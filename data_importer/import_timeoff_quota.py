#!/usr/bin/env python
import os
import sys
import psycopg2
import urlparse
from dto.employee_time_off_data_generator import EmployeeTimeOffDataGenerator
from serializer.mongodb.timeoff_quota_serializer import TimeOffQuotaSerializer
from data_repository.employee_profile_company_repository import EmployeeProfileCompanyRepository
#
# Company settings defined below
#
PTO_TIMEOFF = 'Paid Time Off (PTO)'
FULLTIME_QUOTA = 80
PARTTIME_QUOTA = 20

SICKDAY_TIMEOFF = 'Sick Time'
SICKDAY_QUOTA = 20

FULLTIME = 'FullTime'
PARTIME = 'PartTime'
ACCRUAL_FREQUENCY = 'Monthly'
#
# Company settings defined above
#

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
    print "STEP 0:"
    print "  Make sure company settings are set correctly inside import_timeoff_quota.py file\n"
    print "Set DATABASE_URL environment variable for Heroku Postgres connection: "
    print "  $ DATABASE_URL=$(heroku config:get DATABASE_URL -a [APP_NAME])\n"
    print "Run script only after DATABASE_URL has been set:"
    print "  $ python import_timeoff_quota.py [COMPANY_ID] [ENVIRONMENT] [OUTPUT_FILE_NAME]\n"

def upload_steps(output_file):
    print "\n"
    print "Data exported to " + output_file
    print "Run the following command to import data into MongoDb:"
    print "  $ mongoimport -h ds061238.mlab.com:61238 -d [DB_NAME] -c [COLLECTION_NAME] -u [USERNAME] -p [PASSWORD] --file " + output_file

def main(argv):
    # try:
    cursor = conn.cursor()
    company_id = argv[0]
    environment = argv[1]
    output_file = argv[2]

    # Use data repository to retrieve raw data from database
    repository = EmployeeProfileCompanyRepository(cursor, company_id)
    data = repository.get_model()

    # Map database model to DTO objects for time off quota calculation
    dtos = []
    for employee in data:
        employeeDto = EmployeeTimeOffDataGenerator(
                          employee.user_id,
                          employee.company_id,
                          employee.employment_type,
                          environment
                      )

        # Get PTO quota
        pto_target = 0
        timeoff_types = []
        if employee.employment_type == FULLTIME:
            pto_target = FULLTIME_QUOTA
        elif employee.employment_type == PARTIME:
            pto_target = PARTTIME_QUOTA
        timeoff_types.append((pto_target, PTO_TIMEOFF, ACCRUAL_FREQUENCY))
        timeoff_types.append((SICKDAY_QUOTA, SICKDAY_TIMEOFF, ACCRUAL_FREQUENCY))
        # Get Sick Time quota
        sick_quota = employeeDto.CalculateEmployeeTimeOffQuota(timeoff_types)
        dtos.append(sick_quota)

    # Serialize time off quota data into a local text file in JSON format
    serializer = TimeOffQuotaSerializer()
    serializer.serialize(output_file, dtos)

    upload_steps(output_file)
    # except:
    #     print sys.exc_info()[0]
    #     usage()
    #     sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])
