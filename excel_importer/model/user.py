from base import Base

class User(Base):
    def __init__(self):
        self.first_name = ""
        self.last_name = ""
        self.company_domain = None
        self.email = None
        self.family_members = []
        self.person = None
        self.id = ""
        self.medical_selection = None
        self.dental_selection = None
        self.basic_life_selection = None
        self.supplemental_life_selection = None
        self.ltd_selection = None
        self.std_selection = None
        self.hra_selection = None
