# Generated by Django 2.2.4 on 2019-10-07 16:10

from django.db import migrations, models
import rest_api.models


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0011_auto_20191007_1556'),
    ]

    operations = [
        migrations.AlterField(
            model_name='file',
            name='file',
            field=models.FileField(default='', upload_to=rest_api.models.fileLocation),
        ),
    ]
