# Generated by Django 2.2 on 2020-02-18 14:08

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0038_request_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='upload',
            name='date',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
