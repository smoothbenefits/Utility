import datetime
from service.hash_key_service import HashKeyService
from timeoff_quota import TimeOffQuota

PTO_TIMEOFF = 'PTO'
FULLTIME_QUOTA = 80
PARTTIME_QUOTA = 20

SICKDAY_TIMEOFF = 'SickTime'
SICKDAY_QUOTA = 20

FULLTIME = 'FullTime'
PARTIME = 'PartTime'

class Employee(object):

    def __init__(self, person_id, employment_type, environment):
        self.person_id = person_id
        self.employment_type = employment_type
        self.environment = environment

    def CalculateEmployeeTimeOffQuota(self):
        hash_key_service = HashKeyService()
        encoded_person_id = self.environment + '_' + hash_key_service.encode_key(self.person_id)

        sick_target = SICKDAY_QUOTA
        pto_target = 0
        if self.employment_type == FULLTIME:
            pto_target = FULLTIME_QUOTA
        elif self.employment_type == PARTIME:
            pto_target = PARTTIME_QUOTA

        self.pto_quota = TimeOffQuota(PTO_TIMEOFF, encoded_person_id, pto_target, 'Monthly')
        self.sick_quota = TimeOffQuota(SICKDAY_TIMEOFF, encoded_person_id, sick_target, 'Monthly')
