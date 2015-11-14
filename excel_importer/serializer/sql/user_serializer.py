from person_serializer import PersonSerializer
from benefits.medical_selection_serializer import MedicalSelectionSerializer
import logging
Logger = logging.getLogger("import_excel")

class UserSerializer(object):
    @staticmethod
    def serialize(user, file, id):
        if user.id:
            Logger.debug("user {} already have id of {}".format(user.email, user.id))
            return
        user_id_string = 'user_id_{}'.format(id)
        person_id_string = 'person_id_{}'.format(id)
        health_selection_id = 'usercompanybenefitplanoption_id_{}'.format(id)
        family_member_dictionary = {}
        for i in range(0, len(user.family_members)):
            member = user.family_members[i]
            family_member_id_string = 'family_member_id_{}_{}'.format(id, i)
            family_member_dictionary[family_member_id_string] = member
        file.write('\n')
        file.write('DECLARE\n')
        file.write('  {} int;\n'.format(user_id_string))
        file.write('  {} int;\n'.format(person_id_string))
        for id_string in family_member_dictionary.keys():
            file.write('  {} int;\n'.format(id_string))
        file.write('  company_user_id_{} int; \n'.format(id))
        file.write('BEGIN\n')
        file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
        file.write('  VALUES(\'pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(user.email.replace('\'', '').lower(), user.first_name.replace('\'', '\'\'').lower().title(), user.last_name.replace('\'', '\'\'').lower().title()))
        file.write('  RETURNING id into user_id_{};\n'.format(id))
        file.write('  raise notice \'The user_id_{} after insert is %\', user_id_{};\n'.format(id, id))
        file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
        file.write('  VALUES(\'employee\', \'f\', company_id, user_id_{})\n'.format(id))
        file.write('  RETURNING id into company_user_id_{};\n'.format(id))
        file.write('  raise notice \'The company_user_id_{} is %\', company_user_id_{};\n'.format(id, id))
        MedicalSelectionSerializer.serialize(user.medical_selection, file, user_id_string, health_selection_id)
        PersonSerializer.serialize(user.person, file, user_id_string, person_id_string, health_selection_id)
        for id_string in family_member_dictionary.keys():
            PersonSerializer.serialize(family_member_dictionary[id_string], file, user_id_string, id_string, health_selection_id)
        file.write('END;\n')
        file.write('\n')
