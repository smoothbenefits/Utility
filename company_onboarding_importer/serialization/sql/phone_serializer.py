class PhoneSerializer(object):
    @staticmethod
    def serialize(phone, file, person_id_string):
        if not phone or not phone.number:
            return

        file.write('  INSERT INTO app_phone(phone_type, number, person_id)\n')
        file.write('  VALUES(\'{}\', \'{}\', {});\n'.format(phone.phone_type, phone.number, person_id_string))
        file.write('\n')
