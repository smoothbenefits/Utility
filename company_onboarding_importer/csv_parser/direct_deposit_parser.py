from common.csv_parse.model_parser_base import ModelParserBase
from ..model.direct_deposit_accounts import DirectDepositAccounts


class DirectDepositParser(ModelParserBase):
    def __init__(self):
        super(DirectDepositParser, self).__init__()

    # Allow concrete classes to populate the mapping polymorphically
    def _setup_column_index_mapping(self):
        self.column_index_property_mapping = {
            31: (lambda value, model: self._setattr_strip(model, 'account_1_amount', value)),
            32: (lambda value, model: self._setattr_strip(model, 'account_1_percentage', value)),
            33: (lambda value, model: self._setattr_strip(model, 'account_1_routing_number', value)),
            34: (lambda value, model: self._setattr_strip(model, 'account_1_account_number', value)),
            35: (lambda value, model: self._setattr_strip(model, 'account_1_bank_name', value)),
            36: (lambda value, model: self._setattr_strip(model, 'account_1_account_type', value)),
            37: (lambda value, model: self._setattr_strip(model, 'account_2_amount', value)),
            38: (lambda value, model: self._setattr_strip(model, 'account_2_percentage', value)),
            39: (lambda value, model: self._setattr_strip(model, 'account_2_routing_number', value)),
            40: (lambda value, model: self._setattr_strip(model, 'account_2_account_number', value)),
            41: (lambda value, model: self._setattr_strip(model, 'account_2_bank_name', value)),
            42: (lambda value, model: self._setattr_strip(model, 'account_2_account_type', value)),
            43: (lambda value, model: self._setattr_strip(model, 'account_3_amount', value)),
            44: (lambda value, model: self._setattr_strip(model, 'account_3_percentage', value)),
            45: (lambda value, model: self._setattr_strip(model, 'account_3_routing_number', value)),
            46: (lambda value, model: self._setattr_strip(model, 'account_3_account_number', value)),
            47: (lambda value, model: self._setattr_strip(model, 'account_3_bank_name', value)),
            48: (lambda value, model: self._setattr_strip(model, 'account_3_account_type', value))
        }

    def _create_model_instance(self):
        return DirectDepositAccounts()
