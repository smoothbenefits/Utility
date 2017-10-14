from common.excel_parse.model_parser_base import ModelParserBase
from ..model.cp_time_attendance_export_row import CPTimeAttendanceExportRow


class CPTimeAttendanceExportRowParser(ModelParserBase):
    def __init__(self):
        super(CPTimeAttendanceExportRowParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'file type': (lambda value, model: self._set_string_value_on_model(model, 'file_type', value)),
            'client name': (lambda value, model: self._set_string_value_on_model(model, 'client_name', value)),
            'client number': (lambda value, model: self._set_string_value_on_model(model, 'client_number', value)),
            'employee number': (lambda value, model: self._set_string_value_on_model(model, 'employee_number', value)),
            'employee name': (lambda value, model: self._set_string_value_on_model(model, 'employee_name', value)),
            'ssn': (lambda value, model: self._set_string_value_on_model(model, 'ssn', value)),
            'earning name': (lambda value, model: self._set_string_value_on_model(model, 'earning_name', value)),
            'earning code': (lambda value, model: self._set_string_value_on_model(model, 'earning_code', value)),
            'hours': (lambda value, model: self._set_number_value_on_model(model, 'hours', value)),
            'pay rate': (lambda value, model: self._set_string_value_on_model(model, 'pay_rate', value)),
            'fixed $ amount': (lambda value, model: self._set_string_value_on_model(model, 'fixed_amount', value)),
            'location': (lambda value, model: self._set_string_value_on_model(model, 'location', value)),
            'division': (lambda value, model: self._set_string_value_on_model(model, 'division', value)),
            'department': (lambda value, model: self._set_string_value_on_model(model, 'department', value)),
            'job code': (lambda value, model: self._set_string_value_on_model(model, 'job_code', value)),
            'beginning balance': (lambda value, model: self._set_string_value_on_model(model, 'begin_balance', value)),
            'accrued': (lambda value, model: self._set_string_value_on_model(model, 'accrued', value)),
            'used': (lambda value, model: self._set_string_value_on_model(model, 'used', value)),
            'ending balance': (lambda value, model: self._set_string_value_on_model(model, 'end_balance', value))
        }

    def _create_model_instance(self, row_number):
        return CPTimeAttendanceExportRow(row_number)
