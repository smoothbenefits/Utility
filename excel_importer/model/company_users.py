from excel_type import ExcelType
from model_type import ModelType
from user import User
from base import Base
import datetime

class CompanyUsers(object):
    def __init__(self, company_id, company_domain):
        self.users = {}
        self.company_id = company_id
        self.company_domain = company_domain
        self.member_id_users = {}

    def _get_user_key(self, person):
        key = "{}{}{}".format(person.first_name, person.last_name, person.birth_date)
        key = key.replace(" ", "_").lower()
        return key

    def _create_new_user(self, first_name, last_name):
        the_user = User()
        the_user.first_name = first_name
        the_user.last_name = last_name
        the_user.email = "{0}{1}@{2}".format(first_name.replace(" ", "_"), last_name.replace(" ", "_"), self.company_domain)
        return the_user

    def _merge_info(self, existing, new):
        for attr in vars(existing):
            item = getattr(existing, attr, None)
            new_item = getattr(new, attr, None)
            if item and new_item and isinstance(item, Base):
                self._merge_info(item, new_item)
            if new_item and not item:
                setattr(existing, attr, new_item)
                print "merge attribute {}. Old value: {}, new value: {}".format(attr, item, new_item)


    def _merge_with_family(self, user, person):
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

    def merge_with_excel_data(self, row, excel_type):
        cur_user = None
        person = row[ModelType.PERSON]
        key = self._get_user_key(person)
        if excel_type == ExcelType.HCHP and person.relationship != 'Subscriber':
            cur_user = self.member_id_users.get(person.member_id[:-2])
            if not cur_user:
                return
            self._merge_with_family(cur_user, person)
        elif excel_type == ExcelType.ENROLLMENT and person.employee_profile and \
            not 'Active' in person.employee_profile.employment_status:
            return
        else:
            # we need to find the user reference by user key
            cur_user = self.users.get(key)
            if not cur_user:
                cur_user = self._create_new_user(person.first_name, person.last_name)
                self.users[key] = cur_user
                if person.member_id:
                    self.member_id_users[person.member_id[:-2]] = cur_user
            if cur_user.person:
                self._merge_info(cur_user.person, person)
            else:
                cur_user.person = person

    def get_all_users(self):
        return self.users.values()
