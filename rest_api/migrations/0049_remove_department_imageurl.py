# Generated by Django 2.2 on 2021-03-06 18:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("rest_api", "0048_auto_20210306_1831"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="department",
            name="imageurl",
        ),
    ]
