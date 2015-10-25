class SerializerFactory(object):
    def __init__(self):
        self.serializer_dict = {}

    def _populate_header(self, header_item, cell):
        if cell.value == header_item['key']:
            header_item['column'] = cell.column

    def get_serializer(self, row_num):
        return self.serializer_dict.get(row_num)

    def get_header(self, header):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def construct_serializer(self, row_num):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _store_data_to_attr(self, serializer, cell):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def get_data(self, data_cell):
        serializer = self.serializer_dict.get(data_cell.row)
        if not serializer:
            serializer = self.construct_serializer(data_cell.row)
            self.serializer_dict[data_cell.row] = serializer
        self._store_data_to_attr(serializer, data_cell)

    def serialize(self):
        for data_item in self.serializer_dict.values():
            data_item.serialize()

