from common.excel_parse.model_parser_base import ModelParserBase
from ...model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'address1': (lambda value, model: self._setattr_strip(model, 'street_1', value)),
            'address2': (lambda value, model: self._setattr_strip(model, 'street_2', value)),
            'city': (lambda value, model: self._setattr_strip(model, 'city', value)),
            'state': (lambda value, model: self._setattr_strip(model, 'state', value)),
            'zip': (lambda value, model: self._setattr_strip(model, 'zipcode', value))
        }

    def _create_model_instance(self, row_number):
        return Address()

