from ..serializer import Serializer

class EmployeeProfileSerializer(object):

    @staticmethod
    def get_employment_status(raw_status):
        if 'A' in raw_status:
            return 'Active'
        elif 'P' in raw_status:
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
            file.write('  SELECT id into {} from app_companydepartment WHERE department=\'{}\' AND company_id={};\n'.format(company_department_id, profile.department, 'the_company_id'))
            file.write('  IF {} IS null THEN\n'.format(company_department_id))
            file.write('    INSERT INTO app_companydepartment(department, description, code, company_id)\n')
            file.write('    VALUES(\'{}\', \'\', \'{}\', {})\n'.format(profile.department, profile.department_code, 'the_company_id'))
            file.write('    RETURNING id into {};\n'.format(company_department_id))
            file.write('  END IF;\n')

        company_division_id = 'null'
        if profile.division:
            company_division_id = 'company_division_{}'.format(id)
            file.write('DECLARE\n')
            file.write('  {} int; \n'.format(company_division_id))
            file.write('BEGIN\n')
            file.write('  SELECT id into {} from app_companydivision WHERE division=\'{}\' AND company_id={};\n'.format(company_division_id, profile.division, 'the_company_id'))
            file.write('  IF {} IS null THEN\n'.format(company_division_id))
            file.write('    INSERT INTO app_companydivision(division, description, code, company_id)\n')
            file.write('    VALUES(\'{}\', \'\', \'{}\', {})\n'.format(profile.division, profile.division_code, 'the_company_id'))
            file.write('    RETURNING id into {};\n'.format(company_division_id))
            file.write('  END IF;\n')


        if not profile or not profile.employment_status or not profile.start_date:
            return

        if not profile.employment_type:
            profile.employment_type = 'FullTime'

        Serializer.clean_datetime(profile, 'benefit_start_date')
        Serializer.clean_datetime(profile, 'start_date')
        Serializer.clean_datetime(profile, 'terminate_date')
        
        file.write('  INSERT INTO app_employeeprofile(job_title, start_date, end_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, benefit_start_date, employee_number, department_id, pin)\n')
        file.write('  VALUES(\'{}\', {}, {}, \'{}\', \'{}\', now(), now(), {}, the_company_id, {}, \'{}\', {}, {});\n'.format(profile.job_title, profile.start_date, profile.terminate_date, profile.employment_type, EmployeeProfileSerializer.get_employment_status(profile.employment_status), person_id_string, profile.benefit_start_date, profile.employee_number, company_department_id, id + 2000))
        if profile.department or profile.division:
            file.write('END; \n')
        file.write('\n')
