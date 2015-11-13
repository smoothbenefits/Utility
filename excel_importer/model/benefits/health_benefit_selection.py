from ..base import Base
class HealthBenefitSelection(Base):
    def __init__(self):
        self.id = ''
        self.benefit_plan = None
        self.benefit_name = ''
        self.pcp_number = ''
        self.option = None
