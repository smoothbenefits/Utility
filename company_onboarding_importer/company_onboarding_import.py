import sys, getopt
import logging

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter

from common.data_import_base import DataImportBase
from model.sys_pay_period_definition import PAY_PERIODS
from model.company_onboarding_users import CompanyOnboardingUsers
from model.company import Company
from data_provider.onboarding_excel_data_provider import OnboardingExcelDataProvider
from serialization.text.company_serializer import CompanySerializer


logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")

CSV = 'csv'
EXCEL = 'excel'
JSON = 'json'

class CompanyOnboardImport(DataImportBase):
    def __init__(self):
        super(CompanyOnboardImport, self).__init__()

    def get_program_name(self):
        return 'company_onboard_import'

    def usage(self):
        print "data_import.py {} [options] [company_name] [file_path]\n".format(self.get_program_name())
        print "options can be one of the following: \n"
        print "-d (--debug) this will turn on the debug statment output \n"
        print "-h (--help) the option will print this message \n"
        print "-b (--base) the database to serialize the imported data into. Option argument specifies which database name\n"
        print "-t (--text) serialize the parsed data into the text file. Option argument specifies output file name\n"
        print "-p (--payperiod) specify the pay period definition. The choices are: {}\n".format(', '.join(PAY_PERIODS))
        print "-f (--format) specify the format of the input file. The choices are: {}, {} and {}. Default is {}\n".format(EXCEL, CSV, JSON, EXCEL)
        print "The script needs the input excel file path to actually perform the company import action\n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "dhb:t:p:f:", ["debug", "help", "base=", "text=", "payperiod=", "format="])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        database_connection = None
        text_output_path = None
        pay_period = None
        input_format = EXCEL
        for o, a in opts:
            if o in ("-d", "--debug"):
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
            elif o in ('-f', '--format'):
                input_format = a
            else:
                assert False, "unhandled option"

        if len(args) <= 1:
            self.usage()
            sys.exit(2)

        company_name = args[0]
        excel_path = args[1]
        Logger.debug("Onboarding company: {}".format(company_name))
        Logger.debug("here is the input excel: {}".format(excel_path))

        # Setup the company model
        onboarding_company = Company()
        onboarding_company.pay_period = pay_period
        onboarding_company.name = company_name
        company_users = CompanyOnboardingUsers(company_name)
        onboarding_company.company_users = company_users

        # Parse data into memory
        data_provider = OnboardingExcelDataProvider()
        data_provider.provide(excel_path, company_users)
        
        # Serialization
        if text_output_path:
            f = open(text_output_path, 'w')
            f.truncate()
            CompanySerializer.serialize(onboarding_company, f)
            f.close()

