from ..serializer import Serializer

class EmployeeProfileSerializer(object):

    @staticmethod
    def get_employment_status(raw_status):
        if 'Active' in raw_status:
            return 'Active'
        else:
            return 'Terminated'

    #This is very weird. Please double check with PO
    @staticmethod
    def get_pay_rate_id(pay_rate):
        if 'Monthly' in pay_rate:
            return 4
        elif 'Hourly' in pay_rate:
            return 1
        elif 'Bi-Weekly' in pay_rate:
            return 2
        else:
            return ''

    @staticmethod
    def serialize(profile, file, id):
        if not profile or not profile.employment_status or not profile.start_date:
            return

        if not profile.employment_type:
            profile.employment_type = 'FullTime'

        file.write('  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)\n')
        file.write('  VALUES(\'\', {}, \'{}\', \'{}\', \'{}\', now(), now(), person_id_{}, company_id, \'{}\', \'{}\');\n'.format(profile.annual_base_salary, Serializer.get_date_string(profile.start_date), profile.employment_type, EmployeeProfileSerializer.get_employment_status(profile.employment_status), id, EmployeeProfileSerializer.get_pay_rate_id(profile.pay_rate), Serializer.get_date_string(profile.benefit_start_date)))
        file.write('\n')
