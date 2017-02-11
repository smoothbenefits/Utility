from common.csv_parse.model_parser_base import ModelParserBase
from ..model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            25: (lambda value, model: self._set_date_value_on_model(model, 'start_date', value)),
            26: (lambda value, model: self._set_date_value_on_model(model, 'terminate_date', value)),
            27: (lambda value, model: self._setattr_strip(model, 'employment_status', value)),
            16: (lambda value, model: self._setattr_strip(model, 'department', value)),
            15: (lambda value, model: self._setattr_strip(model, 'division', value)),
            18: (lambda value, model: self._setattr_strip(model, 'employment_type', value)),
            0: (lambda value, model: self._setattr_strip(model, 'employee_number', value)),
            17: (lambda value, model: self._setattr_strip(model, 'job_title', value))
        }

    def _create_model_instance(self):
        return EmployeeProfile()
