from rest_api import client

client_id = "study-vT1gzcnoVml4Mcfq"
client_secret = "5e0c13777f4c6b7c1ea96ad6c42a26c9911e04edeae8cfdfad2d59f58dfd627e"
access_url = "http://falcon.sdslabs.local/access_token"
user_url = "http://falcon.sdslabs.local/users/"
accounts_url = "http://arceus.sdslabs.local/"
redirect_url = "http://studyportal.sdslabs.local"

config = client.FalconClient(client_id, client_secret, access_url,user_url, accounts_url, redirect_url)

