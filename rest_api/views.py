from django.http import HttpResponse
from rest_api.models import Department, Course, File
from rest_framework  import viewsets
from rest_framework.response import Response
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer

def sample(request):
    return HttpResponse("Test endpoint")

class DepartmentViewSet(viewsets.ModelViewSet):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer

    def post(self, request):
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
        if department != None:
            queryset = Course.objects.filter(department = department)
            return queryset
        else:
            queryset = Course.objects.all()
            return queryset

    def post(self, request):
        course = request.data.get('course')
        department = Department.objects.get(department_id = request.data.get('department'))
        course.department = DepartmentSerializer(data=department)
        serializer = CourseSerializer(data=course)
        if serializer.is_valid(raise_exception=True):
            course_saved = serializer.save(department=department)
        return Response(course_saved)

    def delete(self, request):
        course = Course.objects.get(id = request.data.get('course'))
        serializer = CourseSerializer(data=course)
        if serializer.is_valid():
            instance = serializer.save()
            instance.delete()
            return Response()
        else:
            return Response()

class FileViewSet(viewsets.ModelViewSet):
    serializer_class = FileSerializer
    
    def get_queryset(self):
        queryset = File.objects.all()
        course = self.request.query_params.get('course')
        if course != None:
            queryset = File.objects.filter(course = course)
            return queryset
        else:
            queryset = File.objects.all()
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
        file = File.objects.get(id = request.data.get('file'))
        serializer = FileSerializer(data=file)
        serializer.delete()
        return Response()