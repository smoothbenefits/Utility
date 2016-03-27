class DentalEnrollmentSerializer(object):
    @staticmethod
    def serialize(dental_selection, file, person_id_string, dental_selection_id):
        if not dental_selection or not dental_selection.company_plan:
            return
        else:
            file.write('  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)\n')
            file.write('  VALUES(\'{}\', {}, {});\n'.format('', person_id_string, dental_selection_id))
            file.write('\n')
