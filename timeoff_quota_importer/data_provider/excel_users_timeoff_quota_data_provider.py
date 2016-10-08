from common.data_provider.excel_data_provider_base import ExcelDataProviderBase
from ..excel_parser.user_timeoff_quota_row_parser import UserTimeoffQuotaRowParser


class ExcelUsersTimeoffQuotaDataProvider(ExcelDataProviderBase):
    def __init__(self, excel_file):
        super(ExcelUsersTimeoffQuotaDataProvider, self).__init__(excel_file)

    def _get_row_parser(self):
        return UserTimeoffQuotaRowParser()
