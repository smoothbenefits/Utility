from serializer_factory import SerializerFactory
from user_serializer import UserSerializer

class UserSerializerFactory(SerializerFactory):
    def __init__(self, company_domain):
        super(UserSerializerFactory, self).__init__()
        self.company_domain = company_domain
        self.serializer_dict = {}
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

    def get_data(self, data_cell):
        serializer = self.serializer_dict.get(data_cell.row)
        if not serializer:
            serializer = UserSerializer(data_cell.row, self, self.company_domain)
            self.serializer_dict[data_cell.row] = serializer
        self._store_data_to_attr(serializer, data_cell)

    def serialize(self):
        for data_item in self.serializer_dict.values():
            data_item.serialize()


        
