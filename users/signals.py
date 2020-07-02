from django.dispatch import Signal
from django.db.models.signals import post_save
from django.dispatch import receiver
from users.models import Notifications
from channels.layers import get_channel_layer
import django.dispatch
from asgiref.sync import async_to_sync
from users.serializers import NotificationsSerializer

notify = django.dispatch.Signal(providing_args=["recipient, notification, notification_data"])


def notification_handler(recipient, actor, verb, action, notification_type, target, link):
    new_notification = Notifications(
        recipient=recipient,
        actor=actor,
        action=action,
        verb=verb,
        notification_type=notification_type,
        target=target,
        link=link
    )
    new_notification.save()
    notification_data = NotificationsSerializer(new_notification).data
    notify.send(sender=Notifications,
                recipient=recipient,
                notification=new_notification,
                notification_data=notification_data)


@receiver(notify, sender=Notifications)
def send_notification(sender, **kwargs):
    channel_layer = get_channel_layer()
    groupname = "user_%s" % kwargs['recipient']
    notification = str(kwargs['notification'])
    notification_data = kwargs['notification_data']
    async_to_sync(channel_layer.group_send)(
        groupname,
        {
            'type': 'send.notification',
            'notification': notification,
            'notification_data': notification_data
        }
    )
