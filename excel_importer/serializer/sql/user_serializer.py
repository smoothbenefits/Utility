from person_serializer import PersonSerializer

class UserSerializer(object):
    @staticmethod
    def serialize(user, file, id):
        #print "---------------------------------------------------------------------"
        #print "user: {}, {}, {}".format(user.first_name, user.last_name, user.email)
        #print "person: {}, {}, {}".format(user.person.first_name, user.person.last_name, user.person.birth_date)
        #print "address: {}, {}, {}".format(user.person.address.street_1, user.person.address.city, user.person.address.state)
        #print "phone: {}".format(user.person.phone.number)
        #print "profile: {}, {}".format(user.person.employee_profile.employment_status, user.person.employee_profile.start_date)
        #print "compensation: {}, {}, {}".format(user.person.employee_compensation.annual_base_salary, user.person.employee_compensation.projected_hour_per_month, user.person.employee_compensation.effective_date)
        #for member in user.family_members:
        #    print "family member: {}, {}, {}".format(member.first_name, member.last_name, member.birth_date)
        file.write('\n')
        file.write('DECLARE\n')
        file.write('  user_id_{} int;\n'.format(id))
        file.write('  person_id_{} int;\n'.format(id))
        file.write('  company_user_id_{} int; \n'.format(id))
        file.write('BEGIN\n')
        file.write('  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)\n')
        file.write('  VALUES(\'pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=\', now(), \'{}\', \'t\', \'f\', \'f\', \'{}\', \'{}\', now(), now())\n'.format(user.email.replace('\'', ''), user.first_name.replace('\'', '\'\''), user.last_name.replace('\'', '\'\'')))
        file.write('  RETURNING id into user_id_{};\n'.format(id))
        file.write('  raise notice \'The user_id_{} after insert is %\', user_id;\n'.format(id))
        file.write('  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)\n')
        file.write('  VALUES(\'employee\', \'f\', company_id, user_id_{})\n'.format(id))
        file.write('  RETURNING id into company_user_id_{};\n'.format(id))
        file.write('  raise notice \'The company_user_id_{} is %\', company_user_id_{};\n'.format(id, id))
        PersonSerializer.serialize(user.person, file, id)
        for member in user.family_members:
            PersonSerializer.serialize(member, file, id)
        file.write('END;\n')
        file.write('\n')

