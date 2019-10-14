from django.db import models
from django.contrib.postgres.fields import ArrayField

class Department(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=3)
    imageurl = models.CharField(max_length=100, default='')

    def __str__(self):
        return self.title

class Course(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=200)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
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
    file = models.FileField(default='', upload_to=fileLocation)
    path = models.FilePathField(path=None)
    downloads = models.IntegerField(editable=False, default=0)
    date_modified = models.DateField(auto_now=True)
    filetype = models.CharField(max_length=20, choices=FILE_TYPE)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return fileName(self.file.name)

REQUEST_STATUS = [
    (1,1),
    (2,2),
    (3,3)
]

class Request(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    user_id = models.IntegerField()
    filetype = models.CharField(max_length=4)
    status = models.IntegerField(choices=REQUEST_STATUS)
    title = models.CharField(max_length=100)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title

    