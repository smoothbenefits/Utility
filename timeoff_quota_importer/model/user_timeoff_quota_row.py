class UserTimeoffQuotaRow(object):

    def __init__(self):
        self.email = None
        self.first_name = None
        self.last_name = None
        self.timeoff_type = None
        self.annual_target_hours = None
        self.accrual_frequency = None
        self.banked_hours = None

    def is_valid(self):
        if (self.email is None and (self.first_name is None or self.last_name is None)):
            return False

        if (self.accrual_frequency is None or self.timeoff_type is None or self.annual_target_hours is None):
            return False

        if (not self.annual_target_hours.isdecimal() or float(self.annual_target_hours) < 0):
            return False

        return True
