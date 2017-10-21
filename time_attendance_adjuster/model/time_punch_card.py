import dateutil.parser
import datetime

from common.utility.environment_utility import EnvironmentUtility
from common.utility.hash_key_utility import HashKeyUtility

PUNCH_CARD_TYPE_WORK_TIME = 'Work Time'

class TimePunchCard(object):
    def __init__(self, punch_card_domain_model):

        # List out instance variables
        self.user_id = None
        self.date = None
        self.start = None
        self.end = None
        self.card_type = None

        hash_key_utility = HashKeyUtility()

        # Parse out user ID
        user_descriptor = punch_card_domain_model['employee']['personDescriptor']
        self.user_id = hash_key_utility.decode_key_with_environment(user_descriptor)

        # Parse card type
        self.card_type = punch_card_domain_model['recordType']

        # Parse all dates and times to objects
        self.date = self._parse_date_time(punch_card_domain_model['date'])

        # Parse card mode, hours or range
        self.in_hours = punch_card_domain_model['inHours']

        start_str = punch_card_domain_model['start']
        if (start_str):
            self.start = self._parse_date_time(start_str)

        end_str = punch_card_domain_model['end']
        if (end_str):
            self.end = self._parse_date_time(end_str)

    def get_punch_card_hours(self):
        if (self.start is not None and self.end is not None):
            return self._get_time_diff_in_hours(self.start, self.end, 2)
        return 0.0

    def get_card_day_of_week_iso(self):
        return self.date.isoweekday() % 7

    def get_card_date_text(self):
        return self.date.strftime('%a %m/%d/%y')

    def _get_time_diff_in_hours(self, start_time, end_time, time_unit_precsion=1):
        delta = end_time - start_time
        return round(delta.total_seconds() / 3600, time_unit_precsion)

    def _parse_date_time(self, date_time_string):
        return dateutil.parser.parse(date_time_string)

    def is_work_card(self):
        return self.card_type == PUNCH_CARD_TYPE_WORK_TIME
