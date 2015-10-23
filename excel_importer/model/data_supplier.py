from user_serializer_factory import UserSerializerFactory

class DataSupplier(object):
    def __init__(self):
        self.factories = []
        self.factories.append(UserSerializerFactory("fairviewhealthcare.com"))
        self.header_row_num = None

    def supply_header_data(self, header_row, header_row_num):
        self.header_row_num = header_row_num
        for factory in self.factories:
            factory.get_header(header_row)

    def supply_data(self, worksheet):
        for row in worksheet.iter_rows(row_offset=self.header_row_num):
            for cell in row:
                for factory in self.factories:
                    factory.get_data(cell)


    def serialize_all(self):
        for factory in self.factories:
            factory.serialize()

