from django.db import models

class Department(models.Model):
    title = models.CharField(max_length=100)
    abbreviation = models.CharField(max_length=3)

    def __str__(self):
        return self.abbreviation
