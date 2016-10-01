import logging
import sys, getopt

from common.utility.hash_key_utility import HashKeyUtility
from ..data_provider.company_users_data_provider import CompanyUsersDataProvider
from ..data_provider.company_users_timeoff_quota_data_provider import CompanyUsersTimeoffQuotaDataProvider
from ..data_provider.excel_users_timeoff_quota_data_provider import ExcelUsersTimeoffQuotaDataProvider
from ..model.timeoff_quota import TimeOffQuota
from ..serialization.timeoff_quota_json_serializer import TimeoffQuotaJsonSerializer


logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("UsersTimeoffQuotaDataAggregator")


class UsersTimeoffQuotaDataAggregator(object):

    def __init__(self, company_id, excel_file_path):
        self.__company_id = company_id
        self.__excel_file_path = excel_file_path
        self.__hash_key_utility = HashKeyUtility()

    def get_aggregated_data_as_serializable(self):
        aggregated_data = self.get_aggregated_data()
        serializable_collection = []
        for quota_record in aggregated_data:
            serializable = TimeoffQuotaJsonSerializer.serialize(quota_record)
            serializable_collection.append(serializable)
        return serializable_collection

    def get_aggregated_data(self):

        # Get all company users data
        users_data_provider = CompanyUsersDataProvider(self.__company_id)
        all_users = users_data_provider.get_model()

        # Get all existing timeoff quota data for the company users
        timeoff_quotas_data_provider = CompanyUsersTimeoffQuotaDataProvider(self.__company_id)
        all_users_timeoff_quotas = timeoff_quotas_data_provider.get_model()

        # Parse out all data from the input excel file
        excel_data_provider = ExcelUsersTimeoffQuotaDataProvider(self.__excel_file_path)
        all_parsed_data = excel_data_provider.get_model()

        # Validate the input data
        if not self.__validate_input_data():
            raise ValueError('There were validation issues with the input data!')

        # Now perform aggregation on the 3 sets of data

        # First build the data structure of the result aggregated data, from 
        # existing user timeoff quotas
        user_quota_mapping = self.__build_user_quota_mapping(all_users_timeoff_quotas)

        # Now we go through each excel input line of data, and attempt at 
        # 'merging' them into the data aggregation
        self.__merge_all_input_data_to_aggregation(all_parsed_data, user_quota_mapping, all_users)

        # Validate the output data
        if not self.__validate_output_data():
            raise ValueError('There were validation issues with the aggregated data!')

        for k in user_quota_mapping:
            yield user_quota_mapping[k]

    def __validate_input_data(self):
        # [TODO]: validate input excel data
        return True

    def __validate_output_data(self):
        # [TODO]: validate the finalized aggregated data 
        return True

    def __build_user_quota_mapping(self, users_timeoff_quota_data):
        # This is a user_id to timeoff quota record mapping
        result_mapping = {}

        for timeoff_quota_data in users_timeoff_quota_data:
            user_id = self.__hash_key_utility.decode_key_with_environment(timeoff_quota_data.personDescriptor)
            if not user_id:
                self.__log_error_and_raise_exception('Failed to decode user ID from timeoff quota record. Original personDescriptor: "{}"'.format(timeoff_quota_data.personDescriptor))
            if user_id in result_mapping:
                self.__log_error_and_raise_exception('Found more than 1 existing timeoff records for personDescriptor: "{}"'.format(timeoff_quota_data.personDescriptor))
            result_mapping[user_id] = timeoff_quota_data

        return result_mapping

    def __merge_all_input_data_to_aggregation(self, all_parsed_data, user_quota_mapping, all_company_users):
        for input_row_data in all_parsed_data:
            self.__merge_input_data_row_to_aggregation(input_row_data, user_quota_mapping, all_company_users)

    def __merge_input_data_row_to_aggregation(self, parsed_data_row, user_quota_mapping, all_company_users):
        user_id = self.__get_user_id_for_input_data_row(parsed_data_row, all_company_users)
        if user_id in user_quota_mapping:
            existing_record = user_quota_mapping[user_id]
            existing_record.patch(
                timeoff_type=parsed_data_row.timeoff_type,
                annual_target_hours=parsed_data_row.annual_target_hours,
                accrual_frequency=parsed_data_row.accrual_frequency,
                banked_hours=parsed_data_row.banked_hours
            )
        else:
            # no existing record yet, create one
            user_quota_mapping[user_id] = TimeOffQuota.create(
                person_descriptor=self.__hash_key_utility.encode_key_with_environment(user_id),
                company_descriptor=self.__hash_key_utility.encode_key_with_environment(self.__company_id),
                timeoff_type=parsed_data_row.timeoff_type,
                annual_target_hours=parsed_data_row.annual_target_hours,
                accrual_frequency=parsed_data_row.accrual_frequency,
                banked_hours=parsed_data_row.banked_hours
            )

    def __get_user_id_for_input_data_row(self, parsed_data_row, all_company_users):
        user_info = next((user for user in all_company_users if self.__match_user_info_with_input_data_row(parsed_data_row, user)), None)
        return user_info.user_id

    def __match_user_info_with_input_data_row(self, parsed_data_row, user_info):
        if (parsed_data_row.email == user_info.email):
            return True
        if (parsed_data_row.first_name == user_info.first_name 
            and parsed_data_row.last_name == user_info.last_name):
            return True
        return False

    def __log_error_and_raise_exception(self, message):
        Logger.error(message)
        raise ValueError(message)