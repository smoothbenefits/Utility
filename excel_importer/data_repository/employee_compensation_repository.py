from model.employee_compensation import EmployeeCompensation
from repository import Repository

class EmployeeCompensationRepository(Repository):
    def __init__(self, cursor, person_id):
        super(EmployeeCompensationRepository, self).__init__(cursor)
        self.person_id = person_id

    def _get_sql_string(self):
        return 'select id, annual_base_salary, effective_date, projected_hour_per_month, hourly_rate from app_employeecompensation where person_id=\'{}\''.format(self.person_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_comp = EmployeeCompensation()
        row = data[0]
        if row:
            cur_comp.id = row[0]
            cur_comp.annual_base_salary = row[1]
            cur_comp.effective_date = row[2]
            cur_comp.hours = row[3]
            cur_comp.hourly_rate = row[4]
            return cur_comp
        else:
            return None
