from rest_api.models import Department, Course, File
from rest_framework import serializers

class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ('id', 'title', 'abbreviation', 'url')

        def create(self, validated_data):
            return Department.objects.create(**validated_data)

class CourseSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer(read_only=True)

    class Meta:
        model = Course
        fields = ('id', 'title', 'department', 'code')

        def create(self, validated_data):
            return Course.objects.create(**validated_data)

class FileSerializer(serializers.ModelSerializer):
    course = CourseSerializer()
    class Meta:
        model = File
        fields = ('id', 'path', 'title', 'downloads', 'size', 'date_modified', 'filetype', 'course')