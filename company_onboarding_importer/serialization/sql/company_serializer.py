from company_users_serializer import CompanyUsersSerializer
import logging
Logger = logging.getLogger("import_excel")


class CompanySerializer(object):
    @staticmethod
    def serialize(company, file):
        file.write('DO $$\n')
        file.write('DECLARE\n')
        file.write('  company_id int;\n')
        file.write('BEGIN\n')
        file.write('raise notice \'The company_name to start is {}\'\n'.format(company.name))
        if company.pay_period:
            file.write('  INSERT INTO app_company(name, pay_period_definition)\n')
            file.write('  VALUES(\'{}\', \'{}\')\n'.format(company.name, company.pay_period))
            file.write('  RETURNING id into company_id;\n')
        else:
            file.write('  INSERT INTO app_company(name)\n')
            file.write('  VALUES(\'{}\')\n'.format(company.name))
            file.write('  RETURNING id into company_id;\n')
        file.write('  raise notice \'The company_id after insert is %\', company_id;\n')
        CompanyUsersSerializer.serialize(company.company_users, file)
        file.write('END\n')
        file.write('$$;\n')
