from common.utility.web_request_utility import WebRequestUtility

class WebApiDataRepositoryBase(object):
    def __init__(self):
        self.web_request_utility = WebRequestUtility()
