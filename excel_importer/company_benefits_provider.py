from data_repository.health_plan_repository import HealthPlanRepository
from data_repository.supplemental_life_insurance_repository import SupplementalLifeInsuranceRepository
import psycopg2

class CompanyBenefitsProvider(object):
    def __init__(self, company_id, db_name, db_user='postgres'):
        self.company_id = company_id
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))
    
    def provide(self, comp_benefits):
        # Health Benefits
        cur = self.conn.cursor()
        health_repo = HealthPlanRepository(cur, self.company_id)
        types = health_repo.get_model()

        comp_benefits.medicals = types.get('Medical', None)
        comp_benefits.dentals = types.get('Dental', None)
        comp_benefits.visions = types.get('Vision', None)

        suppl_repo = SupplementalLifeInsuranceRepository(cur, self.company_id)
        comp_benefits.supplemental_life_insurance = suppl_repo.get_model()

