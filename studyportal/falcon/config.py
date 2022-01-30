import os
from studyportal.falcon import client

client_id = os.environ.get("CLIENT_ID")
client_secret = os.environ.get("CLIENT_SECRET")
access_url = os.environ.get("ACCESS_URL")
user_url = os.environ.get("USER_URL")
accounts_url = os.environ.get("ACCOUNTS_URL")
redirect_url = os.environ.get("REDIRECT_URL")

config = client.FalconClient(
    client_id, client_secret, access_url, user_url, accounts_url, redirect_url
)
