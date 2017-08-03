from ...model.model_type import ModelType
from person_parser import PersonParser
from employee_profile_parser import EmployeeProfileParser


class RowParser(object):
    def __init__(self):
        self._person_parser = PersonParser()
        self._employee_profile_parser = EmployeeProfileParser()

    def initialize(self, excel_header_row):
        self._person_parser.initialize(excel_header_row)
        self._employee_profile_parser.initialize(excel_header_row)

    def parse_data(self, excel_row):
        row_parsed = {}
        row_parsed[ModelType.PERSON] = person = self._person_parser.parse_data_row(excel_row)
        row_parsed[ModelType.PERSON].employee_profile = self._employee_profile_parser.parse_data_row(excel_row)
        return row_parsed
