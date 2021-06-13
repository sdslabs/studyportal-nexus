from django.db import models
from django.contrib.postgres.fields import ArrayField


class Department(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=10)
    image = models.ImageField(upload_to="thumbnail", blank=True)

    def __str__(self):
        return self.title


class Course(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=200)
    department = models.ForeignKey(
        Department, on_delete=models.CASCADE, blank=True, null=True
    )
    code = models.CharField(max_length=10, default="")

    def __str__(self):
        return self.title


FILE_TYPE = [
    ("tutorials", "Tutorials"),
    ("books", "Books"),
    ("notes", "Notes"),
    ("exampapers", "Examination Papers"),
]


def fileLocation(instance, filename):
    return "/".join(["./files", instance.filetype, filename])


def fileName(file):
    filename = file.split("/")[-1]
    return filename.split(".")[-2]


class File(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    title = models.CharField(max_length=100, default="")
    driveid = models.CharField(max_length=50, default="")
    downloads = models.IntegerField(default=0)
    size = models.CharField(max_length=10, default="")
    date_modified = models.DateField(auto_now=True)
    fileext = models.CharField(max_length=10, default="")
    filetype = models.CharField(max_length=20, choices=FILE_TYPE)
    finalized = models.BooleanField(default=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE)

    def __str__(self):
        return self.title
