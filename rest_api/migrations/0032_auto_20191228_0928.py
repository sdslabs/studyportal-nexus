# Generated by Django 2.2.6 on 2019-12-28 09:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("rest_api", "0031_auto_20191226_1027"),
    ]

    operations = [
        migrations.AlterField(
            model_name="user",
            name="profile_image",
            field=models.ImageField(
                blank=True, height_field=41, upload_to="", width_field=41
            ),
        ),
    ]
