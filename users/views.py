from rest_api.models import Course
from users.models import User, FileRequest, CourseRequest, Upload
from rest_framework import viewsets, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_api.serializers import CourseSerializer
from users.serializers import UserSerializer
from users.serializers import FileRequestSerializer, CourseRequestSerializer
from users.serializers import UploadSerializer
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

NEXUS_URL = "http://nexus.sdslabs.local/api/v1"


def getUserFromJWT(token):
    decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
    user = User.objects.get(username=decoded_jwt['username'])
    return UserSerializer(user).data


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
