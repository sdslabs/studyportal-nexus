import os
import json
import random
import base64
from users.models import User
from users.serializers import UserSerializer
from resources.serializers import DepartmentSerializer, CourseSerializer, FileSerializer
from users.signals import notification_handler
from resources.models import Course, FILE_TYPE
from studyportal.drive.drive import driveinit
from studyportal.settings import CUR_DIR
from apiclient.http import MediaFileUpload
from apiclient import errors
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
    try:
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
    except Exception as error:
        print("An error occurred while sending notifications", error)


def add_file(file, course):
    file.save()
    file_data = FileSerializer(file).data
    user_list = User.objects.all()
    recipient_list = UserSerializer(user_list, many=True)
    recipients = recipient_list.data[:]
    try:
        for recipient in recipients:
            for course_id in recipient["courses"]:
                if course == Course.objects.get(id=course_id):
                    serializer_course = CourseSerializer(course)
                    department = serializer_course.data["department"]
                    department_code = DepartmentSerializer(department).data[
                        "abbreviation"
                    ]
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
    except Exception as error:
        print("An error occurred while sending notifications", error)


def uploadToDrive(service, folder_id, file_details):
    try:
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
    except errors.HttpError as error:
        print("An error occurred:", error)


def updatePermissions(service, fileId):
    try:
        new_permission = {"type": "anyone", "value": "anyone", "role": "reader"}
        service.permissions().create(fileId=fileId, body=new_permission).execute()
    except errors.HttpError as error:
        print("An error occurred:", error)


FOLDER_LIST = ["exampapers", "tutorials_review", "notes", "exampapers_review", "books", "notes_review", "tutorials", "books_review"]


def createFolder(service, folderName, parentFolder):
    folder_metadata = {
        'name': folderName,
        'parents': [parentFolder],
        'mimeType': 'application/vnd.google-apps.folder'
    }
    folder = service.files().create(body=folder_metadata,
                                    fields='id').execute()
    return folder.get('id')


def add_course_to_drive(course):
    with open(STRUCTURE) as f:
        structure = json.load(f)
    try:
        service = driveinit()
        course_data = CourseSerializer(course).data
        department = course_data["department"]
        structure_department = structure["study"][department["abbreviation"]]
        folder_struct = {
            "exampapers": "",
            "tutorials_review": "",
            "notes": "",
            "exampapers_review": "",
            "books": "",
            "notes_review": "",
            "tutorials": "",
            "books_review": "",
            "id": ""
        }
        course_folder_id = createFolder(service, course_data["code"], structure_department["id"])
        folder_struct["id"] = course_folder_id
        for folder in FOLDER_LIST:
            course_subfolder_id = createFolder(service, folder, course_folder_id)
            folder_struct[folder] = course_subfolder_id
        structure_department[course_data["code"]] = folder_struct
        with open(STRUCTURE, 'w') as wf:
            json.dump(structure, wf, indent=4)
    except Exception:
        return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)


def get_file_details_and_upload(
    file, name, filetype, course, for_review, is_file_object
):
    with open(STRUCTURE) as f:
        structure = json.load(f)
    try:
        # File manipulation starts here
        if is_file_object:
            mime_type = file.content_type
            ext = mime_type.split("/")[1].split(";")[0]
            file_data = file.read()
        else:
            file_type = file.split(",")[0]
            mime_type = file_type.split(":")[1].split(";")[0]
            ext = file_type.split("/")[1].split(";")[0]
            base64String = file.split(",")[1]
        if ext == "vnd.openxmlformats-officedocument.wordprocessingml.document":
            ext = "docx"
        rand = str(random.randint(0, 100000))
        temp = open("temp" + rand + "." + ext, "wb")
        if is_file_object:
            temp.write(file_data)
        else:
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
        updatePermissions(driveinit(), driveid)
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
