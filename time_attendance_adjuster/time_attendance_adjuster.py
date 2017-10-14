#!/usr/bin/env python
import sys, getopt
import logging
import json

from common.data_import_base import DataImportBase
from common.utility.environment_utility import EnvironmentUtility

from .data_provider.company_users_data_provider import CompanyUsersDataProvider


class TimeAttendanceAdjuster(DataImportBase):
    def __init__(self):
        super(TimeAttendanceAdjuster, self).__init__()

    def get_program_name(self):
        return 'time_attendance_adjuster'

    def usage(self):
        print "data_import.py {} [options] [arguments]\n".format(self.get_program_name())
        print "options can be one of the following: \n"
        print "-c (--company) [Required] this tells the importer which company is being targeted at"
        print "-d (--debug) [Optional Default=False] this will turn on the debug statment output \n"
        print "-e (--environment) [Optional Default=local] the option to specify target environment to use. Values being one of: local, stage, demo1, demo2, prod \n"
        print "-h (--help) [Optional] the option will print this message \n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "c:de:h", ["company=", "debug", "environment=", "help"])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        company_id = None

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
            else:
                assert False, "unhandled option"

        if (not company_id):
            self.usage()
            sys.exit(2)

        self.__perform_import(company_id)

    def __perform_import(self, company_id):

        # Print output
        print '####### Output Starts #######'
        print ''

        company_users_data_provider = CompanyUsersDataProvider(company_id)
        all_users = company_users_data_provider.get_model()
        for user in all_users:
            print '{0} {1} {2} {3}'.format(user.user_id, user.first_name, user.last_name, user.employee_number)

        print ''
        print '####### Output Ends #######'
        print ''
