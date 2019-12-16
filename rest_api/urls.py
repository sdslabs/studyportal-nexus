from django.urls import path, include
from rest_framework import routers

from rest_api import views

router = routers.DefaultRouter()
router.register(r'departments', views.DepartmentViewSet, base_name='departments')
router.register(r'courses', views.CourseViewSet, base_name='courses')

urlpatterns = [
    path('test', views.sample, name='sample'),
    path('', include(router.urls)),
    path('api-auth', include('rest_framework.urls', namespace='rest_framework'))
]
