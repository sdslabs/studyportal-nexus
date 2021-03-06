from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from admin_panel import views

router = routers.DefaultRouter()

urlpatterns = [
    path("", include(router.urls)),
    url(r"^filerequests", views.FileRequestViewSet.as_view()),
    url(r"^courserequests", views.CourseRequestViewSet.as_view()),
    url(r"^uploads", views.UploadViewSet.as_view()),
]
