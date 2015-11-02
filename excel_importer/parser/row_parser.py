from address_parser import AddressParser
from person_parser import PersonParser
from phone_parser import PhoneParser
from model.model_type import ModelType
from employee_profile_parser import EmployeeProfileParser
from employee_compensation_parser import EmployeeCompensationParser
from dependent_parser import DependentParser

class RowParser(object):
    def __init__(self):
        self._address_parser = AddressParser()
        self._person_parser = PersonParser()
        self._phone_parser = PhoneParser()
        self._employee_profile_parser = EmployeeProfileParser()
        self._employee_compensation_parser = EmployeeCompensationParser()
        self._dependent_parser = DependentParser()

    def initialize(self, excel_header_row):
        self._address_parser.initialize_column_mapping(excel_header_row)
        self._person_parser.initialize_column_mapping(excel_header_row)
        self._phone_parser.initialize_column_mapping(excel_header_row)
        self._employee_profile_parser.initialize_column_mapping(excel_header_row)
        self._employee_compensation_parser.initialize_column_mapping(excel_header_row)
        self._dependent_parser.initialize_column_mapping(excel_header_row)

    def parse_data(self, excel_row):
        row_parsed = {}
        row_parsed[ModelType.PERSON] = self._person_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].address = self._address_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].phone = self._phone_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].employee_profile = self._employee_profile_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].employee_compensation = self._employee_compensation_parser.parse_data_row(excel_row)
        row_parsed[ModelType.DEPENDENT] = self._dependent_parser.parse_data_row(excel_row)
        return row_parsed
