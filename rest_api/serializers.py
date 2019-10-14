from rest_api.models import Department, Course, File, Request
from rest_framework import serializers

class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ('id', 'title', 'abbreviation', 'imageurl')

        def create(self, validated_data):
            return Department.objects.create(**validated_data)

class CourseSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer()
    class Meta:
        model = Course
        fields = ('id', 'title', 'department', 'code')

    def create(self, validated_data):
        department_data = validated_data.pop('department')
        return Course.objects.create(department=department_data, **validated_data)

def fileName(file):
    filename = file.split('/')[-1]
    return filename.split('.')[-2]

class FileSerializer(serializers.ModelSerializer):
    course = CourseSerializer()
    size = serializers.SerializerMethodField()
    title = serializers.SerializerMethodField()
    fileext = serializers.SerializerMethodField()
    class Meta:
        model = File
        fields = ('id', 'file', 'path', 'title', 'downloads', 'size', 'date_modified', 'fileext', 'filetype', 'course')
    def get_size(self, obj):
        file_size = ''
        if obj.file and hasattr(obj.file, 'size'):
            file_size = obj.file.size
        if round(file_size/(1024*1024),2) == 0.00:
            return str(round(file_size/(1024),2))+" KB"
        else:
            return str(round(file_size/(1024*1024),2))+" MB"
    def get_title(self, obj):
        file_title = ''
        if obj.file and hasattr(obj.file, 'name'):
            file_title = obj.file.name
        return fileName(file_title)
    def get_fileext(self, obj):
      filename = obj.file.name
      return filename.split('.')[-1]

class RequestSerializer(serializers.ModelSerializer):
    course = CourseSerializer()
    class Meta:
        model = Request
        fields = ('id', 'user_id', 'filetype', 'status', 'title', 'course')