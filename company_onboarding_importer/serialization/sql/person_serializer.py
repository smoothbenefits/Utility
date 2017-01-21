from common.utility.encryption_utility import EncryptionUtility
from address_serializer import AddressSerializer
from phone_serializer import PhoneSerializer
from employee_profile_serializer import EmployeeProfileSerializer
from employee_compensation_serializer import EmployeeCompensationSerializer
from ..serializer import Serializer
from benefits.medical_enrollment_serializer import MedicalEnrollmentSerializer
from benefits.dental_enrollment_serializer import DentalEnrollmentSerializer

class PersonSerializer(object):

    @staticmethod
    def get_relationship(relationship):
        if 'Subscriber' in relationship or not relationship:
            return 'self'
        elif 'Child' in relationship:
            return 'dependent'
        else:
            return relationship.lower()

    @staticmethod
    def get_gender(gender):
        if gender[0:1] == 'M':
            return 'M'
        else:
            return 'F'


    @staticmethod
    def serialize(person, file, user_id_string, person_id_string, medical_selection_id, dental_selection_id):
        if not person:
            return

        if not person.middle_name:
            person.middle_name = ''
        if person.id:
            file.write('  {} := {};\n'.format(person_id_string, person.id))
        else:
            file.write('  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)\n')
            file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', company_id, {}, \'\')\n'.format(person.person_type, person.first_name.lower().title().replace('\'', '\'\''), person.middle_name.lower().title().replace('\'', '\'\''), person.last_name.lower().title().replace('\'', '\'\''), person.email.replace('\'', ''), PersonSerializer.get_relationship(person.relationship), EncryptionUtility.encrypt(person.ssn), Serializer.get_date_string(person.birth_date), PersonSerializer.get_gender(person.gender), user_id_string))
            file.write('  RETURNING id into {};\n\n'.format(person_id_string))
            AddressSerializer.serialize(person.address, file, person_id_string)
            PhoneSerializer.serialize(person.phone, file, person_id_string)
            EmployeeProfileSerializer.serialize(person.employee_profile, file, person_id_string)
            EmployeeCompensationSerializer.serialize(person.employee_compensation, file, person_id_string)

        MedicalEnrollmentSerializer.serialize(person.medical_enrollment, file, person_id_string, medical_selection_id)
        DentalEnrollmentSerializer.serialize(person.dental_enrollment, file, person_id_string, dental_selection_id)

