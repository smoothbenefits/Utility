import datetime
from common.utility.hash_key_utility import HashKeyUtility
from timeoff_quota import TimeOffQuota

class EmployeeTimeOffDataGenerator(object):

    def __init__(self, user_id, company_id, employment_type, environment):
        self.user_id = user_id
        self.company_id = company_id
        self.employment_type = employment_type
        self.environment = environment

    def CalculateEmployeeTimeOffQuota(self, timeoff_types):
        hash_key_utility = HashKeyUtility()
        encoded_person_id = hash_key_utility.encode_key_with_environment(self.user_id, self.environment)
        encoded_company_id = hash_key_utility.encode_key_with_environment(self.company_id, self.environment)
        self.quota = TimeOffQuota(encoded_person_id, encoded_company_id, timeoff_types)

        return self.quota
