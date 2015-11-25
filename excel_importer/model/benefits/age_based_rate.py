from ..base import Base
class AgeBasedRate(Base):
    def __init__(self):
        self.age_min = ''
        self.age_max = ''
        self.rate = ''
