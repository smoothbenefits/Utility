from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee Employment Start Date': (lambda value, model: setattr(model, 'start_date', value)),
            'Employee Employment Termination Date': (lambda value, model: setattr(model, 'start_date', value)),
            'Employee Employment Status': (lambda value, model: setattr(model, 'employment_status', value)),
            'Employee Department': (lambda value, model: setattr(model, 'department')),
            'Employee Division': (lambda value, model: setattr(model, 'division')),
            'Employee Employment Type': (lambda value, model: setattr(model, 'employment_type', value)),
            'Employee Number': (lambda value, model: setattr(model, 'employee_number', value)),
            'Employee Job Title': (lambda value, model: setattr(model, 'job_title', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeProfile()
