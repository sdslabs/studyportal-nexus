# Generated by Django 2.2 on 2020-04-07 20:05

import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('rest_api', '0044_auto_20200407_2005'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('falcon_id', models.IntegerField(default=0)),
                ('username', models.CharField(default='', max_length=100)),
                ('email', models.CharField(default='', max_length=100)),
                ('profile_image', models.URLField(max_length=500)),
                ('courses', django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), blank=True, default=list, size=None)),
                ('role', models.CharField(choices=[('user', 'user'), ('moderator', 'moderator'), ('admin', 'admin')], max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Upload',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('driveid', models.CharField(max_length=50)),
                ('resolved', models.BooleanField(default=False)),
                ('status', models.IntegerField(choices=[(1, 1), (2, 2), (3, 3)])),
                ('title', models.CharField(default='', max_length=100)),
                ('filetype', models.CharField(choices=[('Tutorial', 'tutorials'), ('Book', 'books'), ('Notes', 'notes'), ('Examination Papers', 'exampapers')], default='', max_length=20)),
                ('date', models.DateField(auto_now_add=True)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Course')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.User')),
            ],
        ),
        migrations.CreateModel(
            name='FileRequest',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('filetype', models.CharField(choices=[('Tutorial', 'tutorials'), ('Book', 'books'), ('Notes', 'notes'), ('Examination Papers', 'exampapers')], max_length=20)),
                ('status', models.IntegerField(choices=[(1, 1), (2, 2), (3, 3)])),
                ('title', models.CharField(max_length=100)),
                ('date', models.DateField(auto_now_add=True)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Course')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.User')),
            ],
        ),
        migrations.CreateModel(
            name='CourseRequest',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('status', models.IntegerField(choices=[(1, 1), (2, 2), (3, 3)])),
                ('department', models.CharField(max_length=100)),
                ('course', models.CharField(max_length=100)),
                ('code', models.CharField(max_length=8)),
                ('date', models.DateField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.User')),
            ],
        ),
    ]
