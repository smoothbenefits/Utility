from common.utility.environment_utility import EnvironmentUtility
from common.utility.hash_key_utility import HashKeyUtility
from common.data_repository.web_api_repository_base import WebApiRepositoryBase

from ..model.user_info import UserInfo


class UsersRepository(WebApiRepositoryBase):
    def __init__(self, company_id):
        super(UsersRepository, self).__init__()
        self._company_id = company_id

    def _get_url(self):
        hash_key_utility = HashKeyUtility()
        url = '{0}api/v1/companies/{1}/users'.format(
            EnvironmentUtility.get_active_settings().main_app_base_url,
            hash_key_utility.encode_key(self._company_id))
        return url

    def _get_model_populated_with_data(self, data):
        if (not data):
            raise ValueError("data is not expected to be empty")

        # This would be a list of UserInfo
        models = []

        for user_role_info in data['user_roles']:
            if user_role_info['company_user_type'] == 'employee':
                user_info = user_role_info['user']
                user_model = UserInfo(
                    user_id=user_info['id'],
                    first_name=user_info['first_name'],
                    last_name=user_info['last_name'],
                    email=user_info['email'])
                models.append(user_model)

        return models
