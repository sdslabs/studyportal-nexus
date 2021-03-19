from django_elasticsearch_dsl import Document, Index
from resources.models import Course, Department, File

COURSES = Index("courses")
DEPARTMENTS = Index("departments")
FILES = Index("files")


@COURSES.doc_type
class CourseDocument(Document):
    class Django:
        model = Course

        fields = [
            "id",
            "title",
            "code",
        ]


@DEPARTMENTS.doc_type
class DepartmentDocument(Document):
    class Django:
        model = Department

        fields = [
            "id",
            "title",
            "abbreviation",
        ]


@FILES.doc_type
class FileDocument(Document):
    class Django:
        model = File

        fields = ["id", "title", "fileext", "filetype"]
