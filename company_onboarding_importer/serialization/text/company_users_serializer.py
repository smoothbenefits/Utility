from ..serializer import Serializer
from user_serializer import UserSerializer
import logging

Logger = logging.getLogger("import_excel")

class CompanyUsersSerializer(object):
    @staticmethod
    def serialize(company_users, f, exclude_path):
        exclude_list = Serializer.get_exclude_list(exclude_path)
        f.write("\nUSERS:\n")
        for user in company_users.get_all_users():
            if user.email.lower() not in exclude_list and \
                user.person.employee_profile and \
                user.person.employee_profile.employment_status and \
                user.person.employee_profile.employment_status == 'A':
                UserSerializer.serialize(user, f)

