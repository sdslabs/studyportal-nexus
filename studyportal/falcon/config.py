from studyportal.falcon import client

client_id = "studyportal-xxxxxxxxxxxxxxxx"
client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
access_url = "http://falcon.sdslabs.local/access_token"
user_url = "http://falcon.sdslabs.local/users/"
accounts_url = "http://arceus.sdslabs.local/"
redirect_url = "http://studyportal.sdslabs.local"

config = client.FalconClient(
    client_id, client_secret, access_url, user_url, accounts_url, redirect_url
)
