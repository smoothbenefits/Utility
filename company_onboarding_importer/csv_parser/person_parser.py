from common.csv_parse.model_parser_base import ModelParserBase
from ..model.person import Person
from datetime import datetime


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            1: (lambda value, model: self._setattr_strip(model, 'first_name', value)),
            2: (lambda value, model: self._setattr_strip(model, 'middle_name', value)),
            3: (lambda value, model: self._setattr_strip(model, 'last_name', value)),
            10: (lambda value, model: self._setattr_strip(model, 'email', value)),
            9: (lambda value, model: self._setattr_strip(model, 'ssn', str(value))),
            12: (lambda value, model: self._set_date_value_on_model(model, 'birth_date', value)),
            13: (lambda value, model: self._setattr_strip(model, 'gender', value)),
            14: (lambda value, model: self._setattr_strip(model, 'marital_status', value))
        }

    def _create_model_instance(self):
        return Person()
