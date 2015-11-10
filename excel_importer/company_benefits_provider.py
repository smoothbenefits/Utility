from data_repository.health_plan_repository import HealthPlanRepository
import psycopg2

class CompanyBenefitsProvider(object):
    def __init__(self, company_id, comp_benefits, db_name, db_user='postgres'):
        self.company_id = company_id
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))
        self.comp_benefits = comp_benefits
    
    def process(self):
        # Health Benefits
        cur = self.conn.cursor()
        health_repo = HealthPlanRepository(cur, self.company_id)
        types = health_repo.get_model()

        self.comp_benefits.medicals = types.get('Medical', None)
        self.comp_benefits.dentals = types.get('Dental', None)
        self.comp_benefits.visions = types.get('Vision', None)

