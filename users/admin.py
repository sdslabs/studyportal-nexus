from django.contrib import admin
from .models import User, FileRequest, CourseRequest, Upload, Notifications

admin.site.register(User)
admin.site.register(FileRequest)
admin.site.register(CourseRequest)
admin.site.register(Upload)
admin.site.register(Notifications)
