#!/usr/bin/env python
import os
import sys
import psycopg2
import urlparse
from dto.employee_time_off import Employee
from serializer.mongodb.timeoff_quota_serializer import TimeOffQuotaSerializer
from data_repository.employee_profile_company_repository import EmployeeProfileCompanyRepository

PTO_TIMEOFF = 'PTO'
FULLTIME_QUOTA = 80
PARTTIME_QUOTA = 20

SICKDAY_TIMEOFF = 'SickTime'
SICKDAY_QUOTA = 20

FULLTIME = 'FullTime'
PARTIME = 'PartTime'
ACCRUAL_FREQUENCY = 'Monthly'

urlparse.uses_netloc.append("postgres")
url = urlparse.urlparse(os.environ["DATABASE_URL"])

conn = psycopg2.connect(
    database=url.path[1:],
    user=url.username,
    password=url.password,
    host=url.hostname,
    port=url.port
)

def usage():
    print "Set DATABASE_URL environment variable for Heroku Postgres connection: "
    print "  $ DATABASE_URL=$(heroku config:get DATABASE_URL -a [APP_NAME])\n"
    print "Run script only after DATABASE_URL has been set:"
    print "  $ python import_timeoff_quota.py [COMPANY_ID] [ENVIRONMENT] [OUTPUT_FILE_NAME]\n"

def upload_steps(output_file):
    print "\n"
    print "Data exported to " + output_file
    print "Run the following command to import data into MongoDb:"
    print "  $ mongoimport -h ds029615.mlab.com:29615 -d [DB_NAME] -c [COLLECTION_NAME] -u [USERNAME] -p [PASSWORD] --file " + output_file

def main(argv):
    try:
        cursor = conn.cursor()
        company_id = argv[0]
        environment = argv[1]
        output_file = argv[2]
        repository = EmployeeProfileCompanyRepository(cursor, company_id)

        data = repository.get_model()
        dtos = []
        for employee in data:
            employeeDto = Employee(employee.person_id, employee.company_id, employee.employment_type, environment)

            # Get PTO quota
            if employee.employment_type == FULLTIME:
                pto_target = FULLTIME_QUOTA
            elif employee.employment_type == PARTIME:
                pto_target = PARTTIME_QUOTA
            pto_quota = employeeDto.CalculateEmployeeTimeOffQuota(pto_target, PTO_TIMEOFF, ACCRUAL_FREQUENCY)
            dtos.append(pto_quota)

            # Get Sick Time quota
            sick_quota = employeeDto.CalculateEmployeeTimeOffQuota(SICKDAY_QUOTA, SICKDAY_TIMEOFF, ACCRUAL_FREQUENCY)
            dtos.append(sick_quota)

        serializer = TimeOffQuotaSerializer()
        serializer.serialize(output_file, dtos)

        upload_steps(output_file)
    except:
        print sys.exc_info()[0]
        usage()
        sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])