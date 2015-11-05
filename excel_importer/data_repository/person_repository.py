from model.person import Person
from repository import Repository

class PersonRepository(Repository):
    def __init__(self, cursor, user_id):
        super(PersonRepository, self).__init__(cursor)
        self.user_id = user_id

    def _get_sql_string(self):
        return 'select id, first_name, middle_name, last_name, relationship, gender, birth_date, ssn, email from app_person where user_id=\'{}\' and person_type=\'primary_contact\''.format(self.user_id)

    def _get_model_populated_with_data(self, data):
        if not data:
            return None
        cur_person = Person()
        row = data[0]
        if row:
            cur_person.id = row[0]
            cur_person.first_name = row[1]
            cur_person.middle_name = row[2]
            cur_person.last_name = row[3]
            cur_person.relationship = row[4]
            cur_person.gender = row[5]
            cur_person.birth_date = row[6]
            cur_person.ssn = row[7]
            cur_person.email = row[8]
            cur_person.person_type = 'primary_contact'
            return cur_person
        else:
            return None