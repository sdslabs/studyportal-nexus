import os
import json
import pytest
import requests
from studyportal.settings import CUR_DIR

NEXUS_URL = 'http://localhost:8005/api/v1/'
RESOURCES = os.path.join(
    CUR_DIR,
    'test/resources/rest_api'
)


class TestRestApi():

    def test_get_department_by_abbr(self):
        with open(os.path.join(RESOURCES, 'sample_department_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'departments/?department=ASED&format=json')
        actual_response = r.json()
        assert actual_response == expected_response

    def test_post_department(self):
        data = {
            'title': 'dep',
            'abbreviation': 'DEP',
            'imageurl': 'DEP.svg'
        }
        r = requests.post(url=NEXUS_URL + 'departments', data=data)
        assert r.status_code == 200

    def test_get_courses_by_department(self):
        with open(os.path.join(RESOURCES, 'sample_course_list_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'courses/?course=null&department=118&format=json')
        actual_response = r.json()
        assert actual_response == expected_response

    def test_get_course_by_code(self):
        with open(os.path.join(RESOURCES, 'sample_course_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'courses/?course=ASN-700&department=118&format=json')
        actual_response = r.json()
        assert actual_response == expected_response

    def test_post_course(self):
        data = {
            'title': 'cour',
            'department': '120',
            'code': 'COU-000'
        }
        r = requests.post(url=NEXUS_URL + 'courses', data=data)
        assert r.status_code == 200

    def test_get_files_by_course(self):
        with open(os.path.join(RESOURCES, 'sample_files_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'files/?course=1251&filetype=null&format=json')
        actual_response = r.json()
        assert actual_response == expected_response

    def test_get_files_by_type(self):
        with open(os.path.join(RESOURCES, 'sample_files_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'files/?course=1251&filetype=exampapers&format=json')
        actual_response = r.json()
        assert actual_response == expected_response

    def test_post_file(self):
        data = {
            'title': 'pdf.pdf',
            'driveid': '123456789',
            'downloads': 0,
            'size': '123545',
            'code': 'ARN-101',
            'filetype': 'tutorials',
            'finalized': 'True'
        }
        r = requests.post(url=NEXUS_URL + 'files', data=data)
        assert r.status_code == 200

    def test_search(self):
        with open(os.path.join(RESOURCES, 'sample_search_response.json')) as f:
            expected_response = json.load(f)
        r = requests.get(url=NEXUS_URL + 'search/?q=test&format=json')
        actual_response = r.json()
        assert actual_response == expected_response
