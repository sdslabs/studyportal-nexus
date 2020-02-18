from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from rest_api import views

router = routers.DefaultRouter()
router.register(r'departments', views.DepartmentViewSet, base_name='departments')
router.register(r'courses', views.CourseViewSet, base_name='courses')
router.register(r'files', views.FileViewSet, base_name='files')
router.register(r'users', views.UserViewSet, base_name='users')
router.register(r'filerequests', views.FileRequestViewSet, base_name='filerequests')
router.register(r'^courserequests', views.CourseRequestViewSet, base_name='courserequests')
router.register(r'uploads', views.UploadViewSet, base_name='uploads')

urlpatterns = [
    path('test', views.sample, name='sample'),
    path('', include(router.urls)),
    path('api-auth', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^departments', views.DepartmentViewSet.as_view()),
    url(r'^courses', views.CourseViewSet.as_view()),
    url(r'^files', views.FileViewSet.as_view()),
    url(r'^users', views.UserViewSet.as_view()),
    url(r'^filerequests', views.FileRequestViewSet.as_view()),
    url(r'^courserequests', views.CourseRequestViewSet.as_view()),
    url(r'^uploads', views.UploadViewSet.as_view()),
]
