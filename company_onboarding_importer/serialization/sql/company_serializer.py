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
        if company.admin_email:
            admin_id_string = 'company_admin_user_id'
            file.write('DECLARE\n')
            file.write('  {} int;\n'.format(admin_id_string))
            file.write('BEGIN\n')
            file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
            file.write('  VALUES(\'pbkdf2_sha256$15000$yQyU6XucXffw$m4mXFteyba8B6vKzw2oKFR9XLn7g+mOBLS111Il2+Ew=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(company.admin_email, company.name, 'admin'))
            file.write('  RETURNING id into {};\n'.format(admin_id_string))
            file.write('  raise notice \'The company admin user_id after insert is %\', {};\n'.format(admin_id_string))
            file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
            file.write('  VALUES(\'admin\', \'f\', company_id, {});\n'.format(admin_id_string))
            file.write('END;')
        CompanyUsersSerializer.serialize(company.company_users, file)
        file.write('END;\n')
        file.write('$$\n')
