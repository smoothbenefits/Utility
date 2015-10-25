from serializer_factory import SerializerFactory
from user_serializer import UserSerializer

class UserSerializerFactory(SerializerFactory):
    def __init__(self, company_domain):
        super(UserSerializerFactory, self).__init__()
        self.company_domain = company_domain
        self._first_name_meta = {'key':'First Name', 'column':None}
        self._last_name_meta = {'key':'Last Name', 'column':None}
        self._email_meta = {'key':'Email', 'column':None}
        
    def get_header(self, header):
        for cell in header:
            self._populate_header(self._first_name_meta, cell)
            self._populate_header(self._last_name_meta, cell)
            self._populate_header(self._email_meta, cell)
    
    def _store_data_to_attr(self, serializer, cell):
        if self._first_name_meta['column'] == cell.column:
            serializer.first_name = cell.value
        elif self._last_name_meta['column'] == cell.column:
            serializer.last_name = cell.value
        elif self._email_meta['column'] == cell.column:
            serializer.email = cell.value

    def construct_serializer(self, row_num):
        return UserSerializer(row_num, self.company_domain)
