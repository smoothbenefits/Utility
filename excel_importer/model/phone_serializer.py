from serializer import Serializer
from person_serializer import PersonSerializer

class PhoneSerializer(Serializer):
    def __init__(self, row_num):
        super(PhoneSerializer, self).__init__(row_num)
        self.phone_type = 'home'
        self.number = ''
        self.person_serializer = None
        self.phone_id = None

    def calculate_dependency(self, serializer_list):
        for serializer in serializer_list:
            if isinstance(serializer, PersonSerializer):
                self.person_serializer = serializer
                return

    def serialize(self):
        if not self.serialized and self.person_serializer:
            person_id = self.person_serializer.serialize()
            print "phone: {}".format(self.number, person_id)
            self.phone_id = 'phone{}'.format(self.row_num)
            self.serialized = True
        return self.phone_id
