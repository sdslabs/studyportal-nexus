from rest_framework.response import Response
from users.serializers import UserSerializer
from studyportal.settings import SECRET_KEY
from rest_framework import status
from users.models import User
from functools import wraps
import jwt


def check_user(function):
    @wraps(function)
    def wrap(self, request, *args, **kwargs):
        try:
            token = request.headers["Authorization"].split(" ")[1]
        except KeyError:
            return Response(
                {"message": "Authentication required"}, status=status.HTTP_403_FORBIDDEN
            )
        try:
            decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
            user = UserSerializer(
                User.objects.get(username=decoded_jwt["username"])
            ).data
        except Exception:
            return Response(
                {"message": "The token is corrupt or the user does not exist"},
                status=status.HTTP_403_FORBIDDEN,
            )
        return function(self, request, user, *args, **kwargs)

    return wrap
