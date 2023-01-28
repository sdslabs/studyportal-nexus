from studyportal.falcon.config import config
from rest_framework.response import Response
from studyportal.falcon import client
from rest_framework import status
from apiclient import errors


def authorize_user(request):
    cookies = request.COOKIES
    print(cookies)
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n")
    try:
        user = client.get_logged_in_user(config, {"sdslabs": request.headers["Authorization"].split(" ")[1]})
        #user = request.headers["Authorization"].split(" ")[1]
        print("\n\n\n\n\n\n\n\n")
        print(user)
        print("\n\n\n\n\n\n\n\n\n")
        for key in user:
            if key == "error":
                return Response(
                    {"message": "User is not authenticated in Arceus"},
                    status=status.HTTP_404_NOT_FOUND,
                )
        return user
    except errors.HttpError as error:
        print("An error occurred:", error)
