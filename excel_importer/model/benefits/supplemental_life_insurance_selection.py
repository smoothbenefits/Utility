from ..base import Base
class SupplementalLifeInsuranceSelection(Base):
    def __init__(self):
        self.id = ''
        self.supplemental_life_insurance = None
        self.primary_beneficiaries = []
        self.contingent_beneficiaries = []
