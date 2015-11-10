from person_serializer import PersonSerializer

class UserSerializer(object):
    @staticmethod
    def serialize(user, f):
        if not f:
            return
        f.write("---------------------------------------------------------------------\n")
        f.write("user: {}, {}, {}\n".format(user.first_name, user.last_name, user.email))
        PersonSerializer.serialize(user.person, f)
        if not user.family_members:
            f.write("No family_members\n")
            return
        f.write("Family Members:\n")
        for member in user.family_members:
            PersonSerializer.serialize(member, f)
