from django.contrib import admin
from .models import Department, Course, File
from .models import User, FileRequest, CourseRequest, Upload

admin.site.register(Department)
admin.site.register(Course)
admin.site.register(File)
admin.site.register(User)
admin.site.register(FileRequest)
admin.site.register(CourseRequest)
admin.site.register(Upload)
