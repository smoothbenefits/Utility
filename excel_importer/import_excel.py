#!/usr/bin/env python

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter
import sys, getopt
import logging
from model.company_users import CompanyUsers
from users_excel_data_provider import UsersExcelDataProvider
from users_db_data_provider import UsersDBDataProvider
from serializer.sql.company_users_serializer import CompanyUsersSerializer
from company_benefits_provider import CompanyBenefitsProvider
from model.company_benefits import CompanyBenefits

logging.basicConfig(level=logging.INFO, stream = sys.stdout)
Logger = logging.getLogger("import_excel")
company_id = 23

def usage():
    print "import_excel.py [options] [arguments]\n"
    print "options can be one of the following: \n"
    print "-d (--debug) this will turn on the debug statment output \n"
    print "-h (--help) the option will print this message \n"
    print "-e (--exclude) the option will specify where the exclude file is. Argument needed for the path to the exclude file. Default is 'exclude.txt'\n"
    print "-o (--output) the output file path to store the generated file. Option argument required. If this option is not specified, the output file will be stored on the same path of this script\n"
    print "-b (--base) the base model data will be provided by data base. Option argument specifies which database name\n"
    print "The script needs the list of input excel file path to actually perform the import action\n"


def main(argv):
    try:
        opts, args = getopt.getopt(argv, "di:ho:b:e:", ["help", "output=", "exclude=", "base="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print(err) # will print something like "option -a not recognized"
        usage()
        sys.exit(2)
    input_array = None
    output = None
    debug = False
    exclude = 'exclude.txt'
    db_name = 'Benefits_DB'
    db_based = False
    for o, a in opts:
        if o == "-d":
            Logger.setLevel(logging.DEBUG)
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        elif o in ("-e", "--exclude"):
            exclude = a
        elif o in ("-b", "--base"):
            db_based = True
            db_name = a
        else:
            assert False, "unhandled option"

    if len(args) <= 0:
        usage()
        sys.exit(2)
    company_users = CompanyUsers(company_id, 'fairviewhealthcare.com')
    data_provider = None
    if db_based:
        data_provider = UsersDBDataProvider(company_users, db_name)
        data_provider.process()
        company_benefits = CompanyBenefits(company_id)
        benefit_provider = CompanyBenefitsProvider(company_id, company_benefits, db_name)
        benefit_provider.process()
        company_users.benefits = company_benefits
        for plan in company_benefits.medicals.values():
            print "{}, {}, {}, {}, {} \n".format(plan.id, plan.name, plan.type, plan.mandatory_pcp, plan.pcp_link)
            print "  options:\n"
            for option in plan.options:
                print "{}, {}, {}, {}\n".format(option.id, option.total_cost_per_period, option.employee_cost_per_period, option.benefit_option_type)
    else:
        data_provider = UsersExcelDataProvider(company_users)
        for excel_path in args:
            Logger.debug("here is the input excel: {}".format(excel_path))
            data_provider.process(excel_path)

    if not output:
        output = "serialized_users.sql"

    CompanyUsersSerializer.serialize(company_users, output, exclude)


if __name__ == "__main__":
   main(sys.argv[1:])
