# Generated by Django 2.2 on 2020-02-12 18:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0035_upload_filetype'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='department',
        ),
    ]
