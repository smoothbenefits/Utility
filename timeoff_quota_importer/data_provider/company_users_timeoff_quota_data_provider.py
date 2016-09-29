from common.utility.environment_utility import EnvironmentUtility
from common.utility.hash_key_utility import HashKeyUtility
from common.data_provider.web_api_data_provider_base import WebApiDataProviderBase
from ..serialization.timeoff_quota_json_serializer import TimeoffQuotaJsonSerializer


class CompanyUsersTimeoffQuotaDataProvider(WebApiDataProviderBase):
    def __init__(self, company_id):
        super(CompanyUsersTimeoffQuotaDataProvider, self).__init__()
        self._company_id = company_id

    def _get_url(self):
        hash_key_utility = HashKeyUtility()
        url = '{0}api/v1/company/{1}/timeoff_quotas'.format(
            EnvironmentUtility.get_active_settings().time_tracking_base_url,
            hash_key_utility.encode_key_with_environment(self._company_id))
        return url

    def _get_model_populated_with_data(self, data):
        # This would be a list of TimeoffQuota
        models = []

        for timeoff_quota_data in data:
            model = TimeoffQuotaJsonSerializer.deserialize(timeoff_quota_data)
            models.append(model)

        return models
