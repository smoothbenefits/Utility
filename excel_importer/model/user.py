import unicodedata
class User(object):
    def __init__(self, first_name, last_name, company_domain, email=None):
        self.first_name = first_name
        self.last_name = last_name
        self.company_domain = company_domain
        if email:
            self.email = email
        else:
            self.email = "{0}{1}@{2}".format(self.first_name.replace(" ", "_"), self.last_name.replace(" ", "_"), self.company_domain)
