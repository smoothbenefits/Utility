class AddressSqlSerializer(object):

    @staticmethod
    def serialize(model):
        print "address_type: {}, address1: {}, address2: {}, city: {}, state: {}, zip: {}".format(
            model.address_type,
            model.street_1,
            model.street_2,
            model.city,
            model.state,
            model.zipcode)
