# Generated by Django 2.2.4 on 2019-10-03 12:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0005_file'),
    ]

    operations = [
        migrations.AddField(
            model_name='file',
            name='fileext',
            field=models.CharField(default=None, max_length=5),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='file',
            name='filetype',
            field=models.CharField(max_length=10),
        ),
        migrations.CreateModel(
            name='Request',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('user_id', models.IntegerField()),
                ('filetype', models.CharField(max_length=4)),
                ('status', models.IntegerField(choices=[(1, 1), (2, 2), (3, 3)])),
                ('title', models.CharField(max_length=100)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Course')),
            ],
        ),
    ]