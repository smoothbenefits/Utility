from ..base import Base
class HealthOption(Base):
    def __init__(self):
        self.id = ''
        self.total_cost_per_period = ''
        self.employee_cost_per_period = ''
        self.benefit_option_type = ''
