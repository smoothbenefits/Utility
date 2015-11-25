from person_serializer import PersonSerializer
from benefits.medical_selection_serializer import MedicalSelectionSerializer
from benefits.dental_selection_serializer import DentalSelectionSerializer
from benefits.basic_life_selection_serializer import BasicLifeSelectionSerializer
from benefits.supplemental_life_selection_serializer import SupplementalLifeSelectionSerializer
from benefits.std_selection_serializer import StdSelectionSerializer
from benefits.ltd_selection_serializer import LtdSelectionSerializer
from benefits.hra_selection_serializer import HraSelectionSerializer
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
        medical_selection_id = 'usercompanybenefitplanoption_id_{}'.format(id)
        dental_selection_id = 'usercompanybenefitplanoption_id_{}_dental'.format(id)
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
        file.write('  {} int;\n'.format(medical_selection_id))
        file.write('  {} int;\n'.format(dental_selection_id))
        file.write('BEGIN\n')
        if user.id:
            file.write('  {} := {};\n'.format(user_id_string, user.id))
        else:
            file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
            file.write('  VALUES(\'pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(user.email.replace('\'', '').lower(), user.first_name.replace('\'', '\'\'').lower().title(), user.last_name.replace('\'', '\'\'').lower().title()))
            file.write('  RETURNING id into user_id_{};\n'.format(id))
            file.write('  raise notice \'The user_id_{} after insert is %\', user_id_{};\n'.format(id, id))
            file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
            file.write('  VALUES(\'employee\', \'f\', company_id, user_id_{})\n'.format(id))
            file.write('  RETURNING id into company_user_id_{};\n'.format(id))
            file.write('  raise notice \'The company_user_id_{} is %\', company_user_id_{};\n'.format(id, id))
        
        MedicalSelectionSerializer.serialize(user.medical_selection, file, user_id_string, medical_selection_id)
        DentalSelectionSerializer.serialize(user.dental_selection, file, user_id_string, dental_selection_id)
        PersonSerializer.serialize(user.person, file, user_id_string, person_id_string, medical_selection_id, dental_selection_id)
        BasicLifeSelectionSerializer.serialize(user.basic_life_selection, file, user_id_string, person_id_string)
        SupplementalLifeSelectionSerializer.serialize(user.supplemental_life_selection, file, person_id_string)
        StdSelectionSerializer.serialize(user.std_selection, file, user_id_string)
        LtdSelectionSerializer.serialize(user.ltd_selection, file, user_id_string)
        HraSelectionSerializer.serialize(user.hra_selection, file, person_id_string)
        for id_string in family_member_dictionary.keys():
            PersonSerializer.serialize(family_member_dictionary[id_string], file, user_id_string, id_string, medical_selection_id, dental_selection_id)
        file.write('END;\n')
        file.write('\n')
