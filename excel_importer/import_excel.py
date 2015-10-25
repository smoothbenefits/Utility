#!/usr/bin/env python

import sys, getopt
import logging

from data_provider.user_data_provider import UserDataProvider

logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")


def usage():
    print "import_excel.py [options] [arguments]\n"
    print "options can be one of the following: \n"
    print "-d (--debug) this will turn on the debug statment output \n"
    print "-h (--help) the option will print this message \n"
    print "-o (--output) the output file path to store the generated file. Option argument required. If this option is not specified, the output file will be stored on the same path of this script\n"
    print "The script needs the list of input excel file path to actually perform the import action"


def main(argv):
    try:
        opts, args = getopt.getopt(argv, "di:ho:", ["help", "output="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    input_array = None
    output = None
    debug = False
    for o, a in opts:
        if o == "-d":
            Logger.setLevel(logging.DEBUG)
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        else:
            assert False, "unhandled option"
    if len(args) <= 0:
        usage()
        sys.exit(2)
    input_excel = args[0]
    Logger.debug("here is the input excel: {}".format(input_excel))

    user_data_provider = UserDataProvider(input_excel)
    user_data_provider.process()

if __name__ == "__main__":
   main(sys.argv[1:])
