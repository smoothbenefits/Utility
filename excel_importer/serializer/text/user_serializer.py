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

        if user.dental_selection:
            f.write("Dental Selection: {}, {}, {}, {}, {}\n".format(user.dental_selection.company_plan.name, user.dental_selection.selection_name, user.dental_selection.benefit_amount, user.dental_selection.guarantee_issue, user.dental_selection.original_effective_date))

        if user.basic_life_selection:
            f.write("Basic Life Selection: {}, {}, {}, {}, {}\n".format(user.basic_life_selection.company_plan.name, user.basic_life_selection.selection_name, user.basic_life_selection.benefit_amount, user.basic_life_selection.guarantee_issue, user.basic_life_selection.original_effective_date))

        if user.supplemental_life_selection:
            f.write("Supplemental Life Selection: {}, {}, {}, {}, {}\n".format(user.supplemental_life_selection.company_plan.name, user.supplemental_life_selection.selection_name, user.supplemental_life_selection.benefit_amount, user.supplemental_life_selection.guarantee_issue, user.supplemental_life_selection.original_effective_date))

        if user.ltd_selection:
            f.write("Ltd Selection: {}, {}, {}, {}, {}\n".format(user.ltd_selection.company_plan.name, user.ltd_selection.selection_name, user.ltd_selection.benefit_amount, user.ltd_selection.guarantee_issue, user.ltd_selection.original_effective_date))

        if user.std_selection:
            f.write("Std Selection: {}, {}, {}, {}, {}\n".format(user.std_selection.company_plan.name, user.std_selection.selection_name, user.std_selection.benefit_amount, user.std_selection.guarantee_issue, user.std_selection.original_effective_date))
