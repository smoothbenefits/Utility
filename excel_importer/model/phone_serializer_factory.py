from serializer_factory import SerializerFactory
from phone_serializer import PhoneSerializer

class PhoneSerializerFactory(SerializerFactory):
    def __init__(self):
        super(PhoneSerializerFactory, self).__init__()
        self._number_meta = {'key':'Home Phone', 'column':None}

    def get_header(self, header):
        for cell in header:
            self._populate_header(self._number_meta, cell)

    def _store_data_to_attr(self, serializer, cell):
        if self._number_meta['column'] == cell.column:
            serializer.number = cell.value

    def construct_serializer(self, row_num):
        return PhoneSerializer(row_num)

