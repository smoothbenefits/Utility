import json

class TimeOffQuotaSerializer(object):

    @staticmethod
    def serialize(file_name, timeoff_quotas):
        target = open(file_name, 'w')
        target.truncate() # clear the file content so it is now empty
        for quota in timeoff_quotas:
            print quota.to_json_string()
            target.write(quota.to_json_string())
            target.write('\n')

        target.close()
