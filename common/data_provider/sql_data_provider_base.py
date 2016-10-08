class SqlDataProviderBase(object):
    def __init__(self, cursor):
        self.cursor = cursor

    def _get_sql_string(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _get_model_populated_with_data(self, data):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def __get_data(self):
        sql_string = self._get_sql_string()
        if sql_string:
            self.cursor.execute(sql_string)
            return self.cursor.fetchall()
        else:
            return None

    def get_model(self):
        data = self.__get_data()
        return self._get_model_populated_with_data(data)
