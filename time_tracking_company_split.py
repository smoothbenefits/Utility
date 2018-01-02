from common.utility.environment_utility import EnvironmentUtility, ENVIRONMENT_PROD, ENVIRONMENT_LOCAL
from common.utility.hash_key_utility import HashKeyUtility
from common.utility.web_request_utility import WebRequestUtility

hash_key_util = HashKeyUtility()
web_request_util = WebRequestUtility()

def update_timeoff_quota(encoded_user_id, new_company_id):
    time_off_quota_url = '{0}api/v1/person/{1}/timeoff_quota'.format(
        EnvironmentUtility.get_active_settings().time_tracking_base_url,
        encoded_user_id
    )
    response = web_request_util.get(time_off_quota_url)
    time_off_quota = response.json()
    if time_off_quota:
        print "For user with id {} we got Time off quotas with company_id {}".format(encoded_user_id, time_off_quota['companyDescriptor'])
        time_off_quota['companyDescriptor'] = new_company_id
        response = web_request_util.put(time_off_quota_url, time_off_quota)
        print "The quota update response is {}".format(response)
    else:
        print "user {} has no timeoff_quota object".format(encoded_user_id)

def update_timeoff_requests(encoded_user_id, new_company_id):
    time_off_requests_url = '{0}api/v1/requestor/{1}/timeoffs'.format(
        EnvironmentUtility.get_active_settings().time_tracking_base_url,
        encoded_user_id
    )
    response = web_request_util.get(time_off_requests_url)
    time_off_requests = response.json()
    print "For user with id {} we got {} Time off requests. Updating company to {}".format(encoded_user_id, len(time_off_requests), new_company_id)
    for time_off_req in time_off_requests:
        time_off_req['requestor']['companyDescriptor'] = new_company_id
        time_off_req_id = time_off_req['_id']
        update_url = '{0}api/v1/timeoffs/{1}/company'.format(
                EnvironmentUtility.get_active_settings().time_tracking_base_url,
                time_off_req_id
            )
        response = web_request_util.put(update_url, time_off_req)
        print "Update time off request {}. Response: {}".format(time_off_req_id, response)

def update_time_punch_cards(encoded_user_id, new_company_id):
    punch_card_url = '{0}api/v1/employee/{1}/time_punch_cards'.format(
        EnvironmentUtility.get_active_settings().time_tracking_base_url,
        encoded_user_id
    )
    response = web_request_util.get(punch_card_url)
    timecards = response.json()
    print "For user with id {} we got {} cards".format(encoded_user_id, len(timecards))
    for timecard in timecards:
        if timecard['employee']['companyDescriptor'] == new_company_id:
            print "time card {} Already updated. Skip".format(timecard['_id'])
            continue
        timecard['employee']['companyDescriptor'] = new_company_id
        card_id = timecard['_id']
        update_url = '{0}api/v1/time_punch_cards/{1}'.format(
                EnvironmentUtility.get_active_settings().time_tracking_base_url,
                card_id
            )
        response = web_request_util.put(update_url, timecard)
        print "Update timecard {}. Response: {}".format(card_id, response)

def update_person_punch_card_settings(encoded_user_id, new_company_id):
    person_punch_card_settings_url = '{0}api/v1/person/{1}/time_punch_card_setting'.format(
        EnvironmentUtility.get_active_settings().time_tracking_base_url,
        encoded_user_id
    )
    response = web_request_util.get(person_punch_card_settings_url)
    if response.status_code == 200:
        person_setting = response.json()
        person_setting['companyDescriptor'] = new_company_id
        update_url = '{0}api/v1/person/time_punch_card_setting/{1}'.format(
                EnvironmentUtility.get_active_settings().time_tracking_base_url,
                person_setting['_id'])
        response = web_request_util.put(update_url, person_setting)
        print "Update punch_card setting response for user {}. Response: {}".format(encoded_user_id, response)
    else:
        print "Punch_card_setting is not available for user {}".format(encoded_user_id)

def main():
    user_id_list=[645, 647,650,653,657,659,660,661,663,666,667,668,671,672,677,678,682,719,718,716,748,752,944,945,946,958,985,999]
    old_company_id=31
    new_company_id=34

    # PLEASE TOGGLE THE ENVIRONMENT TO PRODUCTION WHEN READY TO MAKE THE CHANGE
    EnvironmentUtility.set_active_environment(ENVIRONMENT_PROD)
    encoded_old_comp_id = hash_key_util.encode_key_with_environment(old_company_id)
    encoded_new_comp_id = hash_key_util.encode_key_with_environment(new_company_id)

    company_punch_card_settings_url = '{0}api/v1/company/{1}/time_punch_card_setting'.format(
            EnvironmentUtility.get_active_settings().time_tracking_base_url,
            encoded_old_comp_id
        )

    company_punch_card_setting_response = web_request_util.get(company_punch_card_settings_url)
    if company_punch_card_setting_response.status_code == 200:
        company_punch_card_setting = company_punch_card_setting_response.json()
        if company_punch_card_setting:
            company_punch_card_setting['companyDescriptor'] = encoded_new_comp_id
            del company_punch_card_setting['_id']
            del company_punch_card_setting['__v']
            del company_punch_card_setting['createdTimestamp']
            del company_punch_card_setting['modifiedTimestamp']
            comp_setting_response = web_request_util.post('{0}api/v1/company/time_punch_card_setting'.format(
                    EnvironmentUtility.get_active_settings().time_tracking_base_url), company_punch_card_setting)
            print "Created company punch_card_setting with response {}".format(comp_setting_response)

    for user_id in user_id_list:
        encoded_user_id = hash_key_util.encode_key_with_environment(user_id)

        # First let's update time punch cards
        update_time_punch_cards(encoded_user_id, encoded_new_comp_id)
        
        # Then let's update time off requests
        update_timeoff_requests(encoded_user_id, encoded_new_comp_id)

        update_timeoff_quota(encoded_user_id, encoded_new_comp_id)

        update_person_punch_card_settings(encoded_user_id, encoded_new_comp_id)

if __name__ == '__main__':
    main()
