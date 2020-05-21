from django.dispatch import Signal
from django.db.models.query import QuerySet
from django.db.models.signals import post_save
from django.dispatch import receiver
from users.models import Notifications

notify = Signal(providing_args=[
    'recipient', 'actor', 'verb', 'action'
])

class NotificationQuerySet(QuerySet):

    def unread(self):
        return self.filter(unread=True)

    def read(self,id):
        qset = self.filter(id=id)
        return qset.update(unread=False)
    
    def mark_all_as_read(self,recipient):
        qset = self.unread(True)
        qset = qset.filter(recipient=recipient)
        return qset.update(unread=False)
    
@receiver(post_save, sender=Notifications)
def my_handler(sender, **kwargs):
    print("Notification saved")

notify.connect(my_handler, dispatch_uid=None)
