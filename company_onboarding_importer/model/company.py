from base import Base

class Company(Base):
    def __init__(self):
        self.name = ''
        self.pay_period = None
        self.company_users = None
        self.id = ''