from django.urls import path, include
from rest_framework import routers
from django.conf.urls import url
from resources import views

router = routers.DefaultRouter()

urlpatterns = [
    path("test", views.sample, name="sample"),
    path("", include(router.urls)),
    path("api-auth", include("rest_framework.urls", namespace="rest_framework")),
    url(r"^departments", views.DepartmentViewSet.as_view()),
    url(r"^courses", views.CourseViewSet.as_view()),
    url(r"^files", views.FileViewSet.as_view()),
    url(r"^search", views.SearchViewSet.as_view()),
    url(r"^searchcourse", views.SearchCoursesViewSet.as_view()),
]
