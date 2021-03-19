from users.models import User, FileRequest, CourseRequest, Upload, Notifications
from rest_api.utils import get_size, get_file_details_and_upload, STRUCTURE
from studyportal.settings import NEXUS_URL, SECRET_KEY
from rest_api.serializers import CourseSerializer
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
from users.serializers import UploadSerializer
from studyportal.drive.drive import driveinit
from studyportal.falcon.config import config
from studyportal.falcon import client
from rest_api.models import Course
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
    except Exception:
        return None


class UserViewSet(APIView):
    def get(self, request):
        queryset = None
        token = request.headers["Authorization"].split(" ")[1]
        if token == "None":
            # cookie manipulation starts here
            cookies = {}
            separateCookies = request.headers["Cookie"].split("; ")
            for cookie in separateCookies:
                array = cookie.split("=")
                cookies[array[0]] = array[1]
            # end of cookie manipulation
            user = client.get_logged_in_user(config, {"sdslabs": cookies["sdslabs"]})
            for key in user:
                if key == "error":
                    return Response(status=status.HTTP_404_NOT_FOUND)
            if user is not None:
                queryset = User.objects.filter(falcon_id=user["id"])
                serializer = UserSerializer(queryset, many=True)
                if serializer.data == []:
                    data = {
                        "falcon_id": user["id"],
                        "username": user["username"],
                        "email": user["email"],
                        "profile_image": user["image_url"],
                        "role": "user",
                    }
                    requests.post(NEXUS_URL + "/users", data=data)
            queryset = User.objects.filter(falcon_id=user["id"])
            serializer = UserSerializer(queryset, many=True)
            user = serializer.data[0]
            encoded_jwt = jwt.encode(
                {"username": user["username"], "email": user["email"]},
                SECRET_KEY,
                algorithm="HS256",
            )
            return Response(
                {"token": encoded_jwt, "user": user, "courses": ""},
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
                    {"user": user, "courses": courses}, status=status.HTTP_200_OK
                )
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)

    def post(self, request):
        data = request.data
        query = User.objects.filter(falcon_id=data["falcon_id"])
        if not query:
            user = User(
                falcon_id=data["falcon_id"],
                username=data["username"],
                email=data["email"],
                profile_image=data["profile_image"],
                role=data["role"],
            )
            user.save()
            return Response(user.save(), status=status.HTTP_201_CREATED)
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
                    "Course added successfully", status=status.HTTP_201_CREATED
                )
            else:
                return Response("Course already added", status=status.HTTP_200_OK)
        else:
            if int(new_course) in user["courses"]:
                query.courses.remove(int(new_course))
                query.save()
                return Response(
                    "Course removed successfully", status=status.HTTP_200_OK
                )
            else:
                return Response(
                    "Course does not exist", status=status.HTTP_404_NOT_FOUND
                )

    @classmethod
    def get_extra_actions(cls):
        return []


class FileRequestViewSet(APIView):
    def get(self, request):
        queryset = FileRequest.objects.filter()
        user = self.request.query_params.get("user")
        if user is not None:
            queryset = FileRequest.objects.filter(user=user)
        else:
            token = request.headers["Authorization"].split(" ")[1]
            if token != "None":
                user = getUserFromJWT(token)
                queryset = FileRequest.objects.filter(user=user["id"])
        serializer = FileRequestSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        data = request.data
        token = request.headers["Authorization"].split(" ")[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        user = User.objects.get(username=decoded_jwt["username"])
        course = Course.objects.get(id=data["course"])
        query = FileRequest.objects.filter(title=data["title"])
        if not query:
            request = FileRequest(
                user=user,
                filetype=data["filetype"],
                status=data["status"],
                title=data["title"],
                course=course,
            )
            request.save()
            user_id = UserSerializer(user).data["id"]
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
                FileRequestSerializer(request).data, status=status.HTTP_201_CREATED
            )
        else:
            return Response("Request already exists", status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseRequestViewSet(APIView):
    def get(self, request):
        queryset = CourseRequest.objects.filter()
        user = self.request.query_params.get("user")
        if user is not None:
            queryset = CourseRequest.objects.filter(user=user)
        else:
            token = request.headers["Authorization"].split(" ")[1]
            if token != "None":
                user = getUserFromJWT(token)
                queryset = CourseRequest.objects.filter(user=user["id"])
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        data = request.data
        token = request.headers["Authorization"].split(" ")[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        user = User.objects.get(username=decoded_jwt["username"])
        query = CourseRequest.objects.filter(
            department=data["department"], course=data["course"], code=data["code"]
        )
        if not query:
            request = CourseRequest(
                user=user,
                status=data["status"],
                department=data["department"],
                course=data["course"],
                code=data["code"],
            )
            request.save()
            user_id = UserSerializer(user).data["id"]
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
                CourseRequestSerializer(request).data, status=status.HTTP_201_CREATED
            )
        else:
            return Response("Request already exists", status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []


class UploadViewSet(APIView):
    def get(self, request):
        user = self.request.query_params.get("user")
        queryset = Upload.objects.filter(resolved=False)
        if user is not None:
            queryset = Upload.objects.filter(user=user, resolved=False)
        else:
            token = request.headers["Authorization"].split(" ")[1]
            if token != "None":
                user = getUserFromJWT(token)
                queryset = Upload.objects.filter(user=user["id"])
        serializer = UploadSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request):
        file = request.data["file"]
        name = request.data["name"]
        course = Course.objects.get(id=request.data["course"])
        file_details = get_file_details_and_upload(
            file, name, request.data["filetype"], course, True, False
        )
        token = request.headers["Authorization"].split(" ")[1]
        username = getUserFromJWT(token)["username"]
        user = User.objects.get(username=username)
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
        user_id = UserSerializer(user).data["id"]
        notification_handler(
            user_id,
            "You",
            "placed a request to upload",
            name,
            "upload",
            course,
            "/activity/uploads",
        )
        return Response(UploadSerializer(upload).data, status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []


class NotificationViewSet(APIView):
    def get(self, request):
        token = request.headers["Authorization"].split(" ")[1]
        if token != "None":
            user = getUserFromJWT(token)
            queryset = Notifications.objects.filter(recipient=user["id"])
        serializer = NotificationsSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request):
        notification = Notifications.objects.get(
            id=request.data.get("notification")
        ).delete()
        return Response(notification, status=status.HTTP_200_OK)
