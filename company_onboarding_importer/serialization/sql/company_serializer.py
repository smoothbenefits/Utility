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
        service_id_string = 'integration_provider_id'
        company_group_id_string = 'the_company_group_id'
        file.write('DO $$\n')
        file.write('DECLARE\n')
        file.write('  the_company_id int;\n')
        file.write('  {} int;\n'.format(service_id_string))
        file.write('  {} int;\n'.format(company_group_id_string))
        file.write('BEGIN\n')
        file.write('  raise notice \'The company_name to start is {}\';\n'.format(company.name))
        file.write('  INSERT INTO app_company(name, pay_period_definition_id)\n')
        file.write('  VALUES(\'{}\', {})\n'.format(
            company.name,
            CompanySerializer.get_company_pay_period_id(company.pay_period)
        ))
        file.write('  RETURNING id into the_company_id;\n')
        file.write('  raise notice \'The company_id after insert is %\', the_company_id;\n')
        file.write('  SELECT cg.id into {} from app_companygroup cg where cg.company_id=the_company_id;\n'.format(company_group_id_string))
        file.write('  IF {} IS null THEN\n'.format(company_group_id_string))
        file.write('    INSERT INTO app_companygroup(name, created, updated, company_id)\n')
        file.write('    VALUES(\'Default\', now(), now(), the_company_id)\n')
        file.write('    RETURNING id into {};\n'.format(company_group_id_string))
        file.write('    raise notice \'The default company group is created with id %\', {};\n'.format(company_group_id_string))
        file.write('  END IF;\n')
        if company.admin_email:
            admin_id_string = 'company_admin_user_id'
            file.write('DECLARE\n')
            file.write('  {} int;\n'.format(admin_id_string))
            file.write('BEGIN\n')
            file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
            file.write('  VALUES(\'pbkdf2_sha256$15000$FdFj2db1ynfa$NQk2m/RWgerM0ZhrKAhZ9ae0WrgUb220LalJUV4Eqzk=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(company.admin_email, company.name, 'admin'))
            file.write('  RETURNING id into {};\n'.format(admin_id_string))
            file.write('  raise notice \'The company admin user_id after insert is %\', {};\n'.format(admin_id_string))
            file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
            file.write('  VALUES(\'admin\', \'f\', the_company_id, {});\n'.format(admin_id_string))
            file.write('END;\n')
        if company.service_type and company.service_name:
            file.write('BEGIN\n')
            file.write('  SELECT id into {} FROM app_integrationprovider where name=\'{}\' and service_type=\'{}\';\n'.format(service_id_string, company.service_name, company.service_type))
            file.write('  IF {} IS null THEN\n'.format(service_id_string))
            file.write('    INSERT INTO app_integrationprovider(name, service_type, created_at, updated_at)\n')
            file.write('    values(\'{}\', \'{}\', now(), now())\n'.format(company.service_name, company.service_type))
            file.write('    RETURNING id into {};\n'.format(service_id_string))
            file.write('  END IF;\n')
            file.write('  raise notice \'The integration provider id for {} is %\', {};\n'.format(company.service_name, service_id_string))
            file.write('  INSERT INTO app_companyintegrationprovider(company_external_id, company_id, integration_provider_id, created_at, updated_at)\n')
            file.write('  VALUES(\'{}\', the_company_id, {}, now(), now());\n'.format(company.company_external_id, service_id_string))
            file.write(' ')
            file.write('END;\n')
        CompanyUsersSerializer.serialize(company.company_users, file, None, service_id_string, company_group_id_string, company)
        file.write('END;\n')
        file.write('$$\n')
