from base import Base

class Person(Base):
    def __init__(self):
        self.person_type = ''
        self.first_name = ''
        self.last_name = ''
        self.email = ''
        self.middle_name = ''
        self.relationship = ''
        self.ssn = ''
        self.birth_date = ''
        self.gender = ''
        self.phone = None
        self.address = None
        self.member_id = None
        self.employee_profile = None
        self.employee_compensation = None
