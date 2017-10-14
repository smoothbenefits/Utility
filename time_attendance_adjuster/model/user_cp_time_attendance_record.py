class UserCPTimeAttendanceRecord(object):
    def __init__(self, user):
        self.user = user
        self.cp_export_records = []

    def adjust_hours(self, hours_delta):
        # For now we do not support positive adjustment, due to involvement of 
        # handling over time and split record.
        # Leave this for later
        if (hours_delta > 0):
            raise ValueError('We do not yet support positive adjustment!')

        overtime_record = next((record for record in self.cp_export_records if record.is_overtime_record()), None)
        regular_record = next((record for record in self.cp_export_records if record.is_regular_record()), None)

        remainder = hours_delta
        if (overtime_record):
            remaining_hours = overtime_record.get_adjusted_hours()
            total = remaining_hours + hours_delta
            if (total < 0.0):
                remainder = total
                overtime_record.adjust_hours(hours_delta - remainder)
            else:
                remainder = None
                overtime_record.adjust_hours(hours_delta)

        if (remainder is not None and regular_record):
            regular_record.adjust_hours(remainder)

    def get_records(self, include_zero_hours=True):
        return [record for record in self.cp_export_records if (include_zero_hours or record.get_adjusted_hours() > 0)]

    def append_record(self, record):
        self.cp_export_records.append(record)
