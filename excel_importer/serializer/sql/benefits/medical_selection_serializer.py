class MedicalSelectionSerializer(object):

    @staticmethod
    def serialize(health_selection, file, user_id_string):
        if not health_selection or not health_selection.benefit_plan or not health_selection.benefit_name:
            # We actually waived. Should serialize waive option here
            file.write('  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)\n')
            file.write('  VALUES(now(), now(), {}, company_id, {})\n'.format(1, user_id_string))
            file.write('\n')
        else:
            file.write('  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)\n')
            file.write('  VALUES(now(), now(), {}, {});\n'.format(health_selection.benefit_plan.id, user_id_string))
            file.write('\n')