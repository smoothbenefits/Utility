from ..base import Base
class BasicLifeInsurance(Base):
    def __init__(self):
        self.id = ''
        self.name = ''
        self.total_cost_per_period = ''
        self.employee_cost_per_period = ''
        self.salary_multiplier = ''
