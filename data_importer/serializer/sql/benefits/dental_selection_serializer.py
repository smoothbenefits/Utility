class DentalSelectionSerializer(object):

    @staticmethod
    def serialize(dental_selection, file, user_id_string, dental_selection_id):
        if not dental_selection or not dental_selection.company_plan or not dental_selection.option:
            # We actually waived. Should serialize waive option here
            file.write('  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)\n')
            file.write('  VALUES(now(), now(), {}, company_id, {});\n'.format(2, user_id_string))
            file.write('\n')
        else:
            file.write('  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)\n')
            file.write('  VALUES(now(), now(), {}, {})\n'.format(dental_selection.option.id, user_id_string))
            file.write('  RETURNING id into {};\n'.format(dental_selection_id))
            file.write('\n')
