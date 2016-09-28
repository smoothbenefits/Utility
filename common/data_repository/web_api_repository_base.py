from common.utility.web_request_utility import WebRequestUtility

class WebApiRepositoryBase(object):
    def __init__(self):
        self.web_request_utility = WebRequestUtility()

    def _get_url(self):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def _get_model_populated_with_data(self, data):
        raise NotImplementedError("Please Implement this method in the sub-class")

    def __get_data(self):
        url = self._get_url()
        if url:
            response = self.web_request_utility.get(url)
            return response.json()
        else:
            return None

    def get_model(self):
        data = self.__get_data()
        return self._get_model_populated_with_data(data)
