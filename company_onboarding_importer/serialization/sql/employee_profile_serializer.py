from ..serializer import Serializer

class EmployeeProfileSerializer(object):

    @staticmethod
    def get_employment_status(raw_status):
        if 'Active' in raw_status:
            return 'Active'
        elif 'Prospective' in raw_status:
            return 'Prospective'
        else:
            return 'Terminated'

    @staticmethod
    def serialize(profile, file, person_id_string, id):

        # if department is available, we should insert that into the company department table
        company_department_id = 'null'
        if profile.department:
            company_department_id = 'company_department_{}'.format(id)
            file.write('DECLARE\n')
            file.write('  {} int; \n'.format(company_department_id))
            file.write('BEGIN\n')
            file.write('  SELECT id into {} from app_companydepartment WHERE department=\'{}\';\n'.format(company_department_id, profile.department))
            file.write('  IF {} IS null THEN\n'.format(company_department_id))
            file.write('    INSERT INTO app_companydepartment(department, description, company_id)\n')
            file.write('    VALUES(\'{}\', \'\', {})\n'.format(profile.department, 'company_id'))
            file.write('    RETURNING id into {};\n'.format(company_department_id))
            file.write('  END IF;\n')


        if not profile or not profile.employment_status or not profile.start_date:
            return

        if not profile.employment_type:
            profile.employment_type = 'FullTime'

        if not profile.benefit_start_date:
            profile.benefit_start_date = 'null'
        else:
            profile.benefit_start_date = '\'{}\''.format(Serializer.get_date_string(profile.benefit_start_date))
        file.write('  INSERT INTO app_employeeprofile(job_title, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, benefit_start_date, employee_number, department_id)\n')
        file.write('  VALUES(\'{}\', \'{}\', \'{}\', \'{}\', now(), now(), {}, company_id, {}, \'{}\', {});\n'.format(profile.job_title, Serializer.get_date_string(profile.start_date), profile.employment_type, EmployeeProfileSerializer.get_employment_status(profile.employment_status), person_id_string, profile.benefit_start_date, profile.employee_number, company_department_id))
        if profile.department:
            file.write('END; \n')
        file.write('\n')
