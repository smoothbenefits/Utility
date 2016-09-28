from ..model.employee_profile import EmployeeProfile
from common.data_provider.sql_data_provider_base import SqlDataProviderBase


class EmployeeProfileDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, person_id):
        super(EmployeeProfileDataProvider, self).__init__(cursor)
        self.person_id = person_id

    def _get_sql_string(self):
        return 'select id, job_title, annual_base_salary, start_date, employment_type, employment_status, benefit_start_date, person_id, company_id from app_employeeprofile where person_id=\'{}\''.format(self.person_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_profile = EmployeeProfile()
        row = data[0]
        if row:
            cur_profile.id = row[0]
            cur_profile.job_title = row[1]
            cur_profile.annual_base_salary = row[2]
            cur_profile.start_date = row[3]
            cur_profile.employment_type = row[4]
            cur_profile.employment_status = row[5]
            cur_profile.benefit_start_date = row[6]
            cur_profile.person_id = row[7]
            cur_profile.company_id = row[8]
            return cur_profile
        else:
            return None
