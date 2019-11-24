from django.http import HttpResponse
from rest_api.models import Department, Course, File
from rest_framework  import viewsets, status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer

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
            serializer = CourseSerializer(queryset, many=True)
            return Response(serializer.data)
        elif department != None and course != None:
            queryset = Course.objects.filter(department = department).filter(code = course)
            serializer = CourseSerializer(queryset, many=True)
            return Response(serializer.data)
        else:
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
        if course != None and filetype == 'null':
            queryset = File.objects.filter(course = course)
            serializer = FileSerializer(queryset, many=True)
            return Response(serializer.data)
        elif course != None and filetype != None:
            queryset = File.objects.filter(course = course).filter(filetype = filetype)
            serializer = FileSerializer(queryset, many=True)
            return Response(serializer.data)
        else:
            serializer = FileSerializer(queryset, many=True)
            return Response(serializer.data)

    def post(self, request):
        data = request.data.copy()
        course = Course.objects.get(code = data['code'])
        query = File.objects.filter(title = data['title'])
        if not query:
            file = File(title = get_title(data['title']), driveid = data['driveid'], downloads = 0, size = get_size(int(data['size'])), course = course, fileext = get_fileext(data['title']),  filetype = data['filetype'])
            file.save()
            return Response(file.save(), status = status.HTTP_201_CREATED)
        else:
            return Response("File already exists")
        return Response('')

    def delete(self, request):
        file = File.objects.get(id = request.data.get('file')).delete()
        return Response(file)

    # def download(self, *args, **kwargs):
    #     file_path = file_url
    #     FilePointer = open(file_path,"r")
    #     response = HttpResponse(FilePointer,content_type='application/msword')
    #     response['Content-Disposition'] = 'attachment; filename=NameOfFile'
    #     return response

    @classmethod
    def get_extra_actions(cls):
        return []