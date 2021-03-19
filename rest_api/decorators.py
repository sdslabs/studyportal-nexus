from rest_framework.response import Response
from studyportal.settings import SECRET_KEY
from rest_framework import status
from functools import wraps

def post_permitted(function):
  @wraps(function)
  def wrap(self, request, *args, **kwargs):
      try:
        token = request.headers["Authorization"].split(" ")[1]
      except KeyError:
        return Response(
          { "message": "Authentication required" },
          status=status.HTTP_403_FORBIDDEN
        )
      if token == SECRET_KEY:
          return function(self, request, *args, **kwargs)
      else:
          return Response(
            { "message": "You must have the proper rights to access this route" },
            status=status.HTTP_403_FORBIDDEN
          )
  return wrap
