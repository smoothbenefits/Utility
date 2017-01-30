from common.excel_parse.model_parser_base import ModelParserBase
from ..model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee employment start date': (lambda value, model: setattr(model, 'start_date', value)),
            'employee employment termination date': (lambda value, model: setattr(model, 'start_date', value)),
            'employee employment status': (lambda value, model: setattr(model, 'employment_status', value.strip())),
            'employee department': (lambda value, model: setattr(model, 'department', value)),
            'employee division': (lambda value, model: setattr(model, 'division', value)),
            'employee employment type': (lambda value, model: setattr(model, 'employment_type', value.strip())),
            'employee number': (lambda value, model: setattr(model, 'employee_number', value)),
            'employee job title': (lambda value, model: setattr(model, 'job_title', value.strip()))
        }

    def _create_model_instance(self, row_number):
        return EmployeeProfile()
