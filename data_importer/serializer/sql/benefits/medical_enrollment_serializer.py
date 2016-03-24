class MedicalEnrollmentSerializer(object):
    @staticmethod
    def serialize(medical_selection, file, person_id_string, medical_selection_id):
        if not medical_selection or not medical_selection.benefit_plan or not medical_selection.benefit_name:
            return
        else:
            file.write('  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)\n')
            file.write('  VALUES(\'{}\', {}, {});\n'.format(medical_selection.pcp_number, person_id_string, medical_selection_id))
            file.write('\n')