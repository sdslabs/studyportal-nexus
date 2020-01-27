# Generated by Django 2.2.4 on 2019-08-30 23:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0004_auto_20190830_2153'),
    ]

    operations = [
        migrations.CreateModel(
            name='File',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('path', models.FilePathField(path=None)),
                ('title', models.CharField(max_length=100)),
                ('downloads', models.IntegerField()),
                ('size', models.CharField(max_length=10)),
                ('date_modified', models.DateField(auto_now=True)),
                ('filetype', models.CharField(max_length=4)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Course')),
            ],
        ),
    ]