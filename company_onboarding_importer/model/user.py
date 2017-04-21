from base import Base

class User(Base):
    def __init__(self):
        self.first_name = ""
        self.last_name = ""
        self.company_domain = ''
        self.email = ''
        # Default password hash for benefitmy2017
        self.password = 'pbkdf2_sha256$15000$FdFj2db1ynfa$NQk2m/RWgerM0ZhrKAhZ9ae0WrgUb220LalJUV4Eqzk='
        self.person = ''
        self.direct_deposits = ''
        self.w4 = ''
        self.id = ""
        self.service_user_external_id = ''
