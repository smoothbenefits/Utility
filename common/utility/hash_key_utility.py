import re
from hashlib import md5

from environment_utility import EnvironmentUtility

HASH_KEY = '5e14ca8a-4a48-4cf7-aa3b-e207eb1a9adb'


''' Provides utility to handle hash and unhash of keys
'''
class HashKeyUtility(object):

    ''' Prefix for all hashed tokens '''
    HASH_TOKEN_PREFIX = 'BMHT'

    ''' Regex pattern to match hashed tokens'''
    HASH_TOKEN_REGEX_PATTERN = r'BMHT_[0-9]+_\w+'

    ''' produce a "encoded" version of the given key (any type), in the format of
        original Id concatnated with its MD5 hash (and output to all HEX code for URL safety).
        Also prefix with the HASH_TOKEN_PREFIX.
    '''
    def encode_key(self, key):
        if (not key):
            return key

        return "{0}_{1}_{2}".format(
            self.HASH_TOKEN_PREFIX, key, md5("{0}{1}".format(HASH_KEY, key)).hexdigest())

    def encode_key_with_environment(self, key):
        if (not key):
            return None
        hash_key = self.encode_key(key)

        env_prefix = EnvironmentUtility.get_active_settings().hash_id_env_prefix

        return '{0}_{1}'.format(env_prefix, hash_key)    

    ''' Validate the integrity of the encoded key and
        - return the originl key if it is valid
        - return None if not
    '''
    def decode_key(self, encoded_key):
        if (not encoded_key):
            return encoded_key

        tokens = encoded_key.split('_')
        if (len(tokens) != 3):
            return None

        if (tokens[0] != self.HASH_TOKEN_PREFIX):
            return None

        h = self.encode_key(tokens[1])

        if (h == encoded_key):
            return tokens[1]
        else:
            return None

    def decode_key_with_environment(self, encoded_key):
        if (not encoded_key):
            return None

        # Get expected environment prefix
        env_prefix = EnvironmentUtility.get_active_settings().hash_id_env_prefix

        # Check that the environment token matches
        env_token = encoded_key.split('_', 1)[0]
        if (env_token != env_prefix):
            return None

        hashed_key_part = encoded_key.split('_', 1)[1]
        if (not hashed_key_part):
            return None

        decoded_str = self.decode_key(hashed_key_part)

        if (decoded_str):
            return decoded_str

        return None

    def is_encoded(self, value):
        try:
            decoded = self.decode_key(value)
            return decoded != value
        except:
            return False
