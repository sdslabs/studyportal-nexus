from django.dispatch import Signal
from django.db.models.signals import post_save
from django.dispatch import receiver
from users.models import Notifications

def notification_handler(recipient, actor, verb, action):
    print("notification_handler called")
    new_notification = Notifications(
        recipient=recipient,
        actor=actor,
        action=action,
        verb=verb
    )
    new_notification.save()

@receiver(post_save, sender=Notifications)
def send_notification(sender, **kwargs):
    # TODO send notification through websocket server
    print("send notification called")
