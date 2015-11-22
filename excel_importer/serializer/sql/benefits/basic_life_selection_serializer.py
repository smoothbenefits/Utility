class BasicLifeSelectionSerializer(object):
    @staticmethod
    def serialize(basic_life_selection, file, user_id_string, person_id_string):
        if basic_life_selection and basic_life_selection.company_plan:
            file.write('  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)\n')
            file.write('  VALUES({}, now(), now(), {}, {}, {});\n'.format(max(basic_life_selection.benefit_amount, basic_life_selection.guarantee_issue), basic_life_selection.company_plan.id, person_id_string, user_id_string))
            file.write('\n')
