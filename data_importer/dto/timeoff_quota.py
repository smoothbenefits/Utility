import json
import datetime

DAYS_A_YEAR = 365
START_DATE = datetime.date(2016, 1, 1)

class AccrualSpec(object):

    def __init__(self, accrual_frequency, accrued_hours):
        self.accrualFrequency = accrual_frequency
        self.accruedHours = accrued_hours

    def to_json_string(self):
        obj = {'accrualFrequency': self.accrualFrequency, 'accruedHours': self.accruedHours}
        return json.dumps(obj)

class QuotaInfoCollectionEntry(object):

    def __init__(self, timeoff_type, target_hours, accrual_frequency, accrued_hours):
        self.timeoffType = timeoff_type
        self.annualTargetHours = target_hours
        self.bankedHours = accrued_hours
        self.accrualSpecs = AccrualSpec(accrual_frequency, accrued_hours)

    def to_json_string(self):
        obj =  {
                    'timeoffType': self.timeoffType,
                    'annualTargetHours': self.annualTargetHours,
                    'bankedHours': self.bankedHours,
                    'accrualSpecs': self.accrualSpecs.to_json_string()
                }
        return json.dumps(obj)


class TimeOffQuota(object):

    def __init__(self, timeoff_type, person_id, target_hours, accrual_frequency):

        # Assume accrued time is 0 at the beginning of this year
        days_diff = (datetime.date.today() - START_DATE).days
        self.accrued_time = round(days_diff / DAYS_A_YEAR * target_hours, 1)
        self.target_hours = target_hours

        self.personDescriptor = person_id
        self.quotaInfoCollection = QuotaInfoCollectionEntry(timeoff_type, target_hours, accrual_frequency, self.accrued_time)

    def to_json_string(self):
        obj = {
                  "personDescriptor": self.personDescriptor,
                  "quotaInfoCollection": self.quotaInfoCollection.to_json_string()
              }
        return json.dumps(obj).replace('\\', '').replace('"{', "{").replace('}"', '}')
