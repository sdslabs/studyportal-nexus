# Generated by Django 2.2 on 2021-03-20 18:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courserequest',
            name='department',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='resources.Department'),
        ),
    ]
