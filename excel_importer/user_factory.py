import openpyxl
from model.user import User
import unicodedata


class UserFactory(object):
    def __init__(self, company_domain):
        self.company_domain = company_domain
        self._first_name = {'key':'First Name', 'column':None, 'value':None}
        self._last_name = {'key':'Last Name', 'column':None, 'value':None}
        self._email = {'key':'Email', 'column':None, 'value':None}

    def _populate_mapper(self, map_item, cell):
        if cell.value == map_item['key']:
            map_item['column'] = cell.column

    def _populate_value(self, map_item, cell):
        if cell.value and cell.column == map_item['column']:
            map_item['value'] = cell.value.encode('utf-8')

    def get_users(self, worksheet, header_row_num):
        # first we need to get the column range for each attribute
        for row in worksheet.iter_rows(row_offset=header_row_num-1):
            for cell in row:
                self._populate_mapper(self._first_name, cell)
                self._populate_mapper(self._last_name, cell)
                self._populate_mapper(self._email, cell)
            break
        user_array = []
        for row in worksheet.iter_rows(row_offset=header_row_num):
            for cell in row:
                self._populate_value(self._first_name, cell)
                self._populate_value(self._last_name, cell)
                self._populate_value(self._email, cell)
            if self._first_name['value'] and self._last_name['value']:
                user_array.append(User(self._first_name['value'], self._last_name['value'], self.company_domain, self._email['value']))
        return user_array
