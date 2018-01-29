#!/usr/bin/env python
import sys, getopt, os
import logging
import json
import dateutil.parser
from datetime import timedelta, date

from common.data_import_base import DataImportBase
from common.utility.environment_utility import EnvironmentUtility
from data_aggregator.state_tax_data_aggregator import StateTaxDataAggregator
from common.writer.sql_writer import SQLWriter


class StateTaxImporter(DataImportBase):
    def __init__(self):
        super(StateTaxImporter, self).__init__()

    def get_program_name(self):
        return 'state_tax_importer'

    def usage(self):
        print "data_import.py {} [options] [arguments]\n".format(self.get_program_name())
        print "options can be one of the following: \n"
        print "-c (--company) [Required] this tells the importer which company is being targeted at"
        print "-d (--debug) [Optional Default=False] this will turn on the debug statment output \n"
        print "-e (--environment) [Optional Default=local] the option to specify target environment to use. Values being one of: local, stage, demo1, demo2, prod \n"
        print "-o (--output) [Required] the output file path"
        print "-h (--help) [Optional] the option will print this message \n"
        print "The script needs the expected input Excel file path to perform the adjustment action\n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "c:de:o:h", ["company=", "debug", "environment=", "output=", "help"])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        company_id = None
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
            elif o in ("-o", "--output"):
                output_file_path = a
            else:
                assert False, "unhandled option"

        if (not company_id
            or not output_file_path):
            self.usage()
            sys.exit(2)

        if len(args) != 1:
            self.usage()
            sys.exit(2)

        target_file_path = args[0]

        self.__perform_import(company_id, target_file_path, output_file_path)

    def __perform_import(self, company_id, target_file_path, output_file_path):

        print 'Collecting all data ...'
        data_aggregator = StateTaxDataAggregator(company_id, target_file_path)
        # This is the aggregated map of user_id to state tax input record
        data = data_aggregator.get_aggregated_data()

        print 'Generating SQL file ...'
        self.__write_output(data, output_file_path)

        print 'Operation completed!'

    def __write_output(self, aggregated_data, output_file_path):
        with SQLWriter(output_file_path) as sql_writer:
            for user_id, record in aggregated_data.iteritems():
                sql_writer.write_line('-- user_id={0}'.format(user_id))

                # Only write out if user does not have state tax info yet
                sql_writer.write_line('IF NOT EXISTS (SELECT 1 FROM app_employeestatetaxelection WHERE user_id={0}) THEN'.format(user_id))

                # Write each of the state tax info inserts
                self.__write_state_tax_info(user_id, record.sit_1_info, sql_writer)
                self.__write_state_tax_info(user_id, record.sit_2_info, sql_writer)

                sql_writer.write_line('END IF;')

                sql_writer.write_line('')

    def __write_state_tax_info(self, user_id, state_tax_info, sql_writer):
        if (state_tax_info.is_empty()):
            return

        sql_writer.write_line('INSERT INTO app_employeestatetaxelection(user_id, state, data)')
        sql_writer.write_line('VALUES({0}, \'{1}\', \'{2}\');'.format(user_id, state_tax_info.state, state_tax_info.get_json()))
