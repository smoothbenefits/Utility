from ..serializer import Serializer
from user_serializer import UserSerializer
from company_benefits_text_serializer import CompanyBenefitsTextSerializer
import logging

Logger = logging.getLogger("import_excel")

class CompanyUsersTextSerializer(object):
    @staticmethod
    def serialize(company_users, file_name, exclude_path):
        exclude_list = Serializer.get_exclude_list(exclude_path)
        Logger.debug("serialize company_user in text file {}".format(file_name))
        target = open(file_name, 'w')
        target.truncate() # clear the file content so it is now empty
        CompanyBenefitsTextSerializer.serialize(company_users.benefits, target)
        target.write("\nUSERS:\n")
        for user in company_users.get_all_users():
            if user.email.lower() not in exclude_list and \
                user.person.employee_profile and \
                user.person.employee_profile.employment_status and \
                'Active' in user.person.employee_profile.employment_status:
                UserSerializer.serialize(user, target)

        target.close()

