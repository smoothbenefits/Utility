import logging
Logger = logging.getLogger("import_excel")


class EmployeeW4Serializer(object):
    @staticmethod
    def get_marriage(status):
        if status == 'S':
            return 0
        elif status == 'H':
            return 1
        elif status == 'M':
            return 2
        else:
            return 10

    @staticmethod
    def serialize(w4, file, user_id_string):
        if not w4 or not w4.status:
            return
        marriage_number = EmployeeW4Serializer.get_marriage(w4.status)
        file.write('  INSERT INTO app_w4 (marriage, dependencies, head, tax_credit, calculated_points, user_defined_points, extra_amount, user_id)\n')
        file.write('  VALUES({}, 0, 0, 0, {}, {}, {:.2f}, {});\n'.format(marriage_number, w4.allowance, w4.allowance, w4.extra_amount, user_id_string))
        file.write('\n')
