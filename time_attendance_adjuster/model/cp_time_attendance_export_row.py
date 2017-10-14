from common.model.excel_row_model_base import ExcelRowModelBase

EARNING_CODE_REGULAR = 'REG'
EARNING_CODE_OVERTIME = 'OT'


class CPTimeAttendanceExportRow(ExcelRowModelBase):

    def __init__(self, row_number):
        super(CPTimeAttendanceExportRow, self).__init__(row_number)
        self.file_type = ''
        self.client_name = ''
        self.client_number = ''
        self.employee_number = ''
        self.employee_name = ''
        self.ssn = ''
        self.earning_name = ''
        self.earning_code = ''
        self.hours = ''
        self.pay_rate = ''
        self.fixed_amount = ''
        self.location = ''
        self.division = ''
        self.department = ''
        self.job_code = ''
        self.begin_balance = ''
        self.accrued = ''
        self.used = ''
        self.end_balance = ''

        self.hours_adjustment = 0.0

    def is_valid_for_complete_info(self):
        return True

    def adjust_hours(self, hours_delta):
        self.hours_adjustment = self.hours_adjustment + hours_delta

    def get_adjusted_hours(self):
        if (not self.hours):
            return None
        if (not self.hours_adjustment):
            return self.hours
        return self.hours + self.hours_adjustment

    def is_regular_record(self):
        return self.earning_code == EARNING_CODE_REGULAR

    def is_overtime_record(self):
        return self.earning_code == EARNING_CODE_OVERTIME
