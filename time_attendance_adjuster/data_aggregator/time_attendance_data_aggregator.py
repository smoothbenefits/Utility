import json
import logging
import sys, getopt

from ..data_provider.company_users_data_provider import CompanyUsersDataProvider
from ..data_provider.excel_users_adjustment_specification_data_provider import ExcelUsersAdjustmentSpecificationDataProvider
from ..data_provider.company_users_time_card_data_provider import CompanyUsersTimeCardDataProvider
from ..data_provider.excel_cp_time_attendance_export_data_provider import ExcelCPTimeAttendanceExportDataProvider

logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("TimeAttendanceDataAggregator")


class TimeAttendanceDataAggregator(object):
    def __init__(
        self, 
        company_id, 
        spec_file_path, 
        start_date, 
        end_date, 
        target_file_path):

        self.__users_provider = CompanyUsersDataProvider(company_id)
        self.__specs_provider = ExcelUsersAdjustmentSpecificationDataProvider(spec_file_path)
        self.__time_card_provider = CompanyUsersTimeCardDataProvider(company_id, start_date, end_date)
        self.__cp_export_provider = ExcelCPTimeAttendanceExportDataProvider(target_file_path)

    def get_aggregated_data(self):
        return self.__cp_export_provider.get_model()