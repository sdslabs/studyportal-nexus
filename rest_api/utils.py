import json
import os
import random
import base64
from users.models import User
from users.serializers import UserSerializer
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer
from users.signals import notification_handler
from rest_api.models import Course
from studyportal.drive.drive import driveinit
from studyportal.settings import CUR_DIR
from apiclient.http import MediaFileUpload
from rest_framework.response import Response
from rest_framework import status

STRUCTURE = os.path.join(CUR_DIR, "drive/structure.json")
if os.environ.get("DEVELOPMENT_MODE") == "True":
    STRUCTURE = os.path.join(CUR_DIR, "test/resources/structure.json")


def add_course(course, department):
    course.save()
    user_list = User.objects.all()
    recipient_list = UserSerializer(user_list, many=True)
    department_code = DepartmentSerializer(department).data["abbreviation"]
    course_code = CourseSerializer(course).data["code"]
    recipients = recipient_list.data[:]
    for recipient in recipients:
        notification_handler(
            recipient=recipient["id"],
            actor="Admin",
            verb="added a course",
            action=course_code,
            notification_type="addcourse",
            target=department,
            link="/departments/" + department_code + "/courses/" + course_code,
        )


def add_file(file, course):
    file.save()
    file_data = FileSerializer(file).data
    user_list = User.objects.all()
    recipient_list = UserSerializer(user_list, many=True)
    recipients = recipient_list.data[:]
    for recipient in recipients:
        for course_id in recipient["courses"]:
            if course == Course.objects.get(id=course_id):
                serializer_course = CourseSerializer(course)
                department = serializer_course.data["department"]
                department_code = DepartmentSerializer(department).data["abbreviation"]
                notification_handler(
                    recipient=recipient["id"],
                    actor="Admin",
                    verb="added a file",
                    action=file_data["title"],
                    notification_type="addfile",
                    target=course,
                    link="/departments/"
                    + department_code
                    + "/courses/"
                    + file_data["course"]["code"],
                )


def uploadToDrive(service, folder_id, file_details):
    file_metadata = {"name": file_details["name"], "parents": [folder_id]}
    media = MediaFileUpload(
        file_details["location"], mimetype=file_details["mime_type"]
    )
    file = (
        service.files()
        .create(body=file_metadata, media_body=media, fields="id")
        .execute()
    )
    return file.get("id")


def get_file_details_and_upload(file, name, filetype, course, for_review):
    with open(STRUCTURE) as f:
        structure = json.load(f)
    try:
        # File manipulation starts here
        file_type = file.split(",")[0]
        mime_type = file_type.split(":")[1].split(";")[0]
        ext = file_type.split("/")[1].split(";")[0]
        base64String = file.split(",")[1]

        rand = str(random.randint(0, 100000))
        temp = open("temp" + rand + "." + ext, "wb")
        temp.write(base64.b64decode(base64String))
        file_details = {
            "name": name,
            "mime_type": mime_type,
            "location": "temp" + rand + "." + ext,
        }
        file_size = os.path.getsize("temp" + rand + "." + ext)
        size = get_size(file_size)

        # Get folder id from config
        if for_review:
            review_identifier = str("_review")
        else:
            review_identifier = str("")
        folder_identifier = filetype.lower().replace(" ", "") + review_identifier
        folder_id = structure["study"][course.department.abbreviation][course.code][
            folder_identifier
        ]
        driveid = uploadToDrive(driveinit(), folder_id, file_details)
        os.remove("temp" + rand + "." + ext)
        # end of manipulation
        return {"size": size, "driveid": driveid, "ext": ext}
    except Exception:
        os.remove("temp" + rand + "." + ext)
        return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def get_size(size):
    file_size = size
    if round(file_size / (1024 * 1024), 2) == 0.00:
        return str(round(file_size / (1024), 2)) + " KB"
    else:
        return str(round(file_size / (1024 * 1024), 2)) + " MB"


def fileName(file):
    return file.rpartition(".")[0]


def get_title(name):
    file_title = name
    return fileName(file_title)


def get_fileext(name):
    filename = name
    return filename.split(".")[-1]
