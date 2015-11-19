class StdPlanTextSerializer(object):
    @staticmethod
    def serialize_rates(plan_rates, f):
        for plan_rate in plan_rates:
            f.write('        age_min: {}, age_max: {}, rate: {}\n'.format(plan_rate.age_min, plan_rate.age_max, plan_rate.rate))

    @staticmethod
    def serialize(std_plan, f):
        f.write('id: {}, name: \'{}\' elimination_period_in_days: {}, duration_in_weeks: {}, percentage_of_salary: {}, max_benefit_weekly: {}, employer_contribution_percentage: {}, paid_by: {}, user_amount_required: {}, benefit_amount_step: {}\n'.format(std_plan.id, std_plan.name, std_plan.elimination_period_in_days, std_plan.duration_in_weeks, std_plan.percentage_of_salary, std_plan.max_benefit_weekly, std_plan.employer_contribution_percentage, std_plan.paid_by, std_plan.user_amount_required, std_plan.benefit_amount_step))
        if std_plan.age_based_rates:
            f.write('  Age based rates:\n')
            StdPlanTextSerializer.serialize_rates(std_plan.age_based_rates, f)
        else:
            f.write('  Rate: {}\n'.format(std_plan.rate))
