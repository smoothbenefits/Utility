import psycopg2
from data_repository.user_repository import UserRepository

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
        for user in self.users:
            print "user: {}, {}, {}, {}, {} \n".format(user.id, user.email, user.password, user.first_name, user.last_name)
            if user.person:
                print "  person: {}, {}, {}, {}, {}, {}, {}, {}\n".format(user.person.first_name, user.person.middle_name, user.person.last_name, user.person.gender, user.person.relationship, user.person.birth_date, user.person.email, user.person.ssn)
            else:
                print "  NO PERSON OBJECT\n"
