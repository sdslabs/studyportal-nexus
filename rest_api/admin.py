from django.contrib import admin

from .models import Department, Course, File, User, Request, Upload

admin.site.register(Department)
admin.site.register(Course)
admin.site.register(File)
admin.site.register(User)
admin.site.register(Request)
admin.site.register(Upload)