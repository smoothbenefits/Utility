class StdSelectionSerializer(object):
    @staticmethod
    def serialize(std_selection, file, user_id_string):
        if std_selection and std_selection.company_plan:
            file.write('  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)\n')
            file.write('  VALUES(now(), now(), {}, {}, 0, {});\n'.format(std_selection.company_plan.id, user_id_string, max(std_selection.benefit_amount, std_selection.guarantee_issue)))
            file.write('\n')
