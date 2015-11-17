from ..base import Base
class BenefitPlan(Base):
    def __init__(self):
        self.id = ''
        self.name = ''
        self.type = ''
        self.type_id = ''
        self.mandatory_pcp = False
        self.pcp_link = ''
        self.options = []
