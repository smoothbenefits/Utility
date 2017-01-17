from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_compensation import EmployeeCompensation


class EmployeeCompensationParser(ModelParserBase):
    def __init__(self):
        super(EmployeeCompensationParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee Annual Salary Amount': (lambda value, model: setattr(model, 'annual_base_salary', value)),
            'Employee Scheduled Hours': (lambda value, model: setattr(model, 'hours', value)),
            'Employee Pay Rate Effective Date': (lambda value, model: setattr(model, 'effective_date', value)),
            'Employee Pay Type': (lambda value, model: setattr(model, 'salary_type', value)),
            'Employee Hourly Pay Rate': (lambda value, model: setattr(model, 'hourly_rate')),
            'Employee Pay Cycle': (lambda value, model: setattr(model, 'pay_cycle'))
        }

    def _create_model_instance(self, row_number):
        return EmployeeCompensation()
