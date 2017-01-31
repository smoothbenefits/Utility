from common.excel_parse.model_parser_base import ModelParserBase
from ..model.phone import Phone


class PhoneParser(ModelParserBase):
    def __init__(self):
        super(PhoneParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee phone 1 number': (lambda value, model: self._setattr_strip(model, 'number', value))
        }

    def _create_model_instance(self, row_number):
        return Phone()
