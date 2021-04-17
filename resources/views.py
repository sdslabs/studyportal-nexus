from resources.documents import CourseDocument, FileDocument, DepartmentDocument
from resources.serializers import DepartmentSerializer, CourseSerializer
from resources.models import Department, Course, File
from resources.decorators import action_permitted
from resources.serializers import FileSerializer
from users.signals import notification_handler
from studyportal.drive.drive import driveinit
from studyportal.falcon.config import config
from users.models import User, Notifications
from users.serializers import UserSerializer
from rest_framework.response import Response
from studyportal.settings import SECRET_KEY
from rest_framework import viewsets, status
from apiclient.http import MediaFileUpload
from rest_framework.views import APIView
from studyportal.falcon import client
from django.http import HttpResponse
from resources.utils import (
    add_course,
    add_file,
    get_fileext,
    get_size,
    get_title,
    STRUCTURE,
)
import itertools
import requests
import random
import base64
import jwt
import os


def sample(request):
    return HttpResponse("Test sample")


class DepartmentViewSet(APIView):
    def get(self, request):
        queryset = Department.objects.all()
        serializer_department = DepartmentSerializer(queryset, many=True)
        department = self.request.query_params.get("department")
        if department is not None and department != "undefined":
            queryset = Department.objects.get(abbreviation=department)
            serializer = DepartmentSerializer(queryset).data
            course = Course.objects.filter(department=serializer["id"])
            serializer_course = CourseSerializer(course, many=True).data
            return Response(
                {
                    "message": "Departments fetched successfully",
                    "department": serializer,
                    "courses": serializer_course,
                },
                status=status.HTTP_200_OK,
            )
        else:
            return Response(
                {
                    "message": "Departments fetched successfully",
                    "department": serializer_department.data,
                },
                status=status.HTTP_200_OK,
            )

    @action_permitted
    def post(self, request):
        data = request.data
        query = Department.objects.filter(abbreviation=data["abbreviation"])
        if not query:
            department = Department(
                title=data["title"],
                abbreviation=data["abbreviation"],
            )
            department.save()
            users_list = User.objects.all()
            recipients_list = UserSerializer(users_list, many=True)
            recipients = recipients_list.data[:]
            try:
                for recipient in recipients:
                    notification_handler(
                        recipient=recipient["id"],
                        actor="Admin",
                        verb="added a department",
                        action=data["abbreviation"],
                        notification_type="adddepaartment",
                        target="",
                        link="/departments/" + data["abbreviation"],
                    )
            except Exception as error:
                print("An error occurred while sending notifications", error)
            return Response(
                {"message": "Department successfully added"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"message": "Department already exists"}, status=status.HTTP_200_OK
            )

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseViewSet(APIView):
    def get(self, request):
        queryset = Course.objects.all()
        department = self.request.query_params.get("department")
        course = self.request.query_params.get("course")
        if department is not None and course == "null":
            queryset = Course.objects.filter(department=department)
        elif department is not None and course is not None:
            queryset = Course.objects.filter(department=department).filter(code=course)
        serializer = CourseSerializer(queryset, many=True)
        return Response(
            {"message": "Courses fetched successfully", "courses": serializer.data},
            status=status.HTTP_200_OK,
        )

    @action_permitted
    def post(self, request):
        data = request.data.copy()
        if request.data["department"].isdigit():
            queryset = Department.objects.get(id=request.data["department"])
        else:
            queryset = Department.objects.get(title=request.data["department"])
        query = Course.objects.filter(code=data["code"])
        if not query:
            course = Course(title=data["title"], department=queryset, code=data["code"])
            add_course(course, queryset)
            return Response(
                {"message": "Course successfully added"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"message": "Course already exists"}, status=status.HTTP_200_OK
            )

    @action_permitted
    def delete(self, request):
        course = Course.objects.get(id=request.data.get("course")).delete()
        user_list = User.objects.all()
        recipient_list = UserSerializer(user_list, many=True)
        recipients = recipient_list.data[:]
        try:
            for recipient in recipients:
                notification_handler(
                    recipient=recipient["id"],
                    actor="Admin",
                    verb="deleted a course",
                    action=course,
                    notification_type="deletecourse",
                    target=None,
                    link="",
                )
        except Exception as error:
            print("An error occurred while sending notifications", error)
        return Response(
            {"message": "Course deleted successfully"}, status=status.HTTP_200_OK
        )

    @classmethod
    def get_extra_actions(cls):
        return []


class FileViewSet(APIView):
    def get(self, request):
        queryset = File.objects.all()
        course = self.request.query_params.get("course")
        filetype = self.request.query_params.get("filetype")
        fileid = self.request.query_params.get("fileid")
        if fileid is not None:
            queryset = File.objects.get(id=fileid)
            serializer = FileSerializer(queryset)
            return Response(
                {"message": "Files fetched successfully", "files": serializer.data},
                status=status.HTTP_200_OK,
            )
        if course is not None and filetype == "null":
            queryset = File.objects.filter(course=course).filter(finalized=True)
        elif course is not None and filetype == "all":
            queryset = File.objects.filter(course=course).filter(finalized=True)
        elif course is not None and filetype is not None:
            queryset = (
                File.objects.filter(course=course)
                .filter(filetype=filetype)
                .filter(finalized=True)
            )
        serializer = FileSerializer(queryset, many=True)
        return Response(
            {"message": "Files fetched successfully", "files": serializer.data},
            status=status.HTTP_200_OK,
        )

    @action_permitted
    def post(self, request):
        data = request.data.copy()
        course = Course.objects.get(code=data["code"])
        query = File.objects.filter(title=data["title"])
        if not query:
            file = File(
                title=get_title(data["title"]),
                driveid=data["driveid"],
                downloads=0,
                size=get_size(int(data["size"])),
                course=course,
                fileext=get_fileext(data["title"]),
                filetype=data["filetype"],
                finalized=data["finalized"],
            )
            add_file(file, course)
            return Response(
                {"message": "File saved successfully"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"message": "File already exists"}, status=status.HTTP_200_OK
            )

    def put(self, request):
        data = request.data.copy()
        queryset = File.objects.filter(id=data["id"])
        download = data.get("downloads")
        if not queryset:
            return Response(
                {"message": "File does not exist"}, status=status.HTTP_404_NOT_FOUND
            )
        if download == "true":
            queryset.update(downloads=queryset[0].downloads + 1)
        else:
            queryset.update(**data)
        return Response(
            {"message": "File update successfully"}, status=status.HTTP_200_OK
        )

    @action_permitted
    def delete(self, request):
        File.objects.get(id=request.data.get("file")).delete()
        return Response(
            {"message": "File deleted successfully"}, status=status.HTTP_200_OK
        )

    @classmethod
    def get_extra_actions(cls):
        return []


class SearchViewSet(APIView):
    def get(self, request):
        q = request.query_params.get("q")
        if q:
            courses = CourseDocument.search().query(
                "multi_match", query=q, type="phrase_prefix", fields=["title", "code"]
            )
            departments = DepartmentDocument.search().query(
                "multi_match",
                query=q,
                type="phrase_prefix",
                fields=["title", "abbreviation"],
            )
            files = FileDocument.search().query(
                "multi_match",
                query=q,
                type="phrase_prefix",
                fields=["title", "fileext", "filetype"],
            )

            response_courses = courses.execute()
            queryset_courses = Course.objects.none()
            response_departments = departments.execute()
            queryset_departments = Department.objects.none()
            response_files = files.execute()
            queryset_files = File.objects.none()

            for hit in response_files.hits.hits:
                fileId = hit["_source"]["id"]
                query_files = File.objects.filter(id=fileId, finalized=True)
                queryset_files = list(itertools.chain(queryset_files, query_files))

            for hit in response_departments.hits.hits:
                departmentId = hit["_source"]["id"]
                query_departments = Department.objects.filter(id=departmentId)
                queryset_departments = list(
                    itertools.chain(queryset_departments, query_departments)
                )

            for hit in response_courses.hits.hits:
                courseId = hit["_source"]["id"]
                query = Course.objects.filter(id=courseId)
                queryset_courses = list(itertools.chain(queryset_courses, query))

            serializer_courses = CourseSerializer(queryset_courses, many=True).data
            serializer_departments = DepartmentSerializer(
                queryset_departments, many=True
            ).data
            serializer_files = FileSerializer(queryset_files, many=True).data

            return Response(
                {
                    "message": "Search completed successfully",
                    "departments": serializer_departments,
                    "courses": serializer_courses,
                    "files": serializer_files,
                },
                status=status.HTTP_200_OK,
            )
        else:
            return Response(
                {"message": "Search for the query term failed"},
                status.HTTP_400_BAD_REQUEST,
            )

    @classmethod
    def get_extra_actions(cls):
        return []
