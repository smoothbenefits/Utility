from common.excel_parse.model_parser_base import ModelParserBase
from ..model.direct_deposit_accounts import DirectDepositAccounts


class DirectDepositParser(ModelParserBase):
    def __init__(self):
        super(DirectDepositParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'employee direct deposit 1 amount': (lambda value, model: setattr(model, 'account_1_amount', value)),
            'employee direct deposit 1 percentage': (lambda value, model: setattr(model, 'account_1_percentage', value)),
            'employee direct deposit 1 account routing number': (lambda value, model: setattr(model, 'account_1_routing_number', value)),
            'employee direct deposit 1 account number': (lambda value, model: setattr(model, 'account_1_account_number', value)),
            'employee direct deposit 1 account bank name': (lambda value, model: setattr(model, 'account_1_bank_name', value.strip())),
            'employee direct deposit 1 account type': (lambda value, model: setattr(model, 'account_1_account_type', value)),
            'employee direct deposit 2 amount': (lambda value, model: setattr(model, 'account_2_amount', value)),
            'employee direct deposit 2 percentage': (lambda value, model: setattr(model, 'account_2_percentage', value)),
            'employee direct deposit 2 account routing number': (lambda value, model: setattr(model, 'account_2_routing_number', value)),
            'employee direct deposit 2 account number': (lambda value, model: setattr(model, 'account_2_account_number', value)),
            'employee direct deposit 2 account bank name': (lambda value, model: setattr(model, 'account_2_bank_name', value.strip())),
            'employee direct deposit 2 account type': (lambda value, model: setattr(model, 'account_2_account_type', value)),
            'employee direct deposit 3 amount': (lambda value, model: setattr(model, 'account_3_amount', value)),
            'employee direct deposit 3 percentage': (lambda value, model: setattr(model, 'account_3_percentage', value)),
            'employee direct deposit 3 account routing number': (lambda value, model: setattr(model, 'account_3_routing_number', value)),
            'employee direct deposit 3 account number': (lambda value, model: setattr(model, 'account_3_account_number', value)),
            'employee direct deposit 3 account bank name': (lambda value, model: setattr(model, 'account_3_bank_name', value.strip())),
            'employee direct deposit 3 account type': (lambda value, model: setattr(model, 'account_3_account_type', value))
        }

    def _create_model_instance(self, row_number):
        return DirectDepositAccounts()