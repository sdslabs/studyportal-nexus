from django.db import models
from django.contrib.postgres.fields import ArrayField
from resources.models import Department, Course, File
from resources.utils import FILE_TYPE

USER_ROLE = [("user", "user"), ("moderator", "moderator"), ("admin", "admin")]


class User(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    auth_id = models.IntegerField(default=0)
    username = models.CharField(max_length=100, default="")
    email = models.CharField(max_length=100, default="")
    profile_image = models.URLField(max_length=500)
    courses = ArrayField(models.IntegerField(), blank=True, default=list)
    role = models.CharField(max_length=20, choices=USER_ROLE)

    def __str__(self):
        return self.username


REQUEST_STATUS = [(1, 1), (2, 2), (3, 3)]


class FileRequest(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    filetype = models.CharField(max_length=20, choices=FILE_TYPE)
    status = models.IntegerField(choices=REQUEST_STATUS)
    title = models.CharField(max_length=100)
    date = models.DateField(auto_now_add=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    file = models.IntegerField(blank=True, default=None, null=True)

    def __str__(self):
        return self.title


class CourseRequest(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    status = models.IntegerField(choices=REQUEST_STATUS)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    course = models.CharField(max_length=100)
    code = models.CharField(max_length=8)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.course


class Upload(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    driveid = models.CharField(max_length=50)
    resolved = models.BooleanField(default=False)
    size = models.CharField(max_length=20, default="0KB")
    status = models.IntegerField(choices=REQUEST_STATUS)
    title = models.CharField(max_length=100, default="")
    filetype = models.CharField(max_length=20, choices=FILE_TYPE, default="")
    date = models.DateField(auto_now_add=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    file = models.IntegerField(blank=True, default=None, null=True)
    fileext = models.CharField(max_length=10, default="")

    def __str__(self):
        return self.title


class Notifications(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    recipient = models.IntegerField(blank=False)
    unread = models.BooleanField(default=True, blank=False)
    actor = models.CharField(max_length=255, blank=True)
    verb = models.CharField(max_length=255, blank=False)
    action = models.CharField(max_length=255, blank=False)
    timestamp = models.DateField(auto_now_add=True)
    notification_type = models.CharField(max_length=255)
    target = models.CharField(max_length=255, blank=True)
    link = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return f"{self.actor} {self.verb} {self.action} on {self.timestamp}"
