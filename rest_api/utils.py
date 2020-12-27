from users.models import User
from users.serializers import UserSerializer
from rest_api.serializers import DepartmentSerializer, CourseSerializer
from users.signals import notification_handler


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
