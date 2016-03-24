#!/usr/bin/env python
import os
import sys
import psycopg2
import urlparse
from dto.employee_time_off import Employee
from serializer.mongodb.timeoff_quota_serializer import TimeOffQuotaSerializer
from data_repository.employee_profile_company_repository import EmployeeProfileCompanyRepository

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

def upload_steps(outpuf_file):
    print "\n"
    print "Data exported to " + outpuf_file
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
            employeeDto = Employee(employee.person_id, employee.employment_type, environment)
            employeeDto.CalculateEmployeeTimeOffQuota()
            dtos.append(employeeDto.pto_quota)
            dtos.append(employeeDto.sick_quota)

        serializer = TimeOffQuotaSerializer()
        serializer.serialize(output_file, dtos)

        upload_steps(output_file)
    except:
        print '\n'
        usage()
        sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])
