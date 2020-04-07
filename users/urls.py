from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from users import views

router = routers.DefaultRouter()

urlpatterns = [
    path('', include(router.urls)),
    url('users', views.UserViewSet.as_view()),
    url('filerequests', views.FileRequestViewSet.as_view()),
    url('courserequests', views.CourseRequestViewSet.as_view()),
    url('uploads', views.UploadViewSet.as_view()),
]
