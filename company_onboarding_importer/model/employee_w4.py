from base import Base

class EmployeeW4(Base):
    def __init__(self):
        self.status = ''
        self.allowance = ''
        self.extra_amount = ''