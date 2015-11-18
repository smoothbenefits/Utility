class LifeInsuranceTextSerializer(object):
    @staticmethod
    def serialize_rates(plan_rates, f):
        for condition in plan_rates.keys():
            f.write('      {}\n'.format(condition))
            condition_rates = plan_rates[condition]
            for rate in condition_rates:
                f.write('        age_min: {}, age_max: {}, rate: {}, benefit_reduction_percentage:{}\n'.format(rate.age_min, rate.age_max, rate.rate, rate.benefit_reduction_percentage))

    @staticmethod
    def serialize(life_insurance, f):
        f.write('id: {}, name: \'{}\',  use_employee_age_for_spouse: {}\n'.format(life_insurance.id, life_insurance.name, life_insurance.use_employee_age_for_spouse))
        f.write('  Insurance rates:\n')
        f.write('    employee:\n')
        LifeInsuranceTextSerializer.serialize_rates(life_insurance.employee_rates, f)
        f.write('    spouse:\n')
        LifeInsuranceTextSerializer.serialize_rates(life_insurance.spouse_rates, f)
        f.write('    child:\n')
        LifeInsuranceTextSerializer.serialize_rates(life_insurance.child_rates, f)
