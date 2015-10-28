from model_parser_base import ModelParserBase
from model.phone import Phone


class PhoneParser(ModelParserBase):
    def __init__(self):
        super(PhoneParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Home Phone': (lambda value, model: setattr(model, 'number', value))
        }

    def _create_model_instance(self):
        return Phone()
