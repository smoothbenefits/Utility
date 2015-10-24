from serializer_factory import SerializerFactory
from person_serializer import PersonSerializer

class PersonSerializerFactory(SerializerFactory):
    def __init__(self, company_id):
        super(PersonSerializerFactory, self).__init__()
        self._person_type_meta = {'key': 'Person Type', 'column':None}
        self._first_name_meta = {'key':'First Name', 'column':None}
        self._last_name_meta = {'key':'Last Name', 'column':None}
        self._email_meta = {'key':'Email', 'column':None}
        self._middle_name_meta = {'key':'Mid Name', 'column':None}
        self._relationship_meta = {'key': 'Relation to Subscriber', 'column': None}
        self._ssn_meta = {'key': 'Member\'s SSN', 'column':None}
        self._birth_date_meta = {'key': 'Date Of Birth', 'column':None}
        self._reason_for_change_meta = {'key': 'Reason', 'column':None}
        self._gender_meta = {'key':'Gender', 'column':None}
        self.company_id = company_id

    def get_header(self, header):
        for cell in header:
            self._populate_header(self._person_type_meta, cell)
            self._populate_header(self._first_name_meta, cell)
            self._populate_header(self._last_name_meta, cell)
            self._populate_header(self._email_meta, cell)
            self._populate_header(self._middle_name_meta, cell)
            self._populate_header(self._relationship_meta, cell)
            self._populate_header(self._ssn_meta, cell)
            self._populate_header(self._birth_date_meta, cell)
            self._populate_header(self._gender_meta, cell)

    def _store_data_to_attr(self, serializer, cell):
        if self._first_name_meta['column'] == cell.column:
            serializer.first_name = cell.value
        elif self._last_name_meta['column'] == cell.column:
            serializer.last_name = cell.value
        elif self._email_meta['column'] == cell.column:
            serializer.email = cell.value
        elif self._person_type_meta['column'] == cell.column:
            serializer.person_type = cell.value
        elif self._middle_name_meta['column'] == cell.column:
            serializer.middle_name = cell.value
        elif self._relationship_meta['column'] == cell.column:
            serializer.relationship = cell.value
        elif self._ssn_meta['column'] == cell.column:
            serializer.ssn = cell.value
        elif self._birth_date_meta['column'] == cell.column:
            serializer.birth_date = cell.value
        elif self._gender_meta['column'] == cell.column:
            serializer.gender = cell.value

    def get_data(self, data_cell):
        serializer = self.serializer_dict.get(data_cell.row)
        if not serializer:
            serializer = PersonSerializer(data_cell.row, self.company_id)
            self.serializer_dict[data_cell.row] = serializer
        self._store_data_to_attr(serializer, data_cell)

    def serialize(self):
        for data_item in self.serializer_dict.values():
            data_item.serialize()

