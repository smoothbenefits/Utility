from address_parser import AddressParser
from person_parser import PersonParser


class ParserFactory(object):
    __address_parser = AddressParser()
    __person_parser = PersonParser(__address_parser)

    @staticmethod
    def initialize(excel_header_row):
        ParserFactory.__address_parser.initialize_column_mapping(excel_header_row)
        ParserFactory.__person_parser.initialize_column_mapping(excel_header_row)

    @staticmethod
    def get_address_parser():
        return ParserFactory.__address_parser

    @staticmethod
    def get_person_parser():
        return ParserFactory.__person_parser
