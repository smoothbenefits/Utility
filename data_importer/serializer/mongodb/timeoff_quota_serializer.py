import json

class TimeOffQuotaSerializer(object):

    @staticmethod
    def serialize(file_name, timeoff_quotas):
        target = open(file_name, 'w')
        target.truncate() # clear the file content so it is now empty
        for quota in timeoff_quotas:
            serializable = quota.as_serializable()
            in_json = json.dumps(serializable)
            print in_json
            target.write(in_json)
            target.write('\n')

        target.close()
