from base import Base

class User(Base):
    def __init__(self):
        self.first_name = ""
        self.last_name = ""
        self.company_domain = None
        self.email = None
        self.person = None
        self.direct_deposits = None
        self.w4 = None
        self.id = ""