#!/usr/bin/env python
import sys, getopt
import logging

from common.utility.environment_utility import EnvironmentUtility


class BankedHoursImport(object):

    @staticmethod
    def usage():
        print "data_import.py banked_hours_import [options] [arguments]\n"
        print "options can be one of the following: \n"
        print "-d (--debug) this will turn on the debug statment output \n"
        print "-e (--environment) the option to specify target environment to use. Values being one of: local, stage, demo1, demo2, prod \n"
        print "-h (--help) the option will print this message \n"
        print "The script needs the expected input Excel file path to perform the import action\n"

    @staticmethod
    def execute(argv):
        try:
            opts, args = getopt.getopt(argv, "de:h", ["help", "environment=", "debug"])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            BankedHoursImport.usage()
            sys.exit(2)

        input_file_path = None

        for o, a in opts:
            if o == "-d":
                Logger.setLevel(logging.DEBUG)
            elif o in ("-h", "--help"):
                BankedHoursImport.usage()
                sys.exit()
            elif o in ("-e", "--environment"):
                EnvironmentUtility.set_active_environment(a)
            else:
                assert False, "unhandled option"

        if len(args) != 1:
            BankedHoursImport.usage()
            sys.exit(2)

        input_file_path = args[0]
