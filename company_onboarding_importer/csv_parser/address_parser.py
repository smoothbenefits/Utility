from common.csv_parse.model_parser_base import ModelParserBase
from ..model.address import Address


class AddressParser(ModelParserBase):
    def __init__(self):
        super(AddressParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            4: (lambda value, model: self._setattr_strip(model, 'street_1', value)),
            5: (lambda value, model: self._setattr_strip(model, 'street_2', value)),
            6: (lambda value, model: self._setattr_strip(model, 'city', value)),
            7: (lambda value, model: self._setattr_strip(model, 'state', value)),
            8: (lambda value, model: model.set_normalized_zipcode(value))
        }

    def _create_model_instance(self):
        return Address()
