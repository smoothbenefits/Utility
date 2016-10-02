import json

from timeoff_quota_data_import_base import TimeoffQuotaDataImportBase
from data_aggregator.users_timeoff_quota_data_aggregator import UsersTimeoffQuotaDataAggregator


class TimeoffBankedHoursImport(TimeoffQuotaDataImportBase):
    def __init__(self):
        super(TimeoffBankedHoursImport, self).__init__()

    def get_program_name(self):
        return 'timeoff_banked_hours_import'
        

