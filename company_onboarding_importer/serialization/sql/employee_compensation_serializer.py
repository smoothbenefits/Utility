class EmployeeCompensationSerializer(object):
    @staticmethod
    def get_projected_hours_from_pay_cycle(hours, pay_cycle):
        if pay_cycle == 'W':
            # Weekly
            return  '{:.4f}'.format(float(hours) * 52 / 12)
        elif pay_cycle == 'B':
            # Bi-Weekly
            return '{:.4f}'.format(float(hours) * 26 / 12)
        elif pay_cycle == 'S':
            # Semi-Monthly
            return '{:.4f}'.format(float(hours) * 24 / 12)
        elif pay_cycle == 'M':
            # Monthly
            return '{:.4f}'.format(comp.hours)

    @staticmethod
    def serialize(comp, file, person_id_string):
        if not comp:
            return

        hourly_rate = 'null'
        projected_hour_per_month = 'null'
        annual_base_salary = comp.annual_base_salary
        if 'H' in comp.salary_type:
            annual_base_salary = 'null'
            hourly_rate = '{:.2f}'.format(comp.hourly_rate)
            projected_hour_per_month = EmployeeCompensationSerializer.get_projected_hours_from_pay_cycle(comp.hours, comp.pay_cycle)


        file.write('  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)\n')
        file.write('  VALUES({}, \'{}\', now(), now(), company_id, {}, null, {}, {});\n'.format(annual_base_salary, comp.effective_date, person_id_string, hourly_rate, projected_hour_per_month))
        file.write('\n')
