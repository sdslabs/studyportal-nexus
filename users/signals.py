from django.dispatch import Signal
from django.db.models.signals import post_save
from django.dispatch import receiver
from users.models import Notifications
from channels.layers import get_channel_layer
import django.dispatch
from asgiref.sync import async_to_sync

notify = django.dispatch.Signal(providing_args=["recipient, notification"])

def notification_handler(recipient, actor, verb, action):
    new_notification = Notifications(
        recipient=recipient,
        actor=actor,
        action=action,
        verb=verb
    )
    new_notification.save()
    notify.send(sender=Notifications, recipient=recipient, notification=new_notification)

@receiver(notify, sender=Notifications)
def send_notification(sender, **kwargs):
    channel_layer = get_channel_layer()
    groupname = "user_%s" % kwargs['recipient']
    notification = str(kwargs['notification'])
    async_to_sync(channel_layer.group_send)(
        groupname,
        {
            'type' : 'send.notification',
            'notification' : notification
        }
    )
