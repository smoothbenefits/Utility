from ..model.employee_profile import EmployeeProfile
from common.data_provider.sql_data_provider_base import SqlDataProviderBase


class EmployeeProfileCompanyDataProvider(SqlDataProviderBase):
    def __init__(self, cursor, company_id):
        super(EmployeeProfileCompanyDataProvider, self).__init__(cursor)
        self.company_id = company_id

    def _get_sql_string(self):
        return 'select ep.employment_type, p.user_id, ep.person_id, ep.company_id from app_employeeprofile ep join app_person p on p.id = ep.person_id where ep.company_id=\'{}\''.format(self.company_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        if len(data) > 0:
            profiles = []
            for row in data:
                cur_profile = EmployeeProfile()
                cur_profile.employment_type = row[0]
                cur_profile.user_id = row[1]
                cur_profile.person_id = row[2]
                cur_profile.company_id = row[3]
                profiles.append(cur_profile)
            return profiles
        else:
            return None