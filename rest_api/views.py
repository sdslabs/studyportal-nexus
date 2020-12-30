from django.http import HttpResponse
from rest_api.models import Department, Course, File
from rest_framework import viewsets, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer
from rest_api.serializers import FileSerializer
from studyportal.settings import SECRET_KEY
from apiclient.http import MediaFileUpload
from studyportal.drive.drive import driveinit
from studyportal.falcon.config import config
from studyportal.falcon import client
import requests
import random
import base64
import jwt
import os
import itertools
from rest_api.documents import CourseDocument, FileDocument, DepartmentDocument
from users.models import User, Notifications
from users.serializers import UserSerializer
from users.signals import notification_handler

NEXUS_URL = "http://localhost:8005/api/v1"


def sample(request):
    return HttpResponse("Test endpoint")


class DepartmentViewSet(APIView):
    def get(self, request):
        queryset = Department.objects.all()
        serializer_department = DepartmentSerializer(queryset, many=True)
        department = self.request.query_params.get('department')
        if department is not None and department != 'undefined':
            queryset = Department.objects.get(abbreviation=department)
            serializer = DepartmentSerializer(queryset).data
            course = Course.objects.filter(department=serializer['id'])
            serializer_course = CourseSerializer(course, many=True).data
            return Response({
                "department": serializer,
                "courses": serializer_course
            })
        else:
            return Response({"department": serializer_department.data})

    def post(self, request):
        data = request.data
        query = Department.objects.filter(abbreviation=data['abbreviation'])
        if not query:
            department = Department(
                title=data['title'],
                abbreviation=data['abbreviation'],
                imageurl=data['imageurl']
            )
            department.save()
            users_list = User.objects.all()
            recipients_list = UserSerializer(users_list, many=True)
            recipients = recipients_list.data[:]
            for recipient in recipients:
                notification_handler(recipient=recipient['id'], actor="Admin",
                                     verb="added a department", action=data['abbreviation'],
                                     notification_type="adddepaartment", target='',
                                     link="/departments/" + data['abbreviation'])
            return Response(department.save(), status=status.HTTP_200_OK)
        else:
            return Response("Department already exists")

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseViewSet(APIView):
    def get(self, request):
        queryset = Course.objects.all()
        department = self.request.query_params.get('department')
        course = self.request.query_params.get('course')
        if department is not None and course == 'null':
            queryset = Course.objects.filter(department=department)
        elif department is not None and course is not None:
            queryset = Course.objects.filter(
                department=department
            ).filter(code=course)
        serializer = CourseSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data.copy()
        if request.data['department'].isdigit():
            queryset = Department.objects.get(id=request.data['department'])
        else:
            queryset = Department.objects.get(title=request.data['department'])
        query = Course.objects.filter(code=data['code'])
        if not query:
            course = Course(
                title=data['title'],
                department=queryset,
                code=data['code']
            )
            course.save()
            user_list = User.objects.all()
            recipient_list = UserSerializer(user_list, many=True)
            department_code = DepartmentSerializer(queryset).data['abbreviation']
            recipients = recipient_list.data[:]
            for recipient in recipients:
                notification_handler(recipient=recipient['id'], actor="Admin",
                                     verb="added a course", action=data['code'],
                                     notification_type="addcourse", target=queryset,
                                     link="/departments/" + department_code + "/courses/" + data['code'])
            return Response(course.save(), status=status.HTTP_200_OK)
        else:
            return Response("Course already exists")

    def delete(self, request):
        course = Course.objects.get(id=request.data.get('course')).delete()
        user_list = User.objects.all()
        recipient_list = UserSerializer(user_list, many=True)
        recipients = recipient_list.data[:]
        for recipient in recipients:
            notification_handler(recipient=recipient['id'], actor="Admin",
                                 verb="deleted a course", action=course,
                                 notification_type="deletecourse", target=None,
                                 link="")
        return Response(course)

    @classmethod
    def get_extra_actions(cls):
        return []


def get_size(size):
    file_size = size
    if round(file_size / (1024 * 1024), 2) == 0.00:
        return str(round(file_size / (1024), 2)) + " KB"
    else:
        return str(round(file_size / (1024 * 1024), 2)) + " MB"


def fileName(file):
    return file.rpartition('.')[0]


def get_title(name):
    file_title = name
    return fileName(file_title)


def get_fileext(name):
    filename = name
    return filename.split('.')[-1]


class FileViewSet(APIView):
    def get(self, request):
        queryset = File.objects.all()
        course = self.request.query_params.get('course')
        filetype = self.request.query_params.get('filetype')
        if course is not None and filetype == 'null':
            queryset = File.objects.filter(
                course=course
            ).filter(finalized=True)
        elif course is not None and filetype == 'all':
            queryset = File.objects.filter(
                course=course
            ).filter(finalized=True)
        elif course is not None and filetype is not None:
            queryset = File.objects.filter(
                course=course
            ).filter(filetype=filetype).filter(finalized=True)
        serializer = FileSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data.copy()
        course = Course.objects.get(code=data['code'])
        query = File.objects.filter(title=data['title'])
        if not query:
            file = File(
                title=get_title(data['title']),
                driveid=data['driveid'],
                downloads=0,
                size=get_size(int(data['size'])),
                course=course,
                fileext=get_fileext(data['title']),
                filetype=data['filetype'],
                finalized=data['finalized']
            )
            file.save()
            user_list = User.objects.all()
            recipient_list = UserSerializer(user_list, many=True)
            recipients = recipient_list.data[:]
            for recipient in recipients:
                for course_id in recipient['courses']:
                    if course == Course.objects.get(id=course_id):
                        serializer_course = CourseSerializer(course)
                        department = serializer_course.data['department']
                        department_code = DepartmentSerializer(department).data['abbreviation']
                        notification_handler(recipient=recipient['id'], actor="Admin",
                                             verb="added a file", action=data['title'],
                                             notification_type="addfile", target=course,
                                             link="/departments/" + department_code + "/courses/" + data['code'])
            return Response(file.save(), status=status.HTTP_200_OK)
        else:
            return Response("File already exists")

    def put(self, request):
        data = request.data.copy()
        queryset = File.objects.filter(id=data['id'])
        download = data.get('downloads')
        if not queryset:
            return Response("File doesn't exist!", status=status.HTTP_404_NOT_FOUND)
        if download == 'true':
            queryset.update(downloads=queryset[0].downloads + 1)
        else:
            queryset.update(**data)
        serializer = FileSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def delete(self, request):
        file = File.objects.get(id=request.data.get('file')).delete()
        return Response(file)

    @classmethod
    def get_extra_actions(cls):
        return []


class SearchViewSet(APIView):
    def get(self, request):
        q = request.query_params.get('q')

        if q:
            courses = CourseDocument.search().query(
                "multi_match",
                query=q,
                type="phrase_prefix",
                fields=['title', 'code']
            )
            departments = DepartmentDocument.search().query(
                "multi_match",
                query=q,
                type="phrase_prefix",
                fields=['title', 'abbreviation']
            )
            files = FileDocument.search().query(
                "multi_match",
                query=q,
                type="phrase_prefix",
                fields=['title', 'fileext', 'filetype']
            )

            response_courses = courses.execute()
            queryset_courses = Course.objects.none()
            response_departments = departments.execute()
            queryset_departments = Department.objects.none()
            response_files = files.execute()
            queryset_files = File.objects.none()

            for hit in response_files.hits.hits:
                fileId = hit['_source']["id"]
                query_files = File.objects.filter(id=fileId, finalized=True)
                queryset_files = list(
                    itertools.chain(queryset_files, query_files)
                )

            for hit in response_departments.hits.hits:
                departmentId = hit['_source']["id"]
                query_departments = Department.objects.filter(id=departmentId)
                queryset_departments = list(itertools.chain(
                    queryset_departments, query_departments))

            for hit in response_courses.hits.hits:
                courseId = hit['_source']["id"]
                query = Course.objects.filter(id=courseId)
                queryset_courses = list(itertools.chain(queryset_courses, query))

            serializer_courses = CourseSerializer(queryset_courses, many=True).data
            serializer_departments = DepartmentSerializer(queryset_departments, many=True).data
            serializer_files = FileSerializer(queryset_files, many=True).data

            return Response({
                "departments": serializer_departments,
                "courses": serializer_courses,
                "files": serializer_files,
            }, status=status.HTTP_200_OK)
        else:
            return Response(status.HTTP_400_BAD_REQUEST)

    @classmethod
    def get_extra_actions(cls):
        return []
