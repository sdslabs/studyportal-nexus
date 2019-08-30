from django.db import models
from django.contrib.postgres.fields import ArrayField

class Department(models.Model):
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=3)
    url = models.CharField(max_length=100, default='')

    def __str__(self):
        return self.title

class Course(models.Model):
    title = models.CharField(max_length=200)
    department = models.CharField(max_length=100)

    def __str__(self):
        return self.title