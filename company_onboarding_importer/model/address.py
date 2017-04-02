from base import Base

class Address(Base):
    def __init__(self):
        self.address_type = 'home'
        self.street_1 = ''
        self.street_2 = ''
        self.city = ''
        self.state = ''
        self.zipcode = ''
        self.id = ''

    def set_normalized_zipcode(self, zipcode_input):
        if (not zipcode_input):
            self.zipcode = ''
            return

        if (not isinstance(zipcode_input, basestring)):
            zipcode_input = '{0:g}'.format(zipcode_input).strip()

        if '-' in zipcode_input:
            self.zipcode = zipcode_input.zfill(10)
        else:
            self.zipcode = zipcode_input.zfill(5)
