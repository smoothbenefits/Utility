from model_parser_base import ModelParserBase
from model.employee_profile import EmployeeProfile


class EmployeeProfileParser(ModelParserBase):
    def __init__(self):
        super(EmployeeProfileParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'salary': (lambda value, model: setattr(model, 'annual_base_salary', value)),
            'date of hire': (lambda value, model: setattr(model, 'start_date', value)),
            'member status': (lambda value, model: setattr(model, 'employment_status', value)),
            'salary mode': (lambda value, model: setattr(model, 'pay_rate', value)),
            'orig eff date': (lambda value, model: setattr(model, 'benefit_start_date', value))
        }

    def _create_model_instance(self):
        return EmployeeProfile()
