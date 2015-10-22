#!/usr/bin/env python

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter
import sys, getopt
import logging
from user_factory import UserFactory

logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")

def usage():
    print "import_excel.py [options] [arguments]\n"
    print "options can be one of the following: \n"
    print "-d (--debug) this will turn on the debug statment output \n"
    print "-h (--help) the option will print this message \n"
    print "-o (--output) the output file path to store the generated file. Option argument required. If this option is not specified, the output file will be stored on the same path of this script\n"
    print "The script needs the list of input excel file path to actually perform the import action"

def find_header_row(work_sheet):
    for row in work_sheet.rows:
        for cell in row:
            if cell.value =='First Name' or cell.value == 'Last Name':
                return cell.row
    return None

def read_from_excel(file_list):
    excel_path = file_list[0]
    wb = load_workbook(excel_path, read_only=True, data_only=True, keep_vba=True)
    for ws in wb:
        header_row = find_header_row(ws)
        if header_row:
            user_factory = UserFactory('fairviewhealthcare.com')
            users = user_factory.get_users(ws, header_row)
            for user in users:
                print "{}, {}, {}".format(user.first_name, user.last_name, user.email)


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
    input_array = args
    if len(input_array) <=0:
        usage()
        sys.exit(2)
    Logger.debug("here are the input files: {}".format(input_array))
    read_from_excel(input_array)

if __name__ == "__main__":
   main(sys.argv[1:])
