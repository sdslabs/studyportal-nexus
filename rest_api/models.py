from django.db import models
from django.contrib.postgres.fields import ArrayField

class Department(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=3)
    url = models.CharField(max_length=100, default='')

    def __str__(self):
        return self.title

class Course(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=200)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    code = models.CharField(max_length=10, default='')

    def __str__(self):
        return self.title

class File(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    path = models.FilePathField(path=None)
    title = models.CharField(max_length=100)
    downloads = models.IntegerField()
    size = models.CharField(max_length = 10)
    date_modified = models.DateField(auto_now=True)
    filetype = models.CharField(max_length=4)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title