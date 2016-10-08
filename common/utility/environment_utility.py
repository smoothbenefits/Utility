import os
from keyczar import keyczar

ENVIRONMENT_LOCAL = 'local'
ENVIRONMENT_STAGE = 'stage'
ENVIRONMENT_DEMO1 = 'demo1'
ENVIRONMENT_DEMO2 = 'demo2'
ENVIRONMENT_PROD = 'prod'


class EnvironmentSettings(object):

    def __init__(
        self,
        main_app_base_url,
        time_tracking_base_url,
        hash_id_env_prefix):
        self.main_app_base_url = main_app_base_url
        self.time_tracking_base_url = time_tracking_base_url
        self.hash_id_env_prefix = hash_id_env_prefix


class EnvironmentUtility(object):
    _environment_settings = {
        ENVIRONMENT_LOCAL: EnvironmentSettings(
            main_app_base_url='http://localhost:8000/',
            time_tracking_base_url='http://localhost:6999/',
            hash_id_env_prefix='localhost'
        ),
        ENVIRONMENT_STAGE: EnvironmentSettings(
            main_app_base_url='http://staging.workbenefits.me/',
            time_tracking_base_url='http://stage.timetracking.workbenefits.me/',
            hash_id_env_prefix='stage'
        ),
        ENVIRONMENT_DEMO1: EnvironmentSettings(
            main_app_base_url='http://demo.workbenefits.me/',
            time_tracking_base_url='http://stage.timetracking.workbenefits.me/',
            hash_id_env_prefix='demo'
        ),
        ENVIRONMENT_DEMO2: EnvironmentSettings(
            main_app_base_url='http://demo2.workbenefits.me/',
            time_tracking_base_url='http://stage.timetracking.workbenefits.me/',
            hash_id_env_prefix='demo2'
        ),
        ENVIRONMENT_PROD: EnvironmentSettings(
            main_app_base_url='https://app.workbenefits.me/',
            time_tracking_base_url='https://timetracking.workbenefits.me/',
            hash_id_env_prefix='production'
        )
    }

    _active_environment_settings = _environment_settings[ENVIRONMENT_LOCAL]

    @staticmethod
    def set_active_environment(environment):
        if environment not in EnvironmentUtility._environment_settings:
            raise ValueError("The given environment '{}' is not supported!".format(environment))
        EnvironmentUtility._active_environement_settings = EnvironmentUtility._environment_settings[environment]

    @staticmethod
    def get_active_settings():
        return EnvironmentUtility._active_environement_settings

