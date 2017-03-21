from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_compensation import EmployeeCompensation


class EmployeeCompensationParser(ModelParserBase):
    def __init__(self):
        super(EmployeeCompensationParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'salary rate': (lambda value, model: self._setattr_strip(model, 'annual_base_salary', value)),
            'hiredate': (lambda value, model: self._setattr_strip(model, 'effective_date', value)),
            'hrly/sal': (lambda value, model: self._setattr_strip(model, 'salary_type', value)),
            'hrly rate': (lambda value, model: self._setattr_strip(model, 'hourly_rate', value)),
            'cycle': (lambda value, model: self._setattr_strip(model, 'pay_cycle', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeCompensation()
