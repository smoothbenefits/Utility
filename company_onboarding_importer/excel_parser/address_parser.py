from common.excel_parse.model_parser_base import ModelParserBase
from ..model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee address 1 line 1': (lambda value, model: setattr(model, 'street_1', value)),
            'employee address 1 line 2': (lambda value, model: setattr(model, 'street_2', value)),
            'employee address 1 city': (lambda value, model: setattr(model, 'city', value)),
            'employee address 1 state': (lambda value, model: setattr(model, 'state', value)),
            'employee address 1 zip code': (lambda value, model: setattr(model, 'zipcode', value))
        }

    def _create_model_instance(self, row_number):
        return Address()

