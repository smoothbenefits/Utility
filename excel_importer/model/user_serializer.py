from serializer import Serializer
class UserSerializer(Serializer):
    def __init__(self, row_num, serializer_factory, company_domain):
        super(UserSerializer, self).__init__(row_num)
        self.serializer_factory = serializer_factory
        self._first_name = ""
        self._last_name = ""
        self.company_domain = company_domain
        self._email = None
        
    @property
    def first_name(self):
        return self._first_name

    @first_name.setter
    def first_name(self, first_name):
        self._first_name = first_name

    @property
    def last_name(self):
        return self._last_name

    @last_name.setter
    def last_name(self, last_name):
        return self._last_name

    @property
    def email(self):
        if not self._email:
            return "{0}{1}@{2}".format(self._first_name.replace(" ", "_"), self._last_name.replace(" ", "_"), self.company_domain)
        else:
            return self._email
    
    @email.setter
    def email(self, email):
        self._email = email

    def serialize(self):
        print "{}, {}, {}".format(self.first_name, self.last_name, self.email)
