from common.data_provider.excel_data_provider_base import ExcelDataProviderBase
from ..excel_parser.user_adjustment_sepcification_row_parser import UserAdjustmentSpecificationRowParser


class ExcelUsersAdjustmentSpecificationDataProvider(ExcelDataProviderBase):
    def __init__(self, excel_file):
        super(ExcelUsersAdjustmentSpecificationDataProvider, self).__init__(excel_file)

    def _get_row_parser(self):
        return UserAdjustmentSpecificationRowParser()
