from common.excel_parse.model_parser_base import ModelParserBase
from ..model.user_state_tax_row_record import UserStateTaxRowRecord


class UserStateTaxExcelRowParser(ModelParserBase):
    def __init__(self):
        super(UserStateTaxExcelRowParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee number': (lambda value, model: self._set_string_value_on_model(model, 'employee_number', value)),
            'employee first name': (lambda value, model: self._set_string_value_on_model(model, 'first_name', value)),
            'employee middle name': (lambda value, model: self._set_string_value_on_model(model, 'middle_name', value)),
            'employee last name': (lambda value, model: self._set_string_value_on_model(model, 'last_name', value)),
            'employee sit 1 state': (lambda value, model: self._set_string_value_on_model(model.sit_1_info, 'state', value)),
            'employee sit 1 status': (lambda value, model: self._set_string_value_on_model(model.sit_1_info, 'filing_status', value)),
            'employee sit 1 allowance': (lambda value, model: self._set_number_value_on_model(model.sit_1_info, 'allowance', value)),
            'employee sit 1 extra amount': (lambda value, model: self._set_number_value_on_model(model.sit_1_info, 'extra_amount', value)),
            'employee sit 2 state': (lambda value, model: self._set_string_value_on_model(model.sit_2_info, 'state', value)),
            'employee sit 2 status': (lambda value, model: self._set_string_value_on_model(model.sit_2_info, 'filing_status', value)),
            'employee sit 2 allowance': (lambda value, model: self._set_number_value_on_model(model.sit_2_info, 'allowance', value)),
            'employee sit 2 extra amount': (lambda value, model: self._set_number_value_on_model(model.sit_2_info, 'extra_amount', value))
        }

    def _create_model_instance(self, row_number):
        return UserStateTaxRowRecord(row_number)
