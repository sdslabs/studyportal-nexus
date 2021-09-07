from users.models import User, FileRequest, CourseRequest, Upload, Notifications
from resources.utils import get_size, get_file_details_and_upload, STRUCTURE
from studyportal.settings import NEXUS_URL, SECRET_KEY
from resources.serializers import CourseSerializer
from users.signals import notification_handler
from rest_framework.response import Response
from users.serializers import UserSerializer
from rest_framework import viewsets, status
from rest_framework.views import APIView
from users.serializers import (
    FileRequestSerializer,
    CourseRequestSerializer,
    NotificationsSerializer,
)
from resources.decorators import action_permitted
from resources.models import Department, Course
from users.serializers import UploadSerializer
from studyportal.drive.drive import driveinit
from users.decorators import check_user
from users.auth import authorize_user
import requests
import random
import base64
import json
import jwt
import os


def getUserFromJWT(token):
    try:
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        user = User.objects.get(username=decoded_jwt["username"])
        return UserSerializer(user).data
    except Exception as error:
        print("Error occurred while parsing user token", error)
        return None


def create_user(user_details):
    user = User(
        auth_id=user_details["auth_id"],
        username=user_details["username"],
        email=user_details["email"],
        profile_image=user_details["profile_image"],
        role=user_details["role"],
    )
    user.save()


class UserViewSet(APIView):
    def get(self, request):
        token = request.headers["Authorization"].split(" ")[1]
        if token == "None":
            """
            This following section handles the external auth flow
            """
            user = authorize_user(request)
            if user is not None:
                queryset = User.objects.filter(auth_id=user["id"])
                serializer = UserSerializer(queryset, many=True)
                if serializer.data == []:
                    data = {
                        "auth_id": user["id"],
                        "username": user["username"],
                        "email": user["email"],
                        "profile_image": user["image_url"],
                        "role": "user",
                    }
                    create_user(data)
            queryset = User.objects.filter(auth_id=user["id"])
            serializer = UserSerializer(queryset, many=True)
            user = serializer.data[0]
            encoded_jwt = jwt.encode(
                {"username": user["username"], "email": user["email"]},
                SECRET_KEY,
                algorithm="HS256",
            )
            return Response(
                {
                    "message": "Successfully fetched user data",
                    "token": encoded_jwt,
                    "user": user,
                    "courses": "",
                },
                status=status.HTTP_200_OK,
            )
        else:
            user = getUserFromJWT(token)
            if user is not None:
                courselist = user["courses"]
                courses = []
                for course in courselist:
                    course_object = Course.objects.filter(id=course)
                    if course_object:
                        coursedata = CourseSerializer(course_object, many=True).data[0]
                        courses.append(coursedata)
                return Response(
                    {
                        "message": "Successfully fetched user data",
                        "user": user,
                        "courses": courses,
                    },
                    status=status.HTTP_200_OK,
                )
            else:
                return Response(
                    {"message": "User does not exist"}, status=status.HTTP_404_NOT_FOUND
                )

    @action_permitted
    def post(self, request):
        data = request.data
        query = User.objects.filter(auth_id=data["auth_id"])
        if not query:
            create_user(data)
            return Response(
                {"message": "User created successfully"}, status=status.HTTP_201_CREATED
            )
        else:
            return Response("User already exists", status=status.HTTP_200_OK)

    def put(self, request):
        data = request.data
        new_course = data["course"]
        token = request.headers["Authorization"].split(" ")[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        query = User.objects.get(username=decoded_jwt["username"])
        user = UserSerializer(query).data
        if data["action"] == "add":
            if int(new_course) not in user["courses"]:
                query.courses.append(new_course)
                query.save()
                return Response(
                    {"message": "Course added successfully"},
                    status=status.HTTP_201_CREATED,
                )
            else:
                return Response(
                    {"message": "Course already added"}, status=status.HTTP_200_OK
                )
        else:
            if int(new_course) in user["courses"]:
                query.courses.remove(int(new_course))
                query.save()
                return Response(
                    {"message": "Course removed successfully"},
                    status=status.HTTP_200_OK,
                )
            else:
                return Response(
                    {"message": "Course does not exist"},
                    status=status.HTTP_404_NOT_FOUND,
                )

    @classmethod
    def get_extra_actions(cls):
        return []


class FileRequestViewSet(APIView):
    @check_user
    def get(self, request, user):
        queryset = FileRequest.objects.filter(user=user["id"])
        serializer = FileRequestSerializer(queryset, many=True)
        return Response(
            {
                "message": "Requests fetched successfully",
                "requests": serializer.data,
            },
            status=status.HTTP_200_OK,
        )

    @check_user
    def post(self, request, user):
        data = request.data
        user_id = user["id"]
        user = User.objects.get(id=user_id)
        course = Course.objects.get(id=data["course"])
        query = FileRequest.objects.filter(
            title=data["title"],
            course=course,
            filetype=data["filetype"],
        )
        if not query:
            request = FileRequest(
                user=user,
                filetype=data["filetype"],
                status=data["status"],
                title=data["title"],
                course=course,
            )
            request.save()
            course_code = CourseSerializer(course).data["code"]
            notification_handler(
                user_id,
                "You",
                "placed a request for",
                data["title"],
                "request",
                course_code,
                "/activity/requests",
            )
            return Response(
                {"message": "File requested successfully"},
                status=status.HTTP_201_CREATED,
            )
        else:
            return Response(
                {"message": "Request already exists"}, status=status.HTTP_200_OK
            )

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseRequestViewSet(APIView):
    @check_user
    def get(self, request, user):
        queryset = CourseRequest.objects.filter(user=user["id"])
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response(
            {
                "message": "Requests fetched successfully",
                "requests": serializer.data,
            },
            status=status.HTTP_200_OK,
        )

    @check_user
    def post(self, request, user):
        data = request.data
        user_id = user["id"]
        user = User.objects.get(id=user_id)
        query_request = CourseRequest.objects.filter(
            department=data["department"], code=data["code"]
        )
        query_courses = Course.objects.filter(
            department=data["department"], code=data["code"]
        )
        if not (query_request and query_courses):
            department = Department.objects.get(id=data["department"])
            request = CourseRequest(
                user=user,
                status=data["status"],
                department=department,
                course=data["course"],
                code=data["code"],
            )
            request.save()
            notification_handler(
                user_id,
                "You",
                "placed a request for",
                data["course"],
                "request",
                data["department"],
                "/activity/requests",
            )
            return Response(
                {"message": "Course requested successfully"},
                status=status.HTTP_201_CREATED,
            )
        elif query_request:
            return Response(
                {"message": "Request already exists"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"message": "Course already exists"}, status=status.HTTP_200_OK
            )

    @classmethod
    def get_extra_actions(cls):
        return []


class UploadViewSet(APIView):
    @check_user
    def get(self, request, user):
        queryset = Upload.objects.filter(user=user["id"])
        serializer = UploadSerializer(queryset, many=True)
        return Response(
            {"message": "Uploads fetched successfully", "uploads": serializer.data},
            status=status.HTTP_200_OK,
        )

    @check_user
    def post(self, request, user):
        file = request.data["file"]
        name = request.data["name"]
        course = Course.objects.get(id=request.data["course"])
        file_details = get_file_details_and_upload(
            file, name, request.data["filetype"], course, True, False
        )
        user_id = user["id"]
        user = User.objects.get(id=user_id)
        upload = Upload(
            user=user,
            driveid=file_details["driveid"],
            size=file_details["size"],
            resolved=False,
            status=request.data["status"],
            title=name,
            filetype=request.data["filetype"],
            course=course,
            fileext=file_details["ext"],
        )
        upload.save()
        notification_handler(
            user_id,
            "You",
            "placed a request to upload",
            name,
            "upload",
            course,
            "/activity/uploads",
        )
        return Response(
            {"message": "File uploaded successfully"}, status=status.HTTP_200_OK
        )

    @classmethod
    def get_extra_actions(cls):
        return []


class NotificationViewSet(APIView):
    @check_user
    def get(self, request, user):
        queryset = Notifications.objects.filter(recipient=user["id"])
        serializer = NotificationsSerializer(queryset, many=True)
        return Response(
            {
                "message": "Notifications fetched successfully",
                "notifications": serializer.data,
            },
            status=status.HTTP_200_OK,
        )

    def delete(self, request):
        try:
            id = request.query_params.get("notification")
            userid = request.query_params.get("userid")
            if id != "null":
                Notifications.objects.get(
                    id=id
                ).delete()
            elif userid != "null":
                Notifications.objects.filter(
                    recipient=userid
                ).delete()
            return Response(
                {"message": "Notification deleted successfully"},
                status=status.HTTP_200_OK,
            )
        except Notifications.DoesNotExist:
            return Response(
                {"message": "Notification was already deleted"},
                status=status.HTTP_404_NOT_FOUND,
            )
