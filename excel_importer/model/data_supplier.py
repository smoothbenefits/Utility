from user_serializer_factory import UserSerializerFactory
from person_serializer_factory import PersonSerializerFactory

class DataSupplier(object):
    def __init__(self):
        self.factories = []
        self.factories.append(UserSerializerFactory("fairviewhealthcare.com"))
        self.factories.append(PersonSerializerFactory(40))
        self.header_row_num = None
        self.serializer_list_dict = {}

    def supply_header_data(self, header_row, header_row_num):
        self.header_row_num = header_row_num
        for factory in self.factories:
            factory.get_header(header_row)

    def supply_data(self, worksheet):
        cur_row = 0
        for row in worksheet.iter_rows(row_offset=self.header_row_num):
            if not row:
                continue
            for cell in row:
                cur_row = cell.row
                for factory in self.factories:
                    factory.get_data(cell)

            serializer_list = self.serializer_list_dict.get(cur_row)
            if not serializer_list:
                serializer_list = []
                self.serializer_list_dict[cur_row] = serializer_list

            for factory in self.factories:
                serializer_list.append(factory.get_serializer(cur_row))

            for serializer in serializer_list:
                serializer.calculate_dependency(serializer_list)


    def serialize_all(self):
        for factory in self.factories:
            factory.serialize()

