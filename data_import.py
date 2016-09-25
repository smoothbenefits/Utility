#!/usr/bin/env python
import os
import sys

from data_importer.account_benefit_data_import import AccountBenefitDataImport
from timeoff_quota_importer.banked_hours_import import BankedHoursImport


ACTION_BANKED_HOURS_IMPORT = 'banked_hours_import'
ACTION_ACCOUNT_BENEFIT_DATA_IMPORT = 'account_benefit_data_import'

AVAILABLE_ACTIONS = [
    ACTION_BANKED_HOURS_IMPORT,
    ACTION_ACCOUNT_BENEFIT_DATA_IMPORT
]

def usage():
    print 'print "data_import.py [action] [action arguments]'
    print '[action] must be one of the below:'
    for action in AVAILABLE_ACTIONS:
        print '  * ' + action 

def main(argv):
    if (argv[0] == ACTION_BANKED_HOURS_IMPORT):
        BankedHoursImport.execute(argv[1:])
    elif (argv[0] == ACTION_ACCOUNT_BENEFIT_DATA_IMPORT):
        AccountBenefitDataImport.execute(argv[1:])
    else:
        usage()
        sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])
