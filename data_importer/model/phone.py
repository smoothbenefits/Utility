from base import Base

class Phone(Base):
    def __init__(self):
        self.phone_type = 'home'
        self.number = ''
        self.id = ''
