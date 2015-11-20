class CompanyBenefits(object):
    def __init__(self, company_id):
        self.company_id = company_id
        self.medicals = None
        self.dentals = None
        self.visions = None
        self.basic_life_insurance = None
        self.supplemental_life_insurance = None
        self.std_plan = None
        self.ltd_plan = None
