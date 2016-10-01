VALID_ACCRUAL_FREQUENCY = [
    'Monthly',
    'Daily'
]

VALID_TIMEOFF_TYPE = [
    'Paid Time Off (PTO)',
    'Sick Time'
]

class AccrualSpec(object):

    def __init__(self, accrual_frequency=None, accrued_hours=0.0, last_accrual_time_stamp=None):
        self.accrualFrequency = accrual_frequency
        self.accruedHours = accrued_hours
        self.lastAccuralTimeStamp = last_accrual_time_stamp

    ''' This is called "patch" instead of "update" to represent the expectation of 
        this method to roughly align with the PATCH and PUT HTTP verbs. (Not the same though,
        as we are not describing actions and targets in this case)
        Where this method only updates a field, if a not "None" value is given, but will retain
        the original value, if a None value is given for an input
    '''
    def patch(self, accrual_frequency):
        if (accrual_frequency is not None):
            self.accrualFrequency = accrual_frequency

    @staticmethod
    def create(accrual_frequency):
        return AccrualSpec(accrual_frequency=accrual_frequency, accrued_hours=0.0)


class QuotaInfoCollectionEntry(object):

    def __init__(self, timeoff_type, banked_hours=0.0, annual_target_hours=0.0, accrual_specs=None):
        self.timeoffType = timeoff_type
        self.annualTargetHours = annual_target_hours
        self.bankedHours = banked_hours
        self.accrualSpecs = accrual_specs

    ''' This is called "patch" instead of "update" to represent the expectation of 
        this method to roughly align with the PATCH and PUT HTTP verbs. (Not the same though,
        as we are not describing actions and targets in this case)
        Where this method only updates a field, if a not "None" value is given, but will retain
        the original value, if a None value is given for an input
    '''
    def patch(self, banked_hours, annual_target_hours, accrual_frequency):
        if (banked_hours is not None):
            self.bankedHours = banked_hours
        if (annual_target_hours is not None):
            self.annualTargetHours = annual_target_hours
        self.accrualSpecs.patch(accrual_frequency=accrual_frequency)

    @staticmethod
    def create(timeoff_type, banked_hours, annual_target_hours, accrual_frequency):
        banked_hours_val = 0.0
        if banked_hours is not None:
            banked_hours_val = banked_hours

        new_quota_info_spec = AccrualSpec.create(accrual_frequency=accrual_frequency)
        return QuotaInfoCollectionEntry(
            timeoff_type=timeoff_type,
            banked_hours=banked_hours_val,
            annual_target_hours=annual_target_hours,
            accrual_specs=new_quota_info_spec)

class TimeOffQuota(object):

    def __init__(self, person_descriptor, company_descriptor, quota_info_collection, created_time_stamp=None, modified_time_stamp=None):

        self.id = None
        self.createdTimeStamp = created_time_stamp
        self.modifiedTimestamp = modified_time_stamp
        self.personDescriptor = person_descriptor
        self.companyDescriptor = company_descriptor
        self.quotaInfoCollection = quota_info_collection

    def get_quota_info_entry_by_timeoff_type(self, timeoff_type):
        return next((entry for entry in self.quotaInfoCollection if entry.timeoffType == timeoff_type), None)

    ''' This is called "patch" instead of "update" to represent the expectation of 
        this method to roughly align with the PATCH and PUT HTTP verbs. (Not the same though,
        as we are not describing actions and targets in this case)
        Where this method only updates a field, if a not "None" value is given, but will retain
        the original value, if a None value is given for an input
    '''
    def patch(self, timeoff_type, annual_target_hours, accrual_frequency, banked_hours):
        # if the record has entry for this timeoff_type, update it
        # Otherwise, add one to the collection
        quota_info_entry = self.get_quota_info_entry_by_timeoff_type(timeoff_type)
        if (quota_info_entry is not None):
            quota_info_entry.patch(
                annual_target_hours=annual_target_hours,
                accrual_frequency=accrual_frequency,
                banked_hours=banked_hours)
        else:
            new_quota_info_entry = QuotaInfoCollectionEntry.create(
                timeoff_type=timeoff_type,
                banked_hours=banked_hours,
                annual_target_hours=annual_target_hours,
                accrual_frequency=accrual_frequency
            )
            self.quotaInfoCollection.append(new_quota_info_entry)

    ''' Factory method. To create an instance of TimeOffQuota with expected
        quota specs information
    '''
    @staticmethod
    def create(person_descriptor, company_descriptor, timeoff_type, annual_target_hours, accrual_frequency, banked_hours):
        new_quota_info_entry = QuotaInfoCollectionEntry.create(
            timeoff_type=timeoff_type,
            banked_hours=banked_hours,
            annual_target_hours=annual_target_hours,
            accrual_frequency=accrual_frequency)
        new_quota_record = TimeOffQuota(
            person_descriptor=person_descriptor,
            company_descriptor=company_descriptor,
            quota_info_collection=[new_quota_info_entry]        
        )
        return new_quota_record
