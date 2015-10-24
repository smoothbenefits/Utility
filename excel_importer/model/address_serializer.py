from serializer import Serializer
from person_serializer import PersonSerializer

class AddressSerializer(Serializer):
    def __init__(self, row_num, company_id):
        super(AddressSerializer, self).__init__(row_num)
        self.company_id = company_id
        self.address_type = 'home'
        self.street_1 = None
        self.street_2 = None
        self.city = None
        self.state = None
        self.zipcode = None
        self.person_serializer = None
        self.address_id = None

    def calculate_dependency(self, serializer_list):
        for serializer in serializer_list:
            if isinstance(serializer, PersonSerializer):
                self.person_serializer = serializer
                return

    def serialize(self):
        if not self.serialized and self.person_serializer:
            person_id = self.person_serializer.serialize()
            print "address1: {}, city: {}, state: {}, zip: {}, person:{}".format(self.street_1, self.city, self.state, self.zipcode, person_id)
            self.person_id = 'address{}'.format(self.row_num)
            self.serialized = True
        return self.address_id