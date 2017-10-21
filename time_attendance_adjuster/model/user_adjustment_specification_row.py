from common.model.excel_row_model_base import ExcelRowModelBase


class UserAdjustmentSpecificationRow(ExcelRowModelBase):

    def __init__(self, row_number):
        super(UserAdjustmentSpecificationRow, self).__init__(row_number)
        self.first_name = None
        self.last_name = None
        self.employee_number = None
        self.department_number = None
        self.department_name = None
        self.adjustment_code = None

    def __is_user_info_valid(self):
        if (self.employee_number is None and (self.first_name is None or self.last_name is None)):
            return False

        return True

    def is_valid_for_complete_info(self):
        return self.__is_user_info_valid()

    def should_auto_populate_hours(self):
        return self.adjustment_code and 'auto' in self.adjustment_code.lower()

    def should_deduct_lunch_hours(self):
        return self.adjustment_code and 'hourly' in self.adjustment_code.lower()
