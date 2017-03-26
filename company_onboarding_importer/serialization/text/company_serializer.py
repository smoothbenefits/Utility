from company_users_serializer import CompanyUsersSerializer

class CompanySerializer(object):
    @staticmethod
    def serialize(company, f, exclude_path=None):
        if not f:
            return

        f.write('COMPANY: \n')
        f.write('\t {}'.format(company.name))
        if company.pay_period:
            f.write('\t PayPeriod: {}\n'.format(company.pay_period))
        if company.admin_email:
            f.write('\t Company Admin: {}\n'.format(company.admin_email))
        if company.service_type:
            f.write('\t Integrated Service Type: {}\n'.format(company.service_type))
        if company.service_name:
            f.write('\t Integrated Service name: {}\n'.format(company.service_name))
        if company.company_external_id:
            f.write('\t Company id in Integrated Service: {}\n'.format(company.company_external_id))
        CompanyUsersSerializer.serialize(company.company_users, f, exclude_path)
