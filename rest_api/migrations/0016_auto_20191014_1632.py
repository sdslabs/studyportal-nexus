# Generated by Django 2.2.6 on 2019-10-14 16:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0015_auto_20191007_2136'),
    ]

    operations = [
        migrations.RenameField(
            model_name='department',
            old_name='url',
            new_name='imageurl',
        ),
    ]
