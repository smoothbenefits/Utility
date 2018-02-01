from common.data_provider.excel_data_provider_base import ExcelDataProviderBase
from ..excel_parser.user_state_tax_excel_row_parser import UserStateTaxExcelRowParser


class ExcelUsersStateTaxDataProvider(ExcelDataProviderBase):
    def __init__(self, excel_file):
        super(ExcelUsersStateTaxDataProvider, self).__init__(excel_file)

    def _get_row_parser(self):
        return UserStateTaxExcelRowParser()
