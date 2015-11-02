from user_serializer import UserSerializer
from ..serializer import Serializer

class CompanyUsersSerializer(object):

    @staticmethod
    def serialize(company_users, file_name, exclude_path=None):
        exclude_list = Serializer.get_exclude_list(exclude_path)
        target = open(file_name, 'w')
        target.truncate() # clear the file content so it is now empty
        target.write('DO $$\n')
        target.write('DECLARE\n')
        target.write('  company_id int := {};\n'.format(company_users.company_id))
        target.write('BEGIN\n')
        target.write('raise notice \'The company_id to start is %\', company_id;\n')
        users = company_users.get_all_users()
        counter = 0;
        for user in users:
            if user.email.lower() not in exclude_list and \
            user.person.employee_profile and \
            user.person.employee_profile.employment_status and \
            'Active' in user.person.employee_profile.employment_status:
                counter += 1
                UserSerializer.serialize(user, target, counter)

        target.write('raise notice \'There are {} users created \';\n'.format(counter))
        target.write('END\n')
        target.write('$$\n')
        target.close()
