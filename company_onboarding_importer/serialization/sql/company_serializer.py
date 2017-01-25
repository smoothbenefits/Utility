from company_users_serializer import CompanyUsersSerializer
from ...model.sys_pay_period_definition import PAY_PERIODS
import logging
Logger = logging.getLogger("import_excel")


class CompanySerializer(object):
    @staticmethod
    def get_company_pay_period_id(pay_period):
        if pay_period:
            return PAY_PERIODS.index(pay_period) + 1 
        else:
            return 2

    @staticmethod
    def serialize(company, file):
        file.write('DO $$\n')
        file.write('DECLARE\n')
        file.write('  company_id int;\n')
        file.write('BEGIN\n')
        file.write('raise notice \'The company_name to start is {}\';\n'.format(company.name))
        file.write('  INSERT INTO app_company(name, pay_period_definition_id)\n')
        file.write('  VALUES(\'{}\', {})\n'.format(
            company.name,
            CompanySerializer.get_company_pay_period_id(company.pay_period)
        ))
        file.write('  RETURNING id into company_id;\n')
        file.write('  raise notice \'The company_id after insert is %\', company_id;\n')
        CompanyUsersSerializer.serialize(company.company_users, file)
        file.write('END;\n')
        file.write('$$\n')
