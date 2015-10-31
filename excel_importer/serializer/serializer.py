from keyczar import keyczar
import datetime

class Serializer(object):
    _crypter = keyczar.Crypter.Read('fieldkeys')

    @staticmethod
    def get_encrypted(item):
        if item:
            encrypted = Serializer._crypter.Encrypt(item)
            return encrypted
        else:
            return ''

    @staticmethod
    def get_date_string(date):
        if isinstance(date, unicode):
            converted_date = datetime.datetime.strptime(date, '%m/%d/%Y')
        else:
            converted_date = date

        return converted_date.strftime('%Y-%m-%d')