from person_serializer import PersonSerializer
from employee_w4_serializer import EmployeeW4Serializer
from direct_deposit_accounts_serializer import DirectDepositAccountsSerializer

import logging
Logger = logging.getLogger("import_excel")

class UserSerializer(object):
    @staticmethod
    def serialize(user, file, id, service_id_string, company_group_id_string, company):
        if not user:
            Logger.debug("Tried to serialize a non-existing user")
            return
        user_id_string = 'user_id_{}'.format(id)
        person_id_string = 'person_id_{}'.format(id)
        company_group_member_id_string = 'company_group_member_id_{}'.format(id)
        service_user_external_id_string = 'service_user_external_id_{}'.format(id)
        file.write('\n')
        file.write('DECLARE\n')
        file.write('  {} int;\n'.format(user_id_string))
        file.write('  {} int;\n'.format(person_id_string))
        file.write('  {} int;\n'.format(service_user_external_id_string))
        file.write('  {} int;\n'.format(company_group_member_id_string))
        file.write('  company_user_id_{} int; \n'.format(id))
        file.write('BEGIN\n')
        if user.id:
            file.write('  {} := {};\n'.format(user_id_string, user.id))
        else:
            file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
            file.write('  VALUES(\'pbkdf2_sha256$15000$FdFj2db1ynfa$NQk2m/RWgerM0ZhrKAhZ9ae0WrgUb220LalJUV4Eqzk=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(user.email.replace('\'', '').lower(), user.first_name.replace('\'', '\'\''), user.last_name.replace('\'', '\'\'')))
            file.write('  RETURNING id into user_id_{};\n'.format(id))
            file.write('  raise notice \'The user_id_{} after insert is %\', user_id_{};\n'.format(id, id))
            file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
            file.write('  VALUES(\'employee\', \'f\', the_company_id, user_id_{})\n'.format(id))
            file.write('  RETURNING id into company_user_id_{};\n'.format(id))
            file.write('  raise notice \'The company_user_id_{} is %\', company_user_id_{};\n'.format(id, id))
            if company and company.service_name and user.service_user_external_id:
                file.write('  INSERT INTO app_companyuserintegrationprovider(company_user_external_id, created_at, updated_at, company_user_id, integration_provider_id)\n')
                file.write('  VALUES(\'{}\', now(), now(), company_user_id_{}, {})\n'.format(user.service_user_external_id, id, service_id_string))
                file.write('  RETURNING id into {};\n'.format(service_user_external_id_string))
                file.write('  raise notice \'The {} is %\', {};\n'.format(service_user_external_id_string, service_user_external_id_string))
            file.write('  SELECT cgm.id INTO {} from app_companygroupmember cgm where cgm.company_group_id={} and user_id={};\n'.format(company_group_member_id_string, company_group_id_string, user_id_string))
            file.write('  IF {} IS null THEN \n'.format(company_group_member_id_string))
            file.write('    INSERT INTO app_companygroupmember(created, company_group_id, user_id)\n')
            file.write('    VALUES(now(), {}, {})\n'.format(company_group_id_string, user_id_string))
            file.write('    RETURNING id into {};\n'.format(company_group_member_id_string))
            file.write('  END IF;')
            PersonSerializer.serialize(user.person, file, user_id_string, person_id_string, id)
        EmployeeW4Serializer.serialize(user.w4, file, user_id_string)
        DirectDepositAccountsSerializer.serialize(user.direct_deposits, file, user_id_string, id)
        file.write('END;\n')
        file.write('\n')
