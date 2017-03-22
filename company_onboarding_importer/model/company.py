from base import Base

class Company(Base):
    def __init__(self):
        self.name = ''
        self.pay_period = None
        self.company_users = None
        self.admin_email = ''
        self.id = ''
        self.payroll_name = None
        self.company_external_id = None
