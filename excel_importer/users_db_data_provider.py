import psycopg2

class UsersDBDataProvider(object):
    def __init__(self, company_users, db_name, db_user='postgres'):
        self.company_users = company_users
        self.conn = psycopg2.connect("dbname={} user={}".format(db_name, db_user))

    def process(self):
        cur = self.conn.cursor()
        cur.execute("select * from app_companyuser where company_id={}".format(self.company_users.company_id))
        db_comp_users = cur.fetchall()
        print db_comp_users