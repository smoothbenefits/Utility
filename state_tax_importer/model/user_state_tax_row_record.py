from common.model.excel_row_model_base import ExcelRowModelBase
from state_tax_info import StateTaxInfo


class UserStateTaxRowRecord(ExcelRowModelBase):

    def __init__(self, row_number):
        super(UserStateTaxRowRecord, self).__init__(row_number)
        self.first_name = None
        self.middle_name = None
        self.last_name = None
        self.employee_number = None
        self.sit_1_info = StateTaxInfo()
        self.sit_2_info = StateTaxInfo()

    def __is_user_info_valid(self):
        if (self.employee_number is None and (self.first_name is None or self.last_name is None)):
            return False

        return True

    def is_valid(self):
        return (
            self.__is_user_info_valid()
            and self.sit_1_info.is_valid()
            and self.sit_2_info.is_valid()
        )
