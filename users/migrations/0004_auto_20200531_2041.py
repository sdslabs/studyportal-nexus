# Generated by Django 2.2 on 2020-05-31 20:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_auto_20200530_1635'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notifications',
            name='recipient',
            field=models.IntegerField(),
        ),
    ]
