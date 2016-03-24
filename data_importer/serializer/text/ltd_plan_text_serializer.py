class LtdPlanTextSerializer(object):
    @staticmethod
    def serialize_rates(plan_rates, f):
        for plan_rate in plan_rates:
            f.write('        age_min: {}, age_max: {}, rate: {}\n'.format(plan_rate.age_min, plan_rate.age_max, plan_rate.rate))

    @staticmethod
    def serialize(ltd_plan, f):
        f.write('id: {}, name: \'{}\' elimination_period_in_months: {}, duration_in_years: {}, percentage_of_salary: {}, max_benefit_monthly: {}, employer_contribution_percentage: {}, paid_by: {}, user_amount_required: {}, benefit_amount_step: {}\n'.format(ltd_plan.id, ltd_plan.name, ltd_plan.elimination_period_in_months, ltd_plan.duration_in_years, ltd_plan.percentage_of_salary, ltd_plan.max_benefit_monthly, ltd_plan.employer_contribution_percentage, ltd_plan.paid_by, ltd_plan.user_amount_required, ltd_plan.benefit_amount_step))
        if ltd_plan.age_based_rates:
            f.write('  Age based rates:\n')
            LtdPlanTextSerializer.serialize_rates(ltd_plan.age_based_rates, f)
        else:
            f.write('  Rate: {}\n'.format(ltd_plan.rate))
