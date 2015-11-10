import psycopg2
from data_repository.user_repository import UserRepository
from serializer.text.user_serializer import UserSerializer

class UsersDBDataProvider(object):
    def __init__(self, company_users, db_name, db_user='postgres'):
        self.company_users = company_users
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))
        self.users = []

    def process(self):
        cur = self.conn.cursor()
        cur.execute("select user_id from app_companyuser where company_id={}".format(self.company_users.company_id))
        db_comp_users = cur.fetchall()
        for db_user_id in db_comp_users:
            user_repo = UserRepository(cur, db_user_id[0])
            user = user_repo.get_model()
            if user:
                self.users.append(user)
        f = open('db_exported.txt', 'w')
        f.truncate()
        for user in self.users:
            UserSerializer.serialize(user, f)
        f.close()
