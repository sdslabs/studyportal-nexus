from django.db import models
from django.contrib.postgres.fields import ArrayField

class Department(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=10)
    imageurl = models.CharField(max_length=100, default='')

    def __str__(self):
        return self.title

class Course(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=200)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, blank=True, null=True)
    code = models.CharField(max_length=10, default='')

    def __str__(self):
        return self.title

FILE_TYPE = [
    ('tutorials','Tutorial'),
    ('books','Books'),
    ('notes','Notes'),
    ('exampapers','Examination Papers')
]

def fileLocation(instance, filename):
    return '/'.join(['./files', instance.filetype, filename])

def fileName(file):
    filename = file.split('/')[-1]
    return filename.split('.')[-2]

class File(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100, default='')
    driveid = models.CharField(max_length=50, default='')
    downloads = models.IntegerField(default=0)
    size = models.CharField(max_length=10, default='')
    date_modified = models.DateField(auto_now=True)
    fileext = models.CharField(max_length=10, default='')
    filetype = models.CharField(max_length=20, choices=FILE_TYPE)
    finalized = models.BooleanField(default=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

USER_ROLE = [
    ('user','user'),
    ('moderator','moderator'),
    ('admin','admin')
]

class User(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    falcon_id = models.IntegerField(default=0)
    username = models.CharField(max_length=100, default='')
    email = models.CharField(max_length=100, default='')
    profile_image = models.ImageField(height_field=41, width_field=41)
    departmennt = models.ForeignKey(Department, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, choices=USER_ROLE)

    def __str__(self):
        return self.username


REQUEST_STATUS = [
    (1,1),
    (2,2),
    (3,3)
]

class Request(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    filetype = models.CharField(max_length=4, choices=FILE_TYPE)
    status = models.IntegerField(choices=REQUEST_STATUS)
    title = models.CharField(max_length=100)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    