from common.excel_parse.model_parser_base import ModelParserBase
from ..model.user_adjustment_specification_row import UserAdjustmentSpecificationRow


class UserAdjustmentSpecificationRowParser(ModelParserBase):
    def __init__(self):
        super(UserAdjustmentSpecificationRowParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'emp no': (lambda value, model: self._set_string_value_on_model(model, 'employee_number', value)),
            'first name': (lambda value, model: self._set_string_value_on_model(model, 'first_name', value)),
            'last name': (lambda value, model: self._set_string_value_on_model(model, 'last_name', value)),
            'dept num': (lambda value, model: self._set_string_value_on_model(model, 'department_number', value)),
            'dept name': (lambda value, model: self._set_string_value_on_model(model, 'department_name', value)),
            'adjustment type': (lambda value, model: self._set_string_value_on_model(model, 'adjustment_code', value))
        }

    def _create_model_instance(self, row_number):
        return UserAdjustmentSpecificationRow(row_number)
