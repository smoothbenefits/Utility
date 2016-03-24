class PersonSerializer(object):
    @staticmethod
    def serialize(person, f):
        if not f:
            return
        if person:
            f.write("person: {}, {}, {}, {}, {}, {}\n".format(person.id, person.first_name, person.last_name, person.birth_date, person.ssn, person.gender))
            if person.address:
                f.write("address: {}, {}, {}, {}\n".format(person.address.street_1, person.address.city, person.address.state, person.address.zipcode))
            else:
                f.write("No Address\n")
            if person and person.phone:
                f.write("phone: {}\n".format(person.phone.number))
            else:
                f.write("No phone\n")
            if person and person.employee_profile:
                f.write("profile: {}, {}, {}\n".format(person.employee_profile.id, person.employee_profile.employment_status, person.employee_profile.start_date))
            else:
                f.write("No employee profile\n")
            if person and person.employee_compensation:
                f.write("compensation: {}, {}, {}, {}, {}\n".format(person.employee_compensation.id, person.employee_compensation.annual_base_salary, person.employee_compensation.hours, person.employee_compensation.hourly_rate, person.employee_compensation.effective_date))
            else:
                f.write("No employee compensation\n")
            if person.medical_enrollment:
                if person.medical_enrollment.benefit_plan:
                    f.write("Person Medical Selection: {}, {}, {}, {}, {}\n".format(person.medical_enrollment.benefit_plan.id, person.medical_enrollment.benefit_plan.name, person.medical_enrollment.benefit_name, person.medical_enrollment.pcp_number, person.medical_enrollment.option.benefit_option_type))
                else:
                    f.write("Person Medical Selection No Plan: {}, {}\n".format(person.medical_enrollment.benefit_name, person.medical_enrollment.pcp_number))

            if person.dental_enrollment:
                f.write("Person Dental Enrollment: {}, {}, {}, {}\n".format(person.dental_enrollment.company_plan.id, person.dental_enrollment.company_plan.name, person.dental_enrollment.selection_name, person.dental_enrollment.option.benefit_option_type))
        else:
            f.write("No person\n")