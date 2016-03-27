from base import Base

class CompanyUsers(object):
    def __init__(self, company_id):
        self.company_id = company_id
        self.users = {}
        self.benefits = None
        self.prepare_enrollment = False

    def _merge_info(self, existing, new):
        for attr in vars(existing):
            item = getattr(existing, attr, None)
            new_item = getattr(new, attr, None)
            if item and new_item and isinstance(item, Base):
                self._merge_info(item, new_item)
            if new_item and not item:
                setattr(existing, attr, new_item)

    def _get_user_key(self, user_info):
        raise NotImplementedError("Please implement _get_user_key function")
    

    def merge_with_excel_data(self, row, excel_type):
        raise NotImplementedError("Please implement merge_with_excel_data function")
    
    def merge_with_db_data(self, users):
        for user in users:
            if user.person and user.person.birth_date:
                key = self._get_user_key(user.person)
                cur_user = self.users.get(key)
                if cur_user:
                    self._merge_info(cur_user, user)
                else:
                    self.users[key] = user

    def post_parse_processing(self):
        raise NotImplementedError("Please implement post_parse_processing function")

    def get_all_users(self):
        if not self.prepare_enrollment:
            raise Exception("Did not run post processing step!")
        return self.users.values()
