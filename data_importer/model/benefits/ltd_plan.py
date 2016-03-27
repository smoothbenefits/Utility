from ..base import Base
class LtdPlan(Base):
    def __init__(self):
        self.id = ''
        self.name = ''
        self.elimination_period_in_months = ''
        self.duration_in_years = ''
        self.percentage_of_salary = ''
        self.max_benefit_monthly = ''
        self.rate = ''
        self.employer_contribution_percentage = ''
        self.paid_by = ''
        self.user_amount_required = ''
        self.benefit_amount_step = ''
        self.age_based_rates = []
