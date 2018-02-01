VALID_FILING_STATUS = ['S', 'M', 'H', 'E']

class StateTaxInfo(object):

    def __init__(self):
        self.state = None
        self.filing_status = None
        self.allowance = None
        self.extra_amount = None

    def is_valid(self):
        # Allow empty entry
        if (self.is_empty()):
            return True

        if (not self.state
            or not self.filing_status
            or not self.allowance):
            return False

        if (self.filing_status not in VALID_FILING_STATUS):
            return False

        if (self.extra_amount and self.extra_amount < 0):
            return False

        if (self.allowance < 0):
            return False

        return True

    def is_empty(self):
        return (
            not self.state
            and not self.filing_status
            and not self.allowance
            and not self.extra_amount
        )

    def get_json(self):
        if (not self.is_valid()):
            raise RuntimeError('This state tax info object is not valid to be serailized.')

        if (self.is_empty()):
            return ''

        return '{{"filing_status": "{0}", "allowance": {1}, "extra_amount": {2}, "metadata": {{"data_source" : "import" }}}}'.format(
            self.filing_status,
            self.__normalize_allowance(),
            self.__normalize_extra_amount())

    def __normalize_extra_amount(self):
        if not self.extra_amount:
            return 0.0
        return self.extra_amount

    def __normalize_allowance(self):
        return int(self.allowance)
