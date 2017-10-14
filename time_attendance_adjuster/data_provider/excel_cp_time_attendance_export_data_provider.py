from common.data_provider.excel_data_provider_base import ExcelDataProviderBase
from ..excel_parser.cp_time_attendance_export_row_parser import CPTimeAttendanceExportRowParser


class ExcelCPTimeAttendanceExportDataProvider(ExcelDataProviderBase):
    def __init__(self, excel_file):
        super(ExcelCPTimeAttendanceExportDataProvider, self).__init__(excel_file)

    def _get_row_parser(self):
        return CPTimeAttendanceExportRowParser()
