import json
import datetime

DAYS_A_YEAR = 365.0
START_DATE = datetime.date(2016, 1, 1)
DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'

class AccrualSpec(object):

    def __init__(self, accrual_frequency, accrued_hours):
        self.accrualFrequency = accrual_frequency
        self.accruedHours = accrued_hours

    def as_serializable(self):
        obj = {
                  'accrualFrequency': self.accrualFrequency,
                  'accruedHours': self.accruedHours,
                  'lastAccrualTimestamp': datetime.datetime.now().strftime(DATETIME_FORMAT)
              }
        return obj

class QuotaInfoCollectionEntry(object):

    def __init__(self, timeoff_type, target_hours, accrual_frequency, accrued_hours):
        self.timeoffType = timeoff_type
        self.annualTargetHours = target_hours
        self.bankedHours = accrued_hours
        self.accrualSpecs = AccrualSpec(accrual_frequency, accrued_hours)

    def as_serializable(self):
        obj =  {
                    'timeoffType': self.timeoffType,
                    'annualTargetHours': self.annualTargetHours,
                    'bankedHours': self.bankedHours,
                    'accrualSpecs': self.accrualSpecs.as_serializable()
                }
        return obj


class TimeOffQuota(object):

    def __init__(self, person_id, company_id, timeoff_types):

        self.createdTimestamp = datetime.datetime.now()
        self.modifiedTimestamp = datetime.datetime.now()
        self.personDescriptor = person_id
        self.companyDescriptor = company_id
        self.quotaInfoCollection = []
        # Assume accrued time is 0 at the beginning of this year
        days_diff = (datetime.date.today() - START_DATE).days
        for timeoff_type_item in timeoff_types:
            timeoff_type = timeoff_type_item[1]
            target_hours = timeoff_type_item[0]
            accrual_frequency = timeoff_type_item[2]
            accrued_time = round(days_diff / DAYS_A_YEAR * target_hours, 1)
            self.quotaInfoCollection.append(QuotaInfoCollectionEntry(timeoff_type, target_hours, accrual_frequency, accrued_time))

    def _serialize_collection(self, collection):
        serialized_collection = []
        for item in collection:
            serialized_collection.append(item.as_serializable())
        return serialized_collection

    def as_serializable(self):
        obj = {
                  "personDescriptor": self.personDescriptor,
                  "companyDescriptor": self.companyDescriptor,
                  "createdTimestamp": self.createdTimestamp.strftime(DATETIME_FORMAT),
                  "modifiedTimestamp": self.modifiedTimestamp.strftime(DATETIME_FORMAT),
                  "quotaInfoCollection": self._serialize_collection(self.quotaInfoCollection)
              }

        return obj
