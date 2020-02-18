from rest_api.models import Department, Course, File, User, FileRequest, CourseRequest, Upload
from rest_framework import serializers

class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ('id', 'title', 'abbreviation', 'imageurl')

        def create(self, validated_data):
            return Department.objects.create(**validated_data)

class CourseSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer(Department.objects.all())
    class Meta:
        model = Course
        fields = ('id', 'title', 'department', 'code')

def fileName(file):
    filename = file.split('/')[-1]
    return filename.split('.')[-2]

class FileSerializer(serializers.ModelSerializer):
    course = CourseSerializer(Course.objects.all())
    class Meta:
        model = File
        fields = ('id', 'title', 'driveid', 'downloads', 'size', 'date_modified', 'fileext', 'filetype', 'course')

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'falcon_id', 'username', 'email', 'profile_image', 'courses', 'role')

class FileRequestSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())
    course = CourseSerializer(Course.objects.all())
    class Meta:
        model = FileRequest
        fields = ('id', 'user', 'filetype', 'status', 'title', 'date', 'course')

class CourseRequestSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())
    class Meta:
        model = CourseRequest
        fields = ('id', 'user', 'status', 'department', 'course', 'code')

class UploadSerializer(serializers.ModelSerializer):
    user = UserSerializer(User.objects.all())
    course = CourseSerializer(Course.objects.all())
    class Meta:
        model = Upload
        fields = ('id', 'user', 'driveid', 'resolved', 'title', 'filetype', 'date', 'course')
        