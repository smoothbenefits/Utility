from user_serializer import UserSerializer

class CompanyUsersSerializer(object):
    @staticmethod
    def serialize(company_users, file_name):
        target = open(file_name, 'w')
        target.truncate() # clear the file content so it is now empty
        target.write('DO $$\n')
        target.write('DECLARE\n')
        target.write('  company_id int := {};\n'.format(company_users.company_id))
        target.write('BEGIN\n')
        target.write('raise notice \'The company_id to start is %\', company_id;\n')
        users = company_users.get_all_users()
        counter = 1;
        for user in users:
            if user.person.employee_profile and \
            user.person.employee_profile.employment_status and \
            'Active' in user.person.employee_profile.employment_status:
                UserSerializer.serialize(user, target, counter)
                counter += 1

        target.write('raise notice \'There are {} users created \'\n'.format(counter))
        target.write('END\n')
        target.write('$$\n')
        target.close()
