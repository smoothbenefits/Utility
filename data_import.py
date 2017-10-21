#!/usr/bin/env python
import os
import sys

from timeoff_quota_importer.timeoff_banked_hours_import import TimeoffBankedHoursImport
from timeoff_quota_importer.timeoff_quota_spec_import import TimeoffQuotaSpecImport
from company_onboarding_importer.company_onboarding_import import CompanyOnboardImport
from time_attendance_adjuster.time_attendance_adjuster import TimeAttendanceAdjuster

# initialize the list of programs available
AVAILABLE_PROGRAMS = [
    TimeoffBankedHoursImport(),
    TimeoffQuotaSpecImport(),
    CompanyOnboardImport(),
    TimeAttendanceAdjuster()
]

PROGRAM_NAME_MAPPING = {}
for program in AVAILABLE_PROGRAMS:
    PROGRAM_NAME_MAPPING[program.get_program_name()] = program

def usage():
    print 'print "data_import.py [action] [action arguments]'
    print '[action] must be one of the below:'
    for action in PROGRAM_NAME_MAPPING:
        print '  * ' + action 

def main(argv):

    # Now start proxing to programs
    if (len(argv) > 0 and argv[0] in PROGRAM_NAME_MAPPING):
        PROGRAM_NAME_MAPPING[argv[0]].execute(argv[1:])
    else:
        usage()
        sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])
