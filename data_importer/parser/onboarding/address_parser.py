from common.excel_parse.model_parser_base import ModelParserBase
from ...model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee Address 1 Line 1': (lambda value, model: setattr(model, 'street_1', value)),
            'Employee Address 1 Line 2': (lambda value, model: setattr(model, 'street_2', value)),
            'Employee Address 1 City': (lambda value, model: setattr(model, 'city', value)),
            'Employee Address 1 State': (lambda value, model: setattr(model, 'state', value)),
            'Employee Address 1 Zip Code': (lambda value, model: setattr(model, 'zipcode', value))
        }

    def _create_model_instance(self, row_number):
        return Address()

