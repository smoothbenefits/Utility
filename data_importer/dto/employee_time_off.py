import datetime
from service.hash_key_service import HashKeyService
from timeoff_quota import TimeOffQuota

class Employee(object):

    def __init__(self, person_id, company_id, employment_type, environment):
        self.person_id = person_id
        self.company_id = company_id
        self.employment_type = employment_type
        self.environment = environment

    def CalculateEmployeeTimeOffQuota(self, target_hours, timeoff_type, accrual_frequency):
        hash_key_service = HashKeyService()
        encoded_person_id = self.environment + '_' + hash_key_service.encode_key(self.person_id)
        encoded_company_id = self.environment + '_' + hash_key_service.encode_key(self.company_id)
        self.quota = TimeOffQuota(timeoff_type, encoded_person_id, encoded_company_id, target_hours, accrual_frequency)

        return self.quota
