from studyportal.falcon.config import config
from studyportal.falcon import client
from apiclient import errors

def authorize_user(request):
  # cookie manipulation starts here
  cookies = {}
  separateCookies = request.headers["Cookie"].split("; ")
  for cookie in separateCookies:
    array = cookie.split("=")
    cookies[array[0]] = array[1]
    # end of cookie manipulation
    try:
      user = client.get_logged_in_user(config, {"sdslabs": cookies["sdslabs"]})
      for key in user:
        if key == "error":
          return Response({"message": "User is not authenticated in Arceus"}, status=status.HTTP_404_NOT_FOUND)
      return user
    except errors.HttpError as error:
      print("An error occurred:", error)
