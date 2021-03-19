from studyportal.settings import SECRET_KEY
import requests

URL = "http://localhost:8005/api/v1"

departments = [
    {
        "title": "Computer Science and Engineering",
        "abbreviation": "CSED",
        "courses": [
            {
                "department": "Computer Science and Engineering",
                "title": "Data Structures",
                "code": "CSN-101",
            },
            {
                "department": "Computer Science and Engineering",
                "title": "Engineering Analysis and Design",
                "code": "CSN-291",
            },
        ],
    },
    {
        "title": "Architecture and Planning",
        "abbreviation": "ARCD",
        "courses": [
            {
                "department": "Architecture and Planning",
                "title": "Introduction to Advanced Architecture Techniques",
                "code": "ARN-401",
            }
        ],
    },
]

files = [
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 0,
        "size": "123545",
        "code": "CSN-101",
        "filetype": "tutorials",
        "finalized": "True",
    },
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 105,
        "size": "123545",
        "code": "CSN-101",
        "filetype": "books",
        "finalized": "True",
    },
    {
        "title": "test.jpg",
        "driveid": "123456789",
        "downloads": 1000,
        "size": "123545",
        "code": "CSN-101",
        "filetype": "notes",
        "finalized": "True",
    },
    {
        "title": "test.docx",
        "driveid": "123456789",
        "downloads": 251,
        "size": "123545",
        "code": "CSN-101",
        "filetype": "exampapers",
        "finalized": "True",
    },
    {
        "title": "test.bmp",
        "driveid": "123456789",
        "downloads": 0,
        "size": "123545",
        "code": "CSN-291",
        "filetype": "tutorials",
        "finalized": "True",
    },
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 65,
        "size": "123545",
        "code": "CSN-291",
        "filetype": "tutorials",
        "finalized": "True",
    },
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 0,
        "size": "123545",
        "code": "ARN-401",
        "filetype": "notes",
        "finalized": "True",
    },
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 0,
        "size": "123545",
        "code": "ARN-401",
        "filetype": "tutorials",
        "finalized": "True",
    },
    {
        "title": "test.pdf",
        "driveid": "123456789",
        "downloads": 0,
        "size": "123545",
        "code": "CSN-291",
        "filetype": "tutorials",
        "finalized": "True",
    },
]

user = {
    "falcon_id": 123456,
    "username": "darkrider",
    "email": "darkrider251099@gmail.com",
    "profile_image": "http://www.newdesignfile.com/postpic/2009/09/generic-user-profile_354184.png",
    "role": "admin",
}

requests.post(URL + "/users", user, headers={'Authorization': 'Bearer '+ SECRET_KEY})
for department in departments:
    requests.post(
        URL + "/departments",
        {"title": department["title"], "abbreviation": department["abbreviation"]},
        headers={'Authorization': 'Bearer '+ SECRET_KEY},
    )
    for course in department["courses"]:
        requests.post(URL + "/courses", course, headers={'Authorization': 'Bearer '+ SECRET_KEY})

for file in files:
    requests.post(URL + "/files", file, headers={'Authorization': 'Bearer '+ SECRET_KEY})
