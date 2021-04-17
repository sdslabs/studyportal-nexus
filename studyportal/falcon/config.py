from studyportal.falcon import client

client_id = "studyportal-VOW11xXLH5LpnWMU"
client_secret = "a27fbf9bee9412639286e6e466df9c00b40efb456edc06e8c701c1efd3258d5c"
access_url = "http://falcon.sdslabs.local/access_token"
user_url = "http://falcon.sdslabs.local/users/"
accounts_url = "http://arceus.sdslabs.local/"
redirect_url = "http://studyportal.sdslabs.local"

config = client.FalconClient(
    client_id, client_secret, access_url, user_url, accounts_url, redirect_url
)
