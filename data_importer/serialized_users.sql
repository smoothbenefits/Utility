DO $$
DECLARE
  company_id int := 23;
BEGIN
raise notice 'The company_id to start is %', company_id;

DECLARE
  user_id_1 int;
  person_id_1 int;
  company_user_id_1 int; 
  usercompanybenefitplanoption_id_1 int;
  usercompanybenefitplanoption_id_1_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tinaleclair@fairviewhealthcare.com', 't', 'f', 'f', 'Tina', 'Leclair', now(), now())
  RETURNING id into user_id_1;
  raise notice 'The user_id_1 after insert is %', user_id_1;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_1)
  RETURNING id into company_user_id_1;
  raise notice 'The company_user_id_1 is %', company_user_id_1;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_1)
  RETURNING id into usercompanybenefitplanoption_id_1;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_1)
  RETURNING id into usercompanybenefitplanoption_id_1_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tina', '', 'Leclair', '', 'self', 'ALeCc_gfHM4svAJOBuktmKuv0GpJ3L7WSyDn8fgQwUpgAQr4oXmptabTMmdqSkE79xmwRJFMvCc5', '1983-02-06', 'F', company_id, user_id_1, '')
  RETURNING id into person_id_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '5 Tsiennato Rd', '#162', 'Derry', 'NH', '03038', company_id, person_id_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032312889', person_id_1);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_1, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_1, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('E13699', person_id_1, usercompanybenefitplanoption_id_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_1, usercompanybenefitplanoption_id_1_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(50000.0, now(), now(), 17, person_id_1, user_id_1);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_1);

END;


DECLARE
  user_id_2 int;
  person_id_2 int;
  company_user_id_2 int; 
  usercompanybenefitplanoption_id_2 int;
  usercompanybenefitplanoption_id_2_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'selinafletcher@fairviewhealthcare.com', 't', 'f', 'f', 'Selina', 'Fletcher', now(), now())
  RETURNING id into user_id_2;
  raise notice 'The user_id_2 after insert is %', user_id_2;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_2)
  RETURNING id into company_user_id_2;
  raise notice 'The company_user_id_2 is %', company_user_id_2;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_2)
  RETURNING id into usercompanybenefitplanoption_id_2;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_2)
  RETURNING id into usercompanybenefitplanoption_id_2_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Selina', '', 'Fletcher', '', 'self', 'ALeCc_j1TFoPQU-h9zGv-gsIYiyFgUPxi3Gbrja7hSi3jWGZxHIgwIHArPk-8B3Pxn73aeHWf6Ez', '1978-12-11', 'F', company_id, user_id_2, '')
  RETURNING id into person_id_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '105 SPIT BROOK RD', 'APT 16B', 'NASHUA', 'NH', '03062.0', company_id, person_id_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8179832986', person_id_2);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2014-09-04', 'FullTime', 'Active', now(), now(), person_id_2, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '09/04/2014', now(), now(), company_id, person_id_2, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA128700', person_id_2, usercompanybenefitplanoption_id_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_2, usercompanybenefitplanoption_id_2_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(24000.0, now(), now(), 17, person_id_2, user_id_2);

END;


DECLARE
  user_id_3 int;
  person_id_3 int;
  company_user_id_3 int; 
  usercompanybenefitplanoption_id_3 int;
  usercompanybenefitplanoption_id_3_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'susantrubacz@fairviewhealthcare.com', 't', 'f', 'f', 'Susan', 'Trubacz', now(), now())
  RETURNING id into user_id_3;
  raise notice 'The user_id_3 after insert is %', user_id_3;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_3)
  RETURNING id into company_user_id_3;
  raise notice 'The company_user_id_3 is %', company_user_id_3;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_3);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_3)
  RETURNING id into usercompanybenefitplanoption_id_3_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Susan', '', 'Trubacz', '', 'self', '', '1990-10-09', 'F', company_id, user_id_3, '')
  RETURNING id into person_id_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Cottonwood Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_3);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21450.0, '2015-03-02', 'FullTime', 'Active', now(), now(), person_id_3, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '03/02/2015', now(), now(), company_id, person_id_3, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_3, usercompanybenefitplanoption_id_3_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_3, user_id_3);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_3, 0, 250.0);

END;


DECLARE
  user_id_4 int;
  person_id_4 int;
  company_user_id_4 int; 
  usercompanybenefitplanoption_id_4 int;
  usercompanybenefitplanoption_id_4_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresewarrington@fairviewhealthcare.com', 't', 'f', 'f', 'Therese', 'Warrington', now(), now())
  RETURNING id into user_id_4;
  raise notice 'The user_id_4 after insert is %', user_id_4;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_4)
  RETURNING id into company_user_id_4;
  raise notice 'The company_user_id_4 is %', company_user_id_4;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_4);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_4);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Therese', '', 'Warrington', '', 'self', '', '1962-09-28', 'F', company_id, user_id_4, '')
  RETURNING id into person_id_4;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Birch St', '', 'Hudson', 'NH', '03051', company_id, person_id_4);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19721.0, '2015-02-09', 'FullTime', 'Active', now(), now(), person_id_4, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19721.0, '02/09/2015', now(), now(), company_id, person_id_4, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(20000.0, now(), now(), 17, person_id_4, user_id_4);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_4, 3, 3, null, 20000.0, null);

END;


DECLARE
  user_id_5 int;
  person_id_5 int;
  company_user_id_5 int; 
  usercompanybenefitplanoption_id_5 int;
  usercompanybenefitplanoption_id_5_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kristinmaffee@fairviewhealthcare.com', 't', 'f', 'f', 'Kristin', 'Maffee', now(), now())
  RETURNING id into user_id_5;
  raise notice 'The user_id_5 after insert is %', user_id_5;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_5)
  RETURNING id into company_user_id_5;
  raise notice 'The company_user_id_5 is %', company_user_id_5;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_5)
  RETURNING id into usercompanybenefitplanoption_id_5;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_5)
  RETURNING id into usercompanybenefitplanoption_id_5_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kristin', '', 'Maffee', '', 'self', 'ALeCc_jCVWTfTqXt8rlmQi3AG50sydZVqCeejJ1cO0GB-HvubjyjcXWUla6iZVBDoLn0mPEarqxm', '1959-06-02', 'F', company_id, user_id_5, '')
  RETURNING id into person_id_5;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO Box 159', '379 Amhearst Street', 'Nashua', 'NH', '03063', company_id, person_id_5);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033052974', person_id_5);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_5, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31000.0, '06/09/2014', now(), now(), company_id, person_id_5, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('E12436', person_id_5, usercompanybenefitplanoption_id_5);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_5, usercompanybenefitplanoption_id_5_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(31000.0, now(), now(), 17, person_id_5, user_id_5);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_5);

END;


DECLARE
  user_id_6 int;
  person_id_6 int;
  family_member_id_6_0 int;
  company_user_id_6 int; 
  usercompanybenefitplanoption_id_6 int;
  usercompanybenefitplanoption_id_6_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jereneveilleux@fairviewhealthcare.com', 't', 'f', 'f', 'Jerene', 'Veilleux', now(), now())
  RETURNING id into user_id_6;
  raise notice 'The user_id_6 after insert is %', user_id_6;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_6)
  RETURNING id into company_user_id_6;
  raise notice 'The company_user_id_6 is %', company_user_id_6;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_6)
  RETURNING id into usercompanybenefitplanoption_id_6;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_6)
  RETURNING id into usercompanybenefitplanoption_id_6_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jerene', '', 'Veilleux', '', 'self', 'ALeCc_hXER-nUwj_RyloWHHWhuTrAxbXh1urdRGnvfxHL3qm5eMGYErF_AfE2q-zh6kEQLunngjg', '1967-06-21', 'F', company_id, user_id_6, '')
  RETURNING id into person_id_6;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Charles Bancroft Hwy', '', 'Litchfield', 'NH', '03052', company_id, person_id_6);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035217174', person_id_6);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-03-31', 'FullTime', 'Active', now(), now(), person_id_6, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '03/31/2015', now(), now(), company_id, person_id_6, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('G99011', person_id_6, usercompanybenefitplanoption_id_6);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_6, usercompanybenefitplanoption_id_6_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(55000.0, now(), now(), 17, person_id_6, user_id_6);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, 50000.0, null, 0, 0, 0, now(), now(), 12, person_id_6, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_6, 0, 350.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_6);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Stephane', '', 'Veilleux', '', 'spouse', 'ALeCc_jCStE9B9ssnGrpNL05vTT2UI1A--Rc4pa9ih22Rq8mbXOHOR9Wemxf7U4dgXNesGwIrqr9', '1969-02-22', 'M', company_id, user_id_6, '')
  RETURNING id into family_member_id_6_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 CHARLES BANCROFT HWY', 'None', 'LITCHFIELD', 'NH', '03052.0', company_id, family_member_id_6_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035217174', family_member_id_6_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('G99011', family_member_id_6_0, usercompanybenefitplanoption_id_6);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_6_0, usercompanybenefitplanoption_id_6_dental);

END;


DECLARE
  user_id_7 int;
  person_id_7 int;
  company_user_id_7 int; 
  usercompanybenefitplanoption_id_7 int;
  usercompanybenefitplanoption_id_7_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dianezacher@fairviewhealthcare.com', 't', 'f', 'f', 'Diane', 'Zacher', now(), now())
  RETURNING id into user_id_7;
  raise notice 'The user_id_7 after insert is %', user_id_7;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_7)
  RETURNING id into company_user_id_7;
  raise notice 'The company_user_id_7 is %', company_user_id_7;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_7)
  RETURNING id into usercompanybenefitplanoption_id_7;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_7)
  RETURNING id into usercompanybenefitplanoption_id_7_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diane', '', 'Zacher', '', 'self', 'ALeCc_j_lAXFg1IGJZO7cyWuB1AagioEq72SZAOChl1T75yqXxZKFpq-B4keCwljhQvU3O5iYEOx', '1956-10-03', 'F', company_id, user_id_7, '')
  RETURNING id into person_id_7;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Anvil Dr', '', 'Nashua', 'NH', '03060', company_id, person_id_7);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039307795', person_id_7);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25324.0, '2013-12-11', 'FullTime', 'Active', now(), now(), person_id_7, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25324.0, '12/11/2013', now(), now(), company_id, person_id_7, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA23226', person_id_7, usercompanybenefitplanoption_id_7);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_7, usercompanybenefitplanoption_id_7_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(26000.0, now(), now(), 17, person_id_7, user_id_7);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_7, 0, 100.0);

END;


DECLARE
  user_id_8 int;
  person_id_8 int;
  company_user_id_8 int; 
  usercompanybenefitplanoption_id_8 int;
  usercompanybenefitplanoption_id_8_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'emilyinglis@fairviewhealthcare.com', 't', 'f', 'f', 'Emily', 'Inglis', now(), now())
  RETURNING id into user_id_8;
  raise notice 'The user_id_8 after insert is %', user_id_8;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_8)
  RETURNING id into company_user_id_8;
  raise notice 'The company_user_id_8 is %', company_user_id_8;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_8)
  RETURNING id into usercompanybenefitplanoption_id_8;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_8)
  RETURNING id into usercompanybenefitplanoption_id_8_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', 'S', 'Inglis', '', 'self', 'ALeCc_iXCZeeWqVcP2_75A9ytLkJjRorGzr7get0GOHehF1Qjdkm8KgHb7wV_tsbtgo58nbkZJRL', '1987-06-05', 'F', company_id, user_id_8, '')
  RETURNING id into person_id_8;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Windham Dr', '', 'Concord', 'NH', '03301', company_id, person_id_8);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038607924', person_id_8);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46342.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_8, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46342.4, '09/01/2008', now(), now(), company_id, person_id_8, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA161866', person_id_8, usercompanybenefitplanoption_id_8);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_8, usercompanybenefitplanoption_id_8_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(47000.0, now(), now(), 17, person_id_8, user_id_8);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_8, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_8, 0, 550.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_8, 0, 1600.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_8);

END;


DECLARE
  user_id_9 int;
  person_id_9 int;
  company_user_id_9 int; 
  usercompanybenefitplanoption_id_9 int;
  usercompanybenefitplanoption_id_9_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'catherinelajoie@fairviewhealthcare.com', 't', 'f', 'f', 'Catherine', 'Lajoie', now(), now())
  RETURNING id into user_id_9;
  raise notice 'The user_id_9 after insert is %', user_id_9;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_9)
  RETURNING id into company_user_id_9;
  raise notice 'The company_user_id_9 is %', company_user_id_9;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_9);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_9);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Catherine', '', 'Lajoie', '', 'self', '', '1974-04-27', 'F', company_id, user_id_9, '')
  RETURNING id into person_id_9;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20 McKean St', '', 'Nashua', 'NH', '03060', company_id, person_id_9);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_9, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_9, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(42000.0, now(), now(), 17, person_id_9, user_id_9);

END;


DECLARE
  user_id_10 int;
  person_id_10 int;
  company_user_id_10 int; 
  usercompanybenefitplanoption_id_10 int;
  usercompanybenefitplanoption_id_10_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robinluciano@fairviewhealthcare.com', 't', 'f', 'f', 'Robin', 'Luciano', now(), now())
  RETURNING id into user_id_10;
  raise notice 'The user_id_10 after insert is %', user_id_10;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_10)
  RETURNING id into company_user_id_10;
  raise notice 'The company_user_id_10 is %', company_user_id_10;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_10)
  RETURNING id into usercompanybenefitplanoption_id_10;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_10)
  RETURNING id into usercompanybenefitplanoption_id_10_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robin', '', 'Luciano', '', 'self', 'ALeCc_jKIWuD2lO5yFzGxQSGiCJAT1ETxaJr5dVo98V6CIXr0RhKf7Lkh7_DsPBWdd8zhuNPsC06', '1974-12-14', 'F', company_id, user_id_10, '')
  RETURNING id into person_id_10;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '23b Chandler Ct', '', 'Hudson', 'NH', '03051', company_id, person_id_10);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9788088398', person_id_10);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_10, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '08/04/2014', now(), now(), company_id, person_id_10, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F43395', person_id_10, usercompanybenefitplanoption_id_10);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_10, usercompanybenefitplanoption_id_10_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(55000.0, now(), now(), 17, person_id_10, user_id_10);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_10, 0, 400.0);

END;


DECLARE
  user_id_11 int;
  person_id_11 int;
  family_member_id_11_0 int;
  company_user_id_11 int; 
  usercompanybenefitplanoption_id_11 int;
  usercompanybenefitplanoption_id_11_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'angelakraus@fairviewhealthcare.com', 't', 'f', 'f', 'Angela', 'Kraus', now(), now())
  RETURNING id into user_id_11;
  raise notice 'The user_id_11 after insert is %', user_id_11;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_11)
  RETURNING id into company_user_id_11;
  raise notice 'The company_user_id_11 is %', company_user_id_11;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_11)
  RETURNING id into usercompanybenefitplanoption_id_11;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_11)
  RETURNING id into usercompanybenefitplanoption_id_11_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Angela', 'J', 'Kraus', '', 'self', 'ALeCc_gSuJ8ef1U7BzwemXsyCfafw_89dlWfx6kEoqbup8MyKZu-xPTcbeWzOCsCMCirPDnRrZTM', '1980-08-21', 'F', company_id, user_id_11, '')
  RETURNING id into person_id_11;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 A Shadowbrook Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_11);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038094297', person_id_11);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62400.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_11, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62400.0, '09/01/2008', now(), now(), company_id, person_id_11, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('LH0088', person_id_11, usercompanybenefitplanoption_id_11);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_11, usercompanybenefitplanoption_id_11_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(125000.0, now(), now(), 17, person_id_11, user_id_11);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(250000.0, 50000.0, 10000.0, 0, 0, 0, now(), now(), 12, person_id_11, 3, 3, null, 250000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_11, 0, 700.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_11, 0, 3100.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_11);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Matthew', '', 'Kraus', '', 'spouse', 'ALeCc_jatNA3yoWTZoSAJSD_FpEwMdhfJVM8MsGi2JWPFNQc3BeNwkw1okYYrUVgDTegtSqUvBwz', '1978-02-16', 'M', company_id, user_id_11, '')
  RETURNING id into family_member_id_11_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29A SHADOWBROOK DR', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_11_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038094297', family_member_id_11_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('694219.0', family_member_id_11_0, usercompanybenefitplanoption_id_11);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_11_0, usercompanybenefitplanoption_id_11_dental);

END;


DECLARE
  user_id_12 int;
  person_id_12 int;
  company_user_id_12 int; 
  usercompanybenefitplanoption_id_12 int;
  usercompanybenefitplanoption_id_12_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kristinenutter@fairviewhealthcare.com', 't', 'f', 'f', 'Kristine', 'Nutter', now(), now())
  RETURNING id into user_id_12;
  raise notice 'The user_id_12 after insert is %', user_id_12;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_12)
  RETURNING id into company_user_id_12;
  raise notice 'The company_user_id_12 is %', company_user_id_12;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_12);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_12);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kristine', '', 'Nutter', '', 'self', '', '1967-04-21', 'F', company_id, user_id_12, '')
  RETURNING id into person_id_12;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '97 Ansonia Ave', '', 'Dracut', 'NH', '01826', company_id, person_id_12);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58552.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_12, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58552.0, '09/01/2008', now(), now(), company_id, person_id_12, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(118000.0, now(), now(), 17, person_id_12, user_id_12);

END;


DECLARE
  user_id_13 int;
  person_id_13 int;
  company_user_id_13 int; 
  usercompanybenefitplanoption_id_13 int;
  usercompanybenefitplanoption_id_13_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tashavancelette@fairviewhealthcare.com', 't', 'f', 'f', 'Tasha', 'Vancelette', now(), now())
  RETURNING id into user_id_13;
  raise notice 'The user_id_13 after insert is %', user_id_13;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_13)
  RETURNING id into company_user_id_13;
  raise notice 'The company_user_id_13 is %', company_user_id_13;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_13);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_13);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tasha', '', 'Vancelette', '', 'self', '', '1974-01-21', 'F', company_id, user_id_13, '')
  RETURNING id into person_id_13;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Pierce St', '', 'Nashua', 'NH', '03060', company_id, person_id_13);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20280.0, '2014-08-14', 'FullTime', 'Active', now(), now(), person_id_13, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20280.0, '08/14/2014', now(), now(), company_id, person_id_13, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_13, user_id_13);

END;


DECLARE
  user_id_14 int;
  person_id_14 int;
  company_user_id_14 int; 
  usercompanybenefitplanoption_id_14 int;
  usercompanybenefitplanoption_id_14_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alyssamackay@fairviewhealthcare.com', 't', 'f', 'f', 'Alyssa', 'Mackay', now(), now())
  RETURNING id into user_id_14;
  raise notice 'The user_id_14 after insert is %', user_id_14;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_14)
  RETURNING id into company_user_id_14;
  raise notice 'The company_user_id_14 is %', company_user_id_14;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_14);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_14);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alyssa', '', 'Mackay', '', 'self', '', '1988-05-07', 'F', company_id, user_id_14, '')
  RETURNING id into person_id_14;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Chestnut Street', '', 'Hudson', 'NH', '03051', company_id, person_id_14);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46000.0, '2013-09-01', 'FullTime', 'Active', now(), now(), person_id_14, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '09/01/2013', now(), now(), company_id, person_id_14, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_14, user_id_14);

END;


DECLARE
  user_id_15 int;
  person_id_15 int;
  company_user_id_15 int; 
  usercompanybenefitplanoption_id_15 int;
  usercompanybenefitplanoption_id_15_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brittanyshay@fairviewhealthcare.com', 't', 'f', 'f', 'Brittany', 'Shay', now(), now())
  RETURNING id into user_id_15;
  raise notice 'The user_id_15 after insert is %', user_id_15;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_15)
  RETURNING id into company_user_id_15;
  raise notice 'The company_user_id_15 is %', company_user_id_15;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_15)
  RETURNING id into usercompanybenefitplanoption_id_15;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_15)
  RETURNING id into usercompanybenefitplanoption_id_15_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brittany', '', 'Shay', '', 'self', 'ALeCc_iL40XdQNvc6bDbkdybtx7aw19gvt3g0Xq2osy21CFWJL6Ey7p1aE_liNrHPD6fGl8l7lZM', '1990-07-12', 'F', company_id, user_id_15, '')
  RETURNING id into person_id_15;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Tolles St', '', 'Nashua', 'NH', '03064', company_id, person_id_15);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038975852', person_id_15);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-10-12', 'FullTime', 'Active', now(), now(), person_id_15, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '10/12/2014', now(), now(), company_id, person_id_15, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA151118', person_id_15, usercompanybenefitplanoption_id_15);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_15, usercompanybenefitplanoption_id_15_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_15, user_id_15);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_15, 0, 300.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_15);

END;


DECLARE
  user_id_16 int;
  person_id_16 int;
  company_user_id_16 int; 
  usercompanybenefitplanoption_id_16 int;
  usercompanybenefitplanoption_id_16_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'maureenamadi@fairviewhealthcare.com', 't', 'f', 'f', 'Maureen', 'Amadi', now(), now())
  RETURNING id into user_id_16;
  raise notice 'The user_id_16 after insert is %', user_id_16;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_16)
  RETURNING id into company_user_id_16;
  raise notice 'The company_user_id_16 is %', company_user_id_16;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_16);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_16);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maureen', '', 'Amadi', '', 'self', '', '1974-06-27', 'F', company_id, user_id_16, '')
  RETURNING id into person_id_16;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.0, '2011-05-05', 'FullTime', 'Active', now(), now(), person_id_16, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20962.0, '05/05/2011', now(), now(), company_id, person_id_16, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_16, user_id_16);

END;


DECLARE
  user_id_17 int;
  person_id_17 int;
  company_user_id_17 int; 
  usercompanybenefitplanoption_id_17 int;
  usercompanybenefitplanoption_id_17_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katiepicard@fairviewhealthcare.com', 't', 'f', 'f', 'Katie', 'Picard', now(), now())
  RETURNING id into user_id_17;
  raise notice 'The user_id_17 after insert is %', user_id_17;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_17)
  RETURNING id into company_user_id_17;
  raise notice 'The company_user_id_17 is %', company_user_id_17;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_17);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_17);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katie', '', 'Picard', '', 'self', '', '1997-10-09', 'F', company_id, user_id_17, '')
  RETURNING id into person_id_17;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '12 Stonewood Lane', '', 'Hudson', 'NH', '03051', company_id, person_id_17);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 18720.0, '2014-08-18', 'FullTime', 'Active', now(), now(), person_id_17, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(18720.0, '08/18/2014', now(), now(), company_id, person_id_17, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(19000.0, now(), now(), 17, person_id_17, user_id_17);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_17, 3, 3, null, null, null);

END;


DECLARE
  user_id_18 int;
  person_id_18 int;
  company_user_id_18 int; 
  usercompanybenefitplanoption_id_18 int;
  usercompanybenefitplanoption_id_18_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'daniellequinn@fairviewhealthcare.com', 't', 'f', 'f', 'Danielle', 'Quinn', now(), now())
  RETURNING id into user_id_18;
  raise notice 'The user_id_18 after insert is %', user_id_18;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_18)
  RETURNING id into company_user_id_18;
  raise notice 'The company_user_id_18 is %', company_user_id_18;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_18)
  RETURNING id into usercompanybenefitplanoption_id_18;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_18)
  RETURNING id into usercompanybenefitplanoption_id_18_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danielle', '', 'Quinn', '', 'self', 'ALeCc_hGgIXi-1zg4LxtPOgCCVxUfnbv5ayBRua-emluTKHu8J_Y1UDKj-RlPub3C5zoIJ8DmNez', '1980-06-16', 'F', company_id, user_id_18, '')
  RETURNING id into person_id_18;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 WASHINGTON CIR', '', 'HILLSBOROUGH', 'NH', '03244.0', company_id, person_id_18);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033450151', person_id_18);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 55000.0, '2014-01-15', 'FullTime', 'Active', now(), now(), person_id_18, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(55000.0, '01/15/2014', now(), now(), company_id, person_id_18, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('692614.0', person_id_18, usercompanybenefitplanoption_id_18);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_18, usercompanybenefitplanoption_id_18_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(110000.0, now(), now(), 17, person_id_18, user_id_18);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, 10000.0, null, 0, 0, 0, now(), now(), 12, person_id_18, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_18, 0, 600.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_18);

END;


DECLARE
  user_id_19 int;
  person_id_19 int;
  company_user_id_19 int; 
  usercompanybenefitplanoption_id_19 int;
  usercompanybenefitplanoption_id_19_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carolynbeaulieu@fairviewhealthcare.com', 't', 'f', 'f', 'Carolyn', 'Beaulieu', now(), now())
  RETURNING id into user_id_19;
  raise notice 'The user_id_19 after insert is %', user_id_19;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_19)
  RETURNING id into company_user_id_19;
  raise notice 'The company_user_id_19 is %', company_user_id_19;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_19)
  RETURNING id into usercompanybenefitplanoption_id_19;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_19)
  RETURNING id into usercompanybenefitplanoption_id_19_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carolyn', 'S', 'Beaulieu', '', 'self', 'ALeCc_iJhPY0VeHcJDjKBT3L0HyMKrlmKlxlI6AX7V6inMwKss2HpWJK_pe9eKG2_5x6a36NZhyI', '1953-08-27', 'F', company_id, user_id_19, '')
  RETURNING id into person_id_19;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '86-9 Sargent Station Rd', '', 'Weare', 'NH', '03281', company_id, person_id_19);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035666314', person_id_19);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 42577.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_19, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(42577.6, '09/01/2008', now(), now(), company_id, person_id_19, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('D60815', person_id_19, usercompanybenefitplanoption_id_19);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_19, usercompanybenefitplanoption_id_19_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(43000.0, now(), now(), 17, person_id_19, user_id_19);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_19, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_19, 0, 500.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_19);

END;


DECLARE
  user_id_20 int;
  person_id_20 int;
  company_user_id_20 int; 
  usercompanybenefitplanoption_id_20 int;
  usercompanybenefitplanoption_id_20_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carlawholey@fairviewhealthcare.com', 't', 'f', 'f', 'Carla', 'Wholey', now(), now())
  RETURNING id into user_id_20;
  raise notice 'The user_id_20 after insert is %', user_id_20;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_20)
  RETURNING id into company_user_id_20;
  raise notice 'The company_user_id_20 is %', company_user_id_20;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_20);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_20);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carla', '', 'Wholey', '', 'self', '', '1963-06-08', 'F', company_id, user_id_20, '')
  RETURNING id into person_id_20;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2011-03-03', 'FullTime', 'Active', now(), now(), person_id_20, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '03/03/2011', now(), now(), company_id, person_id_20, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_20, user_id_20);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_20, 0, 400.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_20, 0, 1700.0);

END;


DECLARE
  user_id_21 int;
  person_id_21 int;
  family_member_id_21_1 int;
  family_member_id_21_0 int;
  family_member_id_21_2 int;
  company_user_id_21 int; 
  usercompanybenefitplanoption_id_21 int;
  usercompanybenefitplanoption_id_21_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'roberthutchings@fairviewhealthcare.com', 't', 'f', 'f', 'Robert', 'Hutchings', now(), now())
  RETURNING id into user_id_21;
  raise notice 'The user_id_21 after insert is %', user_id_21;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_21)
  RETURNING id into company_user_id_21;
  raise notice 'The company_user_id_21 is %', company_user_id_21;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_21)
  RETURNING id into usercompanybenefitplanoption_id_21;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_21)
  RETURNING id into usercompanybenefitplanoption_id_21_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robert', '', 'Hutchings', '', 'self', 'ALeCc_jn6Cl1zbiDt6Xce_7gb1AdYeZWdSLPPAAlADCieCb6rChE50tQvTFy98CRkIWeACvsE-YJ', '1952-03-14', 'M', company_id, user_id_21, '')
  RETURNING id into person_id_21;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Quill Lane', '', 'Salem', 'NH', '03079', company_id, person_id_21);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_21);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2013-03-01', 'FullTime', 'Active', now(), now(), person_id_21, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '03/01/2013', now(), now(), company_id, person_id_21, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA186074', person_id_21, usercompanybenefitplanoption_id_21);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_21, usercompanybenefitplanoption_id_21_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(17000.0, now(), now(), 17, person_id_21, user_id_21);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_21);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kelly', '', 'Hutchings', '', 'dependent', 'ALeCc_hFZZycdpFAJRFJiZy8aBYGY0FraOCCp9TrBzjOuKGO13EftE7uLckbCUHIk-82XsrZuyDa', '1999-02-03', 'F', company_id, user_id_21, '')
  RETURNING id into family_member_id_21_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_21_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', family_member_id_21_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA1997', family_member_id_21_1, usercompanybenefitplanoption_id_21);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_21_1, usercompanybenefitplanoption_id_21_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Cynthia', '', 'Hutchings', '', 'spouse', 'ALeCc_j7T-BPJCrGfS1RijcT_fxcL07tPRWSI5GCeHA_ZDwc92PvtoSQFONTxMwZN3r0a-q3vmTL', '1952-06-11', 'F', company_id, user_id_21, '')
  RETURNING id into family_member_id_21_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_21_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9788571137', family_member_id_21_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('C65863', family_member_id_21_0, usercompanybenefitplanoption_id_21);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_21_0, usercompanybenefitplanoption_id_21_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Joshua', '', 'Hutchings', '', 'dependent', 'ALeCc_jihB2MDod6nGvAjIaSAc3plIbPTUkW1gC7kGzpw8KKKT3ZmK505LZWluPnoce_GEcUGTZJ', '1990-01-02', 'M', company_id, user_id_21, '')
  RETURNING id into family_member_id_21_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_21_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', family_member_id_21_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA39509', family_member_id_21_2, usercompanybenefitplanoption_id_21);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_21_2, usercompanybenefitplanoption_id_21_dental);

END;


DECLARE
  user_id_22 int;
  person_id_22 int;
  company_user_id_22 int; 
  usercompanybenefitplanoption_id_22 int;
  usercompanybenefitplanoption_id_22_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'darlenecross@fairviewhealthcare.com', 't', 'f', 'f', 'Darlene', 'Cross', now(), now())
  RETURNING id into user_id_22;
  raise notice 'The user_id_22 after insert is %', user_id_22;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_22)
  RETURNING id into company_user_id_22;
  raise notice 'The company_user_id_22 is %', company_user_id_22;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_22)
  RETURNING id into usercompanybenefitplanoption_id_22;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_22);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Darlene', '', 'Cross', '', 'self', 'ALeCc_h47BaTe3IKP435HPvU1eJ_E1n5xpb3ZfHMBOo0oVWa_mWQx4l12O_N7qfeXbmllLA2W2v2', '1962-05-25', 'F', company_id, user_id_22, '')
  RETURNING id into person_id_22;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '66 Farmwood Drive', '', 'Nashua', 'NH', '03062', company_id, person_id_22);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_22, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '06/09/2014', now(), now(), company_id, person_id_22, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('400094.0', person_id_22, usercompanybenefitplanoption_id_22);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_22, user_id_22);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_22);

END;


DECLARE
  user_id_23 int;
  person_id_23 int;
  company_user_id_23 int; 
  usercompanybenefitplanoption_id_23 int;
  usercompanybenefitplanoption_id_23_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'christinecarpenter@fairviewhealthcare.com', 't', 'f', 'f', 'Christine', 'Carpenter', now(), now())
  RETURNING id into user_id_23;
  raise notice 'The user_id_23 after insert is %', user_id_23;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_23)
  RETURNING id into company_user_id_23;
  raise notice 'The company_user_id_23 is %', company_user_id_23;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_23);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_23);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Christine', '', 'Carpenter', '', 'self', '', '1968-05-06', 'F', company_id, user_id_23, '')
  RETURNING id into person_id_23;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1391 Union Street', '', 'Manchester', 'NH', '03104', company_id, person_id_23);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37440.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_23, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '05/11/2015', now(), now(), company_id, person_id_23, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(38000.0, now(), now(), 17, person_id_23, user_id_23);

END;


DECLARE
  user_id_24 int;
  person_id_24 int;
  company_user_id_24 int; 
  usercompanybenefitplanoption_id_24 int;
  usercompanybenefitplanoption_id_24_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'stephaniesaouma@fairviewhealthcare.com', 't', 'f', 'f', 'Stephanie', 'Saouma', now(), now())
  RETURNING id into user_id_24;
  raise notice 'The user_id_24 after insert is %', user_id_24;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_24)
  RETURNING id into company_user_id_24;
  raise notice 'The company_user_id_24 is %', company_user_id_24;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_24)
  RETURNING id into usercompanybenefitplanoption_id_24;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_24)
  RETURNING id into usercompanybenefitplanoption_id_24_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', 'A', 'Saouma', '', 'self', 'ALeCc_jjPEHtxndtSSgb7ZCdWGAAWRMK5kLbmyUYc1VCoJhyq8hEjc2sHXDAu-DpZBsZaR4NDauv', '1967-06-02', 'F', company_id, user_id_24, '')
  RETURNING id into person_id_24;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1301 Bodwell Rd', 'Apt 9', 'Manchester', 'NH', '03109', company_id, person_id_24);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035401487', person_id_24);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 44283.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_24, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(44283.2, '09/01/2008', now(), now(), company_id, person_id_24, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('691861.0', person_id_24, usercompanybenefitplanoption_id_24);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_24, usercompanybenefitplanoption_id_24_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(45000.0, now(), now(), 17, person_id_24, user_id_24);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(40000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_24, 3, 3, null, null, null);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_24);

END;


DECLARE
  user_id_25 int;
  person_id_25 int;
  company_user_id_25 int; 
  usercompanybenefitplanoption_id_25 int;
  usercompanybenefitplanoption_id_25_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carlawholey1@fairviewhealthcare.com', 't', 'f', 'f', 'Carla', 'Wholey', now(), now())
  RETURNING id into user_id_25;
  raise notice 'The user_id_25 after insert is %', user_id_25;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_25)
  RETURNING id into company_user_id_25;
  raise notice 'The company_user_id_25 is %', company_user_id_25;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_25);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_25);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carla', '', 'Wholey', '', 'self', '', '1989-02-27', 'F', company_id, user_id_25, '')
  RETURNING id into person_id_25;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '56 Rangers Road', '', 'Hudson', 'NH', '03051', company_id, person_id_25);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2010-06-07', 'FullTime', 'Active', now(), now(), person_id_25, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '06/07/2010', now(), now(), company_id, person_id_25, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_25, user_id_25);

END;


DECLARE
  user_id_26 int;
  person_id_26 int;
  company_user_id_26 int; 
  usercompanybenefitplanoption_id_26 int;
  usercompanybenefitplanoption_id_26_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katherinephilbrick@fairviewhealthcare.com', 't', 'f', 'f', 'Katherine', 'Philbrick', now(), now())
  RETURNING id into user_id_26;
  raise notice 'The user_id_26 after insert is %', user_id_26;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_26)
  RETURNING id into company_user_id_26;
  raise notice 'The company_user_id_26 is %', company_user_id_26;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_26)
  RETURNING id into usercompanybenefitplanoption_id_26;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_26)
  RETURNING id into usercompanybenefitplanoption_id_26_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', 'S', 'Philbrick', '', 'self', 'ALeCc_hRstxEeXUa_GZ2ntTjanzyL4LbZSyxtHFUt8jIiN7q5SCYEoZY4H0kspXrzVnoyDJMjhbp', '1970-08-18', 'F', company_id, user_id_26, '')
  RETURNING id into person_id_26;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Oliver Drive', '', 'Hudson', 'NH', '03061', company_id, person_id_26);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799356', person_id_26);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2012-05-29', 'FullTime', 'Active', now(), now(), person_id_26, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '05/29/2012', now(), now(), company_id, person_id_26, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('D60815', person_id_26, usercompanybenefitplanoption_id_26);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_26, usercompanybenefitplanoption_id_26_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_26, user_id_26);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_26);

END;


DECLARE
  user_id_27 int;
  person_id_27 int;
  family_member_id_27_0 int;
  company_user_id_27 int; 
  usercompanybenefitplanoption_id_27 int;
  usercompanybenefitplanoption_id_27_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'mariadube@fairviewhealthcare.com', 't', 'f', 'f', 'Maria', 'Dube', now(), now())
  RETURNING id into user_id_27;
  raise notice 'The user_id_27 after insert is %', user_id_27;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_27)
  RETURNING id into company_user_id_27;
  raise notice 'The company_user_id_27 is %', company_user_id_27;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 289, user_id_27)
  RETURNING id into usercompanybenefitplanoption_id_27;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_27)
  RETURNING id into usercompanybenefitplanoption_id_27_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', 'A', 'Dube', '', 'self', 'ALeCc_hSw9YaZdaL_yQmtxQDgHBo-VSDcmqd_59kWQq818dkTBZgSsUkdQfDsxySR9_uGzWLI5Hz', '1965-12-18', 'F', company_id, user_id_27, '')
  RETURNING id into person_id_27;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 303', '', 'NASHUA', 'NH', '03061.0', company_id, person_id_27);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032615090', person_id_27);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 60320.0, '2013-11-01', 'FullTime', 'Active', now(), now(), person_id_27, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(60320.0, '11/01/2013', now(), now(), company_id, person_id_27, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA97577', person_id_27, usercompanybenefitplanoption_id_27);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_27, usercompanybenefitplanoption_id_27_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(61000.0, now(), now(), 17, person_id_27, user_id_27);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(120000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_27, 3, 3, null, 120000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_27, 0, 700.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_27, 0, 3000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_27);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Hannah', '', 'Tomaszewski', '', 'dependent', 'ALeCc_ibDXb8zvkteUxVwaS2r6pinZ7o4uryjZL8bL16CmlM8rl5tCPgu-fNuw4kRiZkphPh1fBy', '1990-04-07', 'F', company_id, user_id_27, '')
  RETURNING id into family_member_id_27_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 303', 'None', 'NASHUA', 'NH', '03061.0', company_id, family_member_id_27_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032615090', family_member_id_27_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA111351', family_member_id_27_0, usercompanybenefitplanoption_id_27);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_27_0, usercompanybenefitplanoption_id_27_dental);

END;


DECLARE
  user_id_28 int;
  person_id_28 int;
  company_user_id_28 int; 
  usercompanybenefitplanoption_id_28 int;
  usercompanybenefitplanoption_id_28_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robynbrody@fairviewhealthcare.com', 't', 'f', 'f', 'Robyn', 'Brody', now(), now())
  RETURNING id into user_id_28;
  raise notice 'The user_id_28 after insert is %', user_id_28;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_28)
  RETURNING id into company_user_id_28;
  raise notice 'The company_user_id_28 is %', company_user_id_28;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_28)
  RETURNING id into usercompanybenefitplanoption_id_28;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_28)
  RETURNING id into usercompanybenefitplanoption_id_28_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robyn', '', 'Brody', '', 'self', 'ALeCc_iu1YVASlyLq9Ao4TwIgXTWbHoLV3m4ueSBtzgGnq-JxIFr-ChrLIKnQaI48-vVNyNWqmxS', '1975-02-23', 'F', company_id, user_id_28, '')
  RETURNING id into person_id_28;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '148R Webster Street', '', 'Hudson', 'NH', '03051', company_id, person_id_28);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038825261', person_id_28);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_28, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '09/01/2014', now(), now(), company_id, person_id_28, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA23226', person_id_28, usercompanybenefitplanoption_id_28);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_28, usercompanybenefitplanoption_id_28_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(48000.0, now(), now(), 17, person_id_28, user_id_28);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(130000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_28, 3, 3, null, 130000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_28, 0, 550.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_28, 0, 2400.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_28);

END;


DECLARE
  user_id_29 int;
  person_id_29 int;
  company_user_id_29 int; 
  usercompanybenefitplanoption_id_29 int;
  usercompanybenefitplanoption_id_29_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jillkracke@fairviewhealthcare.com', 't', 'f', 'f', 'Jill', 'Kracke', now(), now())
  RETURNING id into user_id_29;
  raise notice 'The user_id_29 after insert is %', user_id_29;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_29)
  RETURNING id into company_user_id_29;
  raise notice 'The company_user_id_29 is %', company_user_id_29;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_29)
  RETURNING id into usercompanybenefitplanoption_id_29;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_29)
  RETURNING id into usercompanybenefitplanoption_id_29_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Kracke', '', 'self', 'ALeCc_jlw6DI1vt7RAzaIeFEGIGpLkrqCcN5o_LLT3MAAFRoIgvH4Ozh_CIA_2AE82-RvzKLLd1r', '1989-05-31', 'F', company_id, user_id_29, '')
  RETURNING id into person_id_29;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '75 Island Dr', '', 'Merrimack', 'NH', '03054', company_id, person_id_29);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '7819562294', person_id_29);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2015-07-12', 'FullTime', 'Active', now(), now(), person_id_29, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/12/2015', now(), now(), company_id, person_id_29, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('714273.0', person_id_29, usercompanybenefitplanoption_id_29);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_29, usercompanybenefitplanoption_id_29_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(50000.0, now(), now(), 17, person_id_29, user_id_29);

END;


DECLARE
  user_id_30 int;
  person_id_30 int;
  company_user_id_30 int; 
  usercompanybenefitplanoption_id_30 int;
  usercompanybenefitplanoption_id_30_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lisawood@fairviewhealthcare.com', 't', 'f', 'f', 'Lisa', 'Wood', now(), now())
  RETURNING id into user_id_30;
  raise notice 'The user_id_30 after insert is %', user_id_30;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_30)
  RETURNING id into company_user_id_30;
  raise notice 'The company_user_id_30 is %', company_user_id_30;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_30);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_30);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Lisa', '', 'Wood', '', 'self', '', '1967-12-26', 'F', company_id, user_id_30, '')
  RETURNING id into person_id_30;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '46 Union St', '', 'Milford', 'NH', '03055', company_id, person_id_30);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2014-08-05', 'FullTime', 'Active', now(), now(), person_id_30, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '08/05/2014', now(), now(), company_id, person_id_30, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_30, user_id_30);

END;


DECLARE
  user_id_31 int;
  person_id_31 int;
  family_member_id_31_4 int;
  family_member_id_31_2 int;
  family_member_id_31_3 int;
  family_member_id_31_0 int;
  family_member_id_31_1 int;
  company_user_id_31 int; 
  usercompanybenefitplanoption_id_31 int;
  usercompanybenefitplanoption_id_31_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melissapinard@fairviewhealthcare.com', 't', 'f', 'f', 'Melissa', 'Pinard', now(), now())
  RETURNING id into user_id_31;
  raise notice 'The user_id_31 after insert is %', user_id_31;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_31)
  RETURNING id into company_user_id_31;
  raise notice 'The company_user_id_31 is %', company_user_id_31;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_31)
  RETURNING id into usercompanybenefitplanoption_id_31;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_31)
  RETURNING id into usercompanybenefitplanoption_id_31_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melissa', '', 'Pinard', '', 'self', 'ALeCc_ig1E7sWxYkeaC5xl-IacyDKfLoPEsiyXY7Kbw1dKw132VCnjg08ZP6VHjxsjsYL0geszri', '1969-01-29', 'F', company_id, user_id_31, '')
  RETURNING id into person_id_31;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Wende Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_31);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', person_id_31);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_31, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '09/01/2014', now(), now(), company_id, person_id_31, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA151118', person_id_31, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_31, usercompanybenefitplanoption_id_31_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(140000.0, now(), now(), 17, person_id_31, user_id_31);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(50000.0, 25000.0, 10000.0, 0, 0, 0, now(), now(), 12, person_id_31, 3, 3, null, 50000.0, null);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_31);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Samuel', '', 'Pinard', '', 'dependent', 'ALeCc_g2jepX2jrDfIrbTQ6X6Q_OJHXPjom0lFFQQCBr6zlfmhg49dMRXlimHfmRKLje1ZC2C4w-', '2005-07-01', 'M', company_id, user_id_31, '')
  RETURNING id into family_member_id_31_4;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_31_4);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_31_4);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F61546', family_member_id_31_4, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_31_4, usercompanybenefitplanoption_id_31_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jacob', '', 'Pinard', '', 'dependent', 'ALeCc_gm35gxBW7WdUKCrDuTW66dTOeSixmCUojMKMvoB55bp3vyzTpf23R4nBa4XHgZjrlpITWR', '2003-10-07', 'M', company_id, user_id_31, '')
  RETURNING id into family_member_id_31_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_31_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_31_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F61546', family_member_id_31_2, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_31_2, usercompanybenefitplanoption_id_31_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Matthew', '', 'Pinard', '', 'dependent', 'ALeCc_jj1DuiZnNmNNmue6srhJyqNW9icE0S_9oyToA4bM4AhTg58dLPY98qZmVtJ4J9zBQBM35E', '2005-07-01', 'M', company_id, user_id_31, '')
  RETURNING id into family_member_id_31_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_31_3);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_31_3);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F61546', family_member_id_31_3, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_31_3, usercompanybenefitplanoption_id_31_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Steven', '', 'Pinard', '', 'spouse', 'ALeCc_icTpA4LVnu8oFrgsWuUYNqsysRqEU5lCRK8CirRN_6VvE6qqFzMk_TD_QlUH4Z_7AnVCq6', '1967-07-25', 'M', company_id, user_id_31, '')
  RETURNING id into family_member_id_31_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_31_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '603', family_member_id_31_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA151118', family_member_id_31_0, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_31_0, usercompanybenefitplanoption_id_31_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Brandon', '', 'Pinard', '', 'dependent', 'ALeCc_hjj_iR3rfcRGPg1s0vgA5LitFKEqT-dJ_U2pIEkA9QhdlaaIaTwZjZiHh2Aijbg649l8wL', '1993-12-10', 'M', company_id, user_id_31, '')
  RETURNING id into family_member_id_31_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_31_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_31_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('710725.0', family_member_id_31_1, usercompanybenefitplanoption_id_31);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_31_1, usercompanybenefitplanoption_id_31_dental);

END;


DECLARE
  user_id_32 int;
  person_id_32 int;
  family_member_id_32_0 int;
  company_user_id_32 int; 
  usercompanybenefitplanoption_id_32 int;
  usercompanybenefitplanoption_id_32_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lauriemarston@fairviewhealthcare.com', 't', 'f', 'f', 'Laurie', 'Marston', now(), now())
  RETURNING id into user_id_32;
  raise notice 'The user_id_32 after insert is %', user_id_32;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_32)
  RETURNING id into company_user_id_32;
  raise notice 'The company_user_id_32 is %', company_user_id_32;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_32)
  RETURNING id into usercompanybenefitplanoption_id_32;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_32)
  RETURNING id into usercompanybenefitplanoption_id_32_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Laurie', 'M', 'Marston', '', 'self', 'ALeCc_j8-t7FwRB3qEPRV2_C8GUdLU4LVHNYhFU9GlYCEOqfAlnjlaMIomAlZ2iW_DEbZtEGLUKE', '1960-01-05', 'F', company_id, user_id_32, '')
  RETURNING id into person_id_32;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 DUGOUT RD', '', 'HUDSON', 'NH', '03051', company_id, person_id_32);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827881', person_id_32);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 26956.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_32, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(26956.8, '09/01/2008', now(), now(), company_id, person_id_32, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA276742', person_id_32, usercompanybenefitplanoption_id_32);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_32, usercompanybenefitplanoption_id_32_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(27000.0, now(), now(), 17, person_id_32, user_id_32);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_32, 0, 300.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_32);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Donald', '', 'Marston', '', 'spouse', 'ALeCc_iRvARU3DuFa7MAizx4MJQSo7ziTTtIoCqb2Rw_PWLg0NggyfofTafKXEQIRkmlcbi-22hW', '1958-07-22', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827881', family_member_id_32_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA276742', family_member_id_32_0, usercompanybenefitplanoption_id_32);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_32_0, usercompanybenefitplanoption_id_32_dental);

END;


DECLARE
  user_id_33 int;
  person_id_33 int;
  company_user_id_33 int; 
  usercompanybenefitplanoption_id_33 int;
  usercompanybenefitplanoption_id_33_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alfredosantiago-sanchez@fairviewhealthcare.com', 't', 'f', 'f', 'Alfredo', 'Santiago-Sanchez', now(), now())
  RETURNING id into user_id_33;
  raise notice 'The user_id_33 after insert is %', user_id_33;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_33)
  RETURNING id into company_user_id_33;
  raise notice 'The company_user_id_33 is %', company_user_id_33;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_33)
  RETURNING id into usercompanybenefitplanoption_id_33;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_33)
  RETURNING id into usercompanybenefitplanoption_id_33_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alfredo', '', 'Santiago-Sanchez', '', 'self', 'ALeCc_iMLlaZo0-ze9nqIlMLFFxqKrU5F6vwsBYBH7iJfI8zbEs8ssAEptHYNgn-YLoQmUSoZpx_', '1980-04-05', 'M', company_id, user_id_33, '')
  RETURNING id into person_id_33;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '82 Ledge St Apt 4', '', 'Nashua', 'NH', '03060', company_id, person_id_33);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038205144', person_id_33);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22588.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_33, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22588.0, '09/01/2008', now(), now(), company_id, person_id_33, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA19803', person_id_33, usercompanybenefitplanoption_id_33);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_33, usercompanybenefitplanoption_id_33_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(23000.0, now(), now(), 17, person_id_33, user_id_33);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, 25000.0, null, 0, 0, 0, now(), now(), 12, person_id_33, 3, 3, null, 100000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_33, 0, 250.0);

END;


DECLARE
  user_id_34 int;
  person_id_34 int;
  company_user_id_34 int; 
  usercompanybenefitplanoption_id_34 int;
  usercompanybenefitplanoption_id_34_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'karentierney@fairviewhealthcare.com', 't', 'f', 'f', 'Karen', 'Tierney', now(), now())
  RETURNING id into user_id_34;
  raise notice 'The user_id_34 after insert is %', user_id_34;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_34)
  RETURNING id into company_user_id_34;
  raise notice 'The company_user_id_34 is %', company_user_id_34;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_34)
  RETURNING id into usercompanybenefitplanoption_id_34;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_34)
  RETURNING id into usercompanybenefitplanoption_id_34_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Tierney', '', 'self', 'ALeCc_is0wgy34GwsRqZoS9kKdCXxHh7w-SxWBB2NARpyCMSQ88UQVC92rPFJVJ5jd7X9rBj7_Sx', '1960-06-11', 'F', company_id, user_id_34, '')
  RETURNING id into person_id_34;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 High Plain Ave', '', 'Litchfield', 'NH', '03052', company_id, person_id_34);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035055348', person_id_34);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47320.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_34, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47320.0, '04/07/2014', now(), now(), company_id, person_id_34, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F43395', person_id_34, usercompanybenefitplanoption_id_34);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_34, usercompanybenefitplanoption_id_34_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(48000.0, now(), now(), 17, person_id_34, user_id_34);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_34, 0, 550.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_34, 0, 2000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_34);

END;


DECLARE
  user_id_35 int;
  person_id_35 int;
  company_user_id_35 int; 
  usercompanybenefitplanoption_id_35 int;
  usercompanybenefitplanoption_id_35_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'michelledavanzo@fairviewhealthcare.com', 't', 'f', 'f', 'Michelle', 'D''Avanzo', now(), now())
  RETURNING id into user_id_35;
  raise notice 'The user_id_35 after insert is %', user_id_35;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_35)
  RETURNING id into company_user_id_35;
  raise notice 'The company_user_id_35 is %', company_user_id_35;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_35)
  RETURNING id into usercompanybenefitplanoption_id_35;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_35)
  RETURNING id into usercompanybenefitplanoption_id_35_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'M', 'D''Avanzo', '', 'self', 'ALeCc_hRndwigMt7Jjfiobt7FVyE3POxd9eqQtRpVl-FPFlGR3li_beGSKV4Iq-uof4u-MMnPRjr', '1967-11-09', 'F', company_id, user_id_35, '')
  RETURNING id into person_id_35;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Troutbrook Dr', '', 'Nashua', 'NH', '03062', company_id, person_id_35);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035087134', person_id_35);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27865.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_35, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_35, null, 14.2900, 162.5000);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('C66071', person_id_35, usercompanybenefitplanoption_id_35);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_35, usercompanybenefitplanoption_id_35_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(28000.0, now(), now(), 17, person_id_35, user_id_35);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_35);

END;


DECLARE
  user_id_36 int;
  person_id_36 int;
  company_user_id_36 int; 
  usercompanybenefitplanoption_id_36 int;
  usercompanybenefitplanoption_id_36_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'meghanlandry@fairviewhealthcare.com', 't', 'f', 'f', 'Meghan', 'Landry', now(), now())
  RETURNING id into user_id_36;
  raise notice 'The user_id_36 after insert is %', user_id_36;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_36)
  RETURNING id into company_user_id_36;
  raise notice 'The company_user_id_36 is %', company_user_id_36;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_36);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_36);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Meghan', '', 'Landry', '', 'self', '', '1983-11-25', 'F', company_id, user_id_36, '')
  RETURNING id into person_id_36;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Lorri Road', '', 'Derry', 'NH', '03038', company_id, person_id_36);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_36, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_36, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(50000.0, now(), now(), 17, person_id_36, user_id_36);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_36, 3, 3, null, 100000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_36, 0, 500.0);

END;


DECLARE
  user_id_37 int;
  person_id_37 int;
  company_user_id_37 int; 
  usercompanybenefitplanoption_id_37 int;
  usercompanybenefitplanoption_id_37_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'amandawhite@fairviewhealthcare.com', 't', 'f', 'f', 'Amanda', 'White', now(), now())
  RETURNING id into user_id_37;
  raise notice 'The user_id_37 after insert is %', user_id_37;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_37)
  RETURNING id into company_user_id_37;
  raise notice 'The company_user_id_37 is %', company_user_id_37;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_37)
  RETURNING id into usercompanybenefitplanoption_id_37;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_37)
  RETURNING id into usercompanybenefitplanoption_id_37_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'White', '', 'self', 'ALeCc_ji-y3MsQIjx_BZ_tdEQ0wsXXuu-BW5VkXTzlCe0vWCVEwu__eCFfVFL0rIb2QfRla-hUhu', '1989-02-17', 'F', company_id, user_id_37, '')
  RETURNING id into person_id_37;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Todd Road', '', 'Nashua', 'NH', '03064', company_id, person_id_37);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033056337', person_id_37);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22912.5, '2013-02-14', 'FullTime', 'Active', now(), now(), person_id_37, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '02/14/2013', now(), now(), company_id, person_id_37, null, 11.7500, 162.5000);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('NA1039', person_id_37, usercompanybenefitplanoption_id_37);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_37, usercompanybenefitplanoption_id_37_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(23000.0, now(), now(), 17, person_id_37, user_id_37);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_37);

END;


DECLARE
  user_id_38 int;
  person_id_38 int;
  company_user_id_38 int; 
  usercompanybenefitplanoption_id_38 int;
  usercompanybenefitplanoption_id_38_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alandupont@fairviewhealthcare.com', 't', 'f', 'f', 'Alan', 'Dupont', now(), now())
  RETURNING id into user_id_38;
  raise notice 'The user_id_38 after insert is %', user_id_38;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_38)
  RETURNING id into company_user_id_38;
  raise notice 'The company_user_id_38 is %', company_user_id_38;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_38);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_38)
  RETURNING id into usercompanybenefitplanoption_id_38_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alan', 'W', 'Dupont', '', 'self', '', '1955-10-19', 'M', company_id, user_id_38, '')
  RETURNING id into person_id_38;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20 Blackstone Street', '', 'Hudson', 'NH', '03051', company_id, person_id_38);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 59987.0, '2012-06-25', 'FullTime', 'Active', now(), now(), person_id_38, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(59987.0, '06/25/2012', now(), now(), company_id, person_id_38, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_38, usercompanybenefitplanoption_id_38_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(120000.0, now(), now(), 17, person_id_38, user_id_38);

END;


DECLARE
  user_id_39 int;
  person_id_39 int;
  company_user_id_39 int; 
  usercompanybenefitplanoption_id_39 int;
  usercompanybenefitplanoption_id_39_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ketliecamille@fairviewhealthcare.com', 't', 'f', 'f', 'Ketlie', 'Camille', now(), now())
  RETURNING id into user_id_39;
  raise notice 'The user_id_39 after insert is %', user_id_39;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_39)
  RETURNING id into company_user_id_39;
  raise notice 'The company_user_id_39 is %', company_user_id_39;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_39)
  RETURNING id into usercompanybenefitplanoption_id_39;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_39)
  RETURNING id into usercompanybenefitplanoption_id_39_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ketlie', '', 'Camille', '', 'self', 'ALeCc_ju1s8Yy8JbhlWg4T4vKdhGpNpsRn_PQfkhKSzRivsUO3TB9ypea8Z4Da9F8r1SRRAJE4Bb', '1958-07-21', 'F', company_id, user_id_39, '')
  RETURNING id into person_id_39;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '19 Paul Street', '', 'Nashua', 'NH', '03060', company_id, person_id_39);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8572880821', person_id_39);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37498.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_39, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37498.5, '09/01/2008', now(), now(), company_id, person_id_39, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('LH0144', person_id_39, usercompanybenefitplanoption_id_39);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_39, usercompanybenefitplanoption_id_39_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(38000.0, now(), now(), 17, person_id_39, user_id_39);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_39, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_39, 0, 300.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_39);

END;


DECLARE
  user_id_40 int;
  person_id_40 int;
  company_user_id_40 int; 
  usercompanybenefitplanoption_id_40 int;
  usercompanybenefitplanoption_id_40_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresaberry@fairviewhealthcare.com', 't', 'f', 'f', 'Theresa', 'Berry', now(), now())
  RETURNING id into user_id_40;
  raise notice 'The user_id_40 after insert is %', user_id_40;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_40)
  RETURNING id into company_user_id_40;
  raise notice 'The company_user_id_40 is %', company_user_id_40;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_40)
  RETURNING id into usercompanybenefitplanoption_id_40;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_40)
  RETURNING id into usercompanybenefitplanoption_id_40_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', 'A', 'Berry', '', 'self', 'ALeCc_iGSE3XLUxS-E3JXOln-KwFnJJZBLhmG9mfrvtEvT3qWEDLLObWpHKpFX7ptiOV6GLl-N2N', '1960-08-01', 'F', company_id, user_id_40, '')
  RETURNING id into person_id_40;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '48 Mountain Rd', '', 'Erving', 'MA', '01344', company_id, person_id_40);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '4135489068', person_id_40);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 90000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_40, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(90000.0, '09/01/2008', now(), now(), company_id, person_id_40, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('66446.0', person_id_40, usercompanybenefitplanoption_id_40);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_40, usercompanybenefitplanoption_id_40_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(180000.0, now(), now(), 17, person_id_40, user_id_40);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_40, 0, 1000.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_40, 0, 4500.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_40);

END;


DECLARE
  user_id_41 int;
  person_id_41 int;
  company_user_id_41 int; 
  usercompanybenefitplanoption_id_41 int;
  usercompanybenefitplanoption_id_41_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rhondaboudreau@fairviewhealthcare.com', 't', 'f', 'f', 'Rhonda', 'Boudreau', now(), now())
  RETURNING id into user_id_41;
  raise notice 'The user_id_41 after insert is %', user_id_41;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_41)
  RETURNING id into company_user_id_41;
  raise notice 'The company_user_id_41 is %', company_user_id_41;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_41)
  RETURNING id into usercompanybenefitplanoption_id_41;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_41)
  RETURNING id into usercompanybenefitplanoption_id_41_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rhonda', '', 'Boudreau', '', 'self', 'ALeCc_hY9_8GRWCzLB_wqD6uIanQ2fJ-Tcx-rU9OjaaSVadvzTXMJJxaxlYgBx_ZbUrLkpxnwhKy', '1969-02-26', 'F', company_id, user_id_41, '')
  RETURNING id into person_id_41;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '34 Growing Road', '', 'Hudson', 'NH', '03051', company_id, person_id_41);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_41);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62000.0, '2014-07-15', 'FullTime', 'Active', now(), now(), person_id_41, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62000.0, '07/15/2014', now(), now(), company_id, person_id_41, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA159668', person_id_41, usercompanybenefitplanoption_id_41);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_41, usercompanybenefitplanoption_id_41_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(62000.0, now(), now(), 17, person_id_41, user_id_41);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(40000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_41, 3, 3, null, 40000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_41, 0, 700.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_41);

END;


DECLARE
  user_id_42 int;
  person_id_42 int;
  company_user_id_42 int; 
  usercompanybenefitplanoption_id_42 int;
  usercompanybenefitplanoption_id_42_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'debramelville@fairviewhealthcare.com', 't', 'f', 'f', 'Debra', 'Melville', now(), now())
  RETURNING id into user_id_42;
  raise notice 'The user_id_42 after insert is %', user_id_42;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_42)
  RETURNING id into company_user_id_42;
  raise notice 'The company_user_id_42 is %', company_user_id_42;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_42);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_42);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Debra', '', 'Melville', '', 'self', '', '1961-09-18', 'F', company_id, user_id_42, '')
  RETURNING id into person_id_42;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '150 Wason Road', '', 'Hudson', 'NH', '03051', company_id, person_id_42);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 56285.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_42, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56285.0, '09/01/2008', now(), now(), company_id, person_id_42, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(113000.0, now(), now(), 17, person_id_42, user_id_42);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_42, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_42, 0, 200.0);

END;


DECLARE
  user_id_43 int;
  person_id_43 int;
  company_user_id_43 int; 
  usercompanybenefitplanoption_id_43 int;
  usercompanybenefitplanoption_id_43_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dwaynebernard@fairviewhealthcare.com', 't', 'f', 'f', 'Dwayne', 'Bernard', now(), now())
  RETURNING id into user_id_43;
  raise notice 'The user_id_43 after insert is %', user_id_43;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_43)
  RETURNING id into company_user_id_43;
  raise notice 'The company_user_id_43 is %', company_user_id_43;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_43)
  RETURNING id into usercompanybenefitplanoption_id_43;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_43)
  RETURNING id into usercompanybenefitplanoption_id_43_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dwayne', 'M', 'Bernard', '', 'self', 'ALeCc_hbKtrV1SK_wGh9DRybLIxD17ApNMbYUHnY5B9ZgYhy6c9Ine-9-FdCZm6lHipEO8zE7d0M', '1959-01-08', 'M', company_id, user_id_43, '')
  RETURNING id into person_id_43;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '32 Grove Avenue', '', 'Manchester', 'NH', '03109', company_id, person_id_43);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039358680', person_id_43);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2014-09-26', 'FullTime', 'Active', now(), now(), person_id_43, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/26/2014', now(), now(), company_id, person_id_43, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA148119', person_id_43, usercompanybenefitplanoption_id_43);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_43, usercompanybenefitplanoption_id_43_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(32000.0, now(), now(), 17, person_id_43, user_id_43);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_43, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_43, 0, 350.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_43);

END;


DECLARE
  user_id_44 int;
  person_id_44 int;
  company_user_id_44 int; 
  usercompanybenefitplanoption_id_44 int;
  usercompanybenefitplanoption_id_44_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'daviddillavou@fairviewhealthcare.com', 't', 'f', 'f', 'David', 'Dillavou', now(), now())
  RETURNING id into user_id_44;
  raise notice 'The user_id_44 after insert is %', user_id_44;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_44)
  RETURNING id into company_user_id_44;
  raise notice 'The company_user_id_44 is %', company_user_id_44;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_44)
  RETURNING id into usercompanybenefitplanoption_id_44;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_44)
  RETURNING id into usercompanybenefitplanoption_id_44_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'David', 'A', 'Dillavou', '', 'self', 'ALeCc_i7_X8bxfKrnIkktZt9ijdzboOjacoRj5VOB3iUGJj96vWpjoWa7CbVMYTDnOczqCNKwZbT', '1986-03-23', 'M', company_id, user_id_44, '')
  RETURNING id into person_id_44;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Colson Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_44);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033655496', person_id_44);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_44, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '09/01/2008', now(), now(), company_id, person_id_44, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA275111', person_id_44, usercompanybenefitplanoption_id_44);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_44, usercompanybenefitplanoption_id_44_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(20000.0, now(), now(), 17, person_id_44, user_id_44);

END;


DECLARE
  user_id_45 int;
  person_id_45 int;
  company_user_id_45 int; 
  usercompanybenefitplanoption_id_45 int;
  usercompanybenefitplanoption_id_45_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sylviecotnoir@fairviewhealthcare.com', 't', 'f', 'f', 'Sylvie', 'Cotnoir', now(), now())
  RETURNING id into user_id_45;
  raise notice 'The user_id_45 after insert is %', user_id_45;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_45)
  RETURNING id into company_user_id_45;
  raise notice 'The company_user_id_45 is %', company_user_id_45;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_45)
  RETURNING id into usercompanybenefitplanoption_id_45;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_45)
  RETURNING id into usercompanybenefitplanoption_id_45_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sylvie', '', 'Cotnoir', '', 'self', 'ALeCc_jdXLfYCUatSFQy_4JR7qlpmSb1gNcplPwyxwnxbNeYwQOk4-4j-PsGSEEog6msCV4lef5i', '1961-01-01', 'F', company_id, user_id_45, '')
  RETURNING id into person_id_45;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '41 Almont St', '', 'Nashua', 'NH', '03060', company_id, person_id_45);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035789081', person_id_45);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62504.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_45, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62504.0, '09/01/2008', now(), now(), company_id, person_id_45, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA39535', person_id_45, usercompanybenefitplanoption_id_45);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_45, usercompanybenefitplanoption_id_45_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(126000.0, now(), now(), 17, person_id_45, user_id_45);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_45, 0, 550.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_45, 0, 2500.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_45);

END;


DECLARE
  user_id_46 int;
  person_id_46 int;
  company_user_id_46 int; 
  usercompanybenefitplanoption_id_46 int;
  usercompanybenefitplanoption_id_46_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'martinahill@fairviewhealthcare.com', 't', 'f', 'f', 'Martina', 'Hill', now(), now())
  RETURNING id into user_id_46;
  raise notice 'The user_id_46 after insert is %', user_id_46;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_46)
  RETURNING id into company_user_id_46;
  raise notice 'The company_user_id_46 is %', company_user_id_46;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_46);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_46);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Martina', '', 'Hill', '', 'self', '', '1995-06-02', 'F', company_id, user_id_46, '')
  RETURNING id into person_id_46;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23400.0, '2014-12-09', 'FullTime', 'Active', now(), now(), person_id_46, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23400.0, '12/09/2014', now(), now(), company_id, person_id_46, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(24000.0, now(), now(), 17, person_id_46, user_id_46);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(120000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_46, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_46, 0, 200.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_46, 0, 800.0);

END;


DECLARE
  user_id_47 int;
  person_id_47 int;
  company_user_id_47 int; 
  usercompanybenefitplanoption_id_47 int;
  usercompanybenefitplanoption_id_47_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alysonfortier@fairviewhealthcare.com', 't', 'f', 'f', 'Alyson', 'Fortier', now(), now())
  RETURNING id into user_id_47;
  raise notice 'The user_id_47 after insert is %', user_id_47;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_47)
  RETURNING id into company_user_id_47;
  raise notice 'The company_user_id_47 is %', company_user_id_47;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_47);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_47);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alyson', '', 'Fortier', '', 'self', '', '1995-02-10', 'F', company_id, user_id_47, '')
  RETURNING id into person_id_47;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-02-03', 'FullTime', 'Active', now(), now(), person_id_47, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '02/03/2014', now(), now(), company_id, person_id_47, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_47, user_id_47);

END;


DECLARE
  user_id_48 int;
  person_id_48 int;
  company_user_id_48 int; 
  usercompanybenefitplanoption_id_48 int;
  usercompanybenefitplanoption_id_48_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aliciarinaldi@fairviewhealthcare.com', 't', 'f', 'f', 'Alicia', 'Rinaldi', now(), now())
  RETURNING id into user_id_48;
  raise notice 'The user_id_48 after insert is %', user_id_48;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_48)
  RETURNING id into company_user_id_48;
  raise notice 'The company_user_id_48 is %', company_user_id_48;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_48);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_48);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alicia', '', 'Rinaldi', '', 'self', '', '1989-06-29', 'F', company_id, user_id_48, '')
  RETURNING id into person_id_48;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 Oak Drive', '', 'Litchfield', 'NH', '03052', company_id, person_id_48);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21060.0, '2015-06-22', 'FullTime', 'Active', now(), now(), person_id_48, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '06/22/2015', now(), now(), company_id, person_id_48, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_48, user_id_48);

END;


DECLARE
  user_id_49 int;
  person_id_49 int;
  family_member_id_49_0 int;
  company_user_id_49 int; 
  usercompanybenefitplanoption_id_49 int;
  usercompanybenefitplanoption_id_49_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tiffanybrown@fairviewhealthcare.com', 't', 'f', 'f', 'Tiffany', 'Brown', now(), now())
  RETURNING id into user_id_49;
  raise notice 'The user_id_49 after insert is %', user_id_49;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_49)
  RETURNING id into company_user_id_49;
  raise notice 'The company_user_id_49 is %', company_user_id_49;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_49)
  RETURNING id into usercompanybenefitplanoption_id_49;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_49)
  RETURNING id into usercompanybenefitplanoption_id_49_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tiffany', '', 'Brown', '', 'self', 'ALeCc_jETMlGrjTUo62eNZRiHBrFWF9uBpLjtDV99pzaqbt5-tq3y-4m0wO0OQ_NSDGBCOhkea5j', '1972-09-09', 'F', company_id, user_id_49, '')
  RETURNING id into person_id_49;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '74 Gebig Road', '', 'Nottingham', 'NH', '03290', company_id, person_id_49);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035833890', person_id_49);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 67600.0, '2015-09-20', 'FullTime', 'Active', now(), now(), person_id_49, company_id, null, '2015-09-20');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(67600.0, '09/20/2015', now(), now(), company_id, person_id_49, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA13537', person_id_49, usercompanybenefitplanoption_id_49);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_49, usercompanybenefitplanoption_id_49_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(136000.0, now(), now(), 17, person_id_49, user_id_49);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_49);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Delaney', '', 'Brown', '', 'dependent', 'ALeCc_i-UxjIc_v8QSvYhv19goUUFR_Mq959B8S-NG5wFp_RmKpTeg5wQzvrUabKPuCZLa3ZXEI5', '2002-04-07', 'F', company_id, user_id_49, '')
  RETURNING id into family_member_id_49_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '74 GEBING RD', 'None', 'NOTTINGHAM', 'NH', '03290.0', company_id, family_member_id_49_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035833890', family_member_id_49_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA280977', family_member_id_49_0, usercompanybenefitplanoption_id_49);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_49_0, usercompanybenefitplanoption_id_49_dental);

END;


DECLARE
  user_id_50 int;
  person_id_50 int;
  family_member_id_50_1 int;
  family_member_id_50_0 int;
  family_member_id_50_2 int;
  company_user_id_50 int; 
  usercompanybenefitplanoption_id_50 int;
  usercompanybenefitplanoption_id_50_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dongphuongnguyen@fairviewhealthcare.com', 't', 'f', 'f', 'Dongphuong', 'Nguyen', now(), now())
  RETURNING id into user_id_50;
  raise notice 'The user_id_50 after insert is %', user_id_50;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_50)
  RETURNING id into company_user_id_50;
  raise notice 'The company_user_id_50 is %', company_user_id_50;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_50)
  RETURNING id into usercompanybenefitplanoption_id_50;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_50)
  RETURNING id into usercompanybenefitplanoption_id_50_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dongphuong', '', 'Nguyen', '', 'self', 'ALeCc_j0gS82K2lDforQrItIE7DhlV5QSSt2IcKaV_qG_YM2chVX9mgqZX_47T8FF85BQVZpYWFT', '1982-08-14', 'F', company_id, user_id_50, '')
  RETURNING id into person_id_50;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 Dogwood Cir', '', 'Pelham', 'NH', '03076', company_id, person_id_50);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', person_id_50);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2012-09-01', 'FullTime', 'Active', now(), now(), person_id_50, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '09/01/2012', now(), now(), company_id, person_id_50, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA228218', person_id_50, usercompanybenefitplanoption_id_50);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_50, usercompanybenefitplanoption_id_50_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_50, user_id_50);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_50);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Bryan', '', 'Nguyen', '', 'dependent', 'ALeCc_io_nmMFW6nPgSiNSKOdB2y_oWlzI3V80mJ5B9563AMr6FTr0LVh5zhz-8uJ2ZXUkRpdEuc', '2008-11-25', 'M', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('FCH032', family_member_id_50_1, usercompanybenefitplanoption_id_50);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_50_1, usercompanybenefitplanoption_id_50_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'D', '', 'Nguyen', '', 'spouse', 'ALeCc_heJElOWsaWt7O76QnpZbwOVngPOn3C6KMzvkB_1BYQczRtdOwdmjKQa9WwXGQJqKkVI_SY', '1978-09-19', 'M', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA228218', family_member_id_50_0, usercompanybenefitplanoption_id_50);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_50_0, usercompanybenefitplanoption_id_50_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Bryanna', '', 'Nguyen', '', 'dependent', 'ALeCc_j0nRluWFeFEfa5nzoB8RRYu1EgPgeutv89KzvhKUaMonD6w12kgxniCIXe3Oxsos3G9bUs', '2011-11-18', 'F', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('FCH032', family_member_id_50_2, usercompanybenefitplanoption_id_50);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_50_2, usercompanybenefitplanoption_id_50_dental);

END;


DECLARE
  user_id_51 int;
  person_id_51 int;
  family_member_id_51_0 int;
  company_user_id_51 int; 
  usercompanybenefitplanoption_id_51 int;
  usercompanybenefitplanoption_id_51_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'roselynnbenard@fairviewhealthcare.com', 't', 'f', 'f', 'Roselynn', 'Benard', now(), now())
  RETURNING id into user_id_51;
  raise notice 'The user_id_51 after insert is %', user_id_51;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_51)
  RETURNING id into company_user_id_51;
  raise notice 'The company_user_id_51 is %', company_user_id_51;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_51)
  RETURNING id into usercompanybenefitplanoption_id_51;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_51)
  RETURNING id into usercompanybenefitplanoption_id_51_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roselynn', '', 'Benard', '', 'self', 'ALeCc_iW6QITMmhaTnmLRDjvnL-DPXcn8pxdWpjcMS7RkSdtWtK5B38fioXxRx1iyGHp-fQkZqME', '1972-02-11', 'F', company_id, user_id_51, '')
  RETURNING id into person_id_51;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Stonehenge Rd', 'Apt 4', 'Londonderry', 'NH', '03053', company_id, person_id_51);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032752152', person_id_51);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_51, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/01/2008', now(), now(), company_id, person_id_51, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('C72875', person_id_51, usercompanybenefitplanoption_id_51);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_51, usercompanybenefitplanoption_id_51_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(32000.0, now(), now(), 17, person_id_51, user_id_51);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(30000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_51, 3, 3, null, 30000.0, null);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_51, 0, 1300.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_51);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Nicholas', '', 'Benard', '', 'dependent', 'ALeCc_ihbxYjWJ-woi4y5vx1TJpw-LKi6ldV6E17fD2uiK9pKen57s858WTbGjlrXeHMs_3Xycuk', '1995-02-06', 'M', company_id, user_id_51, '')
  RETURNING id into family_member_id_51_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 308', 'None', 'LONDONDERRY', 'NH', '03053.0', company_id, family_member_id_51_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032752152', family_member_id_51_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('NH1759', family_member_id_51_0, usercompanybenefitplanoption_id_51);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_51_0, usercompanybenefitplanoption_id_51_dental);

END;


DECLARE
  user_id_52 int;
  person_id_52 int;
  family_member_id_52_0 int;
  company_user_id_52 int; 
  usercompanybenefitplanoption_id_52 int;
  usercompanybenefitplanoption_id_52_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'irenegillen@fairviewhealthcare.com', 't', 'f', 'f', 'Irene', 'Gillen', now(), now())
  RETURNING id into user_id_52;
  raise notice 'The user_id_52 after insert is %', user_id_52;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_52)
  RETURNING id into company_user_id_52;
  raise notice 'The company_user_id_52 is %', company_user_id_52;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_52)
  RETURNING id into usercompanybenefitplanoption_id_52;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_52)
  RETURNING id into usercompanybenefitplanoption_id_52_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Irene', 'N', 'Gillen', '', 'self', 'ALeCc_jWTotzlG908m_rij5IVA2Z_dsPUvAtNqytJ-jzUunbZCB9AavYgKtuQo88QK18zWWCPYYs', '1964-12-29', 'F', company_id, user_id_52, '')
  RETURNING id into person_id_52;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '93 Walnut Rd', '', 'Derry', 'NH', '03038', company_id, person_id_52);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034212969', person_id_52);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-08-25', 'FullTime', 'Active', now(), now(), person_id_52, company_id, 1, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/25/2015', now(), now(), company_id, person_id_52, null, 26.0000, 173.3333);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA159668', person_id_52, usercompanybenefitplanoption_id_52);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_52, usercompanybenefitplanoption_id_52_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(55000.0, now(), now(), 17, person_id_52, user_id_52);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_52);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kyle', '', 'Gillen', '', 'dependent', 'ALeCc_iP-GQrc304G0vTr99gTAsnyth2bA1niyXkyygXl73LHh1y2jKNi28iBlLYEy6MF7kAzTix', '2000-05-26', 'M', company_id, user_id_52, '')
  RETURNING id into family_member_id_52_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '93 WALNUT HILL RD', 'None', 'DERRY', 'NH', '03038.0', company_id, family_member_id_52_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034212969', family_member_id_52_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('PRK003', family_member_id_52_0, usercompanybenefitplanoption_id_52);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_52_0, usercompanybenefitplanoption_id_52_dental);

END;


DECLARE
  user_id_53 int;
  person_id_53 int;
  family_member_id_53_2 int;
  family_member_id_53_3 int;
  family_member_id_53_0 int;
  family_member_id_53_1 int;
  company_user_id_53 int; 
  usercompanybenefitplanoption_id_53 int;
  usercompanybenefitplanoption_id_53_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'richardleboeuf@fairviewhealthcare.com', 't', 'f', 'f', 'Richard', 'Leboeuf', now(), now())
  RETURNING id into user_id_53;
  raise notice 'The user_id_53 after insert is %', user_id_53;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_53)
  RETURNING id into company_user_id_53;
  raise notice 'The company_user_id_53 is %', company_user_id_53;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 290, user_id_53)
  RETURNING id into usercompanybenefitplanoption_id_53;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_53)
  RETURNING id into usercompanybenefitplanoption_id_53_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', 'M', 'Leboeuf', '', 'self', 'ALeCc_jlhWUsXs80k9VbQBkaWCX3wStEuSG03kqiGkvq5VMeR1XpNpLphXbNhvX0CQ8ZNC8QVQII', '1967-01-14', 'M', company_id, user_id_53, '')
  RETURNING id into person_id_53;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 Trout Brook Rd', '', 'Dracut', 'MA', '01826', company_id, person_id_53);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', person_id_53);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 137966.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_53, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(137966.4, '09/01/2008', now(), now(), company_id, person_id_53, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA159743', person_id_53, usercompanybenefitplanoption_id_53);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_53, usercompanybenefitplanoption_id_53_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(225000.0, now(), now(), 17, person_id_53, user_id_53);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_53, 0, 1000.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_53, 0, 5000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_53);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Lyndsey', '', 'Leboeuf', '', 'dependent', 'ALeCc_jghXmdjH3TOp00MECK3nPqSxd2M2S5v1eBnY6MtE7TgirgFGtpzRpgVCx9q266PhTc2mgS', '1994-11-01', 'F', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('20413.0', family_member_id_53_2, usercompanybenefitplanoption_id_53);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_53_2, usercompanybenefitplanoption_id_53_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ryan', '', 'Leboeuf', '', 'dependent', 'ALeCc_g72fDRFrKyrj-U7vjHEqxedjXnCeV-9WMD_CQ2AWzDIyC2cTnIjRZA8fzaUzUg6_JcQrzc', '1998-04-04', 'M', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_3);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_3);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('20413.0', family_member_id_53_3, usercompanybenefitplanoption_id_53);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_53_3, usercompanybenefitplanoption_id_53_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Nancy', '', 'Leboeuf', '', 'spouse', 'ALeCc_jldGM2utECJ4Hhun0r0g_vpbH10vJ2vE0kyKol0IgR8qA12a7vjU8sda-Dfs1VzAjD13Qe', '1968-06-16', 'F', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('69464.0', family_member_id_53_0, usercompanybenefitplanoption_id_53);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_53_0, usercompanybenefitplanoption_id_53_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Justin', '', 'Leboeuf', '', 'dependent', 'ALeCc_gC46VkRd8AncXbS9UJYNN5UUY2iTFv7ytGSrIT9ZMEAy8DnvzeanavlWrehzHEbbjyngdT', '1996-05-24', 'M', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('20413.0', family_member_id_53_1, usercompanybenefitplanoption_id_53);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_53_1, usercompanybenefitplanoption_id_53_dental);

END;


DECLARE
  user_id_54 int;
  person_id_54 int;
  company_user_id_54 int; 
  usercompanybenefitplanoption_id_54 int;
  usercompanybenefitplanoption_id_54_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katherineconway@fairviewhealthcare.com', 't', 'f', 'f', 'Katherine', 'Conway', now(), now())
  RETURNING id into user_id_54;
  raise notice 'The user_id_54 after insert is %', user_id_54;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_54)
  RETURNING id into company_user_id_54;
  raise notice 'The company_user_id_54 is %', company_user_id_54;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_54)
  RETURNING id into usercompanybenefitplanoption_id_54;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_54)
  RETURNING id into usercompanybenefitplanoption_id_54_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', '', 'Conway', '', 'self', 'ALeCc_hoLXg5LdA5Sz5xL5aLOpRvso4CqegjZzGnvGwCm8mnmZnVjEATSiZhfxW6Oe6OmJYYbZWb', '1992-06-19', 'F', company_id, user_id_54, '')
  RETURNING id into person_id_54;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 Chestnut Rd', '', 'Tyngsboro', 'MA', '01879', company_id, person_id_54);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9786493479', person_id_54);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-04-01', 'FullTime', 'Active', now(), now(), person_id_54, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '04/01/2015', now(), now(), company_id, person_id_54, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('HV0047', person_id_54, usercompanybenefitplanoption_id_54);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_54, usercompanybenefitplanoption_id_54_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_54, user_id_54);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_54, 3, 3, null, 100000.0, null);

END;


DECLARE
  user_id_55 int;
  person_id_55 int;
  company_user_id_55 int; 
  usercompanybenefitplanoption_id_55 int;
  usercompanybenefitplanoption_id_55_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robertmackay@fairviewhealthcare.com', 't', 'f', 'f', 'Robert', 'Mackay', now(), now())
  RETURNING id into user_id_55;
  raise notice 'The user_id_55 after insert is %', user_id_55;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_55)
  RETURNING id into company_user_id_55;
  raise notice 'The company_user_id_55 is %', company_user_id_55;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_55);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_55);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robert', '', 'Mackay', '', 'self', '', '1956-01-27', 'M', company_id, user_id_55, '')
  RETURNING id into person_id_55;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '100 London Court', '', 'Merrimack', 'NH', '03054', company_id, person_id_55);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2010-12-01', 'FullTime', 'Active', now(), now(), person_id_55, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '12/01/2010', now(), now(), company_id, person_id_55, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_55, user_id_55);

END;


DECLARE
  user_id_56 int;
  person_id_56 int;
  family_member_id_56_0 int;
  company_user_id_56 int; 
  usercompanybenefitplanoption_id_56 int;
  usercompanybenefitplanoption_id_56_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ashleycoleman@fairviewhealthcare.com', 't', 'f', 'f', 'Ashley', 'Coleman', now(), now())
  RETURNING id into user_id_56;
  raise notice 'The user_id_56 after insert is %', user_id_56;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_56)
  RETURNING id into company_user_id_56;
  raise notice 'The company_user_id_56 is %', company_user_id_56;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_56)
  RETURNING id into usercompanybenefitplanoption_id_56;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_56)
  RETURNING id into usercompanybenefitplanoption_id_56_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Coleman', '', 'self', 'ALeCc_js5UtmzRGC7xnmEEttRB4Qqpaggc9s9rnUYNCNJYZda2olvlqhjyUKHCLoeOcMZfi1DL78', '1986-09-22', 'F', company_id, user_id_56, '')
  RETURNING id into person_id_56;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Clifton Avenue', '', 'Salem', 'NH', '03079', company_id, person_id_56);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034016987', person_id_56);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2015-02-27', 'FullTime', 'Active', now(), now(), person_id_56, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '02/27/2015', now(), now(), company_id, person_id_56, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('61699.0', person_id_56, usercompanybenefitplanoption_id_56);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_56, usercompanybenefitplanoption_id_56_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(48000.0, now(), now(), 17, person_id_56, user_id_56);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_56);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Isabella', '', 'Coleman', '', 'dependent', 'ALeCc_h64sddoem0lYT9o5h9FROO0Mx0nY4pbfYPNZNaDaQu-27eoEDnOSzsIECVYPKtybeFbYrF', '2015-09-10', 'F', company_id, user_id_56, '')
  RETURNING id into family_member_id_56_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 CLIFTON AVE', 'None', 'SALEM', 'NH', '03079.0', company_id, family_member_id_56_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034016987', family_member_id_56_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA138066', family_member_id_56_0, usercompanybenefitplanoption_id_56);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_56_0, usercompanybenefitplanoption_id_56_dental);

END;


DECLARE
  user_id_57 int;
  person_id_57 int;
  company_user_id_57 int; 
  usercompanybenefitplanoption_id_57 int;
  usercompanybenefitplanoption_id_57_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kylesargent@fairviewhealthcare.com', 't', 'f', 'f', 'Kyle', 'Sargent', now(), now())
  RETURNING id into user_id_57;
  raise notice 'The user_id_57 after insert is %', user_id_57;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_57)
  RETURNING id into company_user_id_57;
  raise notice 'The company_user_id_57 is %', company_user_id_57;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_57);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_57);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kyle', 'J', 'Sargent', '', 'self', '', '1991-08-07', 'M', company_id, user_id_57, '')
  RETURNING id into person_id_57;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Cassandra Lane', '', 'Nashua', 'NH', '03064', company_id, person_id_57);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17680.0, '2012-08-14', 'FullTime', 'Active', now(), now(), person_id_57, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17680.0, '08/14/2012', now(), now(), company_id, person_id_57, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(18000.0, now(), now(), 17, person_id_57, user_id_57);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_57, 3, 3, null, 20000.0, null);

END;


DECLARE
  user_id_58 int;
  person_id_58 int;
  company_user_id_58 int; 
  usercompanybenefitplanoption_id_58 int;
  usercompanybenefitplanoption_id_58_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jessicamorrell@fairviewhealthcare.com', 't', 'f', 'f', 'Jessica', 'Morrell', now(), now())
  RETURNING id into user_id_58;
  raise notice 'The user_id_58 after insert is %', user_id_58;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_58)
  RETURNING id into company_user_id_58;
  raise notice 'The company_user_id_58 is %', company_user_id_58;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_58)
  RETURNING id into usercompanybenefitplanoption_id_58;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_58)
  RETURNING id into usercompanybenefitplanoption_id_58_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Morrell', '', 'self', 'ALeCc_jqwK1gjYpdtGG-AyQx4uE2DVfA_rVTpdumyjNoOIE8xEG2UCO0QafT5s3wi7u_U-sisyeB', '1987-01-02', 'F', company_id, user_id_58, '')
  RETURNING id into person_id_58;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 1216', '', 'Pepperell', 'MA', '01463', company_id, person_id_58);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_58);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_58, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_58, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('64020.0', person_id_58, usercompanybenefitplanoption_id_58);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_58, usercompanybenefitplanoption_id_58_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(42000.0, now(), now(), 17, person_id_58, user_id_58);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_58, 0, 250.0);

END;


DECLARE
  user_id_59 int;
  person_id_59 int;
  company_user_id_59 int; 
  usercompanybenefitplanoption_id_59 int;
  usercompanybenefitplanoption_id_59_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'emilyteague@fairviewhealthcare.com', 't', 'f', 'f', 'Emily', 'Teague', now(), now())
  RETURNING id into user_id_59;
  raise notice 'The user_id_59 after insert is %', user_id_59;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_59)
  RETURNING id into company_user_id_59;
  raise notice 'The company_user_id_59 is %', company_user_id_59;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_59)
  RETURNING id into usercompanybenefitplanoption_id_59;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_59)
  RETURNING id into usercompanybenefitplanoption_id_59_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', '', 'Teague', '', 'self', 'ALeCc_hT0UcjAMto3cMa3IAnaR4Y9Sq0_-3IJGZm1gU4TE-SNMHekQqhcB4eGKUzGZaBpZ3yiPqm', '1987-10-01', 'F', company_id, user_id_59, '')
  RETURNING id into person_id_59;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Longwood Ave #2', '', 'Manchester', 'NH', '03109', company_id, person_id_59);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033150098', person_id_59);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_59, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '05/11/2015', now(), now(), company_id, person_id_59, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA132022', person_id_59, usercompanybenefitplanoption_id_59);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_59, usercompanybenefitplanoption_id_59_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(136000.0, now(), now(), 17, person_id_59, user_id_59);

END;


DECLARE
  user_id_60 int;
  person_id_60 int;
  company_user_id_60 int; 
  usercompanybenefitplanoption_id_60 int;
  usercompanybenefitplanoption_id_60_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'juliabizzarro@fairviewhealthcare.com', 't', 'f', 'f', 'Julia', 'Bizzarro', now(), now())
  RETURNING id into user_id_60;
  raise notice 'The user_id_60 after insert is %', user_id_60;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_60)
  RETURNING id into company_user_id_60;
  raise notice 'The company_user_id_60 is %', company_user_id_60;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_60);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_60);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Julia', '', 'Bizzarro', '', 'self', '', '1992-09-09', 'F', company_id, user_id_60, '')
  RETURNING id into person_id_60;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Cottage Ave', '', 'Nashua', 'NH', '03060', company_id, person_id_60);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22360.0, '2014-11-02', 'FullTime', 'Active', now(), now(), person_id_60, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22360.0, '11/02/2014', now(), now(), company_id, person_id_60, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(23000.0, now(), now(), 17, person_id_60, user_id_60);

END;


DECLARE
  user_id_61 int;
  person_id_61 int;
  family_member_id_61_1 int;
  family_member_id_61_0 int;
  family_member_id_61_2 int;
  company_user_id_61 int; 
  usercompanybenefitplanoption_id_61 int;
  usercompanybenefitplanoption_id_61_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'markfournier@fairviewhealthcare.com', 't', 'f', 'f', 'Mark', 'Fournier', now(), now())
  RETURNING id into user_id_61;
  raise notice 'The user_id_61 after insert is %', user_id_61;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_61)
  RETURNING id into company_user_id_61;
  raise notice 'The company_user_id_61 is %', company_user_id_61;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_61)
  RETURNING id into usercompanybenefitplanoption_id_61;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_61)
  RETURNING id into usercompanybenefitplanoption_id_61_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mark', '', 'Fournier', '', 'self', 'ALeCc_imfyya1PjhsU7ox4Mjw8M9nGrfZJThiDum1og3w6nEEcMbh180Tj-CNRId2fFMbJAqSbgl', '1980-11-02', 'M', company_id, user_id_61, '')
  RETURNING id into person_id_61;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_61);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', person_id_61);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2014-08-27', 'FullTime', 'Active', now(), now(), person_id_61, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '08/27/2014', now(), now(), company_id, person_id_61, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F43395', person_id_61, usercompanybenefitplanoption_id_61);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_61, usercompanybenefitplanoption_id_61_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_61, user_id_61);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_61, 0, 550.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_61);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ethan', '', 'Fournier', '', 'dependent', 'ALeCc_j3NoR_c3sXr5zkt__3Wp4ULDepf2DQChhL42-Rvr63YFeslMbq5aoClhyY4uUg4zZf_jKq', '2011-09-03', 'M', company_id, user_id_61, '')
  RETURNING id into family_member_id_61_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_61_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_61_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('201678.0', family_member_id_61_1, usercompanybenefitplanoption_id_61);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_61_1, usercompanybenefitplanoption_id_61_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jessica', '', 'Fournier', '', 'spouse', 'ALeCc_haninS7Oon7lhVbnxpbIF-4E2DCHxZTKn7A0DwGY4nZX5eCe1FBYxmnKvKbOQhkgk5WH8Q', '1976-03-31', 'F', company_id, user_id_61, '')
  RETURNING id into family_member_id_61_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_61_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_61_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA151118', family_member_id_61_0, usercompanybenefitplanoption_id_61);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_61_0, usercompanybenefitplanoption_id_61_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Noah', '', 'Fournier', '', 'dependent', 'ALeCc_gW5oznBIjg4ymZWftaJW_-5CGYHvJR1qZXwZ_nnCRV5KDXszd_D2VfQksNLWTM8eHnr1bs', '2014-11-14', 'M', company_id, user_id_61, '')
  RETURNING id into family_member_id_61_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_61_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_61_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('201678.0', family_member_id_61_2, usercompanybenefitplanoption_id_61);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_61_2, usercompanybenefitplanoption_id_61_dental);

END;


DECLARE
  user_id_62 int;
  person_id_62 int;
  company_user_id_62 int; 
  usercompanybenefitplanoption_id_62 int;
  usercompanybenefitplanoption_id_62_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dariustavallai@fairviewhealthcare.com', 't', 'f', 'f', 'Darius', 'Tavallai', now(), now())
  RETURNING id into user_id_62;
  raise notice 'The user_id_62 after insert is %', user_id_62;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_62)
  RETURNING id into company_user_id_62;
  raise notice 'The company_user_id_62 is %', company_user_id_62;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_62);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_62)
  RETURNING id into usercompanybenefitplanoption_id_62_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Darius', '', 'Tavallai', '', 'self', '', '1989-07-22', 'M', company_id, user_id_62, '')
  RETURNING id into person_id_62;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '19 Ichabod Dr', '', 'Merrimack', 'NH', '03054', company_id, person_id_62);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17617.0, '2011-12-03', 'FullTime', 'Active', now(), now(), person_id_62, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17617.0, '12/03/2011', now(), now(), company_id, person_id_62, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_62, usercompanybenefitplanoption_id_62_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(18000.0, now(), now(), 17, person_id_62, user_id_62);

END;


DECLARE
  user_id_63 int;
  person_id_63 int;
  company_user_id_63 int; 
  usercompanybenefitplanoption_id_63 int;
  usercompanybenefitplanoption_id_63_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ashleylevison@fairviewhealthcare.com', 't', 'f', 'f', 'Ashley', 'Levison', now(), now())
  RETURNING id into user_id_63;
  raise notice 'The user_id_63 after insert is %', user_id_63;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_63)
  RETURNING id into company_user_id_63;
  raise notice 'The company_user_id_63 is %', company_user_id_63;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_63)
  RETURNING id into usercompanybenefitplanoption_id_63;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_63)
  RETURNING id into usercompanybenefitplanoption_id_63_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Levison', '', 'self', 'ALeCc_inxR-t19VmfwYFKhYObrQAXkBe7e0EQCLXloBN07TT48FrTD7q7vahFiEahUIUlCeKdUH0', '1988-05-02', 'F', company_id, user_id_63, '')
  RETURNING id into person_id_63;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Watercrest Dr', '', 'Londonberry', 'NH', '03053', company_id, person_id_63);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035484392', person_id_63);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27170.0, '2014-07-21', 'FullTime', 'Active', now(), now(), person_id_63, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27170.0, '07/21/2014', now(), now(), company_id, person_id_63, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('G70568', person_id_63, usercompanybenefitplanoption_id_63);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_63, usercompanybenefitplanoption_id_63_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(28000.0, now(), now(), 17, person_id_63, user_id_63);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_63, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_63, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_63, 0, 1400.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_63);

END;


DECLARE
  user_id_64 int;
  person_id_64 int;
  company_user_id_64 int; 
  usercompanybenefitplanoption_id_64 int;
  usercompanybenefitplanoption_id_64_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'shannonohearn@fairviewhealthcare.com', 't', 'f', 'f', 'Shannon', 'O''Hearn', now(), now())
  RETURNING id into user_id_64;
  raise notice 'The user_id_64 after insert is %', user_id_64;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_64)
  RETURNING id into company_user_id_64;
  raise notice 'The company_user_id_64 is %', company_user_id_64;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_64)
  RETURNING id into usercompanybenefitplanoption_id_64;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_64)
  RETURNING id into usercompanybenefitplanoption_id_64_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shannon', '', 'O''Hearn', '', 'self', 'ALeCc_jdLBG8_-7G-mghyT_KbHLCwGG8SJt1vgHRQhyCRr8g9RUWJKMD4Im6St8gYJ064ffLGgra', '1977-12-02', 'F', company_id, user_id_64, '')
  RETURNING id into person_id_64;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '16 Walnut Street', '', 'Hudson', 'NH', '03051', company_id, person_id_64);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9785129683', person_id_64);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-04-14', 'FullTime', 'Active', now(), now(), person_id_64, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '04/14/2015', now(), now(), company_id, person_id_64, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('65085.0', person_id_64, usercompanybenefitplanoption_id_64);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_64, usercompanybenefitplanoption_id_64_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(59000.0, now(), now(), 17, person_id_64, user_id_64);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_64);

END;


DECLARE
  user_id_65 int;
  person_id_65 int;
  company_user_id_65 int; 
  usercompanybenefitplanoption_id_65 int;
  usercompanybenefitplanoption_id_65_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'areliousthomas@fairviewhealthcare.com', 't', 'f', 'f', 'Arelious', 'Thomas', now(), now())
  RETURNING id into user_id_65;
  raise notice 'The user_id_65 after insert is %', user_id_65;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_65)
  RETURNING id into company_user_id_65;
  raise notice 'The company_user_id_65 is %', company_user_id_65;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_65)
  RETURNING id into usercompanybenefitplanoption_id_65;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_65)
  RETURNING id into usercompanybenefitplanoption_id_65_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Arelious', 'A', 'Thomas', '', 'self', 'ALeCc_jWuowq5O_h1ZxnwdjbP8NMPg92norTYW0c_4mJ1YmbJcjPSNuFtmLfkc1XnF2Sp5b5uz0l', '1952-11-18', 'M', company_id, user_id_65, '')
  RETURNING id into person_id_65;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Page Rd', '', 'Litchfield', 'NH', '03052', company_id, person_id_65);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039435819', person_id_65);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28662.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_65, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28662.0, '09/01/2008', now(), now(), company_id, person_id_65, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA1696', person_id_65, usercompanybenefitplanoption_id_65);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_65, usercompanybenefitplanoption_id_65_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(29000.0, now(), now(), 17, person_id_65, user_id_65);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_65);

END;


DECLARE
  user_id_66 int;
  person_id_66 int;
  company_user_id_66 int; 
  usercompanybenefitplanoption_id_66 int;
  usercompanybenefitplanoption_id_66_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aletheahoch@fairviewhealthcare.com', 't', 'f', 'f', 'Alethea', 'Hoch', now(), now())
  RETURNING id into user_id_66;
  raise notice 'The user_id_66 after insert is %', user_id_66;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_66)
  RETURNING id into company_user_id_66;
  raise notice 'The company_user_id_66 is %', company_user_id_66;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_66)
  RETURNING id into usercompanybenefitplanoption_id_66;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_66)
  RETURNING id into usercompanybenefitplanoption_id_66_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alethea', 'M', 'Hoch', '', 'self', 'ALeCc_hAGu_ai3qOFj_4lwlJbyo_cWfA7gxxFumRDqgVszWcXfzP6vgf35FeJPehSvvGipPpQGcJ', '1954-06-26', 'F', company_id, user_id_66, '')
  RETURNING id into person_id_66;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '201 Chester Road', '', 'Candia', 'NH', '03034', company_id, person_id_66);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033203111', person_id_66);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 69222.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_66, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(69222.0, '09/01/2008', now(), now(), company_id, person_id_66, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('D60815', person_id_66, usercompanybenefitplanoption_id_66);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_66, usercompanybenefitplanoption_id_66_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(139000.0, now(), now(), 17, person_id_66, user_id_66);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_66, 0, 800.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_66, 0, 2000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_66);

END;


DECLARE
  user_id_67 int;
  person_id_67 int;
  company_user_id_67 int; 
  usercompanybenefitplanoption_id_67 int;
  usercompanybenefitplanoption_id_67_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brendamarquis@fairviewhealthcare.com', 't', 'f', 'f', 'Brenda', 'Marquis', now(), now())
  RETURNING id into user_id_67;
  raise notice 'The user_id_67 after insert is %', user_id_67;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_67)
  RETURNING id into company_user_id_67;
  raise notice 'The company_user_id_67 is %', company_user_id_67;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_67)
  RETURNING id into usercompanybenefitplanoption_id_67;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_67)
  RETURNING id into usercompanybenefitplanoption_id_67_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brenda', 'C', 'Marquis', '', 'self', 'ALeCc_h0PWU1TBJ0_Qtfy8DqovKMeQYROeHnpn5FpDeAbpSaS4br8LqXyZQjcEy7aB6E5sQfmPWX', '1953-12-16', 'F', company_id, user_id_67, '')
  RETURNING id into person_id_67;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Metropolitan Ave', '', 'Nashua', 'NH', '03064', company_id, person_id_67);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035952792', person_id_67);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28294.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_67, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28294.5, '09/01/2008', now(), now(), company_id, person_id_67, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F43395', person_id_67, usercompanybenefitplanoption_id_67);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_67, usercompanybenefitplanoption_id_67_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(29000.0, now(), now(), 17, person_id_67, user_id_67);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_67, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_67, 0, 1300.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_67);

END;


DECLARE
  user_id_68 int;
  person_id_68 int;
  company_user_id_68 int; 
  usercompanybenefitplanoption_id_68 int;
  usercompanybenefitplanoption_id_68_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melanieperry@fairviewhealthcare.com', 't', 'f', 'f', 'Melanie', 'Perry', now(), now())
  RETURNING id into user_id_68;
  raise notice 'The user_id_68 after insert is %', user_id_68;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_68)
  RETURNING id into company_user_id_68;
  raise notice 'The company_user_id_68 is %', company_user_id_68;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_68);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_68);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melanie', '', 'Perry', '', 'self', '', '1976-11-09', 'F', company_id, user_id_68, '')
  RETURNING id into person_id_68;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_68, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '07/14/2014', now(), now(), company_id, person_id_68, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(136000.0, now(), now(), 17, person_id_68, user_id_68);

END;


DECLARE
  user_id_69 int;
  person_id_69 int;
  company_user_id_69 int; 
  usercompanybenefitplanoption_id_69 int;
  usercompanybenefitplanoption_id_69_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melissarust@fairviewhealthcare.com', 't', 'f', 'f', 'Melissa', 'Rust', now(), now())
  RETURNING id into user_id_69;
  raise notice 'The user_id_69 after insert is %', user_id_69;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_69)
  RETURNING id into company_user_id_69;
  raise notice 'The company_user_id_69 is %', company_user_id_69;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_69);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_69);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melissa', '', 'Rust', '', 'self', '', '1982-10-02', 'F', company_id, user_id_69, '')
  RETURNING id into person_id_69;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '85 Clark Rd', '', 'Shirley', 'MA', '01464', company_id, person_id_69);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41800.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_69, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41800.0, '07/14/2014', now(), now(), company_id, person_id_69, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(42000.0, now(), now(), 17, person_id_69, user_id_69);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_69, 3, 3, null, 100000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_69, 0, 350.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_69, 0, 1000.0);

END;


DECLARE
  user_id_70 int;
  person_id_70 int;
  company_user_id_70 int; 
  usercompanybenefitplanoption_id_70 int;
  usercompanybenefitplanoption_id_70_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'donaldrankins@fairviewhealthcare.com', 't', 'f', 'f', 'Donald', 'Rankins', now(), now())
  RETURNING id into user_id_70;
  raise notice 'The user_id_70 after insert is %', user_id_70;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_70)
  RETURNING id into company_user_id_70;
  raise notice 'The company_user_id_70 is %', company_user_id_70;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_70);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_70);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Donald', '', 'Rankins', '', 'self', '', '1967-02-03', 'M', company_id, user_id_70, '')
  RETURNING id into person_id_70;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '58 North Short St', '', 'Andover', 'NH', '03216', company_id, person_id_70);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 56992.0, '2011-04-04', 'FullTime', 'Active', now(), now(), person_id_70, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56992.0, '04/04/2011', now(), now(), company_id, person_id_70, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(114000.0, now(), now(), 17, person_id_70, user_id_70);

END;


DECLARE
  user_id_71 int;
  person_id_71 int;
  company_user_id_71 int; 
  usercompanybenefitplanoption_id_71 int;
  usercompanybenefitplanoption_id_71_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'toddgrogg@fairviewhealthcare.com', 't', 'f', 'f', 'Todd', 'Grogg', now(), now())
  RETURNING id into user_id_71;
  raise notice 'The user_id_71 after insert is %', user_id_71;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_71)
  RETURNING id into company_user_id_71;
  raise notice 'The company_user_id_71 is %', company_user_id_71;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_71)
  RETURNING id into usercompanybenefitplanoption_id_71;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_71)
  RETURNING id into usercompanybenefitplanoption_id_71_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Todd', 'J', 'Grogg', '', 'self', 'ALeCc_hs59EUHaJAEtr4BZyQYczvXMDCXmwYT9WIAnUYXoZmwIM2yc74KkoeufydoHtlaCGdpvD4', '1966-05-06', 'M', company_id, user_id_71, '')
  RETURNING id into person_id_71;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '31 Congress St #5', '', 'Nashua', 'NH', '03062', company_id, person_id_71);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039137939', person_id_71);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24668.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_71, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24668.8, '09/01/2008', now(), now(), company_id, person_id_71, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA148091', person_id_71, usercompanybenefitplanoption_id_71);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_71, usercompanybenefitplanoption_id_71_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_71, user_id_71);

END;


DECLARE
  user_id_72 int;
  person_id_72 int;
  company_user_id_72 int; 
  usercompanybenefitplanoption_id_72 int;
  usercompanybenefitplanoption_id_72_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jennyxayachack@fairviewhealthcare.com', 't', 'f', 'f', 'Jenny', 'Xayachack', now(), now())
  RETURNING id into user_id_72;
  raise notice 'The user_id_72 after insert is %', user_id_72;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_72)
  RETURNING id into company_user_id_72;
  raise notice 'The company_user_id_72 is %', company_user_id_72;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_72);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_72)
  RETURNING id into usercompanybenefitplanoption_id_72_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jenny', '', 'Xayachack', '', 'self', '', '1990-05-25', 'F', company_id, user_id_72, '')
  RETURNING id into person_id_72;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 48214.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_72, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_72, null, 23.1800, 173.3333);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_72, usercompanybenefitplanoption_id_72_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(49000.0, now(), now(), 17, person_id_72, user_id_72);

END;


DECLARE
  user_id_73 int;
  person_id_73 int;
  company_user_id_73 int; 
  usercompanybenefitplanoption_id_73 int;
  usercompanybenefitplanoption_id_73_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cindyboucher@fairviewhealthcare.com', 't', 'f', 'f', 'Cindy', 'Boucher', now(), now())
  RETURNING id into user_id_73;
  raise notice 'The user_id_73 after insert is %', user_id_73;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_73)
  RETURNING id into company_user_id_73;
  raise notice 'The company_user_id_73 is %', company_user_id_73;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_73)
  RETURNING id into usercompanybenefitplanoption_id_73;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_73)
  RETURNING id into usercompanybenefitplanoption_id_73_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cindy', 'A', 'Boucher', '', 'self', 'ALeCc_i1yCZtsWT-yLQkWkTjDi_N6JelLMsQXypD9rWNVGT21Nj8H-CnKAlt5MNSxHdmvNiRzp1X', '1957-02-15', 'F', company_id, user_id_73, '')
  RETURNING id into person_id_73;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 PAGE RD APT 19', '', 'LITCHFIELD', 'NH', '03052.0', company_id, person_id_73);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038648134', person_id_73);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25313.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_73, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25313.6, '09/01/2008', now(), now(), company_id, person_id_73, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA128700', person_id_73, usercompanybenefitplanoption_id_73);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_73, usercompanybenefitplanoption_id_73_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(26000.0, now(), now(), 17, person_id_73, user_id_73);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(50000.0, 25000.0, null, 0, 0, 0, now(), now(), 12, person_id_73, 3, 3, null, 50000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_73, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_73, 0, 1000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_73);

END;


DECLARE
  user_id_74 int;
  person_id_74 int;
  company_user_id_74 int; 
  usercompanybenefitplanoption_id_74 int;
  usercompanybenefitplanoption_id_74_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'maryscafidi@fairviewhealthcare.com', 't', 'f', 'f', 'Mary', 'Scafidi', now(), now())
  RETURNING id into user_id_74;
  raise notice 'The user_id_74 after insert is %', user_id_74;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_74)
  RETURNING id into company_user_id_74;
  raise notice 'The company_user_id_74 is %', company_user_id_74;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_74)
  RETURNING id into usercompanybenefitplanoption_id_74;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_74)
  RETURNING id into usercompanybenefitplanoption_id_74_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mary', '', 'Scafidi', '', 'self', 'ALeCc_ga-KRl7HyI8Q4fN5ya_iAubQ6ULmtE6PW68SWMLgAuJZSz1XTnMWUO0gqcsNZ5bstXtd9N', '1959-01-18', 'F', company_id, user_id_74, '')
  RETURNING id into person_id_74;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '53 River Road', '', 'Hudson', 'NH', '03051', company_id, person_id_74);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034949588', person_id_74);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-02-18', 'FullTime', 'Active', now(), now(), person_id_74, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '02/18/2014', now(), now(), company_id, person_id_74, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('H59937', person_id_74, usercompanybenefitplanoption_id_74);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_74, usercompanybenefitplanoption_id_74_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_74, user_id_74);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, 10000.0, null, 0, 0, 0, now(), now(), 12, person_id_74, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_74, 0, 250.0);

END;


DECLARE
  user_id_75 int;
  person_id_75 int;
  company_user_id_75 int; 
  usercompanybenefitplanoption_id_75 int;
  usercompanybenefitplanoption_id_75_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brunildamejia@fairviewhealthcare.com', 't', 'f', 'f', 'Brunilda', 'Mejia', now(), now())
  RETURNING id into user_id_75;
  raise notice 'The user_id_75 after insert is %', user_id_75;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_75)
  RETURNING id into company_user_id_75;
  raise notice 'The company_user_id_75 is %', company_user_id_75;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_75);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_75)
  RETURNING id into usercompanybenefitplanoption_id_75_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brunilda', '', 'Mejia', '', 'self', '', '1972-08-17', 'F', company_id, user_id_75, '')
  RETURNING id into person_id_75;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '21 Longview Terrace', '', 'Methuen', 'MA', '01844', company_id, person_id_75);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 66019.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_75, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(66019.2, '09/01/2008', now(), now(), company_id, person_id_75, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_75, usercompanybenefitplanoption_id_75_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(133000.0, now(), now(), 17, person_id_75, user_id_75);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_75, 0, 650.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_75, 0, 2800.0);

END;


DECLARE
  user_id_76 int;
  person_id_76 int;
  company_user_id_76 int; 
  usercompanybenefitplanoption_id_76 int;
  usercompanybenefitplanoption_id_76_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jameshayes@fairviewhealthcare.com', 't', 'f', 'f', 'James', 'Hayes', now(), now())
  RETURNING id into user_id_76;
  raise notice 'The user_id_76 after insert is %', user_id_76;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_76)
  RETURNING id into company_user_id_76;
  raise notice 'The company_user_id_76 is %', company_user_id_76;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_76);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_76);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'James', '', 'Hayes', '', 'self', '', '1980-10-22', 'M', company_id, user_id_76, '')
  RETURNING id into person_id_76;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '12 pheasant St', '', 'Litchfield', 'NH', '03052', company_id, person_id_76);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2011-07-05', 'FullTime', 'Active', now(), now(), person_id_76, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '07/05/2011', now(), now(), company_id, person_id_76, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_76, user_id_76);

END;


DECLARE
  user_id_77 int;
  person_id_77 int;
  company_user_id_77 int; 
  usercompanybenefitplanoption_id_77 int;
  usercompanybenefitplanoption_id_77_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sherimello@fairviewhealthcare.com', 't', 'f', 'f', 'Sheri', 'Mello', now(), now())
  RETURNING id into user_id_77;
  raise notice 'The user_id_77 after insert is %', user_id_77;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_77)
  RETURNING id into company_user_id_77;
  raise notice 'The company_user_id_77 is %', company_user_id_77;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_77)
  RETURNING id into usercompanybenefitplanoption_id_77;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_77);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheri', '', 'Mello', '', 'self', 'ALeCc_hiCUkTVZPKuiJGNVaDlCohykY27e0USE6JYec64M4zteyojOSJX65QcJEzTKU0dJrhk0m3', '1979-09-04', 'F', company_id, user_id_77, '')
  RETURNING id into person_id_77;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '43A ABBOTT ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_77);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '5089338479', person_id_77);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21840.0, '2014-11-08', 'FullTime', 'Active', now(), now(), person_id_77, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21840.0, '11/08/2014', now(), now(), company_id, person_id_77, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA280862', person_id_77, usercompanybenefitplanoption_id_77);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_77, user_id_77);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_77);

END;


DECLARE
  user_id_78 int;
  person_id_78 int;
  family_member_id_78_1 int;
  family_member_id_78_0 int;
  company_user_id_78 int; 
  usercompanybenefitplanoption_id_78 int;
  usercompanybenefitplanoption_id_78_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'charlottelavoie@fairviewhealthcare.com', 't', 'f', 'f', 'Charlotte', 'Lavoie', now(), now())
  RETURNING id into user_id_78;
  raise notice 'The user_id_78 after insert is %', user_id_78;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_78)
  RETURNING id into company_user_id_78;
  raise notice 'The company_user_id_78 is %', company_user_id_78;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_78)
  RETURNING id into usercompanybenefitplanoption_id_78;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_78)
  RETURNING id into usercompanybenefitplanoption_id_78_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Charlotte', '', 'Lavoie', '', 'self', 'ALeCc_hVdHxdSr2JWi40Q7ASIeQfi_EsaImAjqfGBIFDT-8m_Pn21mpEPC5QvlvQE8Yq2CtAZCSX', '1955-09-02', 'F', company_id, user_id_78, '')
  RETURNING id into person_id_78;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 Willow Ln', '', 'Amherst', 'NH', '03031', company_id, person_id_78);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', person_id_78);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_78, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45000.0, '09/01/2008', now(), now(), company_id, person_id_78, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA96670', person_id_78, usercompanybenefitplanoption_id_78);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_78, usercompanybenefitplanoption_id_78_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(45000.0, now(), now(), 17, person_id_78, user_id_78);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_78);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Andrew', '', 'Lavoie', '', 'disabled dependent', 'ALeCc_i_tp_mQiPUzVvJ7WLiZVAgEfVVpcI8-SNxCE-3w84yxeFCkmyusa-NVWsNntLRFqDgMIC_', '1987-07-01', 'M', company_id, user_id_78, '')
  RETURNING id into family_member_id_78_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 WILLOW LN', 'None', 'AMHERST', 'NH', '03031.0', company_id, family_member_id_78_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', family_member_id_78_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('714980.0', family_member_id_78_1, usercompanybenefitplanoption_id_78);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_78_1, usercompanybenefitplanoption_id_78_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Paul', '', 'Lavoie', '', 'spouse', 'ALeCc_gunyDJfX7Wdzo7zDFHuqiMN_woz0FJ3mH1eLfoOt-pv0eCStNCvaEW_TDJOufsiXyJMHBZ', '1950-09-05', 'M', company_id, user_id_78, '')
  RETURNING id into family_member_id_78_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 WILLOW LN', 'None', 'AMHERST', 'NH', '03031.0', company_id, family_member_id_78_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', family_member_id_78_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F85122', family_member_id_78_0, usercompanybenefitplanoption_id_78);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_78_0, usercompanybenefitplanoption_id_78_dental);

END;


DECLARE
  user_id_79 int;
  person_id_79 int;
  company_user_id_79 int; 
  usercompanybenefitplanoption_id_79 int;
  usercompanybenefitplanoption_id_79_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'clarettamalin@fairviewhealthcare.com', 't', 'f', 'f', 'Claretta', 'Malin', now(), now())
  RETURNING id into user_id_79;
  raise notice 'The user_id_79 after insert is %', user_id_79;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_79)
  RETURNING id into company_user_id_79;
  raise notice 'The company_user_id_79 is %', company_user_id_79;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_79)
  RETURNING id into usercompanybenefitplanoption_id_79;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_79)
  RETURNING id into usercompanybenefitplanoption_id_79_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Claretta', '', 'Malin', '', 'self', 'ALeCc_j7UG_qtLAk6VHg4BZ0XvjT-Jr6OHghKi94nIiYm9J47XClsJQ0eXdCRFr5FBQuhCrHx1Rq', '1953-07-21', 'F', company_id, user_id_79, '')
  RETURNING id into person_id_79;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Barisano Way', '', 'Nashua', 'NH', '03063', company_id, person_id_79);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799077', person_id_79);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 38480.0, '2011-02-14', 'FullTime', 'Active', now(), now(), person_id_79, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(38480.0, '02/14/2011', now(), now(), company_id, person_id_79, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA333498', person_id_79, usercompanybenefitplanoption_id_79);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_79, usercompanybenefitplanoption_id_79_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(77000.0, now(), now(), 17, person_id_79, user_id_79);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_79, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_79, 0, 200.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_79);

END;


DECLARE
  user_id_80 int;
  person_id_80 int;
  company_user_id_80 int; 
  usercompanybenefitplanoption_id_80 int;
  usercompanybenefitplanoption_id_80_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'conraddupont@fairviewhealthcare.com', 't', 'f', 'f', 'Conrad', 'Dupont', now(), now())
  RETURNING id into user_id_80;
  raise notice 'The user_id_80 after insert is %', user_id_80;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_80)
  RETURNING id into company_user_id_80;
  raise notice 'The company_user_id_80 is %', company_user_id_80;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_80)
  RETURNING id into usercompanybenefitplanoption_id_80;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_80);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Conrad', '', 'Dupont', '', 'self', 'ALeCc_gp-l2MQNq9QdmTN3V4eN6bUvemSWa5n_jDp_KxNboLg15m5CJJrMMxPXnnAZpwc9-dFNXn', '1962-12-10', 'M', company_id, user_id_80, '')
  RETURNING id into person_id_80;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1 BEACON ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_80);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033206059', person_id_80);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_80, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27000.0, '06/09/2014', now(), now(), company_id, person_id_80, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA272739', person_id_80, usercompanybenefitplanoption_id_80);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(27000.0, now(), now(), 17, person_id_80, user_id_80);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_80);

END;


DECLARE
  user_id_81 int;
  person_id_81 int;
  company_user_id_81 int; 
  usercompanybenefitplanoption_id_81 int;
  usercompanybenefitplanoption_id_81_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lashandralong@fairviewhealthcare.com', 't', 'f', 'f', 'Lashandra', 'Long', now(), now())
  RETURNING id into user_id_81;
  raise notice 'The user_id_81 after insert is %', user_id_81;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_81)
  RETURNING id into company_user_id_81;
  raise notice 'The company_user_id_81 is %', company_user_id_81;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_81);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_81)
  RETURNING id into usercompanybenefitplanoption_id_81_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Lashandra', '', 'Long', '', 'self', '', '1977-06-19', 'F', company_id, user_id_81, '')
  RETURNING id into person_id_81;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '31 Arlington St #2', '', 'Nashua', 'NH', '03060', company_id, person_id_81);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21242.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_81, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21242.0, '08/04/2014', now(), now(), company_id, person_id_81, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_81, usercompanybenefitplanoption_id_81_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_81, user_id_81);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(40000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_81, 3, 3, null, 40000.0, null);

END;


DECLARE
  user_id_82 int;
  person_id_82 int;
  family_member_id_82_0 int;
  family_member_id_82_1 int;
  family_member_id_82_2 int;
  company_user_id_82 int; 
  usercompanybenefitplanoption_id_82 int;
  usercompanybenefitplanoption_id_82_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jillfavereau@fairviewhealthcare.com', 't', 'f', 'f', 'Jill', 'Favereau', now(), now())
  RETURNING id into user_id_82;
  raise notice 'The user_id_82 after insert is %', user_id_82;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_82)
  RETURNING id into company_user_id_82;
  raise notice 'The company_user_id_82 is %', company_user_id_82;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_82)
  RETURNING id into usercompanybenefitplanoption_id_82;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_82)
  RETURNING id into usercompanybenefitplanoption_id_82_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Favereau', '', 'self', 'ALeCc_jcdmsljiT2FqWqtz2mQLDAfQBe6-V9Minz-NHULhmHsopE34Sdhb2iQGhW661tEbjRSXhG', '1972-07-03', 'F', company_id, user_id_82, '')
  RETURNING id into person_id_82;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Mockingbird Hill Road', '', 'Windham', 'NH', '03087', company_id, person_id_82);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', person_id_82);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2010-11-22', 'FullTime', 'Active', now(), now(), person_id_82, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '11/22/2010', now(), now(), company_id, person_id_82, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F57533', person_id_82, usercompanybenefitplanoption_id_82);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_82, usercompanybenefitplanoption_id_82_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(117000.0, now(), now(), 17, person_id_82, user_id_82);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_82, 0, 550.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_82);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Clifford', '', 'Favereau', '', 'spouse', 'ALeCc_idzdWjgcXySKbLERStxExyBqkywvy4R8m1891q1P1uN_FqoNB9Mhd7FKsXCjb_8OdaeLM5', '1968-06-15', 'M', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA145464', family_member_id_82_0, usercompanybenefitplanoption_id_82);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_82_0, usercompanybenefitplanoption_id_82_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Anthony', '', 'Favereau', '', 'dependent', 'ALeCc_he0BbnTQrPI2Jwl65MjTb7BTgAxRqoV2zxgoeX6dlUiztaOLKwOLtb_RUtPpNFOZoTDdTu', '2001-04-16', 'M', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F73883', family_member_id_82_1, usercompanybenefitplanoption_id_82);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_82_1, usercompanybenefitplanoption_id_82_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Leah', '', 'Favereau', '', 'dependent', 'ALeCc_jZjeOGMz-XrXIv7qbZwHk_RkhZVQcdlZ6mnZoO30ZQ0VVeUTCLQA6piv12vgVfTIpDdWps', '2005-12-24', 'F', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F73883', family_member_id_82_2, usercompanybenefitplanoption_id_82);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_82_2, usercompanybenefitplanoption_id_82_dental);

END;


DECLARE
  user_id_83 int;
  person_id_83 int;
  company_user_id_83 int; 
  usercompanybenefitplanoption_id_83 int;
  usercompanybenefitplanoption_id_83_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'marianneclauss@fairviewhealthcare.com', 't', 'f', 'f', 'Marianne', 'Clauss', now(), now())
  RETURNING id into user_id_83;
  raise notice 'The user_id_83 after insert is %', user_id_83;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_83)
  RETURNING id into company_user_id_83;
  raise notice 'The company_user_id_83 is %', company_user_id_83;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_83)
  RETURNING id into usercompanybenefitplanoption_id_83;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_83)
  RETURNING id into usercompanybenefitplanoption_id_83_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Marianne', '', 'Clauss', '', 'self', 'ALeCc_hmWZ_39LLch1knr1hsv7r_RxkuH4jCyaGqASF6cxsIdqCZWk2rgeTdUaeFjHTyaDXU28zm', '1966-05-04', 'F', company_id, user_id_83, '')
  RETURNING id into person_id_83;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '61 Croteau Court', '2F', 'Manchester', 'NH', '03104', company_id, person_id_83);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034868424', person_id_83);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 43680.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_83, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(43680.0, '06/12/2014', now(), now(), company_id, person_id_83, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA128700', person_id_83, usercompanybenefitplanoption_id_83);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_83, usercompanybenefitplanoption_id_83_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(44000.0, now(), now(), 17, person_id_83, user_id_83);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_83);

END;


DECLARE
  user_id_84 int;
  person_id_84 int;
  company_user_id_84 int; 
  usercompanybenefitplanoption_id_84 int;
  usercompanybenefitplanoption_id_84_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'deniseparadise@fairviewhealthcare.com', 't', 'f', 'f', 'Denise', 'Paradise', now(), now())
  RETURNING id into user_id_84;
  raise notice 'The user_id_84 after insert is %', user_id_84;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_84)
  RETURNING id into company_user_id_84;
  raise notice 'The company_user_id_84 is %', company_user_id_84;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_84);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_84)
  RETURNING id into usercompanybenefitplanoption_id_84_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Denise', 'J', 'Paradise', '', 'self', '', '1972-05-11', 'F', company_id, user_id_84, '')
  RETURNING id into person_id_84;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Joseph Avenue', '', 'Hudson', 'NH', '03051', company_id, person_id_84);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 92705.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_84, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(92705.6, '09/01/2008', now(), now(), company_id, person_id_84, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_84, usercompanybenefitplanoption_id_84_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(186000.0, now(), now(), 17, person_id_84, user_id_84);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(250000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_84, 3, 3, null, 250000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_84, 0, 1000.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_84, 0, 4600.0);

END;


DECLARE
  user_id_85 int;
  person_id_85 int;
  family_member_id_85_0 int;
  company_user_id_85 int; 
  usercompanybenefitplanoption_id_85 int;
  usercompanybenefitplanoption_id_85_dental int;
BEGIN
  user_id_85 := 376;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 289, user_id_85)
  RETURNING id into usercompanybenefitplanoption_id_85;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_85)
  RETURNING id into usercompanybenefitplanoption_id_85_dental;

  person_id_85 := 422;
  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85794', person_id_85, usercompanybenefitplanoption_id_85);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_85, usercompanybenefitplanoption_id_85_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(140000.0, now(), now(), 17, person_id_85, user_id_85);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_85, 3, 3, null, 20000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_85, 0, 750.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_85, 0, 1500.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_85);

  family_member_id_85_0 := 423;
  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_85_0, usercompanybenefitplanoption_id_85_dental);

END;


DECLARE
  user_id_86 int;
  person_id_86 int;
  company_user_id_86 int; 
  usercompanybenefitplanoption_id_86 int;
  usercompanybenefitplanoption_id_86_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kalilamson@fairviewhealthcare.com', 't', 'f', 'f', 'Kali', 'Lamson', now(), now())
  RETURNING id into user_id_86;
  raise notice 'The user_id_86 after insert is %', user_id_86;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_86)
  RETURNING id into company_user_id_86;
  raise notice 'The company_user_id_86 is %', company_user_id_86;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_86);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_86);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kali', '', 'Lamson', '', 'self', '', '1987-08-01', 'F', company_id, user_id_86, '')
  RETURNING id into person_id_86;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '310 Brook Village Rd', '', 'Nashua', 'NH', '03062', company_id, person_id_86);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_86, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '06/09/2014', now(), now(), company_id, person_id_86, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_86, user_id_86);

END;


DECLARE
  user_id_87 int;
  person_id_87 int;
  company_user_id_87 int; 
  usercompanybenefitplanoption_id_87 int;
  usercompanybenefitplanoption_id_87_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'stephanieperez@fairviewhealthcare.com', 't', 'f', 'f', 'Stephanie', 'Perez', now(), now())
  RETURNING id into user_id_87;
  raise notice 'The user_id_87 after insert is %', user_id_87;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_87)
  RETURNING id into company_user_id_87;
  raise notice 'The company_user_id_87 is %', company_user_id_87;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_87);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_87);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', '', 'Perez', '', 'self', '', '1984-03-25', 'F', company_id, user_id_87, '')
  RETURNING id into person_id_87;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '218 Pheasant Run Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_87);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 18439.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_87, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_87, null, 11.8200, 130.0000);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(19000.0, now(), now(), 17, person_id_87, user_id_87);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_87, 0, 200.0);

END;


DECLARE
  user_id_88 int;
  person_id_88 int;
  company_user_id_88 int; 
  usercompanybenefitplanoption_id_88 int;
  usercompanybenefitplanoption_id_88_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dawnturcotte@fairviewhealthcare.com', 't', 'f', 'f', 'Dawn', 'Turcotte', now(), now())
  RETURNING id into user_id_88;
  raise notice 'The user_id_88 after insert is %', user_id_88;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_88)
  RETURNING id into company_user_id_88;
  raise notice 'The company_user_id_88 is %', company_user_id_88;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_88)
  RETURNING id into usercompanybenefitplanoption_id_88;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_88);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dawn', 'G', 'Turcotte', '', 'self', 'ALeCc_gg0nAEHZXMyVJuHxyd-Hqnoxb4y4KKgFDB2qpPI2IifZlJexkGSVrBWlcK77wJilaHob8K', '1964-08-15', 'F', company_id, user_id_88, '')
  RETURNING id into person_id_88;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Heather Court', '', 'Nashua', 'NH', '03062', company_id, person_id_88);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033960668', person_id_88);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.5, '2012-06-05', 'FullTime', 'Active', now(), now(), person_id_88, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '06/05/2012', now(), now(), company_id, person_id_88, null, 10.7500, 162.5000);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('FCH034', person_id_88, usercompanybenefitplanoption_id_88);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_88, user_id_88);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_88);

END;


DECLARE
  user_id_89 int;
  person_id_89 int;
  company_user_id_89 int; 
  usercompanybenefitplanoption_id_89 int;
  usercompanybenefitplanoption_id_89_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'eleanorknowlton@fairviewhealthcare.com', 't', 'f', 'f', 'Eleanor', 'Knowlton', now(), now())
  RETURNING id into user_id_89;
  raise notice 'The user_id_89 after insert is %', user_id_89;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_89)
  RETURNING id into company_user_id_89;
  raise notice 'The company_user_id_89 is %', company_user_id_89;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_89)
  RETURNING id into usercompanybenefitplanoption_id_89;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_89)
  RETURNING id into usercompanybenefitplanoption_id_89_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Eleanor', '', 'Knowlton', '', 'self', 'ALeCc_gVJJCJ4pfJD-44w3qB7hcuUu2iUqxGtT4jhegvT-Q5wRm3QQpKJqHDQpn-w5cvZghEAISk', '1956-02-09', 'F', company_id, user_id_89, '')
  RETURNING id into person_id_89;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Emerald Drive', '', 'Merrimack', 'NH', '03054', company_id, person_id_89);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8576361697', person_id_89);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19012.0, '2010-06-30', 'FullTime', 'Active', now(), now(), person_id_89, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19012.0, '06/30/2010', now(), now(), company_id, person_id_89, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA125738', person_id_89, usercompanybenefitplanoption_id_89);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_89, usercompanybenefitplanoption_id_89_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(20000.0, now(), now(), 17, person_id_89, user_id_89);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(20000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_89, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_89, 0, 200.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_89, 0, 1000.0);

END;


DECLARE
  user_id_90 int;
  person_id_90 int;
  family_member_id_90_1 int;
  family_member_id_90_0 int;
  family_member_id_90_2 int;
  company_user_id_90 int; 
  usercompanybenefitplanoption_id_90 int;
  usercompanybenefitplanoption_id_90_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sheilalamb@fairviewhealthcare.com', 't', 'f', 'f', 'Sheila', 'Lamb', now(), now())
  RETURNING id into user_id_90;
  raise notice 'The user_id_90 after insert is %', user_id_90;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_90)
  RETURNING id into company_user_id_90;
  raise notice 'The company_user_id_90 is %', company_user_id_90;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_90)
  RETURNING id into usercompanybenefitplanoption_id_90;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_90)
  RETURNING id into usercompanybenefitplanoption_id_90_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheila', 'M', 'Lamb', '', 'self', 'ALeCc_gDrteiXBvF2jLt913G9aVObN8S4AvuH19mrFKC9g9QwpOnTmYT6okWfYTkJO9tJE-aR55J', '1959-09-07', 'F', company_id, user_id_90, '')
  RETURNING id into person_id_90;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 Lake Shore Dr', '', 'Westford', 'MA', '01886', company_id, person_id_90);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', person_id_90);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-08-06', 'FullTime', 'Active', now(), now(), person_id_90, company_id, 1, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/06/2015', now(), now(), company_id, person_id_90, null, 28.0000, 173.3333);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('20684.0', person_id_90, usercompanybenefitplanoption_id_90);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_90, usercompanybenefitplanoption_id_90_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(59000.0, now(), now(), 17, person_id_90, user_id_90);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_90);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ethan', '', 'Lamb', '', 'dependent', 'ALeCc_j4PZlFewUvB8SNtMP60Yv9g_I7BbncJS4_bpgKr96PZ2I8nOZ6zeI91Gp2-UFXD1uJAbbE', '1996-04-02', 'M', company_id, user_id_90, '')
  RETURNING id into family_member_id_90_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_90_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_90_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('20684.0', family_member_id_90_1, usercompanybenefitplanoption_id_90);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_90_1, usercompanybenefitplanoption_id_90_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Daniel', '', 'Lamb', '', 'spouse', 'ALeCc_i3-es6dfXrYk-NV5HdngQo5uxjc-MZVn1uZAJClDP7p1Fg9HpwaYzBG5uxpOwYJGgqfTI4', '1962-01-26', 'M', company_id, user_id_90, '')
  RETURNING id into family_member_id_90_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_90_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_90_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA1031', family_member_id_90_0, usercompanybenefitplanoption_id_90);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_90_0, usercompanybenefitplanoption_id_90_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ainsley', '', 'Lamb', '', 'dependent', 'ALeCc_jiCF_tIFfMm1XOUFucMrcCQamMyxn6Ed-uz9FGh9Gada3LeWe8i23oR1f_0-7hpvlgv-7O', '1998-07-17', 'F', company_id, user_id_90, '')
  RETURNING id into family_member_id_90_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_90_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_90_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA1031', family_member_id_90_2, usercompanybenefitplanoption_id_90);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_90_2, usercompanybenefitplanoption_id_90_dental);

END;


DECLARE
  user_id_91 int;
  person_id_91 int;
  family_member_id_91_0 int;
  company_user_id_91 int; 
  usercompanybenefitplanoption_id_91 int;
  usercompanybenefitplanoption_id_91_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cathyriley@fairviewhealthcare.com', 't', 'f', 'f', 'Cathy', 'Riley', now(), now())
  RETURNING id into user_id_91;
  raise notice 'The user_id_91 after insert is %', user_id_91;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_91)
  RETURNING id into company_user_id_91;
  raise notice 'The company_user_id_91 is %', company_user_id_91;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_91)
  RETURNING id into usercompanybenefitplanoption_id_91;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_91);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cathy', '', 'Riley', '', 'self', 'ALeCc_iBefY_Zb1WkuDZAZ6bOk8W21ZDT0HWbFAciPOmVBIr4L_8QqT49QuxC1hZjo8q_rewHH17', '1959-02-22', 'F', company_id, user_id_91, '')
  RETURNING id into person_id_91;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Chatham Street', '', 'Hudson', 'NH', '03051', company_id, person_id_91);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032332736', person_id_91);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2014-09-14', 'FullTime', 'Active', now(), now(), person_id_91, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '09/14/2014', now(), now(), company_id, person_id_91, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA280862', person_id_91, usercompanybenefitplanoption_id_91);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_91, user_id_91);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_91);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'William', '', 'Riley', '', 'spouse', 'ALeCc_hTzEcCsJg3OLZSna7Iq5v_5u593YfwiG0QjE8qJhP4W9x8fx3pHH9TwlvZ6SZZnXql7DMi', '1953-04-19', 'M', company_id, user_id_91, '')
  RETURNING id into family_member_id_91_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 CHATHAM ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_91_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032332736', family_member_id_91_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA275111', family_member_id_91_0, usercompanybenefitplanoption_id_91);

END;


DECLARE
  user_id_92 int;
  person_id_92 int;
  company_user_id_92 int; 
  usercompanybenefitplanoption_id_92 int;
  usercompanybenefitplanoption_id_92_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robertacarrigg@fairviewhealthcare.com', 't', 'f', 'f', 'Roberta', 'Carrigg', now(), now())
  RETURNING id into user_id_92;
  raise notice 'The user_id_92 after insert is %', user_id_92;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_92)
  RETURNING id into company_user_id_92;
  raise notice 'The company_user_id_92 is %', company_user_id_92;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_92)
  RETURNING id into usercompanybenefitplanoption_id_92;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_92)
  RETURNING id into usercompanybenefitplanoption_id_92_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roberta', 'A', 'Carrigg', '', 'self', 'ALeCc_gnyNEYCWiuAfvWVah5VB-aMUzhZuWDvWGaAMyYgmHL1zHs0LDfDM2TX1w_f3ZQwpvZVrYw', '1958-03-07', 'F', company_id, user_id_92, '')
  RETURNING id into person_id_92;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Sunrise Trail', '', 'Nashua', 'NH', '03060', company_id, person_id_92);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_92);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27040.0, '2013-06-10', 'FullTime', 'Active', now(), now(), person_id_92, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27040.0, '06/10/2013', now(), now(), company_id, person_id_92, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('E98023', person_id_92, usercompanybenefitplanoption_id_92);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_92, usercompanybenefitplanoption_id_92_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(28000.0, now(), now(), 17, person_id_92, user_id_92);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_92, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_92, 0, 1400.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_92);

END;


DECLARE
  user_id_93 int;
  person_id_93 int;
  company_user_id_93 int; 
  usercompanybenefitplanoption_id_93 int;
  usercompanybenefitplanoption_id_93_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'annplourde@fairviewhealthcare.com', 't', 'f', 'f', 'Ann', 'Plourde', now(), now())
  RETURNING id into user_id_93;
  raise notice 'The user_id_93 after insert is %', user_id_93;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_93)
  RETURNING id into company_user_id_93;
  raise notice 'The company_user_id_93 is %', company_user_id_93;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_93);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_93)
  RETURNING id into usercompanybenefitplanoption_id_93_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ann', 'M', 'Plourde', '', 'self', '', '1964-07-27', 'F', company_id, user_id_93, '')
  RETURNING id into person_id_93;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '18 School Street', '', 'Salem', 'NH', '03079', company_id, person_id_93);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 76169.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_93, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(76169.0, '09/01/2008', now(), now(), company_id, person_id_93, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_93, usercompanybenefitplanoption_id_93_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(153000.0, now(), now(), 17, person_id_93, user_id_93);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(250000.0, null, 10000.0, 0, 0, 0, now(), now(), 12, person_id_93, 3, 3, null, 250000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_93, 0, 850.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_93, 0, 3700.0);

END;


DECLARE
  user_id_94 int;
  person_id_94 int;
  company_user_id_94 int; 
  usercompanybenefitplanoption_id_94 int;
  usercompanybenefitplanoption_id_94_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kathrynmasterson@fairviewhealthcare.com', 't', 'f', 'f', 'Kathryn', 'Masterson', now(), now())
  RETURNING id into user_id_94;
  raise notice 'The user_id_94 after insert is %', user_id_94;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_94)
  RETURNING id into company_user_id_94;
  raise notice 'The company_user_id_94 is %', company_user_id_94;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_94)
  RETURNING id into usercompanybenefitplanoption_id_94;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_94);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kathryn', '', 'Masterson', '', 'self', 'ALeCc_izxT351rP_C1S_saj0Ndr1H9Lgn0DHLXDtZro_c-FezaHcniGCpdykWfMlw7ZJMlKj8lvk', '1950-11-05', 'F', company_id, user_id_94, '')
  RETURNING id into person_id_94;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '70 Joppa Rd', '', 'Merrimack', 'NH', '03054', company_id, person_id_94);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039210228', person_id_94);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_94, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40000.0, '09/01/2008', now(), now(), company_id, person_id_94, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA323197', person_id_94, usercompanybenefitplanoption_id_94);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(40000.0, now(), now(), 17, person_id_94, user_id_94);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_94, 0, 400.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_94, 0, 1900.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_94);

END;


DECLARE
  user_id_95 int;
  person_id_95 int;
  company_user_id_95 int; 
  usercompanybenefitplanoption_id_95 int;
  usercompanybenefitplanoption_id_95_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sarahst_john@fairviewhealthcare.com', 't', 'f', 'f', 'Sarah', 'St John', now(), now())
  RETURNING id into user_id_95;
  raise notice 'The user_id_95 after insert is %', user_id_95;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_95)
  RETURNING id into company_user_id_95;
  raise notice 'The company_user_id_95 is %', company_user_id_95;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_95);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_95);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sarah', '', 'St John', '', 'self', '', '1986-04-19', 'F', company_id, user_id_95, '')
  RETURNING id into person_id_95;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '88 3/4 Palm Street', '', 'Nasua', 'NH', '03060', company_id, person_id_95);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19851.0, '2013-07-26', 'FullTime', 'Active', now(), now(), person_id_95, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19851.0, '07/26/2013', now(), now(), company_id, person_id_95, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(20000.0, now(), now(), 17, person_id_95, user_id_95);

END;


DECLARE
  user_id_96 int;
  person_id_96 int;
  company_user_id_96 int; 
  usercompanybenefitplanoption_id_96 int;
  usercompanybenefitplanoption_id_96_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dianahall@fairviewhealthcare.com', 't', 'f', 'f', 'Diana', 'Hall', now(), now())
  RETURNING id into user_id_96;
  raise notice 'The user_id_96 after insert is %', user_id_96;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_96)
  RETURNING id into company_user_id_96;
  raise notice 'The company_user_id_96 is %', company_user_id_96;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 288, user_id_96)
  RETURNING id into usercompanybenefitplanoption_id_96;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_96)
  RETURNING id into usercompanybenefitplanoption_id_96_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diana', '', 'Hall', '', 'self', 'ALeCc_jgrvD_8kfA-dhf8yoBcbSG4Kq_sianovhmG8jdCPLUCbSQdTxgZkNaqDo3LgkILgcQqLbi', '1970-12-02', 'F', company_id, user_id_96, '')
  RETURNING id into person_id_96;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 JAMES WAY', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_96);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037933476', person_id_96);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20716.0, '2010-04-27', 'FullTime', 'Active', now(), now(), person_id_96, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20716.0, '04/27/2010', now(), now(), company_id, person_id_96, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA52384', person_id_96, usercompanybenefitplanoption_id_96);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_96, usercompanybenefitplanoption_id_96_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_96, user_id_96);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_96);

END;


DECLARE
  user_id_97 int;
  person_id_97 int;
  company_user_id_97 int; 
  usercompanybenefitplanoption_id_97 int;
  usercompanybenefitplanoption_id_97_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rosefournier@fairviewhealthcare.com', 't', 'f', 'f', 'Rose', 'Fournier', now(), now())
  RETURNING id into user_id_97;
  raise notice 'The user_id_97 after insert is %', user_id_97;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_97)
  RETURNING id into company_user_id_97;
  raise notice 'The company_user_id_97 is %', company_user_id_97;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_97);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_97);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rose', '', 'Fournier', '', 'self', '', '1962-04-05', 'F', company_id, user_id_97, '')
  RETURNING id into person_id_97;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32344.0, '2013-09-09', 'FullTime', 'Active', now(), now(), person_id_97, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32344.0, '09/09/2013', now(), now(), company_id, person_id_97, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(33000.0, now(), now(), 17, person_id_97, user_id_97);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_97, 0, 350.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_97, 0, 1600.0);

END;


DECLARE
  user_id_98 int;
  person_id_98 int;
  company_user_id_98 int; 
  usercompanybenefitplanoption_id_98 int;
  usercompanybenefitplanoption_id_98_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'paulinepoisson-levesque@fairviewhealthcare.com', 't', 'f', 'f', 'Pauline', 'Poisson-Levesque', now(), now())
  RETURNING id into user_id_98;
  raise notice 'The user_id_98 after insert is %', user_id_98;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_98)
  RETURNING id into company_user_id_98;
  raise notice 'The company_user_id_98 is %', company_user_id_98;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_98);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_98)
  RETURNING id into usercompanybenefitplanoption_id_98_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Pauline', 'A', 'Poisson-Levesque', '', 'self', '', '1949-05-19', 'F', company_id, user_id_98, '')
  RETURNING id into person_id_98;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Autumn Leaf Dr', 'Apt 2', 'Nashua', 'NH', '03062', company_id, person_id_98);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37167.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_98, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37167.0, '09/01/2008', now(), now(), company_id, person_id_98, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_98, usercompanybenefitplanoption_id_98_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_98, user_id_98);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_98, 0, 350.0);

END;


DECLARE
  user_id_99 int;
  person_id_99 int;
  company_user_id_99 int; 
  usercompanybenefitplanoption_id_99 int;
  usercompanybenefitplanoption_id_99_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jamesbush@fairviewhealthcare.com', 't', 'f', 'f', 'James', 'Bush', now(), now())
  RETURNING id into user_id_99;
  raise notice 'The user_id_99 after insert is %', user_id_99;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_99)
  RETURNING id into company_user_id_99;
  raise notice 'The company_user_id_99 is %', company_user_id_99;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_99)
  RETURNING id into usercompanybenefitplanoption_id_99;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_99);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'James', '', 'Bush', '', 'self', 'ALeCc_gMawt8o3cfIUlP-uhVg4btXNoO1oFhSsLPWLZzp5qOVWUAwxijeemL7dr_wTvsO1geSMiP', '1989-01-09', 'M', company_id, user_id_99, '')
  RETURNING id into person_id_99;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 Hawkstead Hollow', '', 'Nashua', 'NH', '03063', company_id, person_id_99);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034403317', person_id_99);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21450.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_99, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '06/12/2014', now(), now(), company_id, person_id_99, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA123876', person_id_99, usercompanybenefitplanoption_id_99);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_99, user_id_99);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(30000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_99, 3, 3, null, null, null);

END;


DECLARE
  user_id_100 int;
  person_id_100 int;
  company_user_id_100 int; 
  usercompanybenefitplanoption_id_100 int;
  usercompanybenefitplanoption_id_100_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'janetmaxfield@fairviewhealthcare.com', 't', 'f', 'f', 'Janet', 'Maxfield', now(), now())
  RETURNING id into user_id_100;
  raise notice 'The user_id_100 after insert is %', user_id_100;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_100)
  RETURNING id into company_user_id_100;
  raise notice 'The company_user_id_100 is %', company_user_id_100;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_100)
  RETURNING id into usercompanybenefitplanoption_id_100;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_100)
  RETURNING id into usercompanybenefitplanoption_id_100_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Janet', '', 'Maxfield', '', 'self', 'ALeCc_i7QEjXvtsA20B1-MulKT6pX-Oi_pnTQj7yvMJq6V42FH0S9h023dcvP_k7P6vFK35K8Fpa', '1964-08-26', 'F', company_id, user_id_100, '')
  RETURNING id into person_id_100;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '30 Library St Apt 2', '', 'Hudson', 'NH', '03051', company_id, person_id_100);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033055088', person_id_100);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31616.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_100, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31616.0, '07/14/2014', now(), now(), company_id, person_id_100, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('NA1039', person_id_100, usercompanybenefitplanoption_id_100);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_100, usercompanybenefitplanoption_id_100_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(32000.0, now(), now(), 17, person_id_100, user_id_100);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_100, 0, 350.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_100, 0, 1600.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_100);

END;


DECLARE
  user_id_101 int;
  person_id_101 int;
  company_user_id_101 int; 
  usercompanybenefitplanoption_id_101 int;
  usercompanybenefitplanoption_id_101_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'christophergrenier@fairviewhealthcare.com', 't', 'f', 'f', 'Christopher', 'Grenier', now(), now())
  RETURNING id into user_id_101;
  raise notice 'The user_id_101 after insert is %', user_id_101;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_101)
  RETURNING id into company_user_id_101;
  raise notice 'The company_user_id_101 is %', company_user_id_101;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_101);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_101);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Christopher', '', 'Grenier', '', 'self', '', '1989-08-20', 'M', company_id, user_id_101, '')
  RETURNING id into person_id_101;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23533.0, '2015-07-15', 'FullTime', 'Active', now(), now(), person_id_101, company_id, null, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23533.0, '07/15/2015', now(), now(), company_id, person_id_101, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(24000.0, now(), now(), 17, person_id_101, user_id_101);

END;


DECLARE
  user_id_102 int;
  person_id_102 int;
  family_member_id_102_2 int;
  family_member_id_102_0 int;
  family_member_id_102_1 int;
  company_user_id_102 int; 
  usercompanybenefitplanoption_id_102 int;
  usercompanybenefitplanoption_id_102_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'patricialavoie@fairviewhealthcare.com', 't', 'f', 'f', 'Patricia', 'Lavoie', now(), now())
  RETURNING id into user_id_102;
  raise notice 'The user_id_102 after insert is %', user_id_102;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_102)
  RETURNING id into company_user_id_102;
  raise notice 'The company_user_id_102 is %', company_user_id_102;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_102)
  RETURNING id into usercompanybenefitplanoption_id_102;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_102)
  RETURNING id into usercompanybenefitplanoption_id_102_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Patricia', 'A', 'Lavoie', '', 'self', 'ALeCc_gnXYXHJlSG-4IeYW8YtnOcYzUTB4-CHH7XCvuGPsKA3dBohem1oGIqhM2fRcNbPmXDOekx', '1965-06-09', 'F', company_id, user_id_102, '')
  RETURNING id into person_id_102;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 Cleveland Hill Road', '', 'Brookline', 'NH', '03033', company_id, person_id_102);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', person_id_102);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2013-05-29', 'FullTime', 'Active', now(), now(), person_id_102, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '05/29/2013', now(), now(), company_id, person_id_102, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA333498', person_id_102, usercompanybenefitplanoption_id_102);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_102, usercompanybenefitplanoption_id_102_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_102, user_id_102);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_102);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Molly', '', 'Lavoie', '', 'dependent', 'ALeCc_jWzdcPhjH7a9jTzc_E-zaDpK8mtjXJkILTd-8g65imuyXJcwzpRNpruptlOqR6iil5zlZI', '1998-11-25', 'F', company_id, user_id_102, '')
  RETURNING id into family_member_id_102_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_102_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_102_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA12613', family_member_id_102_2, usercompanybenefitplanoption_id_102);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_102_2, usercompanybenefitplanoption_id_102_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Raymond', '', 'Lavoie', '', 'spouse', 'ALeCc_gQPzLzgzN4smjquSl0_MCTMy3SDKtjF1-gD5erbU8oJHRIIoGreAYB8-22ysD84rEHKBdP', '1964-07-28', 'M', company_id, user_id_102, '')
  RETURNING id into family_member_id_102_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_102_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_102_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('C66065', family_member_id_102_0, usercompanybenefitplanoption_id_102);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_102_0, usercompanybenefitplanoption_id_102_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jessica', '', 'Lavoie', '', 'dependent', 'ALeCc_gcNZO_0oq8x-tJNZOSTyK5BAnRxoqtuv_hfU4xzoFe30msmaf4ohDlwgKygieg66UojyAg', '1996-05-03', 'F', company_id, user_id_102, '')
  RETURNING id into family_member_id_102_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_102_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_102_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA333498', family_member_id_102_1, usercompanybenefitplanoption_id_102);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_102_1, usercompanybenefitplanoption_id_102_dental);

END;


DECLARE
  user_id_103 int;
  person_id_103 int;
  company_user_id_103 int; 
  usercompanybenefitplanoption_id_103 int;
  usercompanybenefitplanoption_id_103_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'annagelinas@fairviewhealthcare.com', 't', 'f', 'f', 'Anna', 'Gelinas', now(), now())
  RETURNING id into user_id_103;
  raise notice 'The user_id_103 after insert is %', user_id_103;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_103)
  RETURNING id into company_user_id_103;
  raise notice 'The company_user_id_103 is %', company_user_id_103;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_103)
  RETURNING id into usercompanybenefitplanoption_id_103;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_103)
  RETURNING id into usercompanybenefitplanoption_id_103_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Anna', 'M', 'Gelinas', '', 'self', 'ALeCc_igmf48GCP43-8QY1XsVJsPu2Pn-ZbIBnEamsne5inyCrILwdHUgQFA1wnzV7ehexi6YVYY', '1972-10-03', 'F', company_id, user_id_103, '')
  RETURNING id into person_id_103;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Cross St', 'Apt 1', 'Nashua', 'NH', '03064', company_id, person_id_103);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038806149', person_id_103);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37689.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_103, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37689.0, '09/01/2008', now(), now(), company_id, person_id_103, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA97575', person_id_103, usercompanybenefitplanoption_id_103);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_103, usercompanybenefitplanoption_id_103_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(38000.0, now(), now(), 17, person_id_103, user_id_103);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_103, 0, 450.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_103, 0, 1900.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_103);

END;


DECLARE
  user_id_104 int;
  person_id_104 int;
  company_user_id_104 int; 
  usercompanybenefitplanoption_id_104 int;
  usercompanybenefitplanoption_id_104_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'hollymatthew@fairviewhealthcare.com', 't', 'f', 'f', 'Holly', 'Matthew', now(), now())
  RETURNING id into user_id_104;
  raise notice 'The user_id_104 after insert is %', user_id_104;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_104)
  RETURNING id into company_user_id_104;
  raise notice 'The company_user_id_104 is %', company_user_id_104;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_104)
  RETURNING id into usercompanybenefitplanoption_id_104;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_104)
  RETURNING id into usercompanybenefitplanoption_id_104_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Holly', '', 'Matthew', '', 'self', 'ALeCc_h6IDBDao2kYq8KL0cxKcBmbiau1LdSfQcwHOoPMeMLDMf1wj7_3Zr-qiURPgR7NEQpL9S2', '1971-05-20', 'F', company_id, user_id_104, '')
  RETURNING id into person_id_104;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '25 CHEYENNE DR', '', 'NASHUA', 'NH', '03063', company_id, person_id_104);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827389', person_id_104);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17550.0, '2012-08-01', 'FullTime', 'Active', now(), now(), person_id_104, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17550.0, '08/01/2012', now(), now(), company_id, person_id_104, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('G00063', person_id_104, usercompanybenefitplanoption_id_104);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_104, usercompanybenefitplanoption_id_104_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(18000.0, now(), now(), 17, person_id_104, user_id_104);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_104, 0, 200.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_104, 0, 900.0);

END;


DECLARE
  user_id_105 int;
  person_id_105 int;
  family_member_id_105_0 int;
  company_user_id_105 int; 
  usercompanybenefitplanoption_id_105 int;
  usercompanybenefitplanoption_id_105_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'michelledodge@fairviewhealthcare.com', 't', 'f', 'f', 'Michelle', 'Dodge', now(), now())
  RETURNING id into user_id_105;
  raise notice 'The user_id_105 after insert is %', user_id_105;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_105)
  RETURNING id into company_user_id_105;
  raise notice 'The company_user_id_105 is %', company_user_id_105;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_105)
  RETURNING id into usercompanybenefitplanoption_id_105;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_105)
  RETURNING id into usercompanybenefitplanoption_id_105_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'L', 'Dodge', '', 'self', 'ALeCc_iS9Itww2h28sg3LDXrWnvWNxZ5_X2OsygPL3ignegyW5s7ea96c0BvUaOqgyCZwiegjA-Z', '1968-09-21', 'F', company_id, user_id_105, '')
  RETURNING id into person_id_105;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Arcadian Lane', '', 'Litchfield', 'NH', '03052', company_id, person_id_105);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034247660', person_id_105);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 64542.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_105, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(64542.4, '09/01/2008', now(), now(), company_id, person_id_105, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA138916', person_id_105, usercompanybenefitplanoption_id_105);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_105, usercompanybenefitplanoption_id_105_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(130000.0, now(), now(), 17, person_id_105, user_id_105);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_105, 0, 500.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_105, 0, 2000.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_105);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kent', '', 'Dodge', '', 'spouse', 'ALeCc_hDXGLQ25XT35HLk-jR66lXzPqU42Ut9GaiArb6jrk5D1AXeX6I4jCTUdRC9HaoXk1XwGdg', '1957-10-03', 'M', company_id, user_id_105, '')
  RETURNING id into family_member_id_105_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 ARCADIAN LN', 'None', 'LITCHFIELD', 'NH', '03052.0', company_id, family_member_id_105_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034247660', family_member_id_105_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('F43395', family_member_id_105_0, usercompanybenefitplanoption_id_105);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_105_0, usercompanybenefitplanoption_id_105_dental);

END;


DECLARE
  user_id_106 int;
  person_id_106 int;
  family_member_id_106_0 int;
  company_user_id_106 int; 
  usercompanybenefitplanoption_id_106 int;
  usercompanybenefitplanoption_id_106_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'elizabethfahey@fairviewhealthcare.com', 't', 'f', 'f', 'Elizabeth', 'Fahey', now(), now())
  RETURNING id into user_id_106;
  raise notice 'The user_id_106 after insert is %', user_id_106;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_106)
  RETURNING id into company_user_id_106;
  raise notice 'The company_user_id_106 is %', company_user_id_106;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 295, user_id_106)
  RETURNING id into usercompanybenefitplanoption_id_106;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_106)
  RETURNING id into usercompanybenefitplanoption_id_106_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', 'A', 'Fahey', '', 'self', 'ALeCc_iiZzy83tB9NGW36UcUQ2ytFCL5HugZicgUd6_TyLDH35vIktnJIY1S4kj56pMtM9SfECt4', '1954-10-28', 'F', company_id, user_id_106, '')
  RETURNING id into person_id_106;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Radcliffe Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_106);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035981307', person_id_106);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24024.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_106, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24024.0, '09/01/2008', now(), now(), company_id, person_id_106, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA276742', person_id_106, usercompanybenefitplanoption_id_106);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_106, usercompanybenefitplanoption_id_106_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_106, user_id_106);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_106, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_106, 0, 1200.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_106);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Michael', '', 'Fahey', '', 'spouse', 'ALeCc_jH_jpoJUiDUJ2ADPLpAN00LIOqq0SyzKkw8LxvOMYa4NySrAr75nvk-BY2y2xGd-I_GXqo', '1953-02-09', 'M', company_id, user_id_106, '')
  RETURNING id into family_member_id_106_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 RADCLIFFE DR', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_106_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035981307', family_member_id_106_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('7525.0', family_member_id_106_0, usercompanybenefitplanoption_id_106);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_106_0, usercompanybenefitplanoption_id_106_dental);

END;


DECLARE
  user_id_107 int;
  person_id_107 int;
  company_user_id_107 int; 
  usercompanybenefitplanoption_id_107 int;
  usercompanybenefitplanoption_id_107_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresacronin@fairviewhealthcare.com', 't', 'f', 'f', 'Theresa', 'Cronin', now(), now())
  RETURNING id into user_id_107;
  raise notice 'The user_id_107 after insert is %', user_id_107;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_107)
  RETURNING id into company_user_id_107;
  raise notice 'The company_user_id_107 is %', company_user_id_107;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_107)
  RETURNING id into usercompanybenefitplanoption_id_107;

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_107);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', '', 'Cronin', '', 'self', 'ALeCc_i5dox2HIaNZJUhtakNUsNvbqMzfS387mCTfBoArd0q2yGRalltYjZYqL2zVzAqWK9pTTLy', '1949-12-05', 'F', company_id, user_id_107, '')
  RETURNING id into person_id_107;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Heidi Lane', '', 'Nashua', 'NH', '03062', company_id, person_id_107);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038864214', person_id_107);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_107, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '09/01/2008', now(), now(), company_id, person_id_107, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA19803', person_id_107, usercompanybenefitplanoption_id_107);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(17000.0, now(), now(), 17, person_id_107, user_id_107);

END;


DECLARE
  user_id_108 int;
  person_id_108 int;
  company_user_id_108 int; 
  usercompanybenefitplanoption_id_108 int;
  usercompanybenefitplanoption_id_108_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'richardford@fairviewhealthcare.com', 't', 'f', 'f', 'Richard', 'Ford', now(), now())
  RETURNING id into user_id_108;
  raise notice 'The user_id_108 after insert is %', user_id_108;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_108)
  RETURNING id into company_user_id_108;
  raise notice 'The company_user_id_108 is %', company_user_id_108;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_108);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_108);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', '', 'Ford', '', 'self', '', '1990-02-11', 'M', company_id, user_id_108, '')
  RETURNING id into person_id_108;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2006-06-05', 'FullTime', 'Active', now(), now(), person_id_108, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '06/05/2006', now(), now(), company_id, person_id_108, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_108, user_id_108);

END;


DECLARE
  user_id_109 int;
  person_id_109 int;
  family_member_id_109_0 int;
  company_user_id_109 int; 
  usercompanybenefitplanoption_id_109 int;
  usercompanybenefitplanoption_id_109_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'mariamiranda@fairviewhealthcare.com', 't', 'f', 'f', 'Maria', 'Miranda', now(), now())
  RETURNING id into user_id_109;
  raise notice 'The user_id_109 after insert is %', user_id_109;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_109)
  RETURNING id into company_user_id_109;
  raise notice 'The company_user_id_109 is %', company_user_id_109;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 292, user_id_109)
  RETURNING id into usercompanybenefitplanoption_id_109;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 301, user_id_109)
  RETURNING id into usercompanybenefitplanoption_id_109_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', '', 'Miranda', '', 'self', 'ALeCc_g5-rd4y0VlgArjwkrd82XepZZ2GCC6IJCR9VRjZM-vsHYWszROZXXGhNiwqBObtFyg8i-I', '1991-10-15', 'F', company_id, user_id_109, '')
  RETURNING id into person_id_109;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '208 Kinsley Street', '', 'Nashua', 'NH', '03060', company_id, person_id_109);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038207625', person_id_109);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2015-03-01', 'FullTime', 'Active', now(), now(), person_id_109, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '03/01/2015', now(), now(), company_id, person_id_109, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('S51601', person_id_109, usercompanybenefitplanoption_id_109);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_109, usercompanybenefitplanoption_id_109_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_109, user_id_109);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, 10000.0, 0, 0, 0, now(), now(), 12, person_id_109, 3, 3, null, 100000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_109, 0, 300.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_109, 0, 1200.0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Reinaliz Guadalupe', '', 'Roig-Miranda', '', 'dependent', 'ALeCc_ggwpW4tTTrzj3V0sUvZQ9_ScByoMyV1AW6dl8dvqIQMAKXo2TkHzJZeH8A8-xVKkyBVtAz', '2013-10-14', 'F', company_id, user_id_109, '')
  RETURNING id into family_member_id_109_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '205 KINSLEY ST', 'None', 'NASHUA', 'NH', '03060.0', company_id, family_member_id_109_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038207625', family_member_id_109_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('FCH031', family_member_id_109_0, usercompanybenefitplanoption_id_109);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_109_0, usercompanybenefitplanoption_id_109_dental);

END;


DECLARE
  user_id_110 int;
  person_id_110 int;
  company_user_id_110 int; 
  usercompanybenefitplanoption_id_110 int;
  usercompanybenefitplanoption_id_110_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'heatherbresee@fairviewhealthcare.com', 't', 'f', 'f', 'Heather', 'Bresee', now(), now())
  RETURNING id into user_id_110;
  raise notice 'The user_id_110 after insert is %', user_id_110;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_110)
  RETURNING id into company_user_id_110;
  raise notice 'The company_user_id_110 is %', company_user_id_110;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_110)
  RETURNING id into usercompanybenefitplanoption_id_110;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_110)
  RETURNING id into usercompanybenefitplanoption_id_110_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Heather', '', 'Bresee', '', 'self', 'ALeCc_iV-6h1OfU_ORydn9ABC3cGoxOMGXQPGeyXANc39oXOXo_DqbWvZU1g5mT2YyNAZYkxLDl0', '1988-04-14', 'F', company_id, user_id_110, '')
  RETURNING id into person_id_110;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '133 Conant Road', '', 'Nashua', 'NH', '03062', company_id, person_id_110);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038099915', person_id_110);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24375.0, '2012-08-10', 'FullTime', 'Active', now(), now(), person_id_110, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/10/2012', now(), now(), company_id, person_id_110, null, 12.5000, 162.5000);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA145464', person_id_110, usercompanybenefitplanoption_id_110);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_110, usercompanybenefitplanoption_id_110_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(25000.0, now(), now(), 17, person_id_110, user_id_110);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(40000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_110, 3, 3, null, 40000.0, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_110, 0, 200.0);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_110, 0, 800.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_110);

END;


DECLARE
  user_id_111 int;
  person_id_111 int;
  company_user_id_111 int; 
  usercompanybenefitplanoption_id_111 int;
  usercompanybenefitplanoption_id_111_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jessicasmith@fairviewhealthcare.com', 't', 'f', 'f', 'Jessica', 'Smith', now(), now())
  RETURNING id into user_id_111;
  raise notice 'The user_id_111 after insert is %', user_id_111;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_111)
  RETURNING id into company_user_id_111;
  raise notice 'The company_user_id_111 is %', company_user_id_111;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 291, user_id_111)
  RETURNING id into usercompanybenefitplanoption_id_111;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_111)
  RETURNING id into usercompanybenefitplanoption_id_111_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Smith', '', 'self', 'ALeCc_gYUjHW5ZTh9tLtF86JwD3EqtVwt02L1dGgy_iCaSo15T1IklLvSAo0Y6Qoge3lP9HBc8rp', '1988-05-31', 'F', company_id, user_id_111, '')
  RETURNING id into person_id_111;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '2 Rega St', '', 'Hudson', 'NH', '03051', company_id, person_id_111);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034409908', person_id_111);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2014-09-08', 'FullTime', 'Active', now(), now(), person_id_111, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '09/08/2014', now(), now(), company_id, person_id_111, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA95114', person_id_111, usercompanybenefitplanoption_id_111);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_111, usercompanybenefitplanoption_id_111_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(17000.0, now(), now(), 17, person_id_111, user_id_111);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(90000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_111, 3, 3, null, null, null);

  INSERT INTO app_usercompanyltdinsuranceplan(created_at, updated_at, company_ltd_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 10, user_id_111, 0, 800.0);

END;


DECLARE
  user_id_112 int;
  person_id_112 int;
  family_member_id_112_1 int;
  family_member_id_112_0 int;
  family_member_id_112_2 int;
  company_user_id_112 int; 
  usercompanybenefitplanoption_id_112 int;
  usercompanybenefitplanoption_id_112_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'shellybeaucage@fairviewhealthcare.com', 't', 'f', 'f', 'Shelly', 'Beaucage', now(), now())
  RETURNING id into user_id_112;
  raise notice 'The user_id_112 after insert is %', user_id_112;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_112)
  RETURNING id into company_user_id_112;
  raise notice 'The company_user_id_112 is %', company_user_id_112;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_112)
  RETURNING id into usercompanybenefitplanoption_id_112;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_112)
  RETURNING id into usercompanybenefitplanoption_id_112_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shelly', 'A', 'Beaucage', '', 'self', 'ALeCc_iGlmAzvVOwI4jFl3VZM3_v3wS_UMLXy2Z2_Y2rMiO2KPXle6rIhlag5aO4El99Jel2VEeN', '1969-10-15', 'F', company_id, user_id_112, '')
  RETURNING id into person_id_112;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110b Pelham Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_112);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6036893731', person_id_112);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40539.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_112, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40539.0, '09/01/2008', now(), now(), company_id, person_id_112, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85774', person_id_112, usercompanybenefitplanoption_id_112);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_112, usercompanybenefitplanoption_id_112_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(41000.0, now(), now(), 17, person_id_112, user_id_112);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_112, 0, 500.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_112);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Paige', '', 'Beaucage', '', 'dependent', 'ALeCc_jPa1o_7juWikRAzOON0oEkWlxFSZNabw-NewAEwE1RbFSI-d3f2bw60qm9zTZn7zEBL2ai', '1993-01-22', 'F', company_id, user_id_112, '')
  RETURNING id into family_member_id_112_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110B PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_112_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038090084', family_member_id_112_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85774', family_member_id_112_1, usercompanybenefitplanoption_id_112);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_112_1, usercompanybenefitplanoption_id_112_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Britney', '', 'Beaucage', '', 'dependent', 'ALeCc_g5NVx5MrS1TjfKf2RZ-pPyTJnKENX496O8wuJ1kR_sriOLhZ9oeBj_H_BLwjIO7w-7m3yN', '1995-05-31', 'F', company_id, user_id_112, '')
  RETURNING id into family_member_id_112_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1108 PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_112_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039214039', family_member_id_112_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85774', family_member_id_112_0, usercompanybenefitplanoption_id_112);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_112_0, usercompanybenefitplanoption_id_112_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Justin', '', 'Saucier', '', 'dependent', 'ALeCc_iNkFkDuKwAinWIosVLYp4cA3ggwZ6bIj3zhdyDhZhbnpgJ1_Ab6-6tajSCsKu4-XBbHB8w', '1990-03-08', 'M', company_id, user_id_112, '')
  RETURNING id into family_member_id_112_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110B PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_112_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6036893731', family_member_id_112_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85774', family_member_id_112_2, usercompanybenefitplanoption_id_112);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_112_2, usercompanybenefitplanoption_id_112_dental);

END;


DECLARE
  user_id_113 int;
  person_id_113 int;
  company_user_id_113 int; 
  usercompanybenefitplanoption_id_113 int;
  usercompanybenefitplanoption_id_113_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cristianechatfield@fairviewhealthcare.com', 't', 'f', 'f', 'Cristiane', 'Chatfield', now(), now())
  RETURNING id into user_id_113;
  raise notice 'The user_id_113 after insert is %', user_id_113;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_113)
  RETURNING id into company_user_id_113;
  raise notice 'The company_user_id_113 is %', company_user_id_113;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_113);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_113);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cristiane', '', 'Chatfield', '', 'self', '', '1973-09-10', 'F', company_id, user_id_113, '')
  RETURNING id into person_id_113;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '4 Torrey Rd', '', 'Nashua', 'NH', '06063', company_id, person_id_113);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28080.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_113, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28080.0, '04/07/2014', now(), now(), company_id, person_id_113, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(29000.0, now(), now(), 17, person_id_113, user_id_113);

END;


DECLARE
  user_id_114 int;
  person_id_114 int;
  company_user_id_114 int; 
  usercompanybenefitplanoption_id_114 int;
  usercompanybenefitplanoption_id_114_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'danilledefranzo@fairviewhealthcare.com', 't', 'f', 'f', 'Danille', 'Defranzo', now(), now())
  RETURNING id into user_id_114;
  raise notice 'The user_id_114 after insert is %', user_id_114;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_114)
  RETURNING id into company_user_id_114;
  raise notice 'The company_user_id_114 is %', company_user_id_114;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_114);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_114);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danille', '', 'Defranzo', '', 'self', '', '1992-02-12', 'F', company_id, user_id_114, '')
  RETURNING id into person_id_114;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2015-01-20', 'FullTime', 'Active', now(), now(), person_id_114, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '01/20/2015', now(), now(), company_id, person_id_114, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(24000.0, now(), now(), 17, person_id_114, user_id_114);

END;


DECLARE
  user_id_115 int;
  person_id_115 int;
  company_user_id_115 int; 
  usercompanybenefitplanoption_id_115 int;
  usercompanybenefitplanoption_id_115_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kellymcnally@fairviewhealthcare.com', 't', 'f', 'f', 'Kelly', 'Mcnally', now(), now())
  RETURNING id into user_id_115;
  raise notice 'The user_id_115 after insert is %', user_id_115;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_115)
  RETURNING id into company_user_id_115;
  raise notice 'The company_user_id_115 is %', company_user_id_115;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_115)
  RETURNING id into usercompanybenefitplanoption_id_115;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_115)
  RETURNING id into usercompanybenefitplanoption_id_115_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kelly', '', 'Mcnally', '', 'self', 'ALeCc_h8YWpiyFvGyOD1o_WefDKsHIMaCx8mfo5u9fE0aYr2w7pPr-nK7lbt0I0x8Ek17S7S3YNd', '1989-09-01', 'F', company_id, user_id_115, '')
  RETURNING id into person_id_115;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Sanborn Rd', '', 'Derry', 'NH', '03038', company_id, person_id_115);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22880.0, '2015-02-01', 'FullTime', 'Active', now(), now(), person_id_115, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22880.0, '02/01/2015', now(), now(), company_id, person_id_115, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA7125', person_id_115, usercompanybenefitplanoption_id_115);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_115, usercompanybenefitplanoption_id_115_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(23000.0, now(), now(), 17, person_id_115, user_id_115);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_115, 0, 250.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_115);

END;


DECLARE
  user_id_116 int;
  person_id_116 int;
  company_user_id_116 int; 
  usercompanybenefitplanoption_id_116 int;
  usercompanybenefitplanoption_id_116_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'amandaglazier@fairviewhealthcare.com', 't', 'f', 'f', 'Amanda', 'Glazier', now(), now())
  RETURNING id into user_id_116;
  raise notice 'The user_id_116 after insert is %', user_id_116;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_116)
  RETURNING id into company_user_id_116;
  raise notice 'The company_user_id_116 is %', company_user_id_116;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_116);

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_116)
  RETURNING id into usercompanybenefitplanoption_id_116_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'Glazier', '', 'self', '', '1978-10-22', 'F', company_id, user_id_116, '')
  RETURNING id into person_id_116;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31200.0, '2015-05-01', 'FullTime', 'Active', now(), now(), person_id_116, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31200.0, '05/01/2015', now(), now(), company_id, person_id_116, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_116, usercompanybenefitplanoption_id_116_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(32000.0, now(), now(), 17, person_id_116, user_id_116);

END;


DECLARE
  user_id_117 int;
  person_id_117 int;
  company_user_id_117 int; 
  usercompanybenefitplanoption_id_117 int;
  usercompanybenefitplanoption_id_117_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aubreyguillotte@fairviewhealthcare.com', 't', 'f', 'f', 'Aubrey', 'Guillotte', now(), now())
  RETURNING id into user_id_117;
  raise notice 'The user_id_117 after insert is %', user_id_117;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_117)
  RETURNING id into company_user_id_117;
  raise notice 'The company_user_id_117 is %', company_user_id_117;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_117);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_117);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Aubrey', '', 'Guillotte', '', 'self', '', '1990-04-12', 'F', company_id, user_id_117, '')
  RETURNING id into person_id_117;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-05-08', 'FullTime', 'Active', now(), now(), person_id_117, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '05/08/2015', now(), now(), company_id, person_id_117, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(21000.0, now(), now(), 17, person_id_117, user_id_117);

END;


DECLARE
  user_id_118 int;
  person_id_118 int;
  company_user_id_118 int; 
  usercompanybenefitplanoption_id_118 int;
  usercompanybenefitplanoption_id_118_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'karenfothergill@fairviewhealthcare.com', 't', 'f', 'f', 'Karen', 'Fothergill', now(), now())
  RETURNING id into user_id_118;
  raise notice 'The user_id_118 after insert is %', user_id_118;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_118)
  RETURNING id into company_user_id_118;
  raise notice 'The company_user_id_118 is %', company_user_id_118;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_118)
  RETURNING id into usercompanybenefitplanoption_id_118;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_118)
  RETURNING id into usercompanybenefitplanoption_id_118_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Fothergill', '', 'self', 'ALeCc_ij0APfypY6Scf6dniNPiyClmDtHCRR_xYW2vQSed8ZY67XnHFM0kGRRQQkrbjzoTzO6_WZ', '1954-07-18', 'F', company_id, user_id_118, '')
  RETURNING id into person_id_118;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 496', '', 'AMHERST', 'NH', '03031.0', company_id, person_id_118);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032619901', person_id_118);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2014-06-24', 'FullTime', 'Active', now(), now(), person_id_118, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '06/24/2014', now(), now(), company_id, person_id_118, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('FCH034', person_id_118, usercompanybenefitplanoption_id_118);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_118, usercompanybenefitplanoption_id_118_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(20000.0, now(), now(), 17, person_id_118, user_id_118);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_118, 0, 250.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_118);

END;


DECLARE
  user_id_119 int;
  person_id_119 int;
  company_user_id_119 int; 
  usercompanybenefitplanoption_id_119 int;
  usercompanybenefitplanoption_id_119_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'nicholecurran@fairviewhealthcare.com', 't', 'f', 'f', 'Nichole', 'Curran', now(), now())
  RETURNING id into user_id_119;
  raise notice 'The user_id_119 after insert is %', user_id_119;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_119)
  RETURNING id into company_user_id_119;
  raise notice 'The company_user_id_119 is %', company_user_id_119;
  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 1, company_id, user_id_119);

  INSERT INTO app_usercompanywaivedbenefit(created_at, updated_at, benefit_type_id, company_id, user_id)
  VALUES(now(), now(), 2, company_id, user_id_119);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Nichole', '', 'Curran', '', 'self', '', '1987-10-26', 'F', company_id, user_id_119, '')
  RETURNING id into person_id_119;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21060.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_119, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '08/04/2014', now(), now(), company_id, person_id_119, null, null, null);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(22000.0, now(), now(), 17, person_id_119, user_id_119);

END;


DECLARE
  user_id_120 int;
  person_id_120 int;
  family_member_id_120_0 int;
  family_member_id_120_1 int;
  company_user_id_120 int; 
  usercompanybenefitplanoption_id_120 int;
  usercompanybenefitplanoption_id_120_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tracieseidl@fairviewhealthcare.com', 't', 'f', 'f', 'Tracie', 'Seidl', now(), now())
  RETURNING id into user_id_120;
  raise notice 'The user_id_120 after insert is %', user_id_120;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_120)
  RETURNING id into company_user_id_120;
  raise notice 'The company_user_id_120 is %', company_user_id_120;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_120)
  RETURNING id into usercompanybenefitplanoption_id_120;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_120)
  RETURNING id into usercompanybenefitplanoption_id_120_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tracie', 'M', 'Seidl', '', 'self', 'ALeCc_jEPKc51ZC5Dh8q0hO3uMqYfIiLV5qHAnHZgdz19bmeJxdW525c1iI1CqO4wbFYOnsGaOeh', '1973-09-17', 'F', company_id, user_id_120, '')
  RETURNING id into person_id_120;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Fairmont Street', '', 'Nashua', 'NH', '03064', company_id, person_id_120);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', person_id_120);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47132.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_120, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47132.0, '09/01/2008', now(), now(), company_id, person_id_120, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('NH22665', person_id_120, usercompanybenefitplanoption_id_120);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_120, usercompanybenefitplanoption_id_120_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(48000.0, now(), now(), 17, person_id_120, user_id_120);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_120);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Michael', '', 'Seidl', '', 'spouse', 'ALeCc_iLqmslDlv-JeAim1vLhGMI6ualEUqncwoJqVCF6lWYrOJKVrjzaPpAPV-ArQBKOXdaibF2', '1973-03-29', 'M', company_id, user_id_120, '')
  RETURNING id into family_member_id_120_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 FAIRMOUNT ST', 'None', 'NASHUA', 'NH', '03064.0', company_id, family_member_id_120_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', family_member_id_120_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('61828.0', family_member_id_120_0, usercompanybenefitplanoption_id_120);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_120_0, usercompanybenefitplanoption_id_120_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Shayne', '', 'Seidl', '', 'dependent', 'ALeCc_gFEcQbLJUcsRsz9H5R8tQnn7XZzhcykjhxVSzupmtH5vkq1-OS1Q_GEAMZ_YQ3ZoApVwdE', '1997-01-11', 'M', company_id, user_id_120, '')
  RETURNING id into family_member_id_120_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 FAIRMOUNT ST', 'None', 'NASHUA', 'NH', '03064.0', company_id, family_member_id_120_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', family_member_id_120_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA18476', family_member_id_120_1, usercompanybenefitplanoption_id_120);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_120_1, usercompanybenefitplanoption_id_120_dental);

END;


DECLARE
  user_id_121 int;
  person_id_121 int;
  company_user_id_121 int; 
  usercompanybenefitplanoption_id_121 int;
  usercompanybenefitplanoption_id_121_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rosemarysampson@fairviewhealthcare.com', 't', 'f', 'f', 'Rosemary', 'Sampson', now(), now())
  RETURNING id into user_id_121;
  raise notice 'The user_id_121 after insert is %', user_id_121;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_121)
  RETURNING id into company_user_id_121;
  raise notice 'The company_user_id_121 is %', company_user_id_121;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_121)
  RETURNING id into usercompanybenefitplanoption_id_121;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_121)
  RETURNING id into usercompanybenefitplanoption_id_121_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rosemary', '', 'Sampson', '', 'self', 'ALeCc_jr6zbllAfAwfu0zixDoJQOU3kFvQvMc_iefSvvpsHAuAwFsbyyJH_a2cPSRGqFTOkz_3TP', '1962-05-02', 'F', company_id, user_id_121, '')
  RETURNING id into person_id_121;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '77 Cadogan Way', '', 'Nashua', 'NH', '03062', company_id, person_id_121);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157382', person_id_121);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2013-12-30', 'FullTime', 'Active', now(), now(), person_id_121, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '12/30/2013', now(), now(), company_id, person_id_121, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('B73073', person_id_121, usercompanybenefitplanoption_id_121);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_121, usercompanybenefitplanoption_id_121_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(140000.0, now(), now(), 17, person_id_121, user_id_121);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(100000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_121, 3, 3, null, 100000.0, null);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_121);

END;


DECLARE
  user_id_122 int;
  person_id_122 int;
  company_user_id_122 int; 
  usercompanybenefitplanoption_id_122 int;
  usercompanybenefitplanoption_id_122_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'elizabethngugi@fairviewhealthcare.com', 't', 'f', 'f', 'Elizabeth', 'Ngugi', now(), now())
  RETURNING id into user_id_122;
  raise notice 'The user_id_122 after insert is %', user_id_122;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_122)
  RETURNING id into company_user_id_122;
  raise notice 'The company_user_id_122 is %', company_user_id_122;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 294, user_id_122)
  RETURNING id into usercompanybenefitplanoption_id_122;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 300, user_id_122)
  RETURNING id into usercompanybenefitplanoption_id_122_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', '', 'Ngugi', '', 'self', 'ALeCc_gGGNkVu0h5Pc5BvFs4eg6-kC3aUIMGw2pelcSjUFHMKiamX5VL86HCmQYV8ticqPri6BjC', '1973-03-05', 'F', company_id, user_id_122, '')
  RETURNING id into person_id_122;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '216 Elmwood Drive', '', 'Hudson', 'NH', '03051', company_id, person_id_122);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157994', person_id_122);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45011.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_122, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45011.0, '09/01/2008', now(), now(), company_id, person_id_122, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('S51601', person_id_122, usercompanybenefitplanoption_id_122);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_122, usercompanybenefitplanoption_id_122_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(46000.0, now(), now(), 17, person_id_122, user_id_122);

  INSERT INTO app_personcompsuppllifeinsuranceplan(self_elected_amount, spouse_elected_amount, child_elected_amount, self_premium_per_month, spouse_premium_per_month, child_premium_per_month, created_at, updated_at, company_supplemental_life_insurance_plan_id, person_id, self_condition_id, spouse_condition_id, child_adad_premium_per_month, self_adad_premium_per_month, spouse_adad_premium_per_month)
  VALUES(50000.0, null, null, 0, 0, 0, now(), now(), 12, person_id_122, 3, 3, null, null, null);

  INSERT INTO app_usercompanystdinsuranceplan(created_at, updated_at, company_std_insurance_id, user_id, total_premium_per_month, user_select_amount)
  VALUES(now(), now(), 8, user_id_122, 0, 150.0);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_122);

END;


DECLARE
  user_id_123 int;
  person_id_123 int;
  family_member_id_123_1 int;
  family_member_id_123_0 int;
  family_member_id_123_2 int;
  company_user_id_123 int; 
  usercompanybenefitplanoption_id_123 int;
  usercompanybenefitplanoption_id_123_dental int;
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'bonniedoran@fairviewhealthcare.com', 't', 'f', 'f', 'Bonnie', 'Doran', now(), now())
  RETURNING id into user_id_123;
  raise notice 'The user_id_123 after insert is %', user_id_123;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_123)
  RETURNING id into company_user_id_123;
  raise notice 'The company_user_id_123 is %', company_user_id_123;
  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 296, user_id_123)
  RETURNING id into usercompanybenefitplanoption_id_123;

  INSERT INTO app_usercompanybenefitplanoption(created_at, updated_at, benefit_id, user_id)
  VALUES(now(), now(), 302, user_id_123)
  RETURNING id into usercompanybenefitplanoption_id_123_dental;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Bonnie', 'L', 'Doran', '', 'self', 'ALeCc_hsSyhtYk9ABV_pZWj7HzmCreqIjI6p77jt6sRg7p88FCQnLu6yBTN9ZvKNMooEyD0ebprR', '1956-07-27', 'F', company_id, user_id_123, '')
  RETURNING id into person_id_123;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', '', 'MERRIMACK', 'NH', '03054.0', company_id, person_id_123);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', person_id_123);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37440.0, '2012-02-15', 'FullTime', 'Active', now(), now(), person_id_123, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '02/15/2012', now(), now(), company_id, person_id_123, null, null, null);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85791', person_id_123, usercompanybenefitplanoption_id_123);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', person_id_123, usercompanybenefitplanoption_id_123_dental);

  INSERT INTO app_usercompanylifeinsuranceplan(insurance_amount, created_at, updated_at, company_life_insurance_id, person_id, user_id)
  VALUES(38000.0, now(), now(), 17, person_id_123, user_id_123);

  INSERT INTO app_personcompanyhraplan(created_at, updated_at, company_hra_plan_id, person_id)
  VALUES(now(), now(), 4, person_id_123);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Sadie', '', 'Doran', '', 'dependent', 'ALeCc_g2lz2ssWESWS_xdUdiAoaMx59n6D42JxcfaUapQRlJR7hAyk4t_UMmoWYzNJPts-VqukrI', '1994-08-11', 'F', company_id, user_id_123, '')
  RETURNING id into family_member_id_123_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_123_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_123_1);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85791', family_member_id_123_1, usercompanybenefitplanoption_id_123);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_123_1, usercompanybenefitplanoption_id_123_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Carly', '', 'Doran', '', 'dependent', 'ALeCc_h7QWlOHKV_qlIJ0vZvmj2udbh1erXNvgS2hMILDmk0zRyCd2uVQnKyLrSrq2gtje6X7Fv1', '1990-04-30', 'F', company_id, user_id_123, '')
  RETURNING id into family_member_id_123_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_123_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_123_0);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85791', family_member_id_123_0, usercompanybenefitplanoption_id_123);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_123_0, usercompanybenefitplanoption_id_123_dental);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jonathan', '', 'Smith', '', 'life partner', 'ALeCc_gIMab6Wl5xT-iBvJiFAD0qObtst5A4ptLGjTk9-93Lfuejaf8I6Q-eOU6ttRd8Hl3BGQLV', '1952-12-27', 'M', company_id, user_id_123, '')
  RETURNING id into family_member_id_123_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_123_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_123_2);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('AA85791', family_member_id_123_2, usercompanybenefitplanoption_id_123);

  INSERT INTO app_enrolled(pcp, person_id, user_company_benefit_plan_option_id)
  VALUES('', family_member_id_123_2, usercompanybenefitplanoption_id_123_dental);

END;

raise notice 'There are 123 users created ';
END
$$
