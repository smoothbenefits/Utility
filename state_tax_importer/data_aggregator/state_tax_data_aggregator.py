import json
import logging
import sys, getopt

from common.data_provider.company_user_data_provider import CompanyUsersDataProvider
from ..data_provider.excel_users_state_tax_data_provider import ExcelUsersStateTaxDataProvider

logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("TimeAttendanceDataAggregator")


class StateTaxDataAggregator(object):
    def __init__(
        self, 
        company_id,  
        target_file_path):

        self.__users_provider = CompanyUsersDataProvider(company_id)
        self.__excel_state_tax_provider = ExcelUsersStateTaxDataProvider(target_file_path)

    def get_aggregated_data(self):
        # The result to hold the resultant aggregation of data
        # A map between user_id and input state tax record
        user_record_map = {}

        # Get all state tax models from the provider that parsed 
        # the target file
        all_records = self.__excel_state_tax_provider.get_model()

        # For each of the row model, attempt at finding the existing 
        # company employee record on file. 
        # Report if cannot find a match, or find multiple
        # Create map of user_id:state_tax_record
        # Report if encountering a single user mapped to more than 2 records
        users = self.__users_provider.get_model()
        for record in all_records:
            if (not record.is_valid()):
                Logger.error('Encountered invalid input record. Row Number: {}'.format(record.row_number))
                continue
                
            user_info_list = self.__get_users_info_for_record(record, users)
            if (len(user_info_list) < 1):
                Logger.error('Could not locate existing user account for input. Row Number: {}'.format(record.row_number))
            elif (len(user_info_list) > 1):
                Logger.error('Located multiple user accounts for input. Row Number: {}'.format(record.row_number))
            else:
                user_info = user_info_list[0]
                if (user_info.user_id in user_record_map):
                    Logger.error('Encountered multiple input records for the same user. Row Number: {}'.format(record.row_number))
                else:
                    user_record_map[user_info.user_id] = record

        # Return the user_id:state_tax_record map as result
        return user_record_map

    def __get_users_info_for_record(self, record, users):
        return [user for user in users if self.__match_user_info_with_record(record, user)]

    def __match_user_info_with_record(self, record, user_info):
        return (self.__string_equal_no_case(record.first_name, user_info.first_name)
            and self.__string_equal_no_case(record.middle_name, user_info.middle_name)
            and self.__string_equal_no_case(record.last_name, user_info.last_name))

    def __to_lower_case(self, string):
        if not string:
            return '' 
        return string.lower()

    def __string_equal_no_case(self, string_a, string_b):
        return self.__to_lower_case(string_a) == self.__to_lower_case(string_b)

    def __log_error_and_raise_exception(self, message):
        Logger.error(message)
        raise ValueError(message)
