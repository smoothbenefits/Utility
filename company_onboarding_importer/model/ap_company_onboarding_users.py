import re

from company_users import CompanyUsers
from user import User
from model_type import ModelType
from common.utility.password_utility import PasswordUtility

class APCompanyOnboardingUsers(CompanyUsers):
    _division_map = {
        10: 'EXECUTIVE',
        20: 'ACCOUNTING',
        25: 'GRAPHICS',
        26: 'PRODUCTION MANAGER',
        27: 'FLEXO',
        30: 'SALES/CUSTOMER SERVICE',
        35: 'PURCHASING',
        40: 'TOOL MAKER',
        45: 'MATERIAL HANDLERS',
        50: 'EXTRUSION',
        60: 'TOOL SETTERS',
        65: 'TAG & LABEL',
        70: 'PRESS OPERATORS',
        80: 'SHIPPING',
        90: 'MAINTENANCE',
        95: 'ADMIN MAINTENANCE'
    }

    _salary_type_map = {
        1: 'H',
        2: 'S'
    }

    _pay_cycle_map = {
        1: {'pay_cycle': 'W', 'num_per_year': 52},
        2: {'pay_cycle': 'B', 'num_per_year': 26},
        3: {'pay_cycle': 'S', 'num_per_year': 24},
        4: {'pay_cycle': 'M', 'num_per_year': 12},
    }

    def __init__(self, company_name, is_trial):
        super(APCompanyOnboardingUsers, self).__init__(company_name, is_trial)
        self._password_util = PasswordUtility()

    def _get_user_key(self, user_info):
        return user_info.ssn

    def _create_new_user(self, person):
        the_user = User()
        the_user.first_name = person.first_name
        the_user.last_name = person.last_name
        email_host = self.company_name
        if self.is_trial:
            email_host += 'workbenefitsme'
        if not the_user.email or not the_user.email.strip() or self.is_trial:
            email = '{}{}@{}.com'.format(
                re.sub('[\s+]', '', person.first_name),
                re.sub('[\s+]', '', person.last_name[0]),
                re.sub('[\s+]', '', email_host)
            )
            the_user.email = email
            person.email = email
        else:
            the_user.email = person.email

        # We should randomize the passwords
        password, hashed_password = self._password_util.get_next_password_pair()
        the_user.password = hashed_password
        the_user.text_password = password
        return the_user

    def _update_annual_salary(self, user, pay_per_year):
        if user.person.employee_compensation.annual_base_salary:
            user.person.employee_compensation.annual_base_salary *= pay_per_year 

    def _translate_to_system_values(self, user):
        user.person.middle_name = ''
        if not user.person.email:
            user.person.email = ''
        if user.person.employee_profile:
            user.service_user_external_id = user.person.employee_profile.employee_number
            if user.person.employee_profile.employment_status == 'Z':
                user.person.employee_profile.employment_status = 'T'
            else:
                user.person.employee_profile.employment_status = 'A'
            user.person.employee_profile.division = self._division_map.get(
                user.person.employee_profile.division,
                ''
            )
            user.person.employee_profile.employment_type = 'FullTime'
        if user.person.employee_compensation:
            user.person.employee_compensation.hours = 0
            user.person.employee_compensation.salary_type = self._salary_type_map.get(
                user.person.employee_compensation.salary_type
            )
            pay_cycle_instance = self._pay_cycle_map.get(user.person.employee_compensation.pay_cycle)
            if pay_cycle_instance:
                user.person.employee_compensation.pay_cycle = pay_cycle_instance['pay_cycle']
                self._update_annual_salary(user, pay_cycle_instance['num_per_year'])
            else:
                user.person.employee_compensation.pay_cycle = None

        if user.w4 and not user.w4.extra_amount:
            user.w4.extra_amount = 0

    def merge_with_file_data(self, row):
        cur_user = None
        person = row.get(ModelType.PERSON)
        if not (person and (person.first_name or person.last_name)):
            return
        key = self._get_user_key(person)
        cur_user = self.users.get(key)
        if not cur_user:
            cur_user = self._create_new_user(person)
            cur_user.person = person
            self.users[key] = cur_user

        cur_user.w4 = row.get(ModelType.W4)
        self._translate_to_system_values(cur_user)

    def _find_with_first_name_last_name(self, first_name, last_name):
        for user in self.get_all_users():
            if user.person and user.person.first_name and first_name.upper() in user.person.first_name.upper() and \
                user.person.last_name and last_name.upper() in user.person.last_name.upper():
                return user

    def merge_with_basic_data(self, basic_users):
        all_basic_users = basic_users.get_all_users()
        for basic_user in all_basic_users:
            if basic_user.person and basic_user.person.first_name and basic_user.person.last_name:
                matched_user = self._find_with_first_name_last_name(basic_user.person.first_name, basic_user.person.last_name)
                if matched_user:
                    if not self.is_trial and basic_user.person.email.strip():
                        matched_user.person.email = basic_user.person.email
                        matched_user.email = basic_user.email
                    self._merge_info(matched_user, basic_user)

