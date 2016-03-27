class SupplementalLifeSelectionSerializer(object):
    @staticmethod
    def _get_elect_amount(selection):
        if not selection:
            return 'null'
        return max(selection.benefit_amount, selection.guarantee_issue)

    @staticmethod
    def serialize(supplemental_life_selection, file, person_id_string):
        if supplemental_life_selection['self'] or supplemental_life_selection['spouse'] or supplemental_life_selection['child'] or supplemental_life_selection['ADD']:
            self_elected_amount = SupplementalLifeSelectionSerializer._get_elect_amount(supplemental_life_selection['self'])
            spouse_elected_amount = SupplementalLifeSelectionSerializer._get_elect_amount(supplemental_life_selection['spouse'])
            child_elected_amount = SupplementalLifeSelectionSerializer._get_elect_amount(supplemental_life_selection['child'])
            add_elected_amount = SupplementalLifeSelectionSerializer._get_elect_amount(supplemental_life_selection['ADD'])
            file.write('  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)\n')
            file.write('  VALUES({}, {}, {}, 0, 0, 0, now(), now(), {}, {}, 3, 3, null, {}, null);\n'.format(self_elected_amount, spouse_elected_amount, child_elected_amount, supplemental_life_selection['self'].company_plan.id, person_id_string, add_elected_amount))
            file.write('\n')
