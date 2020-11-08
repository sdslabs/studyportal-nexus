import requests
from users.views import getUserFromJWT
from rest_framework import status
from rest_framework.response import Response
from users.serializers import CourseRequestSerializer, FileRequestSerializer, UploadSerializer
from users.models import CourseRequest, FileRequest, Upload
from rest_framework.views import APIView

class FileRequestViewSet(APIView):
    def get(self, request):
        queryset = FileRequest.objects.all()
        serializer = FileRequestSerializer(queryset, many=True)
        print(serializer)
        print('hello')
        return Response({'filerequest':serializer.data})

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
        queryset = CourseRequest.objects.all()
        serializer = CourseRequestSerializer(queryset, many=True)
        return Response({'courserequest':serializer.data})

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

class UploadViewSet(APIView):
    def get(self, request):
        queryset = Upload.objects.all()
        serializer = UploadSerializer(queryset, many=True)
        return Response({'upload':serializer.data})

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
