from common.excel_parse.model_parser_base import ModelParserBase
from ...model.direct_deposit_accounts import DirectDepositAccounts


class DirectDepositParser(ModelParserBase):
    def __init__(self):
        super(DirectDepositParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_mapping(self):
        self.column_property_mapping = {
            'Employee Direct Deposit 1 Amount': (lambda value, model: setattr(model, 'account_1_amount', value)),
            'Employee Direct Deposit 1 Percentage': (lambda value, model: setattr(model, 'account_1_percentage', value)),
            'Employee Direct Deposit 1 Account Routing Number': (lambda value, model: setattr(model, 'account_1_routing_number', value)),
            'Employee Direct Deposit 1 Account Number': (lambda value, model: setattr(model, 'account_1_accounting_number', value)),
            'Employee Direct Deposit 1 Account Bank Name': (lambda value, model: setattr(model, 'account_1_bank_number')),
            'Employee Direct Deposit 1 Account Type': (lambda value, model: setattr(model, 'account_1_account_type')),
            'Employee Direct Deposit 2 Amount': (lambda value, model: setattr(model, 'account_2_amount', value)),
            'Employee Direct Deposit 2 Percentage': (lambda value, model: setattr(model, 'account_2_percentage', value)),
            'Employee Direct Deposit 2 Account Routing Number': (lambda value, model: setattr(model, 'account_2_routing_number', value)),
            'Employee Direct Deposit 2 Account Number': (lambda value, model: setattr(model, 'account_2_accounting_number', value)),
            'Employee Direct Deposit 2 Account Bank Name': (lambda value, model: setattr(model, 'account_2_bank_number')),
            'Employee Direct Deposit 2 Account Type': (lambda value, model: setattr(model, 'account_2_account_type')),
            'Employee Direct Deposit 3 Amount': (lambda value, model: setattr(model, 'account_3_amount', value)),
            'Employee Direct Deposit 3 Percentage': (lambda value, model: setattr(model, 'account_3_percentage', value)),
            'Employee Direct Deposit 3 Account Routing Number': (lambda value, model: setattr(model, 'account_3_routing_number', value)),
            'Employee Direct Deposit 3 Account Number': (lambda value, model: setattr(model, 'account_3_accounting_number', value)),
            'Employee Direct Deposit 3 Account Bank Name': (lambda value, model: setattr(model, 'account_3_bank_number')),
            'Employee Direct Deposit 3 Account Type': (lambda value, model: setattr(model, 'account_3_account_type'))
        }

    def _create_model_instance(self, row_number):
        return DirectDepositAccounts()