from model_parser_base import ModelParserBase
from model.person import Person


class DependentParser(ModelParserBase):
    def __init__(self):
        super(DependentParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'dependent first name': (lambda value, model: setattr(model, 'first_name', value)),
            'dependent last name': (lambda value, model: setattr(model, 'last_name', value)),
            'dependent mid name': (lambda value, model: setattr(model, 'middle_name', value)),
            'dependent relationship': (lambda value, model: setattr(model, 'relationship', value)),
            'dependent date of birth': (lambda value, model: setattr(model, 'birth_date', value)),
            'dependent gender': (lambda value, model: setattr(model, 'gender', value))
        }

    def _create_model_instance(self):
        return Person()