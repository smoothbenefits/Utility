class UserInfo(object):

    def __init__(self, user_id, first_name, last_name, employee_number):
        self.user_id = user_id
        self.first_name = first_name
        self.last_name = last_name
        self.employee_number = employee_number

    def get_full_name(self):
        if self.first_name is not None and self.last_name is not None:
            return self.first_name + ' ' + self.last_name
        return None
