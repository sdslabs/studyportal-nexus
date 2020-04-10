from django.http import HttpResponse
from rest_api.models import Department, Course, File
from rest_api.models import User, FileRequest, CourseRequest, Upload
from rest_framework import viewsets, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer
from rest_api.serializers import FileSerializer, UserSerializer
from rest_api.serializers import FileRequestSerializer, CourseRequestSerializer
from rest_api.serializers import UploadSerializer
from studyportal.settings import SECRET_KEY
from apiclient.http import MediaFileUpload
from rest_api.drive import driveinit
from rest_api.config import config
from rest_api import client
import requests
import random
import base64
import jwt
import os
import itertools
from rest_api.documents import CourseDocument, FileDocument, DepartmentDocument

NEXUS_URL = "http://nexus.sdslabs.local/api/v1"


def sample(request):
    return HttpResponse("Test endpoint")


def getUserFromJWT(token):
    decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
    user = User.objects.get(username=decoded_jwt['username'])
    return UserSerializer(user).data


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
            return Response(department.save(), status=status.HTTP_201_CREATED)
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
            return Response(course.save(), status=status.HTTP_201_CREATED)
        else:
            return Response("Course already exists")

    def delete(self, request):
        course = Course.objects.get(id=request.data.get('course')).delete()
        return Response(course)

    @classmethod
    def get_extra_actions(cls):
        return []


def get_size(size):
    file_size = size
    if round(file_size/(1024*1024), 2) == 0.00:
        return str(round(file_size/(1024), 2))+" KB"
    else:
        return str(round(file_size/(1024*1024), 2))+" MB"


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
            return Response(file.save(), status=status.HTTP_201_CREATED)
        else:
            return Response("File already exists")

    def delete(self, request):
        file = File.objects.get(id=request.data.get('file')).delete()
        return Response(file)

    @classmethod
    def get_extra_actions(cls):
        return []


class UserViewSet(APIView):
    def get(self, request):
        queryset = None
        token = request.headers['Authorization'].split(' ')[1]
        if token == 'None':
            # user = client.get_logged_in_user(config,{'sdslabs': ''})
            user = client.get_user_by_username('darkrider', config)
            if user is not None:
                queryset = User.objects.filter(falcon_id=user['id'])
                serializer = UserSerializer(queryset, many=True)
                if serializer.data == []:
                    data = {
                        'falcon_id': user['id'],
                        'username': user['username'],
                        'email': user['email'],
                        'profile_image': user['image_url'],
                        'role': 'user'
                    }
                    requests.post(NEXUS_URL+'/users', data=data)
            queryset = User.objects.filter(falcon_id=user['id'])
            serializer = UserSerializer(queryset, many=True)
            user = serializer.data[0]
            encoded_jwt = jwt.encode(
                {
                    'username': user['username'],
                    'email': user['email']
                },
                SECRET_KEY,
                algorithm='HS256'
            )
            return Response(
                {
                    'token': encoded_jwt,
                    'user': user,
                    'courses': ''
                },
                status=status.HTTP_200_OK
            )
        else:
            user = getUserFromJWT(token)
            courselist = user['courses']
            courses = []
            for course in courselist:
                course_object = Course.objects.filter(id=course)
                if course_object:
                    coursedata = CourseSerializer(
                        course_object,
                        many=True
                    ).data[0]
                    courses.append(coursedata)
            return Response({'user': user, 'courses': courses})

    def post(self, request):
        data = request.data
        query = User.objects.filter(falcon_id=data['falcon_id'])
        if not query:
            user = User(
                falcon_id=data['falcon_id'],
                username=data['username'],
                email=data['email'],
                profile_image=data['profile_image'],
                role=data['role']
            )
            user.save()
            return Response(user.save(), status=status.HTTP_201_CREATED)
        else:
            return Response("User already exists")

    def put(self, request):
        data = request.data
        new_course = data['course']
        token = request.headers['Authorization'].split(' ')[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
        query = User.objects.get(username=decoded_jwt['username'])
        user = UserSerializer(query).data
        if data['action'] == 'add':
            if int(new_course) not in user['courses']:
                query.courses.append(new_course)
                query.save()
                return Response('Course added successfully')
            else:
                return Response('Course already added')
        else:
            if int(new_course) in user['courses']:
                print(int(new_course) in user['courses'])
                query.courses.remove(int(new_course))
                query.save()
                return Response('Course removed successfully')
            else:
                return Response('Course does not exist')

    @classmethod
    def get_extra_actions(cls):
        return []


class FileRequestViewSet(APIView):
    def get(self, request):
        queryset = FileRequest.objects.filter()
        user = self.request.query_params.get('user')
        if user is not None:
            queryset = FileRequest.objects.filter(user=user)
        else:
            token = request.headers['Authorization'].split(' ')[1]
            if token != 'None':
                user = getUserFromJWT(token)
                queryset = FileRequest.objects.filter(user=user['id'])
        serializer = FileRequestSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data
        token = request.headers['Authorization'].split(' ')[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
        user = User.objects.get(username=decoded_jwt['username'])
        course = Course.objects.get(id=data['course'])
        query = FileRequest.objects.filter(title=data['title'])
        if not query:
            request = FileRequest(
                user=user,
                filetype=data['filetype'],
                status=data['status'],
                title=data['title'],
                course=course
            )
            request.save()
            return Response(
                FileRequestSerializer(request).data,
                status=status.HTTP_201_CREATED
            )
        else:
            return Response("Request already exists")

    def put(self, request):
        data = request.data
        query = FileRequest.objects.filter(
            id=data['request']
        ).update(status=data['status'])
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = FileRequest.objects.get(
            id=request.data.get('request')
        ).delete()
        return Response(requests)

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseRequestViewSet(APIView):
    def get(self, request):
        queryset = CourseRequest.objects.filter()
        user = self.request.query_params.get('user')
        if user is not None:
            queryset = CourseRequest.objects.filter(user=user)
        else:
            token = request.headers['Authorization'].split(' ')[1]
            if token != 'None':
                user = getUserFromJWT(token)
                queryset = CourseRequest.objects.filter(user=user['id'])
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data
        token = request.headers['Authorization'].split(' ')[1]
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
        user = User.objects.get(username=decoded_jwt['username'])
        query = CourseRequest.objects.filter(
            department=data['department'],
            course=data['course'],
            code=data['code']
        )
        if not query:
            request = CourseRequest(
                user=user,
                status=data['status'],
                department=data['department'],
                course=data['course'],
                code=data['code']
            )
            request.save()
            return Response(
                CourseRequestSerializer(request).data,
                status=status.HTTP_201_CREATED
            )
        else:
            return Response("Request already exists")

    def put(self, request):
        data = request.data
        query = CourseRequest.objects.filter(
            id=data['request']
        ).update(status=data['status'])
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = CourseRequest.objects.get(
            id=request.data.get('request')
        ).delete()
        return Response(requests)

    @classmethod
    def get_extra_actions(cls):
        return []


def uploadToDrive(service, folder_id, file_details):
    file_metadata = {'name': file_details['name']}
    media = MediaFileUpload(
        file_details['location'],
        mimetype=file_details['mime_type']
    )
    file = service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id'
    ).execute()
    return file.get('id')


class UploadViewSet(APIView):
    def get(self, request):
        user = self.request.query_params.get('user')
        queryset = Upload.objects.filter(resolved=False)
        if user is not None:
            queryset = Upload.objects.filter(user=user, resolved=False)
        else:
            token = request.headers['Authorization'].split(' ')[1]
            if token != 'None':
                user = getUserFromJWT(token)
                queryset = Upload.objects.filter(user=user['id'])
        serializer = UploadSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        file = request.data['file']
        name = request.data['name']
        # File manipulation starts here
        type = file.split(",")[0]
        mime_type = type.split(":")[1].split(";")[0]
        ext = type.split("/")[1].split(";")[0]
        base64String = file.split(",")[1]
        rand = str(random.randint(0, 100000))
        temp = open("temp"+rand+"."+ext, "wb")
        temp.write(base64.b64decode(base64String))
        file_details = {
            'name': name,
            'mime_type': mime_type,
            'location': "temp"+rand+"."+ext
        }
        # Get folder id from config
        driveid = uploadToDrive(
            driveinit(),
            '1Zd-uN6muFv8jvjUSM7faanEL0Zv6BTwZ',
            file_details
        )
        os.remove("temp"+rand+"."+ext)
        # end of manipulation
        token = request.headers['Authorization'].split(' ')[1]
        username = getUserFromJWT(token)['username']
        user = User.objects.get(username=username)
        course = Course.objects.get(id=request.data['course'])
        upload = Upload(
            user=user,
            driveid=driveid,
            resolved=False,
            status=request.data['status'],
            title=name,
            filetype=request.data['filetype'],
            course=course
        )
        upload.save()
        return Response(
            UploadSerializer(upload).data,
            status=status.HTTP_200_OK
        )

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
                query_files = File.objects.filter(id=fileId)
                queryset_files = list(itertools.chain(queryset_files, query_files))

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
                "departments" : serializer_departments,
                "courses" : serializer_courses,
                "files" : serializer_files,
            }, status=status.HTTP_200_OK)
        else:
            return Response(status.HTTP_400_BAD_REQUEST)

    @classmethod
    def get_extra_actions(cls):
        return []
