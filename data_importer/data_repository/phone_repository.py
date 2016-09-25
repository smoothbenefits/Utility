from ..model.phone import Phone
from common.data_repository.sql_repository_base import SqlRepositoryBase


class PhoneRepository(SqlRepositoryBase):
    def __init__(self, cursor, person_id):
        super(PhoneRepository, self).__init__(cursor)
        self.person_id = person_id

    def _get_sql_string(self):
        return 'select id, number from app_phone where person_id=\'{}\' and phone_type=\'home\''.format(self.person_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_phone = Phone()
        row = data[0]
        if row:
            cur_phone.id = row[0]
            cur_phone.number = row[1]
            return cur_phone
        else:
            return None
