from company_users import CompanyUsers
from user import User
from model_type import ModelType

class BasicCompanyOnboardingUsers(CompanyUsers):
    def __init__(self, company_name):
        super(BasicCompanyOnboardingUsers, self).__init__(company_name, False)

    def _get_user_key(self, user_info):
        return user_info.email

    def _create_new_user(self, person):
        the_user = User()
        the_user.first_name = person.first_name
        the_user.last_name = person.last_name
        the_user.email = person.email
        email_host = self.company_name
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

