from ..model.person import Person
from common.data_provider.sql_data_provider_base import SqlDataProviderBase
from address_data_provider import AddressDataProvider
from phone_data_provider import PhoneDataProvider
from employee_profile_data_provider import EmployeeProfileDataProvider
from employee_compensation_data_provider import EmployeeCompensationDataProvider


class DependentDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, user_id):
        super(DependentDataProvider, self).__init__(cursor)
        self.user_id = user_id

    def _get_sql_string(self):
        return 'select id, first_name, middle_name, last_name, relationship, gender, birth_date, ssn, email from app_person where user_id=\'{}\' and person_type=\'family\''.format(self.user_id)

    def _get_model_populated_with_data(self, data):
        members = []
        if not data:
            return members
        for row in data:
            if not row:
                continue
            cur_person = Person()
            cur_person.id = row[0]
            cur_person.first_name = row[1]
            cur_person.middle_name = row[2]
            cur_person.last_name = row[3]
            cur_person.relationship = row[4]
            cur_person.gender = row[5]
            cur_person.birth_date = row[6]
            cur_person.ssn = row[7]
            cur_person.email = row[8]
            cur_person.person_type = 'primary_contact'
            address_repo = AddressDataProvider(self.cursor, cur_person.id)
            cur_person.address = address_repo.get_model()
            phone_repo = PhoneDataProvider(self.cursor, cur_person.id)
            cur_person.phone = phone_repo.get_model()
            profile_repo = EmployeeProfileDataProvider(self.cursor, cur_person.id)
            cur_person.employee_profile = profile_repo.get_model()
            comp_repo = EmployeeCompensationDataProvider(self.cursor, cur_person.id)
            cur_person.employee_compensation = comp_repo.get_model()
            members.append(cur_person)
        return members
