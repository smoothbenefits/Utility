class SqlRepositoryBase(object):
    def __init__(self, cursor):
        self.cursor = cursor

    def _get_sql_string(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _get_model_populated_with_data(self, data):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def get_data_row(self):
        sql_string = self._get_sql_string()
        if sql_string:
            self.cursor.execute(sql_string)
            return self.cursor.fetchall()
        else:
            return None

    def get_model(self):
        data = self.get_data_row()
        return self._get_model_populated_with_data(data)
