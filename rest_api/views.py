from django.http import HttpResponse
from rest_api.models import Department, Course, File
from rest_framework  import viewsets
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer

def sample(request):
    return HttpResponse("Test endpoint")

class DepartmentViewSet(viewsets.ModelViewSet):
    serializer_class = DepartmentSerializer

    def get_queryset(self):
        queryset = Department.objects.all()
        department = self.request.query_params.get('department')
        if department != None:
            queryset = Department.objects.filter(abbreviation = department)
            return queryset
        else:
            return queryset

    def post(self, request):
        print("here")
        department = request.data.get('department')
        serializer = DepartmentSerializer(data=department)
        if serializer.is_valid(raise_exception=True):
            department_saved = serializer.save()
        return Response(department_saved)

class CourseViewSet(viewsets.ModelViewSet):
    serializer_class = CourseSerializer

    def get_queryset(self):
        queryset = Course.objects.all()
        department = self.request.query_params.get('department')
        course = self.request.query_params.get('course')
        if department != None and course == 'null':
            queryset = Course.objects.filter(department = department)
            return queryset
        elif department != None and course != None:
            queryset = Course.objects.filter(department = department).filter(code = course)
            return queryset
        else:
            return queryset

    def post(self, request):
        course = request.data
        print(course)

    def delete(self, request):
        course = Course.objects.get(id = request.data.get('course')).delete()
        return Response(course)

class CourseViewTest(viewsets.ModelViewSet):
    print("here 1")
    serializer_class = CourseSerializer
    print("last")

    def post(self, request):
        print(request.get)
        if request.method == 'POST':
            print(request.get)
            print('hello')


class FileViewSet(viewsets.ModelViewSet):
    serializer_class = FileSerializer
    
    def get_queryset(self):
        queryset = File.objects.all()
        course = self.request.query_params.get('course')
        filetype = self.request.query_params.get('filetype')
        if course != None and filetype == 'null':
            queryset = File.objects.filter(course = course)
            return queryset
        elif course != None and filetype != None:
            queryset = File.objects.filter(course = course).filter(filetype = filetype)
            return queryset
        else:
            return queryset

    def post(self, request):
        files = request.data.get('file')
        course = Course.objects.get(course = request.data.get('course'))
        files.course = CourseSerializer(data=course)
        serializer = FileSerializer(data=files)
        if serializer.is_valid(raise_exception=True):
            file_saved = serializer.save(file=files)
        return Response(file_saved)

    def delete(self, request):
        file = File.objects.get(id = request.data.get('file')).delete()
        return Response(file)

    def download(self, *args, **kwargs):
        file_path = file_url
        FilePointer = open(file_path,"r")
        response = HttpResponse(FilePointer,content_type='application/msword')
        response['Content-Disposition'] = 'attachment; filename=NameOfFile'
        return response