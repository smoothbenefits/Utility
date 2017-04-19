class PersonSerializer(object):
    @staticmethod
    def serialize(person, f):
        if not f:
            return
        if person:
            f.write("person: {}, {}, {}, {}, {}, {}, {}, {}\n".format(person.id, person.first_name, person.middle_name, person.last_name, person.birth_date, person.ssn, person.gender, person.marital_status))
            if person.address:
                f.write("address: {}, {}, {}, {}\n".format(person.address.street_1, person.address.city, person.address.state, person.address.zipcode))
            else:
                f.write("No Address\n")
            if person and person.phone:
                f.write("phone: {}\n".format(person.phone.number))
            else:
                f.write("No phone\n")
            if person and person.employee_profile:
                f.write("profile: {}, {}, {}, {}, {}, {}, {}, {}, {}, {}\n".format(person.employee_profile.id, person.employee_profile.employment_type, person.employee_profile.employment_status, person.employee_profile.start_date, person.employee_profile.terminate_date, person.employee_profile.employee_number, person.employee_profile.division, person.employee_profile.department, person.employee_profile.job_title, person.employee_profile.benefit_start_date))
            else:
                f.write("No employee profile\n")
            if person and person.employee_compensation:
                f.write("compensation: {}, {}, {}, {}, {}\n".format(person.employee_compensation.id, person.employee_compensation.annual_base_salary, person.employee_compensation.hours, person.employee_compensation.hourly_rate, person.employee_compensation.effective_date))
            else:
                f.write("No employee compensation\n")
        else:
            f.write("No person\n")
