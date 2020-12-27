from users.models import User
from users.serializers import UserSerializer
from rest_api.serializers import DepartmentSerializer, CourseSerializer, FileSerializer
from users.signals import notification_handler
from rest_api.models import Course


def add_course(course, department):
    course.save()
    user_list = User.objects.all()
    recipient_list = UserSerializer(user_list, many=True)
    department_code = DepartmentSerializer(department).data['abbreviation']
    course_code = CourseSerializer(course).data['code']
    recipients = recipient_list.data[:]
    for recipient in recipients:
        notification_handler(
            recipient=recipient['id'], actor="Admin",
            verb="added a course", action=course_code,
            notification_type="addcourse", target=department,
            link="/departments/" + department_code + "/courses/" + course_code
        )

def add_file(file, course):
    file.save()
    file_data = FileSerializer(file).data
    user_list = User.objects.all()
    recipient_list = UserSerializer(user_list, many=True)
    recipients = recipient_list.data[:]
    for recipient in recipients:
        for course_id in recipient['courses']:
            if course == Course.objects.get(id=course_id):
                serializer_course = CourseSerializer(course)
                department = serializer_course.data['department']
                department_code = DepartmentSerializer(department).data['abbreviation']
                notification_handler(recipient=recipient['id'], actor="Admin",
                                     verb="added a file", action=file_data['title'],
                                     notification_type="addfile", target=course,
                                     link="/departments/" + department_code + "/courses/" + file_data['course']['code'])
