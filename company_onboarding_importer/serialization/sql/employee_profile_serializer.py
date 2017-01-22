from ..serializer import Serializer

class EmployeeProfileSerializer(object):

    @staticmethod
    def get_employment_status(raw_status):
        if 'Active' in raw_status:
            return 'Active'
        else:
            return 'Terminated'

    @staticmethod
    def serialize(profile, file, person_id_string):
        if not profile or not profile.employment_status or not profile.start_date:
            return

        if not profile.employment_type:
            profile.employment_type = 'FullTime'

        file.write('  INSERT INTO app_employeeprofile(job_title, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, benefit_start_date)\n')
        file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', now(), now(), {}, company_id, \'{}\');\n'.format(profile.job_title, Serializer.get_date_string(profile.start_date), profile.employment_type, EmployeeProfileSerializer.get_employment_status(profile.employment_status), person_id_string, profile.benefit_start_date))
        file.write('\n')
