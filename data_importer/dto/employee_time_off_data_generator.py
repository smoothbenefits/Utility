import datetime
from ..service.hash_key_service import HashKeyService
from timeoff_quota import TimeOffQuota

class EmployeeTimeOffDataGenerator(object):

    def __init__(self, user_id, company_id, employment_type, environment):
        self.user_id = user_id
        self.company_id = company_id
        self.employment_type = employment_type
        self.environment = environment

    def CalculateEmployeeTimeOffQuota(self, timeoff_types):
        hash_key_service = HashKeyService()
        encoded_person_id = self.environment + '_' + hash_key_service.encode_key(self.user_id)
        encoded_company_id = self.environment + '_' + hash_key_service.encode_key(self.company_id)
        self.quota = TimeOffQuota(encoded_person_id, encoded_company_id, timeoff_types)

        return self.quota
