import json
import logging
import sys, getopt

from ..data_provider.company_users_data_provider import CompanyUsersDataProvider
from ..data_provider.excel_users_adjustment_specification_data_provider import ExcelUsersAdjustmentSpecificationDataProvider
from ..data_provider.company_users_time_card_data_provider import CompanyUsersTimeCardDataProvider
from ..data_provider.excel_cp_time_attendance_export_data_provider import ExcelCPTimeAttendanceExportDataProvider
from ..model.user_cp_time_attendance_record import UserCPTimeAttendanceRecord
from ..model.blank_user_adjustment_spec import BlankUserAdjustmentSpec

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
        # Transform adjust spec data to mapping keyed off HR employee number
        spec_data_set = self.__specs_provider.get_model()
        spec_data_map = {}
        for spec_data in spec_data_set:
            if (not spec_data.employee_number):
                Logger.error('Missing employee number!')
            elif(spec_data.employee_number in spec_data_map):
                Logger.error('Multiple adjustment specs rows have duplicate employee number')
            spec_data_map[spec_data.employee_number] = spec_data

        # Collect time cards into a mapping based on user_id
        time_cards = self.__time_card_provider.get_model()
        time_card_map = {}
        for time_card in time_cards:
            if time_card.user_id not in time_card_map:
                time_card_map[time_card.user_id] = []
            time_card_map[time_card.user_id].append(time_card)

        # Now process each row of the original dump and prepare data for the adjusted version
        export_data = self.__cp_export_provider.get_model()
        user_record_map = {}
        users = self.__users_provider.get_model()
        for record in export_data:
            # Find the user record match
            user = self.__get_user_info_for_record(record, users)
            if (user.user_id not in user_record_map):
                user_record_map[user.user_id] = UserCPTimeAttendanceRecord(user)
            user_record_map[user.user_id].append_record(record)

        user_records = user_record_map.values()
        for user_record in user_records:
            user = user_record.user
            user_specs = None
            user_time_cards = None
            if (user.user_id in time_card_map):
                user_time_cards = time_card_map[user.user_id]
            if (user.employee_number in spec_data_map):
                user_specs = spec_data_map[user.employee_number]
            else:
                user_specs = BlankUserAdjustmentSpec()

            # If we have all the data to perform the adjustment. Do it!
            if (user_specs and user_time_cards):
                # Only do the adjustment if all of below holds
                # 1. user specs said so
                # 2. only include time cards that are work type, and is with time range
                if (user_specs.should_deduct_lunch_hours()):
                    lunch_hours = 0.0
                    for card in user_time_cards:
                        if (card.is_work_card() 
                            and not card.in_hours
                            and card.get_punch_card_hours() > 6.0):
                            lunch_hours = lunch_hours + 0.5
                            user_record.lunch_hours_records[card.get_card_date_text()] = 0.5
                    user_record.adjust_hours(-lunch_hours)

        return user_records

    def __get_user_info_for_record(self, export_record, users):
        user_info = next((user for user in users if self.__match_user_info_with_record(export_record, user)), None)
        
        if (not user_info):
            self.__log_error_and_raise_exception('Could not locate existing user account for input. Row Number: {}'.format(export_record.row_number))

        return user_info

    def __match_user_info_with_record(self, record, user_info):
        if (self.__string_equal_no_case(record.employee_name, user_info.get_full_name())):
            return True
        return False

    def __to_lower_case(self, string):
        if not string:
            return string 
        return string.lower()

    def __string_equal_no_case(self, string_a, string_b):
        return self.__to_lower_case(string_a) == self.__to_lower_case(string_b)

    def __log_error_and_raise_exception(self, message):
        Logger.error(message)
        raise ValueError(message)
