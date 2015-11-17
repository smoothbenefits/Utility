#!/usr/bin/env python

from openpyxl import load_workbook
from openpyxl.compat import range
from openpyxl.cell import get_column_letter
import sys, getopt
import logging
from model.fairview_users import FairviewUsers
from users_excel_data_provider import UsersExcelDataProvider
from users_db_data_provider import UsersDBDataProvider
from serializer.sql.company_users_serializer import CompanyUsersSerializer
from company_benefits_provider import CompanyBenefitsProvider
from model.company_benefits import CompanyBenefits
from serializer.text.company_users_text_serializer import CompanyUsersTextSerializer

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
    print "-t (--text) serialize the parsed data into the text file named \"model_data.txt\"\n"
    print "The script needs the list of input excel file path to actually perform the import action\n"


def main(argv):
    try:
        opts, args = getopt.getopt(argv, "di:ho:b:e:t", ["help", "output=", "exclude=", "base=", "text"])
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
    serialize_text = "model_data.txt"
    text_serialize = False
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
        elif o in ("-t", "--text"):
            text_serialize = True
        else:
            assert False, "unhandled option"

    if len(args) <= 0:
        usage()
        sys.exit(2)
    company_users = FairviewUsers(company_id, 'fairviewhealthcare.com')
    data_provider = None
    if db_based and db_name:
        data_provider = UsersDBDataProvider(db_name)
        data_provider.provide(company_users)
        company_benefits = CompanyBenefits(company_id)
        benefit_provider = CompanyBenefitsProvider(company_id, db_name)
        benefit_provider.provide(company_benefits)
        company_users.benefits = company_benefits

    data_provider = UsersExcelDataProvider()
    for excel_path in args:
        Logger.debug("here is the input excel: {}".format(excel_path))
        data_provider.provide(excel_path, company_users)

    company_users.post_parse_processing()

    if not output:
        output = "serialized_users.sql"

    CompanyUsersSerializer.serialize(company_users, output, exclude)

    if text_serialize:
        CompanyUsersTextSerializer.serialize(company_users, serialize_text, exclude)


if __name__ == "__main__":
   main(sys.argv[1:])
