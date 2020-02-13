from django.http import HttpResponse
from rest_api.models import Department, Course, File, User, Request, Upload
from rest_framework  import viewsets, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer, UserSerializer, RequestSerializer, UploadSerializer
from studyportal.settings import SECRET_KEY
from apiclient.http import MediaFileUpload
from rest_api.drive import driveinit
from rest_api.config import config
from rest_api import client
import requests
import base64
import jwt
import os

NEXUS_URL = "http://nexus.sdslabs.local/api/v1"

def sample(request):
    return HttpResponse("Test endpoint")

class DepartmentViewSet(APIView):
    def get(self,request):
        queryset = Department.objects.all()
        serializer_department = DepartmentSerializer(queryset, many=True)
        department = self.request.query_params.get('department')
        if department != None:
            queryset = Department.objects.get(abbreviation = department)
            serializer = DepartmentSerializer(queryset).data
            course = Course.objects.filter(department = serializer['id'])
            serializer_course = CourseSerializer(course, many=True).data
            return Response({
                "department":serializer,
                "courses":serializer_course
                })
        else:
            return Response(serializer_department.data)

    def post(self, request):
        data = request.data
        query = Department.objects.filter(abbreviation = data['abbreviation'])
        if not query:
            department = Department(title = data['title'], abbreviation = data['abbreviation'], imageurl = data['imageurl'])
            department.save()
            return Response(department.save(), status = status.HTTP_201_CREATED)
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
        if department != None and course == 'null':
            queryset = Course.objects.filter(department = department)
        elif department != None and course != None:
            queryset = Course.objects.filter(department = department).filter(code = course)
        serializer = CourseSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data.copy()
        if request.data['department'].isdigit():
            queryset = Department.objects.get(id = request.data['department'])
        else:
            queryset = Department.objects.get(title = request.data['department'])
        query = Course.objects.filter(code = data['code'])
        if not query:
            course = Course(title = data['title'], department = queryset, code = data['code'])
            course.save()
            return Response(course.save(), status = status.HTTP_201_CREATED)
        else:
            return Response("Course already exists")

    def delete(self, request):
        course = Course.objects.get(id = request.data.get('course')).delete()
        return Response(course)

    @classmethod
    def get_extra_actions(cls):
        return []

def get_size(size):
    file_size = size
    if round(file_size/(1024*1024),2) == 0.00:
        return str(round(file_size/(1024),2))+" KB"
    else:
        return str(round(file_size/(1024*1024),2))+" MB"

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
        if course != None and filetype == 'null' :
            queryset = File.objects.filter(course = course).filter(finalized = True)
        elif course != None and filetype == 'all' :
            queryset = File.objects.filter(course = course).filter(finalized = True)
        elif course != None and filetype != None:
            queryset = File.objects.filter(course = course).filter(filetype = filetype).filter(finalized = True)
        serializer = FileSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data.copy()
        course = Course.objects.get(code = data['code'])
        query = File.objects.filter(title = data['title'])
        if not query:
            file = File(title = get_title(data['title']), driveid = data['driveid'], downloads = 0, size = get_size(int(data['size'])), course = course, fileext = get_fileext(data['title']),  filetype = data['filetype'], finalized = data['finalized'])
            file.save()
            return Response(file.save(), status = status.HTTP_201_CREATED)
        else:
            return Response("File already exists")
        return Response('')

    def delete(self, request):
        file = File.objects.get(id = request.data.get('file')).delete()
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
            user = client.get_user_by_username('darkrider',config)
            if user is not None:
                queryset = User.objects.filter(falcon_id = user['id'])
                serializer = UserSerializer(queryset, many=True)
                if serializer.data == []:
                    data = {
                        'falcon_id':user['id'],
                        'username':user['username'],
                        'email':user['email'],
                        'profile_image':user['image_url'],
                        'role':'user'
                    }
                    requests.post(NEXUS_URL+'/users',data=data)
            queryset = User.objects.filter(falcon_id = user['id'])
            serializer = UserSerializer(queryset, many=True)
            user = serializer.data[0]
            encoded_jwt = jwt.encode({'username':user['username'], 'email':user['email']},SECRET_KEY,algorithm='HS256')
            return Response({'token':encoded_jwt,'user':user}, status = status.HTTP_200_OK)
        else:
            decoded_jwt = jwt.decode(token,SECRET_KEY,algorithms=['HS256'])
            queryset = User.objects.filter(username = decoded_jwt['username'])
            serializer = UserSerializer(queryset, many=True)
            user = serializer.data[0]
            return Response(user)

    def post(self, request):
        data = request.data
        query = User.objects.filter(falcon_id = data['falcon_id'])
        if not query:
            user = User(falcon_id = data['falcon_id'], username = data['username'], email = data['email'], profile_image = data['profile_image'], role = data['role'])
            user.save()
            return Response(user.save(), status = status.HTTP_201_CREATED)
        else:
            return Response("User already exists")

    @classmethod
    def get_extra_actions(cls):
        return []

class RequestViewSet(APIView):
    def get(self, request):
        queryset = Request.objects.filter()
        user = self.request.query_params.get('user')
        if user is not None:
            queryset = Request.objects.filter(user = user)
        serializer = RequestSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        data = request.data
        user = User.objects.get(id = data['user'])
        course = Course.objects.get(id = data['course'])
        query = Request.objects.filter(title = data['title'])
        if not query:
            request = Request(user = user, filetype = data['filetype'], status = data['status'], title = data['title'], course = course)
            request.save()
            return Response(request.save(), status = status.HTTP_201_CREATED)
        else:
            return Response("Request already exists")

    def put(self, request):
        data = request.data
        query = Request.objects.filter(id = data['request']).update(status = data['status'])
        return Response(query, status = status.HTTP_200_OK)

    def delete(self, request):
        requests = Request.objects.get(id = request.data.get('request')).delete()
        return Response(requests)

    @classmethod
    def get_extra_actions(cls):
        return []

def uploadToDrive(service, folder_id, file_details):
    file_metadata = {'name': file_details['name']}
    media = MediaFileUpload(file_details['location'],mimetype=file_details['mime_type'])
    file = service.files().create(body=file_metadata,media_body=media,fields='id').execute()
    return file.get('id')

class UploadViewSet(APIView):
    def get(self, request):
        user = self.request.query_params.get('user')
        queryset = Upload.objects.filter(resolved = False)
        if user is not None:
            queryset = Upload.objects.filter(user = user, resolved = False)
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
        temp = open("temp."+ext,"wb")
        temp.write(base64.b64decode(base64String))
        file_details = {
            'name':name,
            'mime_type':mime_type,
            'location':"temp."+ext
        }
        driveid = uploadToDrive(driveinit(),'1Zd-uN6muFv8jvjUSM7faanEL0Zv6BTwZ',file_details) # Get folder id from config
        os.remove("temp."+ext)
        # end of manipulation
        user = User.objects.filter(id = request.data['user'])
        course = Course.objects.filter(id = request.data['course'])
        upload = Upload(user = user, driveid = driveid, resolved = False, title = name, filetype = request.data['filetype'], course = course)
        upload.save()
        return Response(upload.save(), status = status.HTTP_200_OK)

    @classmethod
    def get_extra_actions(cls):
        return []
        