from user_serializer_factory import UserSerializerFactory
from person_serializer_factory import PersonSerializerFactory
from address_serializer_factory import AddressSerializerFactory
from phone_serializer_factory import PhoneSerializerFactory

class DataSupplier(object):
    def __init__(self, company_id):
        self.factories = []
        self.factories.append(UserSerializerFactory("fairviewhealthcare.com"))
        self.factories.append(PersonSerializerFactory(company_id))
        self.factories.append(AddressSerializerFactory(company_id))
        self.factories.append(PhoneSerializerFactory())
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
        for key in self.serializer_list_dict.keys():
            for serializer in self.serializer_list_dict[key]:
                serializer.serialize()

