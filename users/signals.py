from django.dispatch import Signal
from django.db.models.query import QuerySet
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_api.models import Course
from users.models import Notifications

def notification_handler(recipient, actor, verb, action):
    new_notification = Notifications(
        recipient=recipient,
        actor=actor,
        action=action,
        verb=verb
    )
    new_notification.save()
