from ..serializer import Serializer
from user_serializer import UserSerializer
import logging

Logger = logging.getLogger("import_excel")

class CompanyUsersSerializer(object):
    @staticmethod
    def serialize(company_users, f, exclude_path):
        exclude_list = Serializer.get_exclude_list(exclude_path)
        f.write("\nUSERS:\n")
        count = 0
        for user in company_users.get_all_users():
            if user.email.lower() not in exclude_list and \
                user.person.employee_profile and \
                user.person.employee_profile.employment_status and \
                user.person.employee_profile.employment_status != 'T':
                print "{} {} | {} | {}".format(user.first_name, user.last_name, user.email, user.text_password)
                UserSerializer.serialize(user, f)
                count += 1
        f.write("\nUser Count: {}\n".format(count))

