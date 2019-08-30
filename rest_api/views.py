from django.http import HttpResponse
from rest_api.models import Department
from rest_api.models import Course
from rest_framework  import viewsets
from rest_api.serializers import DepartmentSerializer
from rest_api.serializers import CourseSerializer

def sample(request):
    return HttpResponse("Test endpoint")

class DepartmentViewSet(viewsets.ModelViewSet):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer

class CourseViewSet(viewsets.ModelViewSet):
    serializer_class = CourseSerializer

    def get_queryset(self):
        queryset = Course.objects.all()
        department = self.request.query_params.get('department')
        queryset = Course.objects.filter(department = department)

        return queryset