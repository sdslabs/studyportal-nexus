# Generated by Django 2.2 on 2020-05-30 16:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_notifications'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notifications',
            name='actor',
            field=models.CharField(blank=True, max_length=255),
        ),
    ]
