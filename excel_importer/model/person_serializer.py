from serializer import Serializer
from user_serializer import UserSerializer

class PersonSerializer(Serializer):
    def __init__(self, row_num, company_id):
        super(PersonSerializer, self).__init__(row_num)
        self.person_type = ''
        self.first_name = ''
        self.last_name = ''
        self.email = ''
        self.middle_name = ''
        self._relationship = ''
        self.ssn = ''
        self._birth_date = ''
        self.gender = ''
        self.company_id = company_id
        self.user_serializer = None
        self.person_id = None

    @property
    def relationship(self):
        return self._relationship

    @relationship.setter
    def relationship(self, relationship):
        self._relationship = relationship

    @property
    def birth_date(self):
        return self._birth_date

    @birth_date.setter
    def birth_date(self, birth_date):
        self._birth_date = birth_date

    def calculate_dependency(self, serializer_list):
        for serializer in serializer_list:
            if isinstance(serializer, UserSerializer):
                self.user_serializer = serializer
                return

    def serialize(self):
        if not self.serialized and self.user_serializer:
            user_id = self.user_serializer.serialize()
            print "ssn: {}, relationship: {}, birth_date: {}, gender: {}, user:{}".format(self.ssn, self.relationship, self.birth_date, self.gender, user_id)
            self.person_id = 'person{}'.format(self.row_num)
            self.serialized = True
        return self.person_id