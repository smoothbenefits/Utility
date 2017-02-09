from common.csv_parse.model_parser_base import ModelParserBase
from ..model.phone import Phone


class PhoneParser(ModelParserBase):
    def __init__(self):
        super(PhoneParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            11: (lambda value, model: self._setattr_strip(model, 'number', value))
        }

    def _create_model_instance(self):
        return Phone()
