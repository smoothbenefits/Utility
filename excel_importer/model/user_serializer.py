from serializer import Serializer
class UserSerializer(Serializer):
    def __init__(self, row_num, company_domain):
        super(UserSerializer, self).__init__(row_num)
        self.first_name = ""
        self.last_name = ""
        self.company_domain = company_domain
        self._email = None
        self.user_id = None

    @property
    def email(self):
        if not self._email:
            return "{0}{1}@{2}".format(self.first_name.replace(" ", "_"), self.last_name.replace(" ", "_"), self.company_domain)
        else:
            return self._email
    
    @email.setter
    def email(self, email):
        self._email = email

    def calculate_dependency(self, serializer_list):
        pass

    def serialize(self):
        if not self.serialized:
            self.user_id = 'user{}'.format(self.row_num)
            print "{}, {}, {}".format(self.first_name, self.last_name, self.email)
            self.serialized = True
        return self.user_id
