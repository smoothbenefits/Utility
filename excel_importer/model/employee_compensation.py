from base import Base

class EmployeeCompensation(Base):
    def __init__(self):
        self.annual_base_salary = ''
        self.projected_hour_per_month = ''
        self.hourly_rate = ''
        self.reason = ''
        self.effective_date = ''
