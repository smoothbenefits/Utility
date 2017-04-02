from base import Base

class User(Base):
    def __init__(self):
        self.first_name = ""
        self.last_name = ""
        self.company_domain = ''
        self.email = ''
        self.person = ''
        self.direct_deposits = ''
        self.w4 = ''
        self.id = ""
        self.service_user_external_id = ''
