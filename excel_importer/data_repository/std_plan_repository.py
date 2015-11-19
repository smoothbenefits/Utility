from model.benefits.age_based_rate import AgeBasedRate
from model.benefits.std_plan import StdPlan
from repository import Repository
class StdPlanRepository(Repository):
    def __init__(self, cursor, company_id):
        super(StdPlanRepository, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return """select sp.id,
                    sp.name, 
                    csp.elimination_period_in_days,
                    csp.duration,
                    csp.percentage_of_salary,
                    csp.max_benefit_weekly,
                    csp.rate,
                    csp.employer_contribution_percentage,
                    csp.paid_by,
                    csp.user_amount_required,
                    csp.benefit_amount_step,
                    csr.age_min,
                    csr.age_max,
                    csr.rate
                    from app_stdinsuranceplan sp
                    join app_companystdinsuranceplan csp on csp.std_insurance_plan_id = sp.id
                    join app_companystdagebasedrate csr on csr.company_std_insurance_plan_id = csp.id
                    where csp.company_id = {};""".format(self.company_id)

    def _append_rate(self, plan_rates, row):
        plan_rate = AgeBasedRate()
        plan_rate.age_min = row[11]
        plan_rate.age_max = row[12]
        plan_rate.rate = row[13]
        plan_rates.append(plan_rate)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        plan = StdPlan()
        for row in data:
            if not plan.id or not plan.name:
                plan.id = row[0]
                plan.name = row[1]
                plan.elimination_period_in_days = row[2]
                plan.duration_in_weeks = row[3]
                plan.percentage_of_salary = row[4]
                plan.max_benefit_weekly = row[5]
                plan.rate = row[6]
                plan.employer_contribution_percentage = row[7]
                plan.paid_by = row[8]
                plan.user_amount_required = row[9]
                plan.benefit_amount_step = row[10]

            self._append_rate(plan.age_based_rates, row)
        
        return plan
