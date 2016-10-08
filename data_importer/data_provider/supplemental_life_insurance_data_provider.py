from ..model.benefits.supplemental_life_insurance import SupplementalLifeInsurance
from ..model.benefits.supplemental_life_insurance_rate import SupplementalLifeInsuranceRate
from common.data_provider.sql_data_provider_base import SqlDataProviderBase


class SupplementalLifeInsuranceDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, company_id):
        super(SupplementalLifeInsuranceDataProvider, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return """select csp.id,
                    sp.name, 
                    sp.use_employee_age_for_spouse,
                    sr.age_min,
                    sr.age_max,
                    sr.rate,
                    sr.benefit_reduction_percentage,
                    sr.bind_type,
                    sc.name, 
                    sc.id
                    from app_supplementallifeinsuranceplan sp
                    join app_compsuppllifeinsuranceplan csp on csp.supplemental_life_insurance_plan_id = sp.id
                    join app_supplementallifeinsuranceplanrate sr on sr.supplemental_life_insurance_plan_id = sp.id
                    join app_syssuppllifeinsurancecondition sc on sc.id = sr.condition_id
                    where csp.company_id = {};""".format(self.company_id)

    def _append_rate(self, plan_rates, condition, row):
        rates = plan_rates.get(condition, None)
        if not rates:
            rates = []
            plan_rates[condition] = rates
        plan_rate = SupplementalLifeInsuranceRate()
        plan_rate.age_min = row[3]
        plan_rate.age_max = row[4]
        plan_rate.rate = row[5]
        plan_rate.benefit_reduction_percentage = row[6]
        rates.append(plan_rate)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        plan = SupplementalLifeInsurance()
        for row in data:
            if not plan.id or not plan.name:
                plan.id = row[0]
                plan.name = row[1]
                plan.use_employee_age_for_spouse = row[2]
            condition = row[9]
            if row[7] == 'self':
                self._append_rate(plan.employee_rates, condition, row)
            elif row[7] == 'spouse':
                self._append_rate(plan.spouse_rates, condition, row)
            elif row[7] == 'dependent':
                self._append_rate(plan.child_rates, condition, row)
        
        return plan
