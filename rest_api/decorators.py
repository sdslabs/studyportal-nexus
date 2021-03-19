from rest_framework.response import Response
from users.serializers import UserSerializer
from studyportal.settings import SECRET_KEY
from rest_framework import status
from users.models import User
from functools import wraps
import jwt

def auth_user(function):
  @wraps(function)
  def wrap(self, request, *args, **kwargs):
      try:
        token = request.headers["Authorization"].split(" ")[1]
      except KeyError:
        return Response(
          { "message": "Authentication required" },
          status=status.HTTP_403_FORBIDDEN
        )
      try:
        decoded_jwt = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        user = UserSerializer(User.objects.get(username=decoded_jwt["username"])).data
      except Exception:
        return Response(
          { "message": "The token is corrupt or the user does not exist" },
          status=status.HTTP_403_FORBIDDEN
        )
      if user["role"] is "admin" or user["role"] is "moderator":
          return function(self, request, *args, **kwargs)
      else:
          return Response(
            { "message": "You must be an admin to access this route" },
            status=status.HTTP_403_FORBIDDEN
          )
  return wrap
