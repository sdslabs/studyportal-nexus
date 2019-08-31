from django.contrib import admin

from .models import Department, Course, File

admin.site.register(Department)
admin.site.register(Course)
admin.site.register(File)