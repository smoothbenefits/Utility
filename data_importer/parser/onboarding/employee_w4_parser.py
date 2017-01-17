from common.excel_parse.model_parser_base import ModelParserBase
from ...model.employee_w4 import EmployeeW4


class EmployeeW4Parser(ModelParserBase):
    def __init__(self):
        super(EmployeeW4Parser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee FIT Status ': (lambda value, model: setattr(model, 'status', value)),
            'Employee FIT Allowance': (lambda value, model: setattr(model, 'allowance', value)),
            'Employee FIT Extra Amount': (lambda value, model: setattr(model, 'extra_amount', value))
        }

    def _create_model_instance(self, row_number):
        return EmployeeW4()
