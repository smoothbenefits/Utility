from model.user import User
from repository import Repository
from person_repository import PersonRepository
from dependent_repository import DependentRepository
class UserRepository(Repository):
    def __init__(self, cursor, user_id):
        super(UserRepository, self).__init__(cursor)
        self.user_id = user_id

    def _get_sql_string(self):
        return 'select u.email, u.password, u.first_name, u.last_name from app_authuser u where id=\'{}\''.format(self.user_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_user = User()
        row = data[0]
        if row:
            cur_user.email = row[0]
            cur_user.password = row[1]
            cur_user.first_name = row[2]
            cur_user.last_name = row[3]
            cur_user.id = self.user_id
            pr = PersonRepository(self.cursor, self.user_id)
            cur_user.person = pr.get_model()
            dep_repo = DependentRepository(self.cursor, self.user_id)
            members = dep_repo.get_model()
            for member in members:
                cur_user.family_members.append(member)
            return cur_user
        else:
            return None
