class LtdSelectionSerializer(object):
    @staticmethod
    def serialize(ltd_selection, file, user_id_string):
        if ltd_selection and ltd_selection.company_plan:
            file.write('  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)\n')
            file.write('  VALUES(now(), now(), {}, {}, 0, {});\n'.format(ltd_selection.company_plan.id, user_id_string, max(ltd_selection.benefit_amount, ltd_selection.guarantee_issue)))
            file.write('\n')
