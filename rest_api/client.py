import requests
class DataResponse:
	def __init__(self, AccessToken, TokenType, ExpiresIn):
		self.AccessToken = AccessToken
		self.TokenType = TokenType
		self.ExpiresIn = ExpiresIn
class FalconClient:
	def __init__(self, ClientId, ClientSecret, URLAccessToken, URLResourceOwner, AccountsURL):
		self.ClientId = ClientId
		self.ClientSecret = ClientSecret
		self.URLAccessToken = URLAccessToken
		self.URLResourceOwner = URLResourceOwner
		self.AccountsURL = AccountsURL
COOKIE_NAME = "sdslabs"
def make_request(url, token):
	headers = { 'Authorization': "Bearer {}".format(token), "Content-Type": "application/json" }
	response = requests.get(url, headers=headers)
	return response.json()
def get_token(config):
	data  = { "client_id": config.ClientId, "client_secret": config.ClientSecret, "grant_type": "client_credentials" }
	headers = { "Content-Type": "application/x-www-form-urlencoded" }
	response = requests.post(config.URLAccessToken, data=data, headers=headers)
	return response.json()['access_token']
def get_user_by_id(id, config):
	token = get_token(config)
	response = make_request(config.URLResourceOwner+"id/"+id, token)
	return response
def get_user_by_username(username, config):
	token = get_token(config)
	response = make_request(config.URLResourceOwner+"username/"+username, token)
	return response
def get_user_by_email(email, config):
	token = get_token(config)
	response = make_request(config.URLResourceOwner+"email/"+email, token)
	return response
def get_logged_in_user(config, response):
	cookie = response.cookies[COOKIE_NAME]
	if cookie == "":
		return ""
	token = get_token(config)
	user_data = make_request(config.URLResourceOwner+"logged_in_user/"+ cookie, token)
	return user_data
def login(config, w, response):
	user_data = get_logged_in_user(config, response)