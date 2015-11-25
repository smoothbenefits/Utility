class HraSelectionSerializer(object):
    @staticmethod
    def serialize(hra_selection, file, person_id_string):
        if hra_selection and hra_selection.benefit_plan:
            file.write('  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)\n')
            file.write('  VALUES(now(), now(), {}, {});\n'.format(hra_selection.benefit_plan.id, person_id_string))
            file.write('\n')
