import requests
import json
import datetime
import copy

company_info = 'stage_BMHT_1_b457df460695969e8960e3f1623a3ee7'
prod_company_info = 'production_BMHT_29_6d6548c7e58f85e2f31a30bd396bd8dc'

get_path = '/api/v1/company/{}/timeoff_quotas'.format(prod_company_info)
put_path = '/api/v1/person/{}/timeoff_quota'
host = 'http://timetracking.workbenefits.me'

response = requests.get(host + get_path)
quotas = response.json()
for quota in quotas:
    print 'old quota is {}'.format(quota)
    del quota['_id']
    quota_info_collection = quota['quotaInfoCollection']
    for type_info in quota_info_collection:
        accrual_spec = type_info['accrualSpecs']
        type_info['bankedHours'] = type_info['bankedHours'] + accrual_spec['accrualRate']
        accrual_spec['accruedHours'] = accrual_spec['accruedHours'] + accrual_spec['accrualRate']
        accrual_spec['lastAccrualTimestamp'] = datetime.datetime.utcnow().isoformat()
    
    put_url = host + put_path.format(quota['personDescriptor'])
    serialized_data = json.dumps(quota)
    print 'new quota is {}'.format(serialized_data)
    put_response = requests.put(put_url, data=serialized_data, headers={'Content-Type': 'application/json;charset=UTF-8'})
    print 'put_response has status {} and text {}'.format(put_response.status_code, put_response.text)
