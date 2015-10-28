from model_parser_base import ModelParserBase
from model.employee_compensation import EmployeeCompensation


class EmployeeCompensationParser(ModelParserBase):
    def __init__(self):
        super(EmployeeCompensationParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Salary': (lambda value, model: setattr(model, 'annual_base_salary', value)),
            'Hours': (lambda value, model: setattr(model, 'projected_hour_per_month', float(value)*52/12)),
            'Date of Hire': (lambda value, model: setattr(model, 'effective_date', value))
        }

    def _create_model_instance(self):
        return EmployeeCompensation()
