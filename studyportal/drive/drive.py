from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request

CREDENTIALS = os.path.join(
    os.path.abspath(os.path.dirname(__file__)), "credentials.json"
)
PICKLE = os.path.join(os.path.abspath(os.path.dirname(__file__)), "token.pickle")


def driveinit():
    creds = None
    SCOPES = [
        "https://www.googleapis.com/auth/drive",
        "https://www.googleapis.com/auth/drive.readonly",
        "https://www.googleapis.com/auth/drive.file",
        "https://www.googleapis.com/auth/drive.appdata",
        "https://www.googleapis.com/auth/userinfo.profile",
        "openid",
        "https://www.googleapis.com/auth/userinfo.email",
    ]
    print("here yet?")
    if os.path.exists(PICKLE):
        with open(PICKLE, "rb") as token:
            creds = pickle.load(token)
    print("wbt")
    # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            print("refreshinmg", creds)
            creds.refresh(Request())
            print("???")
        else:
            print("something else")
            flow = InstalledAppFlow.from_client_secrets_file(CREDENTIALS, SCOPES)
            creds = flow.run_local_server(port=0)
        # Save the credentials for the next run
        with open(PICKLE, "wb") as token:
            pickle.dump(creds, token)
    print("hi")
    service = build("drive", "v3", credentials=creds)

    user_service = build("oauth2", "v2", credentials=creds)
    info = user_service.userinfo().get().execute()
    print("Accessing drive of user {} <{}>".format(((info["name"])), info["email"]))

    return service


if __name__ == "__main__":
    driveinit()
