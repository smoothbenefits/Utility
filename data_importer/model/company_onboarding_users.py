from company_users import CompanyUsers

class CompanyOnboardingUsers(CompanyUsers);
    def __init__(self, company_name):
        super(CompanyOnboardingUsers, self).__init__(None)

    def merge_with_excel_data(self, row, excel_type):
        pass