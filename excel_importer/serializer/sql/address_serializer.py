class AddressSerializer(object):
    @staticmethod
    def get_zip_code(raw_zip):
        if isinstance(raw_zip, float):
            return '0{}'.format(raw_zip)
        else:
            return raw_zip

    @staticmethod
    def serialize(address, file, id):
        if not address or not address.street_1 or not address.city:
            return
        file.write('  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)\n')
        file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', \'{}\', \'{}\', company_id, person_id_{});\n'.format(address.address_type, address.street_1, address.street_2, address.city, address.state, AddressSerializer.get_zip_code(address.zipcode), id))
        file.write('\n')
