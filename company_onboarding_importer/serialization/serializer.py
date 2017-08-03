import datetime

class Serializer(object):

    @staticmethod
    def get_date_string(date):
        if isinstance(date, str) or isinstance(date, unicode):
            converted_date = datetime.datetime.strptime(date, '%m/%d/%Y')
        else:
            converted_date = date

        return converted_date.strftime('%Y-%m-%d')

    @staticmethod
    def clean_datetime(model, attr):
        model_value = getattr(model, attr)
        if not model_value:
            setattr(model, attr, 'null')
        else:
            setattr(model, attr, '\'{}\''.format(Serializer.get_date_string(model_value)))


    @staticmethod
    def get_exclude_list(exclude_path):
        exclude_list = []
        if not exclude_path:
            return exclude_list
        exclude_file = open(exclude_path, 'r')
        line = exclude_file.readline()
        while line:
            exclude_list.append(line.replace('\n', '').lower())
            line = exclude_file.readline()
        exclude_file.close()
        return exclude_list
