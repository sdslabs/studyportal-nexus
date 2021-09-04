from studyportal.falcon.config import config
from rest_framework.response import Response
from studyportal.falcon import client
from rest_framework import status
from apiclient import errors


def authorize_user(request):
    cookies = request.COOKIES
    try:
        user = client.get_logged_in_user(config, {"sdslabs": cookies["sdslabs"]})
        for key in user:
            if key == "error":
                return Response(
                    {"message": "User is not authenticated in Arceus"},
                    status=status.HTTP_404_NOT_FOUND,
                )
        return user
    except errors.HttpError as error:
        print("An error occurred:", error)
