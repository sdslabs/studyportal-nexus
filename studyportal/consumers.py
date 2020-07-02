import json
from channels.generic.websocket import WebsocketConsumer
from asgiref.sync import async_to_sync
from users.views import getUserFromJWT

class MyConsumer(WebsocketConsumer):
    def connect(self):
        self.accept()

    def receive(self, text_data=None, bytes_data=None):
        text_data_json = json.loads(text_data)
        messagetype = text_data_json['messagetype']
        if messagetype == 'token':
            token = text_data_json['message']
            user = getUserFromJWT(token)
            self.groupname = "user_%s" % user['id']
            async_to_sync(self.channel_layer.group_add)(
                self.groupname, self.channel_name
            )

    def send_notification(self, event):
        notification = event['notification']
        notification_data = event['notification_data']
        self.send(text_data=json.dumps({
            'notification' : notification,
            'notification_data' : notification_data
        }))

    def disconnect(self, code):
        if self.groupname:
            async_to_sync(self.channel_layer.group_discard)(
                self.groupname, self.channel_name
            )
