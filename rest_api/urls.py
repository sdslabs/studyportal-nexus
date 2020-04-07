from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from rest_api import views

router = routers.DefaultRouter()
router.register(
    r'departments', views.DepartmentViewSet, base_name='departments'
)
router.register(
    r'courses', views.CourseViewSet, base_name='courses'
)
router.register(
    r'files', views.FileViewSet, base_name='files'
)

urlpatterns = [
    path('test', views.sample, name='sample'),
    path('', include(router.urls)),
    path(
        'api-auth', include('rest_framework.urls', namespace='rest_framework')
    ),
    url(r'^departments', views.DepartmentViewSet.as_view()),
    url(r'^courses', views.CourseViewSet.as_view()),
    url(r'^files', views.FileViewSet.as_view()),
]
