from data_provider.health_plan_data_provider import HealthPlanDataProvider
from data_provider.supplemental_life_insurance_data_provider import SupplementalLifeInsuranceDataProvider
from data_provider.std_plan_data_provider import StdPlanDataProvider
from data_provider.ltd_plan_data_provider import LtdPlanDataProvider
from data_provider.basic_life_insurance_data_provider import BasicLifeInsuranceDataProvider
from data_provider.hra_plan_data_provider import HraPlanDataProvider
import psycopg2

class CompanyBenefitsProvider(object):
    def __init__(self, company_id, db_name, db_user='postgres'):
        self.company_id = company_id
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))
    
    def provide(self, comp_benefits):
        # Health Benefits
        cur = self.conn.cursor()
        health_repo = HealthPlanDataProvider(cur, self.company_id)
        types = health_repo.get_model()

        comp_benefits.medicals = types.get('Medical', None)
        comp_benefits.dentals = types.get('Dental', None)
        comp_benefits.visions = types.get('Vision', None)

        basic_repo = BasicLifeInsuranceDataProvider(cur, self.company_id)
        comp_benefits.basic_life_insurance = basic_repo.get_model()
        suppl_repo = SupplementalLifeInsuranceDataProvider(cur, self.company_id)
        comp_benefits.supplemental_life_insurance = suppl_repo.get_model()
        std_repo = StdPlanDataProvider(cur, self.company_id)
        comp_benefits.std_plan = std_repo.get_model()
        ltd_repo = LtdPlanDataProvider(cur, self.company_id)
        comp_benefits.ltd_plan = ltd_repo.get_model()
        hra_repo = HraPlanDataProvider(cur, self.company_id)
        comp_benefits.hra_plan = hra_repo.get_model()

