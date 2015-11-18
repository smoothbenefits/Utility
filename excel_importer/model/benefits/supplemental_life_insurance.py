from ..base import Base
class SupplementalLifeInsurance(Base):
    def __init__(self):
        self.id = ''
        self.name = ''
        self.use_employee_age_for_spouse = ''
        self.employee_rates = {}
        self.spouse_rates = {}
        self.child_rates = {}
