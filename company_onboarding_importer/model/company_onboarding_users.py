import re

from company_users import CompanyUsers
from user import User
from model_type import ModelType

class CompanyOnboardingUsers(CompanyUsers):
    def __init__(self, company_name):
        super(CompanyOnboardingUsers, self).__init__(company_name)

    def _get_user_key(self, user_info):
        return user_info.ssn

    def _create_new_user(self, person):
        the_user = User()
        the_user.first_name = person.first_name
        the_user.last_name = person.last_name
        the_user.email = person.email
        if not the_user.email.strip():
            the_user.email = re.sub('[\s+]', '', '{}.{}@{}.com'.format(person.first_name, person.last_name, self.company_name))
        return the_user

    def merge_with_excel_data(self, row):
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
