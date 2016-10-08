import os
from keyczar import keyczar


class EncryptionUtility(object):
    _keys_file_path = os.path.join(os.path.dirname(__file__), 'encryption_fieldkeys')
    _crypter = keyczar.Crypter.Read(_keys_file_path)

    @staticmethod
    def encrypt(data):
        if data:
            return EncryptionUtility._crypter.Encrypt(data)
        else:
            return ''
