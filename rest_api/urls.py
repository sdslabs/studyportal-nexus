from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from rest_api import views

router = routers.DefaultRouter()
router.register(r'departments', views.DepartmentViewSet, base_name='departments')
router.register(r'courses', views.CourseViewSet, base_name='courses')
router.register(r'files', views.FileViewSet, base_name='files')
router.register(r'users', views.UserViewSet, base_name='users')
router.register(r'requests', views.RequestViewSet, base_name='requests')
router.register(r'uploads', views.UploadViewSet, base_name='uploads')
# router.register(r'test', views.TestViewSet, base_name='test')

urlpatterns = [
    path('test', views.sample, name='sample'),
    path('', include(router.urls)),
    path('api-auth', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^departments', views.DepartmentViewSet.as_view()),
    url(r'^courses', views.CourseViewSet.as_view()),
    url(r'^files', views.FileViewSet.as_view()),
    url(r'^users', views.UserViewSet.as_view()),
    url(r'^requests', views.RequestViewSet.as_view()),
    url(r'^uploads', views.UploadViewSet.as_view()),
    # url(r'^test', views.TestViewSet.as_view()),
]
