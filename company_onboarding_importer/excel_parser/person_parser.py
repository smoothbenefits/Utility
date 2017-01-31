from common.excel_parse.model_parser_base import ModelParserBase
from ..model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee first name': (lambda value, model: self._setattr_strip(model, 'first_name', value)),
            'employee middle name': (lambda value, model: self._setattr_strip(model, 'middle_name', value)),
            'employee last name': (lambda value, model: self._setattr_strip(model, 'last_name', value)),
            'employee email': (lambda value, model: self._setattr_strip(model, 'email', value)),
            'employee ssn': (lambda value, model: self._setattr_strip(model, 'ssn', str(value))),
            'employee birth date': (lambda value, model: self._setattr_strip(model, 'birth_date', value)),
            'employee gender': (lambda value, model: self._setattr_strip(model, 'gender', value)),
            'employee marital status': (lambda value, model: self._setattr_strip(model, 'marital_status', value))
        }

    def _create_model_instance(self, row_number):
        return Person()
