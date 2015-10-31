class EmployeeCompensationSerializer(object):
    @staticmethod
    def serialize(comp, file, id):
        if not comp or not comp.hours:
            return

        hourly_rate = 'null'
        projected_hour_per_month = 'null'
        annual_base_salary = comp.annual_base_salary
        if 'Hourly' in comp.salary_type:
            annual_base_salary = 'null'
            hourly_rate = '{:.4f}'.format(float(comp.annual_base_salary) / (float(comp.hours) * 52))
            projected_hour_per_month = '{:.4f}'.format(float(comp.hours) * 52 / 12)


        file.write('  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)\n')
        file.write('  VALUES({}, \'{}\', now(), now(), company_id, person_id_{}, \'\', {}, {});\n'.format(annual_base_salary, comp.effective_date, id, hourly_rate, projected_hour_per_month))
        file.write('\n')