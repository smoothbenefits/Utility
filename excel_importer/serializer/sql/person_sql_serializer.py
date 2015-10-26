from address_sql_serializer import AddressSqlSerializer


class PersonSqlSerializer(object):

    @staticmethod
    def serialize(model):
        print "first_name: {}, last_name: {}, ssn: {}, relationship: {}, birth_date: {}, gender: {}, email: {}".format(
            model.first_name,
            model.last_name,
            model.ssn,
            model.relationship,
            model.birth_date,
            model.gender,
            model.email)
        AddressSqlSerializer.serialize(model.address)
