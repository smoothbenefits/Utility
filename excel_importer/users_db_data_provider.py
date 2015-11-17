import psycopg2
from data_repository.user_repository import UserRepository
from serializer.text.user_serializer import UserSerializer

class UsersDBDataProvider(object):
    def __init__(self, db_name, db_user='postgres'):
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))

    def provide(self, company_users):
        cur = self.conn.cursor()
        cur.execute("select user_id from app_companyuser where company_id={}".format(company_users.company_id))
        db_comp_users = cur.fetchall()
        users = []
        for db_user_id in db_comp_users:
            user_repo = UserRepository(cur, db_user_id[0])
            user = user_repo.get_model()
            if user:
                users.append(user)
        company_users.merge_with_db_data(users)
