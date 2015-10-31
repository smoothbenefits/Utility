class PhoneSerializer(object):
    @staticmethod
    def serialize(phone, file, id):
        if not phone or not phone.number:
            return

        phone_number = phone.number.replace('-', '')

        file.write('  INSERT INTO app_phone(phone_type, number, person_id)\n')
        file.write('  VALUES(\'{}\', \'{}\', person_id_{});\n'.format(phone.phone_type, phone_number, id))
        file.write('\n')
