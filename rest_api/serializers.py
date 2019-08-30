from rest_api.models import Department
from rest_api.models import Course
from rest_framework import serializers

class DepartmentSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Department
        fields = ('title', 'abbreviation', 'url')

class CourseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Course
        fields = ('title','department')