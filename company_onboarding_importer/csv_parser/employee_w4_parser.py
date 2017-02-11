from common.csv_parse.model_parser_base import ModelParserBase
from ..model.employee_w4 import EmployeeW4


class EmployeeW4Parser(ModelParserBase):
    def __init__(self):
        super(EmployeeW4Parser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            28: (lambda value, model: self._setattr_strip(model, 'status', value)),
            29: (lambda value, model: self._setattr_strip(model, 'allowance', value)),
            30: (lambda value, model: self._set_number_value_on_model(model, 'extra_amount', value))
        }

    def _create_model_instance(self):
        return EmployeeW4()
