from model.benefits.age_based_rate import AgeBasedRate
from model.benefits.ltd_plan import LtdPlan
from repository import Repository
class LtdPlanRepository(Repository):
    def __init__(self, cursor, company_id):
        super(LtdPlanRepository, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return """select clp.id,
                    lp.name, 
                    clp.elimination_period_in_months,
                    clp.duration,
                    clp.percentage_of_salary,
                    clp.max_benefit_monthly,
                    clp.rate,
                    clp.employer_contribution_percentage,
                    clp.paid_by,
                    clp.user_amount_required,
                    clp.benefit_amount_step,
                    clr.age_min,
                    clr.age_max,
                    clr.rate
                    from app_ltdinsuranceplan lp
                    join app_companyltdinsuranceplan clp on clp.ltd_insurance_plan_id = lp.id
                    join app_companyltdagebasedrate clr on clr.company_ltd_insurance_plan_id = clp.id
                    where clp.company_id = {};""".format(self.company_id)

    def _append_rate(self, plan_rates, row):
        plan_rate = AgeBasedRate()
        plan_rate.age_min = row[11]
        plan_rate.age_max = row[12]
        plan_rate.rate = row[13]
        plan_rates.append(plan_rate)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        plan = LtdPlan()
        for row in data:
            if not plan.id or not plan.name:
                plan.id = row[0]
                plan.name = row[1]
                plan.elimination_period_in_months = row[2]
                plan.duration_in_years = row[3]
                plan.percentage_of_salary = row[4]
                plan.max_benefit_monthly = row[5]
                plan.rate = row[6]
                plan.employer_contribution_percentage = row[7]
                plan.paid_by = row[8]
                plan.user_amount_required = row[9]
                plan.benefit_amount_step = row[10]

            self._append_rate(plan.age_based_rates, row)
        
        return plan
