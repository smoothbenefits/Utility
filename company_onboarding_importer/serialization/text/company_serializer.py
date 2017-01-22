from company_users_serializer import CompanyUsersSerializer

class CompanySerializer(object):
    @staticmethod
    def serialize(company, f, exclude_path=None):
        if not f:
            return

        f.write('COMPANY: \n')
        f.write('\t {}'.format(company.name))
        if company.pay_period:
            f.write('\t PayPeriod: {}'.format(company.pay_period))
        CompanyUsersSerializer.serialize(company.company_users, f, exclude_path)
