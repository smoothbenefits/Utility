from common.excel_parse.model_parser_base import ModelParserBase
from ..model.user_timeoff_quota_row import UserTimeoffQuotaRow

class UserTimeoffQuotaRowParser(ModelParserBase):
    def __init__(self):
        super(UserTimeoffQuotaRowParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee account email': (lambda value, model: self._set_string_value_on_model(model, 'email', value)),
            'employee first name': (lambda value, model: self._set_string_value_on_model(model, 'first_name', value)),
            'employee last name': (lambda value, model: self._set_string_value_on_model(model, 'last_name', value)),
            'time off type': (lambda value, model: self._set_string_value_on_model(model, 'timeoff_type', value)),
            'annual target hours': (lambda value, model: self._set_number_value_on_model(model, 'annual_target_hours', value)),
            'accrual frequency': (lambda value, model: self._set_string_value_on_model(model, 'accrual_frequency', value)),    
            'banked hours': (lambda value, model: self._set_number_value_on_model(model, 'banked_hours', value))
        }

    def _create_model_instance(self):
        return UserTimeoffQuotaRow()
