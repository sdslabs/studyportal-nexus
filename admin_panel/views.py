import requests
from users.views import getUserFromJWT
from rest_framework import status
from rest_framework.response import Response
from users.serializers import CourseRequestSerializer, FileRequestSerializer, UploadSerializer, UserSerializer
from users.models import CourseRequest, FileRequest, Upload, User
from rest_framework.views import APIView
from users.models import Notifications
from users.signals import notification_handler
from rest_api.models import Course, Department, File
from rest_api.utils import add_course, add_file
from rest_api.views import get_fileext, get_size, get_title
from rest_api.serializers import CourseSerializer


class FileRequestViewSet(APIView):
    def get(self, request):
        queryset = FileRequest.objects.all()
        serializer = FileRequestSerializer(queryset, many=True)
        return Response({'filerequest': serializer.data})

    def put(self, request):
        data = request.data
        query = FileRequest.objects.filter(
            id=data['request']
        ).update(status=data['status'])
        file_request = FileRequestSerializer(FileRequest.objects.get(id=data['request'])).data
        user = file_request['user']
        course_code = file_request['course']['code']
        user_id = UserSerializer(user).data['id']
        if data['status'] == "2":
            notification_handler(
                user_id, 'Admin', 'approved your request for',
                file_request['title'], 'request', course_code,
                '/activity/requests'
            )
        if data['status'] == "3":
            course = Course.objects.get(code=course_code)
            file = File(
                title=get_title(file_request['title']),
                driveid=data['driveid'],
                downloads=0,
                size=get_size(int(data['size'])),
                course=course,
                fileext=get_fileext(file_request['title']),
                filetype=file_request['filetype'],
                finalized=True,
            )
            add_file(file, course)
            notification_handler(
                user_id, 'Admin', 'uploaded the file you requested',
                file_request['title'], 'request', course_code,
                '/activity/requests'
            )
            FileRequest.objects.get(id=request.data.get('request')).delete()
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = FileRequest.objects.get(
            id=request.data.get('request')
        )
        file_request = FileRequestSerializer(requests).data
        user = file_request['user']
        course_code = file_request['course']['code']
        user_id = UserSerializer(user).data['id']
        notification_handler(
            user_id, 'Admin', 'rejected the file you requested',
            file_request['title'], 'request', course_code,
            '/activity/requests'
        )
        requests = requests.delete()
        return Response(requests)

    @classmethod
    def get_extra_actions(cls):
        return []


class CourseRequestViewSet(APIView):
    def get(self, request):
        queryset = CourseRequest.objects.all()
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response({'courserequest': serializer.data})

    def put(self, request):
        data = request.data
        query = CourseRequest.objects.filter(
            id=data['request']
        ).update(status=data['status'])
        course_object = CourseRequest.objects.get(id=data['request'])
        course_request = CourseRequestSerializer(course_object).data
        user = course_request['user']
        user_id = UserSerializer(user).data['id']
        if data['status'] == "2":
            notification_handler(
                user_id, 'Admin', 'approved your request for',
                course_request['code'],
                'request', course_request['department'],
                "/activity/requests"
            )
        if data['status'] == "3":
            queryset = Department.objects.get(abbreviation=course_request['department'])
            course = Course(
                title=course_request['course'],
                code=course_request['code'],
                department=queryset
            )
            add_course(course, queryset)
            CourseRequest.objects.get(id=request.data.get('request')).delete()
        return Response(query, status=status.HTTP_200_OK)

    def delete(self, request):
        requests = CourseRequest.objects.get(
            id=request.data.get('request')
        )
        course_request = CourseRequestSerializer(requests).data
        user = course_request['user']
        user_id = UserSerializer(user).data['id']
        notification_handler(
            user_id, 'Admin', 'rejected your request for',
            course_request['code'],
            'request', course_request['department'],
            "/activity/requests"
        )
        requests.delete()
        return Response(requests)

    @classmethod
    def get_extra_actions(cls):
        return []


class UploadViewSet(APIView):
    def get(self, request):
        queryset = Upload.objects.all()
        serializer = UploadSerializer(queryset, many=True)
        return Response({'upload': serializer.data})

    def put(self, request):
        # when the admin reviews the files in the drive
        # resolved = True
        # make a post request to FileView set API

        token = request.headers['Authorization'].split(' ')[1]
        if token != 'None':
            user = getUserFromJWT(token)
        else:
            return Response("Sorry, can't authenticate you fam, send me a token")

        if(user['role'] == 'admin'):
            file_id = request.data['file_id']
            file = Upload.objects.get(id=file_id)
            # add the file to the db
            url = "http://localhost:8005/api/v1/files/"
            data = {
                "title": file.title,
                "driveid": file.driveid,
                "size": file.size,
                "code": file.course.code,
                "filetype": file.filetype,
                "finalized": True
            }
            response = requests.post(url, data)
            if(response.status_code == 200):
                queryset = Upload.objects.filter(id=file_id)
                queryset.update(resolved=True)
            else:
                return Response("Failed to add to db :(")
        else:
            return Response("You ain't the admin, go away from my api!!!")

        serializer = UploadSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []
