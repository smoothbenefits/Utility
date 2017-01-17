from common.excel_parse.model_parser_base import ModelParserBase
from ...model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee First Name': (lambda value, model: setattr(model, 'first_name', value)),
            'Employee Middle Name': (lambda value, model: setattr(model, 'middle_name', value)),
            'Employee Last Name': (lambda value, model: setattr(model, 'last_name', value)),
            'Employee Email': (lambda value, model: setattr(model, 'email', value)),
            'Employee SSN': (lambda value, model: setattr(model, 'ssn', value)),
            'Employee Birth Date': (lambda value, model: setattr(model, 'birth_date', value)),
            'Employee Gender': (lambda value, model: setattr(model, 'gender', value)),
            'Employee Marital Status': (lambda value, model: setattr(model, 'marital_status', value))
        }

    def _create_model_instance(self, row_number):
        return Person()
