from ..model.address import Address
from common.data_provider.sql_data_provider_base import SqlDataProviderBase


class AddressDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, person_id):
        super(AddressDataProvider, self).__init__(cursor)
        self.person_id = person_id

    def _get_sql_string(self):
        return 'select id, street_1, street_2, city, state, zipcode from app_address where person_id=\'{}\' and address_type=\'home\''.format(self.person_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_address = Address()
        row = data[0]
        if row:
            cur_address.id = row[0]
            cur_address.street_1 = row[1]
            cur_address.street_2 = row[2]
            cur_address.city = row[3]
            cur_address.state = row[4]
            cur_address.zipcode = row[5]
            return cur_address
        else:
            return None
