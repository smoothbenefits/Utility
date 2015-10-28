class User(object):
    @staticmethod
    def serialize(user):
        print "user: {}, {}, {}".format(user.first_name, user.last_name, user.email)
        print "person: {}, {}, {}".format(user.person.first_name, user.person.last_name, user.person.birth_date)
        print "address: {}, {}, {}".format(user.person.address.street_1, user.person.address.city, user.person.address.state)
        print "phone: {}".format(user.person.phone.number)
        print "profile: {}, {}".format(user.person.employee_profile.employment_status, user.person.employee_profile.start_date)
        print "compensation: {}, {}, {}".format(user.person.employee_compensation.annual_base_salary, user.person.employee_compensation.projected_hour_per_month, user.person.employee_compensation.effective_date)
        for member in user.family_members:
            print "family member: {}, {}, {}".format(member.first_name, member.last_name, member.birth_date)
