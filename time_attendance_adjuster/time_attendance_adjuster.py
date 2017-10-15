#!/usr/bin/env python
import sys, getopt, os
import logging
import json
import dateutil.parser

from common.data_import_base import DataImportBase
from common.utility.environment_utility import EnvironmentUtility
from .data_aggregator.time_attendance_data_aggregator import TimeAttendanceDataAggregator

from common.writer.csv_writer import CSVWriter

from .data_provider.company_users_data_provider import CompanyUsersDataProvider
from .data_provider.excel_users_adjustment_specification_data_provider import ExcelUsersAdjustmentSpecificationDataProvider
from .data_provider.company_users_time_card_data_provider import CompanyUsersTimeCardDataProvider
from .data_provider.excel_cp_time_attendance_export_data_provider import ExcelCPTimeAttendanceExportDataProvider


class TimeAttendanceAdjuster(DataImportBase):
    def __init__(self):
        super(TimeAttendanceAdjuster, self).__init__()

    def get_program_name(self):
        return 'time_attendance_adjuster'

    def usage(self):
        print "data_import.py {} [options] [arguments]\n".format(self.get_program_name())
        print "options can be one of the following: \n"
        print "-c (--company) [Required] this tells the importer which company is being targeted at"
        print "-s (--specification) [Required] the file path to the CSV contains adjustment specification for users"
        print "-d (--debug) [Optional Default=False] this will turn on the debug statment output \n"
        print "-e (--environment) [Optional Default=local] the option to specify target environment to use. Values being one of: local, stage, demo1, demo2, prod \n"
        print "-b (--begin) [Required] the begin date of the range to adjust"
        print "-t (--end) [Required] the end date of the range to adjust"
        print "-o (--output) [Required] the output file path"
        print "-h (--help) [Optional] the option will print this message \n"
        print "The script needs the expected input Excel file path to perform the adjustment action\n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "c:s:de:b:t:o:h", ["company=", "specification=", "debug", "environment=", "begin=", "end=", "output=", "help"])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        company_id = None
        spec_file_path = None
        begin_str = None
        end_str = None
        output_file_path = None

        for o, a in opts:
            if o == "-d":
                Logger.setLevel(logging.DEBUG)
            elif o in ("-h", "--help"):
                self.usage()
                sys.exit()
            elif o in ("-e", "--environment"):
                EnvironmentUtility.set_active_environment(a)
            elif o in ("-c", "--company"):
                company_id = a
            elif o in ("-s", "--specification"):
                spec_file_path = a
            elif o in ("-b", "--begin"):
                begin_str = a
            elif o in ("-t", "--end"):
                end_str = a
            elif o in ("-o", "--output"):
                output_file_path = a
            else:
                assert False, "unhandled option"

        if (not company_id
            or not spec_file_path
            or not output_file_path):
            self.usage()
            sys.exit(2)

        begin = dateutil.parser.parse(begin_str)
        end = dateutil.parser.parse(end_str)

        if (not begin or not end):
            print 'Bad format of begin or end date'
            self.usage()
            sys.exit(2)

        if len(args) != 1:
            self.usage()
            sys.exit(2)

        target_file_path = args[0]

        self.__perform_import(company_id, spec_file_path, begin, end, target_file_path, output_file_path)
        #self.__test_output(company_id, spec_file_path, begin, end, target_file_path, output_file_path)

    def __perform_import(self, company_id, spec_file_path, start_date, end_date, target_file_path, output_file_path):

        print 'Collecting all data ...'

        data_aggregator = TimeAttendanceDataAggregator(company_id, spec_file_path, start_date, end_date, target_file_path)
        data = data_aggregator.get_aggregated_data()

        print 'Generating CSV data ...'
        self.__write_output(data, output_file_path)
        
        print 'Generating Metadata'
        self.__write_metadata(data, output_file_path)

        print 'Operation completed!'

    def __test_output(self, company_id, spec_file_path, start_date, end_date, target_file_path, output_file_path):
        # Print output
        print '####### Output Starts #######'
        print ''

        # company_users_data_provider = CompanyUsersDataProvider(company_id)
        # all_users = company_users_data_provider.get_model()
        # for user in all_users:
        #     print '{0} {1} {2} {3}'.format(user.user_id, user.first_name, user.last_name, user.employee_number)

        # spec_provider = ExcelUsersAdjustmentSpecificationDataProvider(spec_file_path)
        # all_specs = spec_provider.get_model()
        # for spec in all_specs:
        #     print '{0} {1} {2} {3} {4} {5}'.format(spec.first_name, spec.last_name, spec.employee_number, spec.department_number, spec.department_name, spec.adjustment_code)

        # time_card_provider = CompanyUsersTimeCardDataProvider(company_id, start_date, end_date)
        # cards = time_card_provider.get_model()
        # for card in cards:
        #     print '{0} {1} {2} {3} {4}'.format(card.user_id, card.card_type, card.date, card.get_punch_card_hours(), card.in_hours)

        # export_provider = ExcelCPTimeAttendanceExportDataProvider(target_file_path)
        # all_records = export_provider.get_model()
        # for record in all_records:
        #     print '{0} {1} {2} {3} {4} {5} {6} {7} {8}'.format(
        #         record.file_type, record.client_number, record.client_name,
        #         record.employee_number, record.employee_name, record.earning_name,
        #         record.earning_code, record.hours, record.department)

        # writer = CSVWriter()
        # writer.write_cell('aaa')
        # writer.next_row()
        # writer.write_cell('ddd')
        # writer.save(output_file_path)

        print ''
        print '####### Output Ends #######'
        print ''

    def __write_output(self, aggregated_data, output_file_path):
        csv_writer = CSVWriter()
        self.__write_headers(csv_writer)

        for record in aggregated_data:
            self.__write_row(csv_writer, record)

        csv_writer.save(output_file_path)

    def __write_headers(self, csv_writer):
        csv_writer.write_cell('File Type')
        csv_writer.write_cell('Client Name')
        csv_writer.write_cell('Client Number')
        csv_writer.write_cell('Employee Number')
        csv_writer.write_cell('Employee Name')
        csv_writer.write_cell('SSN')
        csv_writer.write_cell('Earning Name')
        csv_writer.write_cell('Earning Code')
        csv_writer.write_cell('Hours')
        csv_writer.write_cell('Pay Rate')
        csv_writer.write_cell('Fixed $ Amount')
        csv_writer.write_cell('Location')
        csv_writer.write_cell('Division')
        csv_writer.write_cell('Department')
        csv_writer.write_cell('Job Code')
        csv_writer.write_cell('Beginning Balance')
        csv_writer.write_cell('Accrued')
        csv_writer.write_cell('Used')
        csv_writer.write_cell('Ending Balance')

        csv_writer.next_row()

    def __write_row(self, csv_writer, row_data):
        csv_writer.write_cell(row_data.file_type)
        csv_writer.write_cell(row_data.client_name)
        csv_writer.write_cell(row_data.client_number)
        csv_writer.write_cell(row_data.employee_number)
        csv_writer.write_cell(row_data.employee_name)
        csv_writer.write_cell(row_data.ssn)
        csv_writer.write_cell(row_data.earning_name)
        csv_writer.write_cell(row_data.earning_code)
        csv_writer.write_cell(row_data.get_adjusted_hours())
        csv_writer.write_cell(row_data.pay_rate)
        csv_writer.write_cell(row_data.fixed_amount)
        csv_writer.write_cell(row_data.location)
        csv_writer.write_cell(row_data.division)
        csv_writer.write_cell(row_data.department)
        csv_writer.write_cell(row_data.job_code)
        csv_writer.write_cell(row_data.begin_balance)
        csv_writer.write_cell(row_data.accrued)
        csv_writer.write_cell(row_data.used)
        csv_writer.write_cell(row_data.end_balance)

        # move to next row
        csv_writer.next_row()

    def __write_metadata(self, aggregated_data, output_file_path):
        csv_writer = CSVWriter()
        self.__write_metadata_headers(csv_writer)

        for record in aggregated_data:
            self.__write_metadata_row(csv_writer, record)

        meta_file_path = self.__get_metadata_file_path(output_file_path)
        csv_writer.save(meta_file_path)

    def __write_metadata_headers(self, csv_writer):
        csv_writer.write_cell('Employee Number')
        csv_writer.write_cell('Employee Name')
        csv_writer.write_cell('Earning Name')
        csv_writer.write_cell('Earning Code')
        csv_writer.write_cell('Original Hours')
        csv_writer.write_cell('Adjustment Delta')
        csv_writer.write_cell('Final Hours')

        csv_writer.next_row()

    def __write_metadata_row(self, csv_writer, row_data):
        csv_writer.write_cell(row_data.employee_number)
        csv_writer.write_cell(row_data.employee_name)
        csv_writer.write_cell(row_data.earning_name)
        csv_writer.write_cell(row_data.earning_code)
        csv_writer.write_cell(row_data.hours)
        csv_writer.write_cell(row_data.hours_adjustment)
        csv_writer.write_cell(row_data.get_adjusted_hours())

        csv_writer.next_row()

    def __get_metadata_file_path(self, output_file_path):
        name, ext = os.path.splitext(output_file_path)
        return "{0}_{1}.{2}".format(name, 'meta', ext)
