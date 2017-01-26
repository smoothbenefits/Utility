from person_serializer import PersonSerializer
from employee_w4_serializer import EmployeeW4Serializer
from direct_deposit_accounts_serializer import DirectDepositAccountsSerializer

import logging
Logger = logging.getLogger("import_excel")

class UserSerializer(object):
    @staticmethod
    def serialize(user, file, id):
        if not user:
            Logger.debug("Tried to serialize a non-existing user")
            return
        user_id_string = 'user_id_{}'.format(id)
        person_id_string = 'person_id_{}'.format(id)
        file.write('\n')
        file.write('DECLARE\n')
        file.write('  {} int;\n'.format(user_id_string))
        file.write('  {} int;\n'.format(person_id_string))
        file.write('  company_user_id_{} int; \n'.format(id))
        file.write('BEGIN\n')
        if user.id:
            file.write('  {} := {};\n'.format(user_id_string, user.id))
        else:
            file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
            file.write('  VALUES(\'pbkdf2_sha256$15000$yQyU6XucXffw$m4mXFteyba8B6vKzw2oKFR9XLn7g+mOBLS111Il2+Ew=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(user.email.replace('\'', '').lower(), user.first_name.replace('\'', '\'\'').lower().title(), user.last_name.replace('\'', '\'\'').lower().title()))
            file.write('  RETURNING id into user_id_{};\n'.format(id))
            file.write('  raise notice \'The user_id_{} after insert is %\', user_id_{};\n'.format(id, id))
            file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
            file.write('  VALUES(\'employee\', \'f\', company_id, user_id_{})\n'.format(id))
            file.write('  RETURNING id into company_user_id_{};\n'.format(id))
            file.write('  raise notice \'The company_user_id_{} is %\', company_user_id_{};\n'.format(id, id))
            PersonSerializer.serialize(user.person, file, user_id_string, person_id_string, id)
        EmployeeW4Serializer.serialize(user.w4, file, user_id_string)
        DirectDepositAccountsSerializer.serialize(user.direct_deposits, file, user_id_string, id)
        file.write('END;\n')
        file.write('\n')
