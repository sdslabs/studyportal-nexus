from rest_api.models import Department, Course, File
from rest_framework import serializers


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ("id", "title", "abbreviation", "imageurl")

        def create(self, validated_data):
            return Department.objects.create(**validated_data)


class CourseSerializer(serializers.ModelSerializer):
    department = DepartmentSerializer(Department.objects.all())

    class Meta:
        model = Course
        fields = ("id", "title", "department", "code")


def fileName(file):
    filename = file.split("/")[-1]
    return filename.split(".")[-2]


class FileSerializer(serializers.ModelSerializer):
    course = CourseSerializer(Course.objects.all())

    class Meta:
        model = File
        fields = (
            "id",
            "title",
            "driveid",
            "downloads",
            "size",
            "date_modified",
            "fileext",
            "filetype",
            "course",
        )
