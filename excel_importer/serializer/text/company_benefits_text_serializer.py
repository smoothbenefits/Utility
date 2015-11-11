class CompanyBenefitsTextSerializer(object):
    @staticmethod
    def serialize_health_plans(plans, f):
        if not plans:
            f.write("No medical plans\n")
        else:
            f.write("---------------------------------------------------------------------\n")
            for plan in plans:
                f.write("{}, {}, {}, {}, {} \n".format(plan.id, plan.name, plan.type, plan.mandatory_pcp, plan.pcp_link))
                f.write("  options:\n")
                for option in plan.options:
                    f.write("{}, {}, {}, {}\n".format(option.id, option.total_cost_per_period, option.employee_cost_per_period, option.benefit_option_type))
                f.write("\n")

    @staticmethod
    def serialize(benefits, f):
        f.write("COMPANY BENEFITS:\n\n")
        if benefits.medicals:
            f.write("Medical:\n")
            CompanyBenefitsTextSerializer.serialize_health_plans(benefits.medicals.values(), f)

        if benefits.dentals:
            f.write("Dentals:\n")
            CompanyBenefitsTextSerializer.serialize_health_plans(benefits.dentals.values(), f)

        if benefits.visions:
            f.write("Visions:\n")
            CompanyBenefitsTextSerializer.serialize_health_plans(benefits.visions.values(), f)
            

