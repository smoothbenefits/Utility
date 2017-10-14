from common.model.excel_row_model_base import ExcelRowModelBase


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

    def is_valid_for_complete_info(self):
        return True
