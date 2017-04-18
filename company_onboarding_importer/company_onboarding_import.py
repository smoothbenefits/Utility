import sys, getopt
import logging

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter

from common.data_import_base import DataImportBase
from model.sys_pay_period_definition import PAY_PERIODS
from model.company_onboarding_users import CompanyOnboardingUsers
from model.ap_company_onboarding_users import APCompanyOnboardingUsers
from model.basic_company_onboarding_users import BasicCompanyOnboardingUsers
from model.company import Company
from data_provider.onboarding_excel_data_provider import OnboardingExcelDataProvider
from data_provider.onboarding_ap_excel_data_provider import OnboardingAPExcelDataProvider
from data_provider.onboarding_csv_data_provider import OnboardingCSVDataProvider
from data_provider.onboarding_basic_excel_data_provider import OnboardingBasicExcelDataProvider
from serialization.text.company_serializer import CompanySerializer as CompanyTextSerializer
from serialization.sql.company_serializer import CompanySerializer as CompanySqlSerializer


logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")

CSV = 'csv'
EXCEL = 'excel'
AP_EXCEL = 'ap_excel'
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
        print "-o (--output) the sql file path to serialize the imported data into.\n"
        print "-t (--text) serialize the parsed data into the text file. Option argument specifies output file name\n"
        print "-p (--payperiod) specify the pay period definition. The choices are: {}\n".format(', '.join(PAY_PERIODS))
        print "-a (--admin) specify the admin email address. With this option specified, the company would have a valid admin user"
        print "-f (--format) specify the format of the input file. The choices are: {}, {}, {} and {}. Default is {}\n".format(EXCEL, AP_EXCEL, CSV, JSON, EXCEL)
        print "-s (--servicetype) specify the type of the service integrated with the company in our system. Only \"Payroll\" for now\n"
        print "-n (--providername) specify the name of the service provider integrated in our system. Only \"Advantage Payroll\" for now\n"
        print "-c (--compserviceid) specify the id the company is registered as in the service integrated\n"
        print "-l (--trial) tells the system whether this is a trial or not. If this flag is not present, it is real\n"
        print "-e (--emailfile) tells the system the path of the email excel file \n"
        print "The script needs the input excel file path to actually perform the company import action\n"

    def execute(self, argv):
        try:
            opts, args = getopt.getopt(argv, "dhlo:t:p:a:f:s:n:c:e:", ["debug", "help", "trial", "output=", "text=", "payperiod=", "admin=", "format=", "servicetype=", "providername=", "compserviceid=", "emailfile="])
        except getopt.GetoptError as err:
            # print help information and exit:
            print(err) # will print something like "option -a not recognized"
            self.usage()
            sys.exit(2)

        sql_file = None
        text_output_path = None
        pay_period = None
        input_format = EXCEL
        admin_email = None
        service_type = None
        service_name = None
        company_service_id = None
        email_file_path = None
        is_trial = False
        for o, a in opts:
            if o in ("-d", "--debug"):
                Logger.setLevel(logging.DEBUG)
            elif o in ("-h", "--help"):
                self.usage()
                sys.exit()
            elif o in ("-o", "--output"):
                sql_file = a
            elif o in ("-t", "--text"):
                text_output_path = a
            elif o in ('-p', '--payperiod'):
                pay_period = a
            elif o in ('-a', '--admin'):
                admin_email = a
            elif o in ('-f', '--format'):
                input_format = a
            elif o in ('-s', '--servicetype'):
                service_type = a
            elif o in ('-n', '--providername'):
                service_name = a
            elif o in ('-c', '--compserviceid'):
                company_service_id = a
            elif o in ('-l', '--trial'):
                is_trial = True
            elif o in ('-e', '--emailfile'):
                email_file_path = a
            else:
                assert False, "unhandled option"

        if len(args) <= 1:
            self.usage()
            sys.exit(2)

        company_name = args[0]
        file_path = args[1]
        Logger.debug("Onboarding company: {}".format(company_name))
        Logger.debug("here is the input excel: {}".format(file_path))

        company_users = CompanyOnboardingUsers(company_name, is_trial)
        # Parse data into memory
        data_provider = None
        if input_format == CSV:
            data_provider = OnboardingCSVDataProvider()
        elif input_format == EXCEL:
            data_provider = OnboardingExcelDataProvider()
        elif input_format == AP_EXCEL:
            data_provider = OnboardingAPExcelDataProvider()
            company_users = APCompanyOnboardingUsers(company_name, is_trial)
        else:
            print "ERROR: Please specify the input format accepted by the program:  {}, {} and {}".format(EXCEL, CSV, JSON)
            sys.exit(2)

        # Setup the company model
        onboarding_company = Company()
        onboarding_company.pay_period = pay_period
        onboarding_company.name = company_name
        onboarding_company.admin_email = admin_email
        onboarding_company.company_users = company_users
        onboarding_company.service_type = service_type
        onboarding_company.service_name = service_name
        onboarding_company.company_external_id = company_service_id
        data_provider.provide(file_path, company_users)

        if email_file_path:
            email_data_provider = OnboardingBasicExcelDataProvider()
            basic_users = BasicCompanyOnboardingUsers(company_name)
            email_data_provider.provide(email_file_path, 'Employees', basic_users)
            company_users.merge_with_basic_data(basic_users)

        # Serialization
        if text_output_path:
            f = open(text_output_path, 'w')
            f.truncate()
            CompanyTextSerializer.serialize(onboarding_company, f)
            f.close()

        if sql_file:
            f = open(sql_file, 'w')
            f.truncate()
            CompanySqlSerializer.serialize(onboarding_company, f)
            f.close()


