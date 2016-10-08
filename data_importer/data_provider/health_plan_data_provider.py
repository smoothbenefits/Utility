from decimal import *
from ..model.benefits.benefit_plan import BenefitPlan
from ..model.benefits.health_option import HealthOption
from common.data_provider.sql_data_provider_base import SqlDataProviderBase


class HealthPlanDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, company_id):
        super(HealthPlanDataProvider, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return """select op.id, 
                    op.total_cost_per_period, 
                    op.employee_cost_per_period, 
                    op.benefit_option_type, 
                    bp.id, 
                    bp.name, 
                    bp.benefit_type_id, 
                    bt.name, 
                    bp.mandatory_pcp, 
                    bp.pcp_link 
                    from app_companybenefitplanoption as op
                    join app_benefitplan as bp on bp.id = op.benefit_plan_id
                    join app_benefittype as bt on bt.id = bp.benefit_type_id
                    where op.company_id = {}""".format(self.company_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        plans_by_type = {}
        for row in data:
            plan_type = row[7]
            plans = plans_by_type.get(plan_type, None)
            if not plans:
                plans = {}
                plans_by_type[plan_type] = plans
            
            plan_name = row[5]
            plan = plans.get(plan_name, None)
            if not plan:
                plan = BenefitPlan()
                plans[plan_name] = plan
                plan.id = row[4]
                plan.name = plan_name
                plan.type_id = row[6]
                plan.type = plan_type
                plan.mandatory_pcp = row[8]
                plan.pcp_link = row[9]
            plan_option = HealthOption()
            plan_option.id = int(row[0])
            plan_option.total_cost_per_period = Decimal(row[1])
            plan_option.employee_cost_per_period = Decimal(row[2])
            plan_option.benefit_option_type = row[3]
            plans[plan_name].options.append(plan_option)

        return plans_by_type


