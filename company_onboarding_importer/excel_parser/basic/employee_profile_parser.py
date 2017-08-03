from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employment type': (lambda value, model: self._setattr_strip(model, 'employment_type', value)),
            'employment start date': (lambda value, model: self._setattr_strip(model, 'start_date', value)),
            'benefit start date': (lambda value, model: self._setattr_strip(model, 'benefit_start_date', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeProfile()
