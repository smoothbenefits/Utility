from model_parser_base import ModelParserBase
from model.benefits.health_benefit_selection import HealthBenefitSelection


class MedicalBenefitSelectionParser(ModelParserBase):
    def __init__(self):
        super(MedicalBenefitSelectionParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'selection category': (lambda value, model: setattr(model, 'benefit_name', value)),
            'pcp number': (lambda value, model: setattr(model, 'pcp_number', value))
        }

    def _create_model_instance(self):
        return HealthBenefitSelection()
