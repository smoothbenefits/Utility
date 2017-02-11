from common.csv_parse.model_parser_base import ModelParserBase
from ..model.employee_compensation import EmployeeCompensation


class EmployeeCompensationParser(ModelParserBase):
    def __init__(self):
        super(EmployeeCompensationParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            20: (lambda value, model: self._setattr_strip(model, 'annual_base_salary', value)),
            21: (lambda value, model: self._setattr_strip(model, 'hours', value)),
            24: (lambda value, model: self._setattr_strip(model, 'effective_date', value)),
            19: (lambda value, model: self._setattr_strip(model, 'salary_type', value)),
            22: (lambda value, model: self._set_number_value_on_model(model, 'hourly_rate', value)),
            23: (lambda value, model: self._setattr_strip(model, 'pay_cycle', value))
        }

    def _create_model_instance(self):
        return EmployeeCompensation()
