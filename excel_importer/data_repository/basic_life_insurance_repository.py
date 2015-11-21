from decimal import *
from model.benefits.basic_life_insurance import BasicLifeInsurance
from repository import Repository
class BasicLifeInsuranceRepository(Repository):
    def __init__(self, cursor, company_id):
        super(BasicLifeInsuranceRepository, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return """select lp.id,
                    lp.name, 
                    csp.total_cost_per_period,
                    csp.employee_cost_per_period,
                    csp.salary_multiplier
                    from app_companylifeinsuranceplan csp
                    join app_lifeinsuranceplan lp on lp.id = csp.life_insurance_plan_id
                    where csp.company_id = {}
                    limit 1;""".format(self.company_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        plan = BasicLifeInsurance()
        row = data[0]
        plan.id = row[0]
        plan.name = row[1]
        plan.total_cost_per_period = Decimal(row[2])
        plan.employee_cost_per_period = Decimal(row[3])
        plan.salary_multiplier = row[4]
        return plan
