from model.company_users import CompanyUsers
from model_type import ModelType
from excel_type import ExcelType
from user import User
import datetime

class FairviewUsers(CompanyUsers):
    def __init__(self, company_id, company_domain):
        super(FairviewUsers, self).__init__(company_id)
        self.company_domain = company_domain
        self.member_id_users = {}
        self._email_list = []

    def _get_unique_email(self, email, counter=0):
        if not email in self._email_list:
            self._email_list.append(email)
            return email
        else:
            counter += 1
            email = '{}{}'.format(email, counter)
            return self._get_unique_email(email, counter)

    def _get_user_key(self, user_info):
        if isinstance(user_info.birth_date, unicode):
            birth_date = datetime.datetime.strptime(user_info.birth_date, '%m/%d/%Y')
        else:
            birth_date = user_info.birth_date
        key = "{}{}{}".format(user_info.first_name, user_info.last_name, birth_date.strftime('%m/%d/%Y'))
        key = key.replace(" ", "_").lower()
        return key

    def _create_new_user(self, first_name, last_name):
        the_user = User()
        the_user.first_name = first_name
        the_user.last_name = last_name
        email_user_name = self._get_unique_email('{0}{1}'.format(first_name.replace(" ", "_"), last_name.replace(" ", "_")))
        the_user.email = "{0}@{1}".format(email_user_name, self.company_domain)
        return the_user

    def _merge_with_family(self, user, person):
        person.person_type = 'family'
        if not user.family_members or len(user.family_members) <= 0:
            user.family_members.append(person)
        else:
            key = self._get_user_key(person)
            merge_target = None
            for member in user.family_members:
                member_key = self._get_user_key(member)
                if member_key == key:
                    merge_target = member
                    break
            if not merge_target:
                user.family_members.append(person)
            else:
                self._merge_info(merge_target, person)

    def _populate_dependent(self, dependent, c_user):
        if not dependent or c_user:
            return
        self._merge_with_family(c_user, dependent)

    def _map_with_company(self, health_selection):
        if not self.benefits or not self.benefits.medicals or not health_selection:
            return
        # we need to match benefit_name with id
        for medical in self.benefits.medicals.values():
            if '1000/3000' in medical.name and \
                '$1000 HRA' in health_selection.benefit_name and \
                'Benefit' not in health_selection.benefit_name:
                health_selection.benefit_plan = medical
                break

            if '2000/4000' in medical.name and \
                '$1000 HRA' in health_selection.benefit_name and \
                'Benefit' in health_selection.benefit_name:
                health_selection.benefit_plan = medical
                break

            if '$5000' in medical.name and \
                '$5000' in health_selection.benefit_name:
                health_selection.benefit_plan = medical
                break

    def _populate_medical(self, health_selection, c_user):
        self._map_with_company(health_selection)
        self._map_with_company(c_user.person.medical_enrollment)
        for member in c_user.family_members:
            self._map_with_company(member.medical_enrollment) 

        c_user.medical_selection = health_selection


    def merge_with_excel_data(self, row, excel_type):
        cur_user = None
        person = row.get(ModelType.PERSON, None)
        if not person:
            return
        key = self._get_user_key(person)
        if excel_type == ExcelType.HCHP and person.relationship != 'Subscriber':
            cur_user = self.member_id_users.get(person.member_id[:-2])
            if not cur_user:
                return
            self._merge_with_family(cur_user, person)
        else:
            # we need to find the user reference by user key
            cur_user = self.users.get(key)
            if not cur_user:
                cur_user = self._create_new_user(person.first_name, person.last_name)
                self.users[key] = cur_user

            if cur_user.person:
                self._merge_info(cur_user.person, person)
            else:
                person.person_type = 'primary_contact'
                cur_user.person = person

            if person.member_id:
                self.member_id_users[person.member_id[:-2]] = cur_user

        self._populate_dependent(row.get(ModelType.DEPENDENT, None), cur_user)
        self._populate_medical(row.get(ModelType.HEALTH_SELECTION, None), cur_user)

    def _get_option_by_option_type(self, options, option_type):
        for option in options:
            if option_type.lower() in option.benefit_option_type.lower():
                return option

    def _update_medical_enrollment(self, user):
        if user.medical_selection and user.medical_selection.benefit_plan:
            # we need to figure out what option we should assign to the person
            found_option = None
            if not user.family_members:
                found_option = self._get_option_by_option_type(user.medical_selection.benefit_plan.options, 'individual')
            elif len(user.family_members) == 1:
                found_option = self._get_option_by_option_type(user.medical_selection.benefit_plan.options, 'individual_plus_one')
            else:
                found_option = self._get_option_by_option_type(user.medical_selection.benefit_plan.options, 'individual_plus_family')

            if found_option:
                user.medical_selection.option = found_option
                user.person.medical_enrollment.option = found_option
                for member in user.family_members:
                    if member.medical_enrollment:
                        member.medical_enrollment.option = found_option

    def post_parse_processing(self):
        self.prepare_enrollment = True
        for user in self.users.values():
            self._update_medical_enrollment(user)

    