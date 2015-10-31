#!/usr/bin/env python

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter
import sys, getopt
import logging
from model.company_users import CompanyUsers
from users_data_provider import UsersDataProvider
from serializer.sql.company_users_serializer import CompanyUsersSerializer

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
    company_users = CompanyUsers(23, 'fairviewhealthcare.com')
    data_provider = UsersDataProvider(company_users)
    for excel_path in args:
        Logger.debug("here is the input excel: {}".format(excel_path))
        data_provider.process(excel_path)

    if not output:
        output = "serialized_users.sql"

    CompanyUsersSerializer.serialize(company_users, output)


if __name__ == "__main__":
   main(sys.argv[1:])
