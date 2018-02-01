from common.utility.environment_utility import EnvironmentUtility
from common.utility.hash_key_utility import HashKeyUtility
from web_api_data_provider_base import WebApiDataProviderBase

from ..model.user_info import UserInfo


class CompanyUsersDataProvider(WebApiDataProviderBase):
    def __init__(self, company_id):
        super(CompanyUsersDataProvider, self).__init__()
        self._company_id = company_id
        self._hash_key_utility = HashKeyUtility()

    def _get_url(self):
        url = '{0}api/v1/company/{1}/employee_profiles'.format(
            EnvironmentUtility.get_active_settings().main_app_base_url,
            self._hash_key_utility.encode_key(self._company_id))
        return url

    def _get_model_populated_with_data(self, data):
        if (not data):
            raise ValueError("data is not expected to be empty")

        # This would be a list of UserInfo
        models = []

        for profile in data:
            first_name = profile['first_name']
            last_name = profile['last_name']
            middle_name = ''
            if ('person' in profile):
                if (profile['person']['first_name']):
                    first_name = profile['person']['first_name']
                if (profile['person']['middle_name']):
                    middle_name = profile['person']['middle_name']
                if (profile['person']['last_name']):
                    last_name = profile['person']['last_name']
            model = UserInfo(
                user_id = self._hash_key_utility.decode_key(profile['person']['user']),
                first_name = first_name,
                middle_name = middle_name,
                last_name = last_name,
                employee_number = profile['employee_number']
            )
            models.append(model)

        return models
