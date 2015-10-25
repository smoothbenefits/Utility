from serializer_factory import SerializerFactory
from address_serializer import AddressSerializer

class AddressSerializerFactory(SerializerFactory):
    def __init__(self, company_id):
        super(AddressSerializerFactory, self).__init__()
        self.company_id = company_id
        self._street_1_meta = {'key':'Address Line 1', 'column':None}
        self._street_2_meta = {'key':'Address Line 2', 'column':None}
        self._city_meta = {'key':'City', 'column':None}
        self._state_meta = {'key':'State', 'column':None}
        self._zipcode_meta = {'key':'ZIP Code', 'column':None}
    
    def get_header(self, header):
        for cell in header:
            self._populate_header(self._street_1_meta, cell)
            self._populate_header(self._street_2_meta, cell)
            self._populate_header(self._city_meta, cell)
            self._populate_header(self._state_meta, cell)
            self._populate_header(self._zipcode_meta, cell)

    def _store_data_to_attr(self, serializer, cell):
        if self._street_1_meta['column'] == cell.column:
            serializer.street_1 = cell.value
        elif self._street_2_meta['column'] == cell.column:
            serializer.street_2 = cell.value
        elif self._city_meta['column'] == cell.column:
            serializer.city = cell.value
        elif self._state_meta['column'] == cell.column:
            serializer.state = cell.value
        elif self._zipcode_meta['column'] == cell.column:
            serializer.zip_code = cell.value

    def construct_serializer(self, row_num):
        return AddressSerializer(row_num, self.company_id)
