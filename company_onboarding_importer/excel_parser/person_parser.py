from common.excel_parse.model_parser_base import ModelParserBase
from ..model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee first name': (lambda value, model: setattr(model, 'first_name', value)),
            'employee middle name': (lambda value, model: setattr(model, 'middle_name', value)),
            'employee last name': (lambda value, model: setattr(model, 'last_name', value)),
            'employee email': (lambda value, model: setattr(model, 'email', value)),
            'employee ssn': (lambda value, model: setattr(model, 'ssn', str(value))),
            'employee birth date': (lambda value, model: setattr(model, 'birth_date', value)),
            'employee gender': (lambda value, model: setattr(model, 'gender', value)),
            'employee marital status': (lambda value, model: setattr(model, 'marital_status', value))
        }

    def _create_model_instance(self, row_number):
        return Person()
