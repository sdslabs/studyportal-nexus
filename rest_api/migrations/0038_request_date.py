# Generated by Django 2.2 on 2020-02-17 19:02

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0037_user_courses'),
    ]

    operations = [
        migrations.AddField(
            model_name='request',
            name='date',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
