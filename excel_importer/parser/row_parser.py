from address_parser import AddressParser
from person_parser import PersonParser
from phone_parser import PhoneParser
from model.model_type import ModelType
from employee_profile_parser import EmployeeProfileParser

class RowParser(object):
    def __init__(self):
        self._address_parser = AddressParser()
        self._person_parser = PersonParser()
        self._phone_parser = PhoneParser()
        self._employee_profile_parser = EmployeeProfileParser()

    def initialize(self, excel_header_row):
        self._address_parser.initialize_column_mapping(excel_header_row)
        self._person_parser.initialize_column_mapping(excel_header_row)
        self._phone_parser.initialize_column_mapping(excel_header_row)
        self._employee_profile_parser.initialize_column_mapping(excel_header_row)

    def parse_data(self, excel_row):
        row_parsed = {}
        row_parsed[ModelType.PERSON] = self._person_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].address = self._address_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].phone = self._phone_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].employee_profile = self._employee_profile_parser.parse_data_row(excel_row)
        return row_parsed
