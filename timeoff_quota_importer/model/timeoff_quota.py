VALID_ACCRUAL_FREQUENCY = [
    'Monthly',
    'Daily'
]

VALID_TIMEOFF_TYPE = [
    'Paid Time Off (PTO)',
    'Sick Time'
]

class AccrualSpec(object):

    def __init__(self, accrual_frequency, accrued_hours, last_accrual_time_stamp):
        self.accrualFrequency = accrual_frequency
        self.accruedHours = accrued_hours
        self.lastAccuralTimeStamp = last_accrual_time_stamp


class QuotaInfoCollectionEntry(object):

    def __init__(self, timeoff_type, banked_hours, annual_target_hours, accrual_specs):
        self.timeoffType = timeoff_type
        self.annualTargetHours = annual_target_hours
        self.bankedHours = banked_hours
        self.accrualSpecs = accrual_specs
  

class TimeOffQuota(object):

    def __init__(self, person_descriptor, company_descriptor, quota_info_collection, created_time_stamp, modified_time_stamp):

        self.createdTimeStamp = created_time_stamp
        self.modifiedTimestamp = modified_time_stamp
        self.personDescriptor = person_descriptor
        self.companyDescriptor = company_descriptor
        self.quotaInfoCollection = quota_info_collection
