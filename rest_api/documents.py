from django_elasticsearch_dsl import Document, Index
from rest_api.models import Course, Department, File

courses = Index('courses')
departments = Index('departments')
files = Index('files')

@courses.doc_type
class CourseDocument(Document):
    class Django:
        model = Course

        fields = [
            'id',
            'title',
            'code',
        ]

@departments.doc_type
class DepartmentDocument(Document):
    class Django:
        model = Department

        fields = [
            'id',
            'title',
            'abbreviation',
        ]

@files.doc_type
class FileDocument(Document):
    class Django:
        model = File

        fields = [
            'id',
            'title',
            'fileext',
            'filetype'
        ]