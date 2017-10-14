from common.utility.environment_utility import EnvironmentUtility
from common.utility.hash_key_utility import HashKeyUtility
from common.data_provider.web_api_data_provider_base import WebApiDataProviderBase
from ..model.time_punch_card import TimePunchCard


class CompanyUsersTimeCardDataProvider(WebApiDataProviderBase):
    def __init__(self, company_id, start_date, end_date):
        super(CompanyUsersTimeCardDataProvider, self).__init__()
        self._company_id = company_id

    def _get_url(self):
        hash_key_utility = HashKeyUtility()

        url = '{0}api/v1/company/{1}/time_punch_cards?start_date={2}&end_date={3}'.format(
            EnvironmentUtility.get_active_settings().time_tracking_base_url,
            hash_key_utility.encode_key_with_environment(self._company_id),
            start_date.isoformat(),
            end_date.isoformat())

        return url

    def _get_model_populated_with_data(self, data):
        # This would be a list of TimeoffQuota
        models = []

        for time_card in data:
            models.append(TimePunchCard(time_card))

        return models
