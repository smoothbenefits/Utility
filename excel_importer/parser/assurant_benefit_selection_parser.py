from model_parser_base import ModelParserBase
from model.benefits.assurant_benefit_selection import AssurantBenefitSelection


class AssurantBenefitSelectionParser(ModelParserBase):
    def __init__(self):
        super(AssurantBenefitSelectionParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically 
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'orig eff date': (lambda value, model: setattr(model, 'original_effective_date', value)),
            'benefit': (lambda value, model: setattr(model, 'selection_name', value)),
            'amount selected': (lambda value, model: setattr(model, 'benefit_amount', value)),
            'guarantee issue': (lambda value, model: setattr(model, 'guarantee_issue', value))
        }

    def _create_model_instance(self):
        return AssurantBenefitSelection()
