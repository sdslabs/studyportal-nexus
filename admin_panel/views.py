import json
import os
import random
import base64
from users.views import getUserFromJWT
from rest_framework import status
from rest_framework.response import Response
from users.serializers import (
    CourseRequestSerializer,
    FileRequestSerializer,
    UploadSerializer,
    UserSerializer,
)
from users.models import CourseRequest, FileRequest, Upload, User
from rest_framework.views import APIView
from users.models import Notifications
from users.signals import notification_handler
from rest_api.models import Course, Department, File
from rest_api.utils import (
    get_fileext,
    get_size,
    get_title,
    add_course,
    add_file,
    get_file_details_and_upload,
    STRUCTURE,
)
from rest_api.serializers import CourseSerializer
from studyportal.drive.drive import driveinit


class FileRequestViewSet(APIView):
    def get(self, request):
        queryset = FileRequest.objects.exclude(status=3)
        serializer = FileRequestSerializer(queryset, many=True)
        return Response({"filerequest": serializer.data}, status=status.HTTP_200_OK)

    def put(self, request):
        data = request.data
        file_request = FileRequest.objects.get(id=data["request"])
        user = file_request.user
        course_code = file_request.course.code
        user_id = UserSerializer(user).data["id"]
        if data["status"] == "2":
            notification_handler(
                user_id,
                "Admin",
                "approved your request for",
                file_request.title,
                "request",
                course_code,
                "/activity/requests",
            )
        if data["status"] == "3":
            course = Course.objects.get(code=course_code)
            file_d = data["file"]
            name = data["name"]
            file_details = get_file_details_and_upload(
                file_d, name, data["filetype"], course, False
            )
            file = File(
                title=get_title(file_request.title),
                driveid=file_details["driveid"],
                downloads=0,
                size=file_details["size"],
                course=course,
                fileext=get_fileext(file_request.title),
                filetype=file_request.filetype,
                finalized=True,
            )
            add_file(file, course)
            file_request.file = file.id
            file_request.save()
            notification_handler(
                user_id,
                "Admin",
                "uploaded the file you requested",
                file_request["title"],
                "request",
                course_code,
                "/activity/requests",
            )
        query = FileRequest.objects.filter(id=data["request"]).update(
            status=data["status"]
        )
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = FileRequest.objects.get(id=request.data.get("request"))
        file_request = FileRequestSerializer(requests).data
        user = file_request["user"]
        course_code = file_request["course"]["code"]
        user_id = UserSerializer(user).data["id"]
        notification_handler(
            user_id,
            "Admin",
            "rejected the file you requested",
            file_request["title"],
            "request",
            course_code,
            "/activity/requests",
        )
        requests = requests.delete()
        return Response(requests, status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseRequestViewSet(APIView):
    def get(self, request):
        queryset = CourseRequest.objects.exclude(status=3)
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response({"courserequest": serializer.data}, status=status.HTTP_200_OK)

    def put(self, request):
        data = request.data
        course_object = CourseRequest.objects.get(id=data["request"])
        course_request = CourseRequestSerializer(course_object).data
        user = course_request["user"]
        user_id = UserSerializer(user).data["id"]
        if data["status"] == "2":
            notification_handler(
                user_id,
                "Admin",
                "approved your request for",
                course_request["code"],
                "request",
                course_request["department"],
                "/activity/requests",
            )
        if data["status"] == "3":
            queryset = Department.objects.get(abbreviation=course_request["department"])
            course = Course(
                title=course_request["course"],
                code=course_request["code"],
                department=queryset,
            )
            add_course(course, queryset)
            notification_handler(
                user_id,
                "Admin",
                "added a course you requested",
                course_request["code"],
                "request",
                course_request["department"],
                "/activity/requests",
            )
        query = CourseRequest.objects.filter(id=data["request"]).update(
            status=data["status"]
        )
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = CourseRequest.objects.get(id=request.data.get("request"))
        course_request = CourseRequestSerializer(requests).data
        user = course_request["user"]
        user_id = UserSerializer(user).data["id"]
        notification_handler(
            user_id,
            "Admin",
            "rejected your request for",
            course_request["code"],
            "request",
            course_request["department"],
            "/activity/requests",
        )
        requests = requests.delete()
        return Response(requests, status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []


class UploadViewSet(APIView):
    def get(self, request):
        queryset = Upload.objects.exclude(status=3)
        serializer = UploadSerializer(queryset, many=True)
        return Response({"upload": serializer.data}, status=status.HTTP_200_OK)

    def put(self, request):
        file_id = request.data["file_id"]
        upload = Upload.objects.get(id=file_id)
        upload_status = request.data["status"]
        queryset = Upload.objects.filter(id=file_id)
        if upload_status == "2":
            notification_handler(
                upload.user.id,
                "Admin",
                "approved the file you uploaded",
                upload.title,
                "upload",
                upload.course,
                "/activity/uploads",
            )
        elif upload_status == "3":
            with open(STRUCTURE) as f:
                structure = json.load(f)
            course = upload.course
            folder_identifier = upload.filetype.lower().replace(" ", "")
            folder_id = structure["study"][course.department.abbreviation][course.code][
                folder_identifier
            ]
            previous_parent = structure["study"][course.department.abbreviation][
                course.code
            ][folder_identifier + str("_review")]
            driveinit().files().update(
                fileId=upload.driveid,
                addParents=folder_id,
                removeParents=previous_parent,
                fields="id, parents",
            ).execute()
            new_file = File(
                title=upload.title,
                filetype=upload.filetype,
                driveid=upload.driveid,
                size=upload.size,
                fileext=upload.fileext,
                finalized=True,
                course=upload.course,
            )
            new_file.save()
            upload.file = new_file.id
            upload.save()
            notification_handler(
                upload.user.id,
                "Admin",
                "added the file you uploaded",
                upload.title,
                "upload",
                upload.course,
                "/activity/uploads",
            )
            user_list = User.objects.all()
            recipient_list = UserSerializer(user_list, many=True)
            recipients = recipient_list.data[:]
            for recipient in recipients:
                for course_id in recipient["courses"]:
                    if course == Course.objects.get(id=course_id):
                        department_code = course.department.abbreviation
                        notification_handler(
                            recipient=recipient["id"],
                            actor="Admin",
                            verb="added a file",
                            action=upload.title,
                            notification_type="addfile",
                            target=course,
                            link="/departments/"
                            + department_code
                            + "/courses/"
                            + upload.course.code,
                        )
            query = queryset.update(resolved=True)
        query = queryset.update(status=upload_status)
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = Upload.objects.get(id=request.data.get("request"))
        notification_handler(
            requests.user.id,
            "Admin",
            "rejected the file you uploaded",
            requests.title,
            "upload",
            requests.course,
            "/activity/uploads",
        )
        requests = requests.delete()
        return Response(requests, status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []
