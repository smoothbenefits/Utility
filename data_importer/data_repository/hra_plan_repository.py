from model.benefits.hra_plan import HraPlan
from repository import Repository

class HraPlanRepository(Repository):
    def __init__(self, cursor, company_id):
        super(HraPlanRepository, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return '''select ch.id, 
                    hp.name 
                    from app_companyhraplan ch 
                    join app_hraplan hp on hp.id = ch.hra_plan_id 
                    where ch.company_id = {};'''.format(self.company_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        hra_plan = HraPlan()
        row = data[0]
        if row:
            hra_plan.id = row[0]
            hra_plan.name = row[1]
            return hra_plan
        else:
            return None