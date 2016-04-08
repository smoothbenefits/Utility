import datetime
from service.hash_key_service import HashKeyService
from timeoff_quota import TimeOffQuota

class EmployeeTimeOffDataGenerator(object):

    def __init__(self, user_id, company_id, employment_type, environment):
        self.user_id = user_id
        self.company_id = company_id
        self.employment_type = employment_type
        self.environment = environment

    def CalculateEmployeeTimeOffQuota(self, target_hours, timeoff_type, accrual_frequency):
        hash_key_service = HashKeyService()
        encoded_user_id = self.environment + '_' + hash_key_service.encode_key(self.user_id)
        encoded_company_id = self.environment + '_' + hash_key_service.encode_key(self.company_id)
        self.quota = TimeOffQuota(timeoff_type, encoded_user_id, encoded_company_id, target_hours, accrual_frequency)

        return self.quota
