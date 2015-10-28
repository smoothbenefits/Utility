from model_parser_base import ModelParserBase
from model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Salary': (lambda value, model: setattr(model, 'annual_base_salary', value)),
            'Date of Hire': (lambda value, model: setattr(model, 'start_date', value)),
            'Member Status': (lambda value, model: setattr(model, 'employment_status', value)),
            'Salary Mode': (lambda value, model: setattr(model, 'employment_type', value)),
            'Orig Eff Date': (lambda value, model: setattr(model, 'benefit_start_date', value))
        }

    def _create_model_instance(self):
        return EmployeeProfile()
