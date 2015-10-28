from model_parser_base import ModelParserBase
from model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'address line 1': (lambda value, model: setattr(model, 'street_1', value)),
            'address line 2': (lambda value, model: setattr(model, 'street_2', value)),
            'city': (lambda value, model: setattr(model, 'city', value)),
            'state': (lambda value, model: setattr(model, 'state', value)),
            'zip code': (lambda value, model: setattr(model, 'zipcode', value))
        }

    def _create_model_instance(self):
        return Address()

