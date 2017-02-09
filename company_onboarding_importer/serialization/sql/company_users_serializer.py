from user_serializer import UserSerializer
from ..serializer import Serializer

class CompanyUsersSerializer(object):

    @staticmethod
    def serialize(company_users, file, exclude_path=None):
        exclude_list = Serializer.get_exclude_list(exclude_path)
        users = company_users.get_all_users()
        counter = 0;
        for user in users:
            if user.email.lower() not in exclude_list and \
            user.person.employee_profile and \
            user.person.employee_profile.employment_status:
                counter += 1
                UserSerializer.serialize(user, file, counter)

        file.write('raise notice \'There are {} users created \';\n'.format(counter))

