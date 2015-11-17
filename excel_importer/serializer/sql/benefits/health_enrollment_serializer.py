class HealthEnrollmentSerializer(object):
    @staticmethod
    def serialize(health_selection, file, person_id_string, health_selection_id):
        if not health_selection or not health_selection.benefit_plan or not health_selection.benefit_name:
            return
        else:
            file.write('  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)\n')
            file.write('  VALUES(\'{}\', {}, {});\n'.format(health_selection.pcp_number, person_id_string, health_selection_id))
            file.write('\n')