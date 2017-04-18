from common.excel_parse.model_parser_base import ModelParserBase
from ...model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'first name': (lambda value, model: self._setattr_strip(model, 'first_name', value)),
            'last name': (lambda value, model: self._setattr_strip(model, 'last_name', value)),
            'email': (lambda value, model: self._setattr_strip(model, 'email', value))
        }

    def _create_model_instance(self, row_number):
        return Person()
