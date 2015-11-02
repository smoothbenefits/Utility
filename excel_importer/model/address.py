from base import Base

class Address(Base):
    def __init__(self):
        self.address_type = 'home'
        self.street_1 = None
        self.street_2 = None
        self.city = None
        self.state = None
        self.zipcode = None
