class SerializerFactory(object):
    def __init__(self):
        pass

    def _populate_header(self, header_item, cell):
        if cell.value == header_item['key']:
            header_item['column'] = cell.column

    def get_header(self, header):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def get_data(self, data_cell):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def serialize(self):
        raise NotImplementedError("Please Implement this method in the sub-class")
