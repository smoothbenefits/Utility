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
                  'accrualRate': accrual_spec.accrualRate,
                  'accrualFrequency': accrual_spec.accrualFrequency,
                  'accruedHours': accrual_spec.accruedHours,
                  'lastAccrualTimestamp': accrual_spec.lastAccuralTimeStamp
              }
        return obj

    @staticmethod
    def __serialize_quota_info_collection_entry(entry):
        if not entry:
            return None

        obj =  {
                    'timeoffType': entry.timeoffType,
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
                  "_id": timeoff_quota.id,
                  "personDescriptor": timeoff_quota.personDescriptor,
                  "companyDescriptor": timeoff_quota.companyDescriptor,
                  "createdTimestamp": timeoff_quota.createdTimestamp,
                  "modifiedTimestamp": timeoff_quota.modifiedTimestamp,
                  "quotaInfoCollection": TimeoffQuotaJsonSerializer.__serialize_quota_info_collection(timeoff_quota.quotaInfoCollection)
              }

        return TimeoffQuotaJsonSerializer.__get_serializable_exclude_none_fields(obj)


    @staticmethod
    def __deserialize_accrual_spec(accrual_spec_data):
        if not accrual_spec_data:
            return None

        obj = AccrualSpec(
            accrual_rate=accrual_spec_data['accrualRate'],
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
        createdTimestamp = None
        if ('createdTimestamp' in timeoff_quota_data):
            createdTimestamp = timeoff_quota_data['createdTimestamp']

        obj = TimeOffQuota(
            created_time_stamp=createdTimestamp,
            modified_time_stamp=timeoff_quota_data['modifiedTimestamp'],
            person_descriptor=timeoff_quota_data['personDescriptor'],
            company_descriptor=timeoff_quota_data['companyDescriptor'],
            quota_info_collection=TimeoffQuotaJsonSerializer.__deserialize_quota_info_collection(timeoff_quota_data['quotaInfoCollection'])
        )

        obj.id = timeoff_quota_data['_id']

        return obj

    ''' Utlity method to clean up the serializable, be it a dictionary
        or a list of dictionaries. 
        This is so that empty/None field is not included in the json,
        or else, the result would be settint those fields to null rather 
        than assuming the default values on the storage/sever side.
    '''
    @staticmethod
    def __get_serializable_exclude_none_fields(serializable):
        if (isinstance(serializable, list)):
            clean_list = []
            for item in serializable:
                clean_list.append(TimeoffQuotaJsonSerializer.__get_serializable_exclude_none_fields(item))
            return clean_list

        if isinstance(serializable, dict):
            return dict((k,TimeoffQuotaJsonSerializer.__get_serializable_exclude_none_fields(v)) for k,v in serializable.iteritems() if v is not None)

        return serializable
