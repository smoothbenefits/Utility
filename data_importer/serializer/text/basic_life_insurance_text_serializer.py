class BasicLifeInsuranceTextSerializer(object):
    @staticmethod
    def serialize(life_insurance, f):
        f.write('id: {}, name: \'{}\',  total_cost_per_period: {}, employee_cost_per_period: {}, salary_multiplier:{}\n\n'.format(life_insurance.id, life_insurance.name, life_insurance.total_cost_per_period, life_insurance.employee_cost_per_period, life_insurance.salary_multiplier))
