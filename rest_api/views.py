from django.http import HttpResponse
from rest_api.models import Department
from rest_framework  import viewsets
from rest_api.serializers import DepartmentSerializer

def sample(request):
    return HttpResponse("Test endpoint")

class DepartmentViewSet(viewsets.ModelViewSet):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer