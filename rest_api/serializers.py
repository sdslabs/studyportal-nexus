from rest_api.models import Department
from rest_framework import serializers

class DepartmentSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Department
        fields = ('title', 'abbreviation')