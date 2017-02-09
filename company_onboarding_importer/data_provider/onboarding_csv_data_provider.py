import csv
from ..csv_parser.row_parser import RowParser

class OnboardingCSVDataProvider(object):
    def provide(self, csv_file_path, company_users):
        row_parser = RowParser()
        with open(csv_file_path, 'rb') as csv_file:
            csv_file_reader = csv.reader(csv_file)
            for row in csv_file_reader:
                row_parsed = row_parser.parse_data(row)
                company_users.merge_with_excel_data(row_parsed)
