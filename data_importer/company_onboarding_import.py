import sys, getopt
import logging

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter

from common.data_import_base import DataImportBase
from model.sys_pay_period_definition import PAY_PERIODS


logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")

class CompanyOnboardImport(DataImportBase):
    def __init__(self):
        super(CompanyOnboardImport, self).__init__()

    def get_program_name(self):
        return 'company_onboard_import'

    def usage(self):
        print "data_import.py {} [options] [company_name] [excel_file_path]\n".format(self.get_program_name())
        print "options can be one of the following: \n"
        print "-d (--debug) this will turn on the debug statment output \n"
        print "-h (--help) the option will print this message \n"
        print "-b (--base) the database to serialize the imported data into. Option argument specifies which database name\n"
        print "-t (--text) serialize the parsed data into the text file. Option argument specifies output file name\n"
        print "-p (--payperiod) specify the pay period definition. The choices are: {}\n".format(', '.join(PAY_PERIODS))
        print "The script needs the input excel file path to actually perform the company import action\n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "dhb:t:p:", ["debug", "help", "base=", "text=", "payperiod="])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        database_connection = None
        text_output_path = None
        pay_period = PAY_PERIODS[0]
        for o, a in opts:
            if o == "-d":
                Logger.setLevel(logging.DEBUG)
            elif o in ("-h", "--help"):
                self.usage()
                sys.exit()
            elif o in ("-b", "--base"):
                database_connection = a
            elif o in ("-t", "--text"):
                text_output_path = a
            elif o in ('-p', '--payperiod'):
                pay_period = a
            else:
                assert False, "unhandled option"

        if len(args) <= 1:
            self.usage()
            sys.exit(2)

        company_name = args[0]
        excel_path = args[1]
        Logger.debug("Onboarding company: {}".format(company_name))
        Logger.debug("here is the input excel: {}".format(excel_path))
