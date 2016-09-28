#!/usr/bin/env python
import sys, getopt
import logging

from common.utility.environment_utility import EnvironmentUtility
from data_provider.company_users_data_provider import CompanyUsersDataProvider

class BankedHoursImport(object):

    @staticmethod
    def usage():
        print "data_import.py banked_hours_import [options] [arguments]\n"
        print "options can be one of the following: \n"
        print "-c (--company) [Required] this tells the importer which company is being targeted at"
        print "-d (--debug) [Optional Default=False] this will turn on the debug statment output \n"
        print "-e (--environment) [Optional Default=local] the option to specify target environment to use. Values being one of: local, stage, demo1, demo2, prod \n"
        print "-h (--help) [Optional] the option will print this message \n"
        print "The script needs the expected input Excel file path to perform the import action\n"

    @staticmethod
    def _perform_import(company_id, excel_file_path):
        users_data_provider = CompanyUsersDataProvider(company_id)
        all_users = users_data_provider.get_model()
        for user in all_users:
            print "{} {}".format(user.first_name, user.last_name)

    @staticmethod
    def execute(argv):
        try:
            opts, args = getopt.getopt(argv, "c:de:h", ["company=", "debug", "environment=", "help"])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            BankedHoursImport.usage()
            sys.exit(2)

        input_file_path = None
        company_id = None

        for o, a in opts:
            if o == "-d":
                Logger.setLevel(logging.DEBUG)
            elif o in ("-h", "--help"):
                BankedHoursImport.usage()
                sys.exit()
            elif o in ("-e", "--environment"):
                EnvironmentUtility.set_active_environment(a)
            elif o in ("-c", "--company"):
                company_id = a
            else:
                assert False, "unhandled option"

        if (not company_id):
            BankedHoursImport.usage()
            sys.exit(2)

        if len(args) != 1:
            BankedHoursImport.usage()
            sys.exit(2)

        input_file_path = args[0]

        BankedHoursImport._perform_import(company_id, input_file_path)

