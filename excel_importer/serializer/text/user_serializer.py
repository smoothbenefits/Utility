from person_serializer import PersonSerializer

class UserSerializer(object):
    @staticmethod
    def serialize(user, f):
        if not f:
            return
        f.write("---------------------------------------------------------------------\n")
        f.write("user: {}, {}, {}, {}\n".format(user.id, user.first_name, user.last_name, user.email))
        PersonSerializer.serialize(user.person, f)
        if not user.family_members:
            f.write("No family_members\n")
        else:
            f.write("Family Members:\n")
            for member in user.family_members:
                PersonSerializer.serialize(member, f)

        if user.medical_selection:
            if user.medical_selection.benefit_plan:
                f.write("Medical Selection: {}, {}, {}, {}\n".format(user.medical_selection.benefit_plan.id, user.medical_selection.benefit_plan.name, user.medical_selection.benefit_name, user.medical_selection.pcp_number))
            else:
                f.write("Medical Selection No Plan: {}, {}\n".format(user.medical_selection.benefit_name, user.medical_selection.pcp_number))