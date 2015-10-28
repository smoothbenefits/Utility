from model_parser_base import ModelParserBase
from model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Address Line 1': (lambda value, model: setattr(model, 'street_1', value)),
            'Address Line 2': (lambda value, model: setattr(model, 'street_2', value)),
            'City': (lambda value, model: setattr(model, 'city', value)),
            'State': (lambda value, model: setattr(model, 'state', value)),
            'ZIP Code': (lambda value, model: setattr(model, 'zipcode', value))
        }

    def _create_model_instance(self):
        return Address()

