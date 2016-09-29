from ..model.timeoff_quota import (
    TimeOffQuota,
    AccrualSpec,
    QuotaInfoCollectionEntry
)

class TimeoffQuotaJsonSerializer(object):

    @staticmethod
    def __serialize_accrual_spec(accrual_spec):
        if not accrual_spec:
            return None

        obj = {
                  'accrualFrequency': accrual_spec.accrualFrequency,
                  'accruedHours': accrual_spec.accruedHours,
                  'lastAccrualTimestamp': accrualSpecs.lastAccrualTimestamp
              }
        return obj

    @staticmethod
    def __serialize_quota_info_collection_entry(entry):
        if not entry:
            return None

        obj =  {
                    'timeoffType': entry.timeoffType,
                    'annualTargetHours': entry.annualTargetHours,
                    'bankedHours': entry.bankedHours,
                    'accrualSpecs': TimeoffQuotaJsonSerializer.__serialize_accrual_spec(entry.accrualSpecs)
                }
        return obj

    @staticmethod
    def __serialize_quota_info_collection(collection):
        if not collection:
            return None

        obj = []
        for entry in collection:
            entry_obj = TimeoffQuotaJsonSerializer.__serialize_quota_info_collection_entry(entry)
            obj.append(entry_obj)

        return obj

    @staticmethod
    def serialize(timeoff_quota):
        if not timeoff_quota:
            return None

        obj = {
                  "personDescriptor": timeoff_quota.personDescriptor,
                  "companyDescriptor": timeoff_quota.companyDescriptor,
                  "createdTimeStamp": timeoff_quota.createdTimeStamp,
                  "modifiedTimestamp": timeoff_quota.modifiedTimestamp,
                  "quotaInfoCollection": TimeoffQuotaJsonSerializer.__serialize_quota_info_collection(timeoff_quota.quotaInfoCollection)
              }

        return obj


    @staticmethod
    def __deserialize_accrual_spec(accrual_spec_data):
        if not accrual_spec_data:
            return None

        obj = AccrualSpec(
            accrual_frequency=accrual_spec_data['accrualFrequency'],
            accrued_hours=accrual_spec_data['accruedHours'],
            last_accrual_time_stamp=accrual_spec_data['lastAccrualTimestamp']
        )

        return obj

    @staticmethod
    def __deserialize_quota_info_collection_entry(entry_data):
        if not entry_data:
            return None

        obj = QuotaInfoCollectionEntry(
            timeoff_type=entry_data['timeoffType'],
            annual_target_hours=entry_data['annualTargetHours'],
            banked_hours=entry_data['bankedHours'],
            accrual_specs=TimeoffQuotaJsonSerializer.__deserialize_accrual_spec(entry_data['accrualSpecs'])
        )

        return obj

    @staticmethod
    def __deserialize_quota_info_collection(collection_data):
        if not collection_data:
            return None

        obj = []
        for entry_data in collection_data:
            entry_obj = TimeoffQuotaJsonSerializer.__deserialize_quota_info_collection_entry(entry_data)
            obj.append(entry_obj)

        return obj

    @staticmethod
    def deserialize(timeoff_quota_data):
        if not timeoff_quota_data:
            return None

        # For some reason, we were not automatically set created time stamp
        # on time tracking service modeling, and hence this could be non-exist
        # on existing data
        createdTimeStamp = None
        if ('createdTimeStamp' in timeoff_quota_data):
            createdTimeStamp = timeoff_quota_data['createdTimeStamp']

        obj = TimeOffQuota(
            created_time_stamp=createdTimeStamp,
            modified_time_stamp=timeoff_quota_data['modifiedTimestamp'],
            person_descriptor=timeoff_quota_data['personDescriptor'],
            company_descriptor=timeoff_quota_data['companyDescriptor'],
            quota_info_collection=TimeoffQuotaJsonSerializer.__deserialize_quota_info_collection(timeoff_quota_data['quotaInfoCollection'])
        )

        return obj
