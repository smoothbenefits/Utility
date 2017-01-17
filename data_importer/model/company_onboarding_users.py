from company_users import CompanyUsers

class CompanyOnboardingUsers(CompanyUsers):
    def __init__(self, company_name):
        super(CompanyOnboardingUsers, self).__init__(None)
        self.employees = []

    def merge_with_excel_data(self, row, excel_type):
        self.employees.append(row)
      