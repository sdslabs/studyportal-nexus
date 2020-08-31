# Generated by Django 2.2 on 2020-05-22 11:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Notifications',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('unread', models.BooleanField(default=True)),
                ('actor', models.CharField(max_length=255)),
                ('verb', models.CharField(max_length=255)),
                ('action', models.CharField(max_length=255)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('recipient', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='notifications', to='users.User')),
            ],
        ),
    ]