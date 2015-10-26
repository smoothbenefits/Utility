from ..model_parser_base import ModelParserBase
from model.person import Person


class PersonParser(ModelParserBase):
    def __init__(self, address_parser):
        super(PersonParser, self).__init__()
        self.address_parser = address_parser

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Person Type': (lambda value, model: setattr(model, 'person_type', value)),
            'First Name': (lambda value, model: setattr(model, 'first_name', value)),
            'Last Name': (lambda value, model: setattr(model, 'last_name', value)),
            'Email': (lambda value, model: setattr(model, 'email', value)),
            'Mid Name': (lambda value, model: setattr(model, 'middle_name', value)),
            'Relation to Subscriber': (lambda value, model: setattr(model, 'relationship', value)),
            'Member\'s SSN': (lambda value, model: setattr(model, 'ssn', value)),
            'Date Of Birth': (lambda value, model: setattr(model, 'birth_date', value)),
            'Gender': (lambda value, model: setattr(model, 'gender', value))
        }

    def _create_model_instance(self):
        return Person()

    # Polymorphic post processing step of parsing data row
    def _parse_data_row_post_process(self, model, data_row):
        model.address = self.address_parser.parse_data_row(data_row)
        return model
