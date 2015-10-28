from model_parser_base import ModelParserBase
from model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self):
        super(PersonParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'person type': (lambda value, model: setattr(model, 'person_type', value)),
            'first name': (lambda value, model: setattr(model, 'first_name', value)),
            'last name': (lambda value, model: setattr(model, 'last_name', value)),
            'email': (lambda value, model: setattr(model, 'email', value)),
            'mid name': (lambda value, model: setattr(model, 'middle_name', value)),
            'relation to subscriber': (lambda value, model: setattr(model, 'relationship', value)),
            'member\'s SSN': (lambda value, model: setattr(model, 'ssn', value)),
            'date of birth': (lambda value, model: setattr(model, 'birth_date', value)),
            'gender': (lambda value, model: setattr(model, 'gender', value)),
            'member id number': (lambda value, model: setattr(model, 'member_id', value))
        }

    def _create_model_instance(self):
        return Person()
