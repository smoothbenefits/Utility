import re

from company_users import CompanyUsers
from user import User
from model_type import ModelType

class CompanyOnboardingUsers(CompanyUsers):
    def __init__(self, company_name, is_trial):
        super(CompanyOnboardingUsers, self).__init__(company_name, is_trial)

    def _get_user_key(self, user_info):
        return user_info.ssn

    def _create_new_user(self, person):
        the_user = User()
        the_user.first_name = person.first_name
        the_user.last_name = person.last_name
        the_user.email = person.email
        email_host = self.company_name
        if self.is_trial:
            email_host += 'workbenefitsme'
        if not the_user.email.strip() or self.is_trial:
            email = '{}{}{}@{}.com'.format(
                re.sub('[\s+]', '', person.first_name),
                '.' + re.sub('[\s+]', '', person.middle_name),
                '.' + re.sub('[\s+]', '', person.last_name),
                re.sub('[\s+]', '', email_host)
            )
            the_user.email = email
            person.email = email
        return the_user

    def merge_with_file_data(self, row):
        cur_user = None
        person = row.get(ModelType.PERSON)
        if not person:
            return
        key = self._get_user_key(person)
        cur_user = self.users.get(key)
        if not cur_user:
            cur_user = self._create_new_user(person)
            cur_user.person = person
            self.users[key] = cur_user

        cur_user.direct_deposits = row.get(ModelType.DIRECT_DEPOSITS)
        cur_user.w4 = row.get(ModelType.W4)
        if cur_user.person.employee_profile:
            if cur_user.person.employee_profile.employee_id:
                cur_user.service_user_external_id = cur_user.person.employee_profile.employee_id
            else:
                cur_user.service_user_external_id = cur_user.person.employee_profile.employee_number
