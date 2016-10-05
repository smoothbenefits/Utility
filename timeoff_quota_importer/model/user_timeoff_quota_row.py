from common.model.excel_row_model_base import ExcelRowModelBase


class UserTimeoffQuotaRow(ExcelRowModelBase):

    def __init__(self, row_number):
        super(UserTimeoffQuotaRow, self).__init__(row_number)
        self.email = None
        self.first_name = None
        self.last_name = None
        self.timeoff_type = None
        self.annual_target_hours = None
        self.accrual_frequency = None
        self.banked_hours = None

    def __is_user_info_valid(self):
        if (self.email is None and (self.first_name is None or self.last_name is None)):
            return False

        return True

    def is_valid_for_specs(self):
        if (not self.__is_user_info_valid()):
            return False

        if (self.accrual_frequency is None or self.timeoff_type is None or self.annual_target_hours is None):
            return False

        if (not self.__is_float(self.annual_target_hours) or float(self.annual_target_hours) < 0):
            return False

        return True

    def is_valid_for_banked_hours(self):
        if (not self.__is_user_info_valid()):
            return False

        if (self.timeoff_type is None):
            return False

        if (not self.__is_float(self.banked_hours)):
            return False

        return True

    def is_valid_for_complete_info(self):
        if (not self.__is_user_info_valid()):
            return False
            
        return self.is_valid_for_specs() and self.is_valid_for_banked_hours()

    def __is_float(self, input):
        if input is None:
            return False
        try:
            num = float(input)
        except ValueError:
            return False
        return True