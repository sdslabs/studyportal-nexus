# Generated by Django 2.2.6 on 2019-10-14 17:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0017_auto_20191014_1711'),
    ]

    operations = [
        migrations.AlterField(
            model_name='file',
            name='downloads',
            field=models.IntegerField(default=0, editable=False),
        ),
    ]
