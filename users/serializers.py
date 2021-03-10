from users.models import User, FileRequest, CourseRequest, Upload, Notifications
from rest_api.models import Course
from rest_api.serializers import CourseSerializer, FileSerializer
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            "id",
            "falcon_id",
            "username",
            "email",
            "profile_image",
            "courses",
            "role",
        )


class FileRequestSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())
    course = CourseSerializer(Course.objects.all())

    class Meta:
        model = FileRequest
        fields = (
            "id",
            "user",
            "filetype",
            "status",
            "title",
            "date",
            "course",
            "files",
        )


class CourseRequestSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())

    class Meta:
        model = CourseRequest
        fields = ("id", "user", "status", "department", "course", "code")


class UploadSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())
    course = CourseSerializer(Course.objects.all())

    class Meta:
        model = Upload
        fields = (
            "id",
            "user",
            "driveid",
            "resolved",
            "status",
            "title",
            "filetype",
            "date",
            "course",
            "file",
            "fileext",
        )


class NotificationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notifications
        fields = "__all__"
