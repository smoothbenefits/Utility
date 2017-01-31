from common.excel_parse.model_parser_base import ModelParserBase
from ..model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee employment start date': (lambda value, model: self._setattr_strip(model, 'start_date', value)),
            'employee employment termination date': (lambda value, model: self._setattr_strip(model, 'start_date', value)),
            'employee employment status': (lambda value, model: self._setattr_strip(model, 'employment_status', value)),
            'employee department': (lambda value, model: self._setattr_strip(model, 'department', value)),
            'employee division': (lambda value, model: self._setattr_strip(model, 'division', value)),
            'employee employment type': (lambda value, model: self._setattr_strip(model, 'employment_type', value)),
            'employee number': (lambda value, model: self._setattr_strip(model, 'employee_number', value)),
            'employee job title': (lambda value, model: self._setattr_strip(model, 'job_title', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeProfile()
