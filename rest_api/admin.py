from django.contrib import admin

from .models import Department
from .models import Course

admin.site.register(Department)
admin.site.register(Course)