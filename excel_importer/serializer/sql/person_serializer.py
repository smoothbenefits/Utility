from address_serializer import AddressSerializer
from phone_serializer import PhoneSerializer
from employee_profile_serializer import EmployeeProfileSerializer
from employee_compensation_serializer import EmployeeCompensationSerializer
from keyczar import keyczar
import datetime

class PersonSerializer(object):
    _crypter = keyczar.Crypter.Read('fieldkeys')

    @staticmethod
    def get_encrypted_ssn(ssn):
        if ssn:
            encrypted_ssn = PersonSerializer._crypter.Encrypt(ssn)
            return encrypted_ssn
        else:
            return ''

    @staticmethod
    def get_relationship(relationship):
        if 'Subscriber' in relationship or not relationship:
            return 'self'
        elif 'Child' in relationship:
            return 'dependent'
        else:
            return relationship.lower()

    @staticmethod
    def get_date_string(date):
        if isinstance(date, unicode):
            converted_date = datetime.datetime.strptime(date, '%m/%d/%Y')
        else:
            converted_date = date

        return converted_date.strftime('%Y-%m-%d')

    @staticmethod
    def get_gender(gender):
        if gender[0:1] == 'M':
            return 'M'
        else:
            return 'F'


    @staticmethod
    def serialize(person, file, id):
        if not person:
            return

        file.write('  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)\n')
        file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', company_id, user_id_{}, \'\')\n'.format(person.person_type, person.first_name.lower().title().replace('\'', '\'\''), person.middle_name.lower().title().replace('\'', '\'\''), person.last_name.lower().title().replace('\'', '\'\''), person.email.replace('\'', ''), PersonSerializer.get_relationship(person.relationship), PersonSerializer.get_encrypted_ssn(person.ssn), PersonSerializer.get_date_string(person.birth_date), PersonSerializer.get_gender(person.gender), id))
        file.write('  RETURNING id into person_id_{};\n\n'.format(id))

        AddressSerializer.serialize(person.address, file, id)
        PhoneSerializer.serialize(person.phone, file, id)
        EmployeeProfileSerializer.serialize(person.employee_profile, file, id)
        EmployeeCompensationSerializer.serialize(person.employee_compensation, file, id)

