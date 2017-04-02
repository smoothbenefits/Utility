from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'hiredate': (lambda value, model: self._setattr_strip(model, 'start_date', value)),
            'termdate': (lambda value, model: self._setattr_strip(model, 'terminate_date', value)),
            'active/term': (lambda value, model: self._setattr_strip(model, 'employment_status', value)),
            'division': (lambda value, model: self._setattr_strip(model, 'division', value)),
            'emp#': (lambda value, model: self._set_string_value_on_model(model, 'employee_number', value)),
            'job': (lambda value, model: self._setattr_strip(model, 'job_title', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeProfile()
