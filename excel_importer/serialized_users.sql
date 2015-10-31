DO $$
DECLARE
  company_id int := 23;
BEGIN
raise notice 'The company_id to start is %', company_id;

DECLARE
  user_id_1 int;
  person_id_1 int;
  company_user_id_1 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tinaleclair@fairviewhealthcare.com', 't', 'f', 'f', 'Tina', 'Leclair', now(), now())
  RETURNING id into user_id_1;
  raise notice 'The user_id_1 after insert is %', user_id_1;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_1)
  RETURNING id into company_user_id_1;
  raise notice 'The company_user_id_1 is %', company_user_id_1;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tina', '', 'Leclair', '', 'self', 'ALeCc_hd9GpN85gmcBDlxb8N2UEA31UdoJXkTN9wLPVBm-cwB7U9oiiJFMMqlSbNQMYVf6ajCCvA', '1983-02-06', 'F', company_id, user_id_1, '')
  RETURNING id into person_id_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '5 Tsiennato Rd', '#162', 'Derry', 'NH', '03038', company_id, person_id_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032312889', person_id_1);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_1, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_1, null, null, null);

END;


DECLARE
  user_id_2 int;
  person_id_2 int;
  company_user_id_2 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'selinafletcher@fairviewhealthcare.com', 't', 'f', 'f', 'Selina', 'Fletcher', now(), now())
  RETURNING id into user_id_2;
  raise notice 'The user_id_2 after insert is %', user_id_2;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_2)
  RETURNING id into company_user_id_2;
  raise notice 'The company_user_id_2 is %', company_user_id_2;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Selina', '', 'Fletcher', '', 'self', 'ALeCc_g38PXqZF7D-B0EknfFc1h2BmI5xBL0XKuoFkhazPNnX3yIN-ymGxYysCLTyb59CVQGq3vX', '1978-12-11', 'F', company_id, user_id_2, '')
  RETURNING id into person_id_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '105 SPIT BROOK RD', 'APT 16B', 'NASHUA', 'NH', '03062.0', company_id, person_id_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8179832986', person_id_2);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2014-09-04', 'FullTime', 'Active', now(), now(), person_id_2, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '09/04/2014', now(), now(), company_id, person_id_2, null, null, null);

END;


DECLARE
  user_id_3 int;
  person_id_3 int;
  company_user_id_3 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'susantrubacz@fairviewhealthcare.com', 't', 'f', 'f', 'Susan', 'Trubacz', now(), now())
  RETURNING id into user_id_3;
  raise notice 'The user_id_3 after insert is %', user_id_3;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_3)
  RETURNING id into company_user_id_3;
  raise notice 'The company_user_id_3 is %', company_user_id_3;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Susan', '', 'Trubacz', '', 'self', '', '1990-10-09', 'F', company_id, user_id_3, '')
  RETURNING id into person_id_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Cottonwood Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_3);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21450.0, '2015-03-02', 'FullTime', 'Active', now(), now(), person_id_3, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '03/02/2015', now(), now(), company_id, person_id_3, null, null, null);

END;


DECLARE
  user_id_4 int;
  person_id_4 int;
  company_user_id_4 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresewarrington@fairviewhealthcare.com', 't', 'f', 'f', 'Therese', 'Warrington', now(), now())
  RETURNING id into user_id_4;
  raise notice 'The user_id_4 after insert is %', user_id_4;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_4)
  RETURNING id into company_user_id_4;
  raise notice 'The company_user_id_4 is %', company_user_id_4;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Therese', '', 'Warrington', '', 'self', '', '1962-09-28', 'F', company_id, user_id_4, '')
  RETURNING id into person_id_4;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Birch St', '', 'Hudson', 'NH', '03051', company_id, person_id_4);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19721.0, '2015-02-09', 'FullTime', 'Active', now(), now(), person_id_4, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19721.0, '02/09/2015', now(), now(), company_id, person_id_4, null, null, null);

END;


DECLARE
  user_id_5 int;
  person_id_5 int;
  family_member_id_5_0 int;
  company_user_id_5 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jereneveilleux@fairviewhealthcare.com', 't', 'f', 'f', 'Jerene', 'Veilleux', now(), now())
  RETURNING id into user_id_5;
  raise notice 'The user_id_5 after insert is %', user_id_5;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_5)
  RETURNING id into company_user_id_5;
  raise notice 'The company_user_id_5 is %', company_user_id_5;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jerene', '', 'Veilleux', '', 'self', 'ALeCc_gs3_xmfLVODLhIdUAdef19ABizCmw-AQf9VCxo_7Xi7aN9Vj4uxEaeD1brDBhJQbss6YxS', '1967-06-21', 'F', company_id, user_id_5, '')
  RETURNING id into person_id_5;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Charles Bancroft Hwy', '', 'Litchfield', 'NH', '03052', company_id, person_id_5);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035217174', person_id_5);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-03-31', 'FullTime', 'Active', now(), now(), person_id_5, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '03/31/2015', now(), now(), company_id, person_id_5, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Stephane', '', 'Veilleux', '', 'spouse', 'ALeCc_hb9jpW8bMELl0vhLxPfDorCV3ftc6XMsYRFDBbEn_GEDboHQ4TLwdm1b7dFnMJiHEUHVu-', '1969-02-22', 'M', company_id, user_id_5, '')
  RETURNING id into family_member_id_5_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 CHARLES BANCROFT HWY', 'None', 'LITCHFIELD', 'NH', '03052.0', company_id, family_member_id_5_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035217174', family_member_id_5_0);

END;


DECLARE
  user_id_6 int;
  person_id_6 int;
  company_user_id_6 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dianezacher@fairviewhealthcare.com', 't', 'f', 'f', 'Diane', 'Zacher', now(), now())
  RETURNING id into user_id_6;
  raise notice 'The user_id_6 after insert is %', user_id_6;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_6)
  RETURNING id into company_user_id_6;
  raise notice 'The company_user_id_6 is %', company_user_id_6;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diane', '', 'Zacher', '', 'self', 'ALeCc_iVcVaT0UCMTRtOCQkvT7esFGlyPaY9naXtrybssVeT-k9IMQdefI-K13uxAgAlOml_7RJG', '1956-10-03', 'F', company_id, user_id_6, '')
  RETURNING id into person_id_6;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Anvil Dr', '', 'Nashua', 'NH', '03060', company_id, person_id_6);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039307795', person_id_6);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25324.0, '2013-12-11', 'FullTime', 'Active', now(), now(), person_id_6, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25324.0, '12/11/2013', now(), now(), company_id, person_id_6, null, null, null);

END;


DECLARE
  user_id_7 int;
  person_id_7 int;
  company_user_id_7 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'emilyinglis@fairviewhealthcare.com', 't', 'f', 'f', 'Emily', 'Inglis', now(), now())
  RETURNING id into user_id_7;
  raise notice 'The user_id_7 after insert is %', user_id_7;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_7)
  RETURNING id into company_user_id_7;
  raise notice 'The company_user_id_7 is %', company_user_id_7;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', 'S', 'Inglis', '', 'self', 'ALeCc_jzUOMtZmlZ5KOXu-NSZJfXcS4i-aQMRmUmvg20_5LMtXy9_PsNULZja0x_4S-9aKgBKBWX', '1987-06-05', 'F', company_id, user_id_7, '')
  RETURNING id into person_id_7;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Windham Dr', '', 'Concord', 'NH', '03301', company_id, person_id_7);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038607924', person_id_7);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46342.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_7, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46342.4, '09/01/2008', now(), now(), company_id, person_id_7, null, null, null);

END;


DECLARE
  user_id_8 int;
  person_id_8 int;
  company_user_id_8 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'catherinelajoie@fairviewhealthcare.com', 't', 'f', 'f', 'Catherine', 'Lajoie', now(), now())
  RETURNING id into user_id_8;
  raise notice 'The user_id_8 after insert is %', user_id_8;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_8)
  RETURNING id into company_user_id_8;
  raise notice 'The company_user_id_8 is %', company_user_id_8;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Catherine', '', 'Lajoie', '', 'self', '', '1974-04-27', 'F', company_id, user_id_8, '')
  RETURNING id into person_id_8;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20 McKean St', '', 'Nashua', 'NH', '03060', company_id, person_id_8);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_8, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_8, null, null, null);

END;


DECLARE
  user_id_9 int;
  person_id_9 int;
  company_user_id_9 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robinluciano@fairviewhealthcare.com', 't', 'f', 'f', 'Robin', 'Luciano', now(), now())
  RETURNING id into user_id_9;
  raise notice 'The user_id_9 after insert is %', user_id_9;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_9)
  RETURNING id into company_user_id_9;
  raise notice 'The company_user_id_9 is %', company_user_id_9;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robin', '', 'Luciano', '', 'self', 'ALeCc_j-j9FELXuhVAQMmkPGtB9FLLC-GtRNV3L95bU05Yx0aqk9wZmuVTDVGOjvSkSIRbZN0g1u', '1974-12-14', 'F', company_id, user_id_9, '')
  RETURNING id into person_id_9;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '23b Chandler Ct', '', 'Hudson', 'NH', '03051', company_id, person_id_9);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9788088398', person_id_9);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_9, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '08/04/2014', now(), now(), company_id, person_id_9, null, null, null);

END;


DECLARE
  user_id_10 int;
  person_id_10 int;
  family_member_id_10_0 int;
  company_user_id_10 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'angelakraus@fairviewhealthcare.com', 't', 'f', 'f', 'Angela', 'Kraus', now(), now())
  RETURNING id into user_id_10;
  raise notice 'The user_id_10 after insert is %', user_id_10;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_10)
  RETURNING id into company_user_id_10;
  raise notice 'The company_user_id_10 is %', company_user_id_10;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Angela', 'J', 'Kraus', '', 'self', 'ALeCc_jdLTolvviyBngR87R-8sXWZiTzTBqmwkV-IDroxqsxe4xvfJtJ_tSLi3mDTrL4KBxMRdVM', '1980-08-21', 'F', company_id, user_id_10, '')
  RETURNING id into person_id_10;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 A Shadowbrook Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_10);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038094297', person_id_10);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62400.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_10, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62400.0, '09/01/2008', now(), now(), company_id, person_id_10, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Matthew', '', 'Kraus', '', 'spouse', 'ALeCc_gvrKYBuhSoJAqlcTELTknqHQ31BjR0L3dhngIg1DR_2xBOTFCwBVblAA6LHonZZy54jjH0', '1978-02-16', 'M', company_id, user_id_10, '')
  RETURNING id into family_member_id_10_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29A SHADOWBROOK DR', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_10_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038094297', family_member_id_10_0);

END;


DECLARE
  user_id_11 int;
  person_id_11 int;
  company_user_id_11 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kristinenutter@fairviewhealthcare.com', 't', 'f', 'f', 'Kristine', 'Nutter', now(), now())
  RETURNING id into user_id_11;
  raise notice 'The user_id_11 after insert is %', user_id_11;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_11)
  RETURNING id into company_user_id_11;
  raise notice 'The company_user_id_11 is %', company_user_id_11;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kristine', '', 'Nutter', '', 'self', '', '1967-04-21', 'F', company_id, user_id_11, '')
  RETURNING id into person_id_11;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '97 Ansonia Ave', '', 'Dracut', 'NH', '01826', company_id, person_id_11);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58552.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_11, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58552.0, '09/01/2008', now(), now(), company_id, person_id_11, null, null, null);

END;


DECLARE
  user_id_12 int;
  person_id_12 int;
  company_user_id_12 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tashavancelette@fairviewhealthcare.com', 't', 'f', 'f', 'Tasha', 'Vancelette', now(), now())
  RETURNING id into user_id_12;
  raise notice 'The user_id_12 after insert is %', user_id_12;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_12)
  RETURNING id into company_user_id_12;
  raise notice 'The company_user_id_12 is %', company_user_id_12;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tasha', '', 'Vancelette', '', 'self', '', '1974-01-21', 'F', company_id, user_id_12, '')
  RETURNING id into person_id_12;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Pierce St', '', 'Nashua', 'NH', '03060', company_id, person_id_12);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20280.0, '2014-08-14', 'FullTime', 'Active', now(), now(), person_id_12, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20280.0, '08/14/2014', now(), now(), company_id, person_id_12, null, null, null);

END;


DECLARE
  user_id_13 int;
  person_id_13 int;
  company_user_id_13 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alyssamackay@fairviewhealthcare.com', 't', 'f', 'f', 'Alyssa', 'Mackay', now(), now())
  RETURNING id into user_id_13;
  raise notice 'The user_id_13 after insert is %', user_id_13;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_13)
  RETURNING id into company_user_id_13;
  raise notice 'The company_user_id_13 is %', company_user_id_13;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alyssa', '', 'Mackay', '', 'self', '', '1988-05-07', 'F', company_id, user_id_13, '')
  RETURNING id into person_id_13;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Chestnut Street', '', 'Hudson', 'NH', '03051', company_id, person_id_13);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46000.0, '2013-09-01', 'FullTime', 'Active', now(), now(), person_id_13, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '09/01/2013', now(), now(), company_id, person_id_13, null, null, null);

END;


DECLARE
  user_id_14 int;
  person_id_14 int;
  company_user_id_14 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brittanyshay@fairviewhealthcare.com', 't', 'f', 'f', 'Brittany', 'Shay', now(), now())
  RETURNING id into user_id_14;
  raise notice 'The user_id_14 after insert is %', user_id_14;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_14)
  RETURNING id into company_user_id_14;
  raise notice 'The company_user_id_14 is %', company_user_id_14;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brittany', '', 'Shay', '', 'self', 'ALeCc_jLj9R3qL9MFHmPMND3-VwvCm0eLoQzXTo1CeAr0NkoIa3dfhJa75ktsh60gL7rc-HjJDx-', '1990-07-12', 'F', company_id, user_id_14, '')
  RETURNING id into person_id_14;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Tolles St', '', 'Nashua', 'NH', '03064', company_id, person_id_14);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038975852', person_id_14);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-10-12', 'FullTime', 'Active', now(), now(), person_id_14, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '10/12/2014', now(), now(), company_id, person_id_14, null, null, null);

END;


DECLARE
  user_id_15 int;
  person_id_15 int;
  company_user_id_15 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'maureenamadi@fairviewhealthcare.com', 't', 'f', 'f', 'Maureen', 'Amadi', now(), now())
  RETURNING id into user_id_15;
  raise notice 'The user_id_15 after insert is %', user_id_15;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_15)
  RETURNING id into company_user_id_15;
  raise notice 'The company_user_id_15 is %', company_user_id_15;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maureen', '', 'Amadi', '', 'self', '', '1974-06-27', 'F', company_id, user_id_15, '')
  RETURNING id into person_id_15;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.0, '2011-05-05', 'FullTime', 'Active', now(), now(), person_id_15, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20962.0, '05/05/2011', now(), now(), company_id, person_id_15, null, null, null);

END;


DECLARE
  user_id_16 int;
  person_id_16 int;
  company_user_id_16 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katiepicard@fairviewhealthcare.com', 't', 'f', 'f', 'Katie', 'Picard', now(), now())
  RETURNING id into user_id_16;
  raise notice 'The user_id_16 after insert is %', user_id_16;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_16)
  RETURNING id into company_user_id_16;
  raise notice 'The company_user_id_16 is %', company_user_id_16;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katie', '', 'Picard', '', 'self', '', '1997-10-09', 'F', company_id, user_id_16, '')
  RETURNING id into person_id_16;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '12 Stonewood Lane', '', 'Hudson', 'NH', '03051', company_id, person_id_16);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 18720.0, '2014-08-18', 'FullTime', 'Active', now(), now(), person_id_16, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(18720.0, '08/18/2014', now(), now(), company_id, person_id_16, null, null, null);

END;


DECLARE
  user_id_17 int;
  person_id_17 int;
  company_user_id_17 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'daniellequinn@fairviewhealthcare.com', 't', 'f', 'f', 'Danielle', 'Quinn', now(), now())
  RETURNING id into user_id_17;
  raise notice 'The user_id_17 after insert is %', user_id_17;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_17)
  RETURNING id into company_user_id_17;
  raise notice 'The company_user_id_17 is %', company_user_id_17;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danielle', '', 'Quinn', '', 'self', 'ALeCc_ij8e1gJcC8B0zrDR86SzsaCS-7poq7VC88GTditpb5ZAdoH2Sf_Pgi-t0YD4DhKOcb6vov', '1980-06-16', 'F', company_id, user_id_17, '')
  RETURNING id into person_id_17;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 WASHINGTON CIR', '', 'HILLSBOROUGH', 'NH', '03244.0', company_id, person_id_17);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033450151', person_id_17);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 55000.0, '2014-01-15', 'FullTime', 'Active', now(), now(), person_id_17, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(55000.0, '01/15/2014', now(), now(), company_id, person_id_17, null, null, null);

END;


DECLARE
  user_id_18 int;
  person_id_18 int;
  company_user_id_18 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carolynbeaulieu@fairviewhealthcare.com', 't', 'f', 'f', 'Carolyn', 'Beaulieu', now(), now())
  RETURNING id into user_id_18;
  raise notice 'The user_id_18 after insert is %', user_id_18;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_18)
  RETURNING id into company_user_id_18;
  raise notice 'The company_user_id_18 is %', company_user_id_18;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carolyn', 'S', 'Beaulieu', '', 'self', 'ALeCc_hwbPR9OWD3E_5bX91FRR9xYPiLCpXD9-4FR6R_IILy3CBC2_EDMrWSeipOzBWkhKpQcVZm', '1953-08-27', 'F', company_id, user_id_18, '')
  RETURNING id into person_id_18;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '86-9 Sargent Station Rd', '', 'Weare', 'NH', '03281', company_id, person_id_18);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035666314', person_id_18);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 42577.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_18, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(42577.6, '09/01/2008', now(), now(), company_id, person_id_18, null, null, null);

END;


DECLARE
  user_id_19 int;
  person_id_19 int;
  company_user_id_19 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carlawholey@fairviewhealthcare.com', 't', 'f', 'f', 'Carla', 'Wholey', now(), now())
  RETURNING id into user_id_19;
  raise notice 'The user_id_19 after insert is %', user_id_19;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_19)
  RETURNING id into company_user_id_19;
  raise notice 'The company_user_id_19 is %', company_user_id_19;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carla', '', 'Wholey', '', 'self', '', '1963-06-08', 'F', company_id, user_id_19, '')
  RETURNING id into person_id_19;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2011-03-03', 'FullTime', 'Active', now(), now(), person_id_19, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '03/03/2011', now(), now(), company_id, person_id_19, null, null, null);

END;


DECLARE
  user_id_20 int;
  person_id_20 int;
  family_member_id_20_0 int;
  family_member_id_20_1 int;
  family_member_id_20_2 int;
  company_user_id_20 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'roberthutchings@fairviewhealthcare.com', 't', 'f', 'f', 'Robert', 'Hutchings', now(), now())
  RETURNING id into user_id_20;
  raise notice 'The user_id_20 after insert is %', user_id_20;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_20)
  RETURNING id into company_user_id_20;
  raise notice 'The company_user_id_20 is %', company_user_id_20;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robert', '', 'Hutchings', '', 'self', 'ALeCc_hUAoWo1NSTh5VUuLkan3o3pFb4BqBRUwYMehFKtezOZMu5wGgrq3w8yFDdqytWWVNUmNmC', '1952-03-14', 'M', company_id, user_id_20, '')
  RETURNING id into person_id_20;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Quill Lane', '', 'Salem', 'NH', '03079', company_id, person_id_20);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_20);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2013-03-01', 'FullTime', 'Active', now(), now(), person_id_20, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '03/01/2013', now(), now(), company_id, person_id_20, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Cynthia', '', 'Hutchings', '', 'spouse', 'ALeCc_hNbJ80YLPu5pz6YVTkRdYdLM-lxZKGXszYYTTzbIShMFpO_2TnEHSWlTU3UYuoZlnniFAR', '1952-06-11', 'F', company_id, user_id_20, '')
  RETURNING id into family_member_id_20_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_20_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9788571137', family_member_id_20_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kelly', '', 'Hutchings', '', 'dependent', 'ALeCc_jbZxQMMxLUCCe2yXN34oSK8OYrH0Eu00z6N86Ie2t0ZZRkjHgF-jLGhR8lgY7Xt-xnR0-N', '1999-02-03', 'F', company_id, user_id_20, '')
  RETURNING id into family_member_id_20_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_20_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', family_member_id_20_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Joshua', '', 'Hutchings', '', 'dependent', 'ALeCc_j1qV2FskHKPMYLtC3iQ2FsoePsjtafA9EhOfLp4AbbaTTAnIUOBGgnv722R0SZJ4DfgSSL', '1990-01-02', 'M', company_id, user_id_20, '')
  RETURNING id into family_member_id_20_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 QUILL LN', 'None', 'NORTH SALEM', 'NH', '03073.0', company_id, family_member_id_20_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', family_member_id_20_2);

END;


DECLARE
  user_id_21 int;
  person_id_21 int;
  company_user_id_21 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'darlenecross@fairviewhealthcare.com', 't', 'f', 'f', 'Darlene', 'Cross', now(), now())
  RETURNING id into user_id_21;
  raise notice 'The user_id_21 after insert is %', user_id_21;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_21)
  RETURNING id into company_user_id_21;
  raise notice 'The company_user_id_21 is %', company_user_id_21;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Darlene', '', 'Cross', '', 'self', 'ALeCc_heGmrSWKjlmKOK0a7vnZyN6B963mm_X0tKY047E37qJJjD4zr-cQiVxqBue8fvIlcfyFYU', '1962-05-25', 'F', company_id, user_id_21, '')
  RETURNING id into person_id_21;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '66 Farmwood Drive', '', 'Nashua', 'NH', '03062', company_id, person_id_21);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_21, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '06/09/2014', now(), now(), company_id, person_id_21, null, null, null);

END;


DECLARE
  user_id_22 int;
  person_id_22 int;
  company_user_id_22 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'christinecarpenter@fairviewhealthcare.com', 't', 'f', 'f', 'Christine', 'Carpenter', now(), now())
  RETURNING id into user_id_22;
  raise notice 'The user_id_22 after insert is %', user_id_22;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_22)
  RETURNING id into company_user_id_22;
  raise notice 'The company_user_id_22 is %', company_user_id_22;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Christine', '', 'Carpenter', '', 'self', '', '1968-05-06', 'F', company_id, user_id_22, '')
  RETURNING id into person_id_22;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1391 Union Street', '', 'Manchester', 'NH', '03104', company_id, person_id_22);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37440.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_22, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '05/11/2015', now(), now(), company_id, person_id_22, null, null, null);

END;


DECLARE
  user_id_23 int;
  person_id_23 int;
  company_user_id_23 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'stephaniesaouma@fairviewhealthcare.com', 't', 'f', 'f', 'Stephanie', 'Saouma', now(), now())
  RETURNING id into user_id_23;
  raise notice 'The user_id_23 after insert is %', user_id_23;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_23)
  RETURNING id into company_user_id_23;
  raise notice 'The company_user_id_23 is %', company_user_id_23;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', 'A', 'Saouma', '', 'self', 'ALeCc_hKKeAPzi91BL9I74XL-cz8pFErmDQQ0zlh8nhqMeF53_9O02eCfC7XDneJpudwdVrrUvLJ', '1967-06-02', 'F', company_id, user_id_23, '')
  RETURNING id into person_id_23;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1301 Bodwell Rd', 'Apt 9', 'Manchester', 'NH', '03109', company_id, person_id_23);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035401487', person_id_23);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 44283.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_23, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(44283.2, '09/01/2008', now(), now(), company_id, person_id_23, null, null, null);

END;


DECLARE
  user_id_24 int;
  person_id_24 int;
  company_user_id_24 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'carlawholey1@fairviewhealthcare.com', 't', 'f', 'f', 'Carla', 'Wholey', now(), now())
  RETURNING id into user_id_24;
  raise notice 'The user_id_24 after insert is %', user_id_24;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_24)
  RETURNING id into company_user_id_24;
  raise notice 'The company_user_id_24 is %', company_user_id_24;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carla', '', 'Wholey', '', 'self', '', '1989-02-27', 'F', company_id, user_id_24, '')
  RETURNING id into person_id_24;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '56 Rangers Road', '', 'Hudson', 'NH', '03051', company_id, person_id_24);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2010-06-07', 'FullTime', 'Active', now(), now(), person_id_24, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '06/07/2010', now(), now(), company_id, person_id_24, null, null, null);

END;


DECLARE
  user_id_25 int;
  person_id_25 int;
  company_user_id_25 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katherinephilbrick@fairviewhealthcare.com', 't', 'f', 'f', 'Katherine', 'Philbrick', now(), now())
  RETURNING id into user_id_25;
  raise notice 'The user_id_25 after insert is %', user_id_25;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_25)
  RETURNING id into company_user_id_25;
  raise notice 'The company_user_id_25 is %', company_user_id_25;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', 'S', 'Philbrick', '', 'self', 'ALeCc_i6deZgstDDRpvouYeSEHJm0U588t43cdUMC9r8X0XPMwbT6C8zJIukc3nHFVHQPVW63ku1', '1970-08-18', 'F', company_id, user_id_25, '')
  RETURNING id into person_id_25;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Oliver Drive', '', 'Hudson', 'NH', '03061', company_id, person_id_25);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799356', person_id_25);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2012-05-29', 'FullTime', 'Active', now(), now(), person_id_25, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '05/29/2012', now(), now(), company_id, person_id_25, null, null, null);

END;


DECLARE
  user_id_26 int;
  person_id_26 int;
  company_user_id_26 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kristinmaffee@fairviewhealthcare.com', 't', 'f', 'f', 'Kristin', 'Maffee', now(), now())
  RETURNING id into user_id_26;
  raise notice 'The user_id_26 after insert is %', user_id_26;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_26)
  RETURNING id into company_user_id_26;
  raise notice 'The company_user_id_26 is %', company_user_id_26;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kristin', '', 'Maffee', '', 'self', 'ALeCc_hIBxfSa9YAUZE3eGAscGLP3SLQDWviZXSngF2kVwz6MZWVqektS-9M54fbVLs5nTvChTGl', '1959-06-29', 'F', company_id, user_id_26, '')
  RETURNING id into person_id_26;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO Box 159', '379 Amhearst Street', 'Nashua', 'NH', '03063', company_id, person_id_26);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033052974', person_id_26);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_26, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31000.0, '06/09/2014', now(), now(), company_id, person_id_26, null, null, null);

END;


DECLARE
  user_id_27 int;
  person_id_27 int;
  company_user_id_27 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'karentierney@fairviewhealthcare.com', 't', 'f', 'f', 'Karen', 'Tierney', now(), now())
  RETURNING id into user_id_27;
  raise notice 'The user_id_27 after insert is %', user_id_27;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_27)
  RETURNING id into company_user_id_27;
  raise notice 'The company_user_id_27 is %', company_user_id_27;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Tierney', '', 'self', 'ALeCc_iQDSbsbWZSON9KWmbdateEIGDC5G0WzdwhftNMwikw8_2DRN7x0pFR7schDGsum-fSyxbZ', '1960-06-11', 'F', company_id, user_id_27, '')
  RETURNING id into person_id_27;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 High Plain Ave', '', 'Litchfield', 'NH', '03052', company_id, person_id_27);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035055348', person_id_27);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47320.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_27, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47320.0, '04/07/2014', now(), now(), company_id, person_id_27, null, null, null);

END;


DECLARE
  user_id_28 int;
  person_id_28 int;
  family_member_id_28_0 int;
  company_user_id_28 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'mariadube@fairviewhealthcare.com', 't', 'f', 'f', 'Maria', 'Dube', now(), now())
  RETURNING id into user_id_28;
  raise notice 'The user_id_28 after insert is %', user_id_28;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_28)
  RETURNING id into company_user_id_28;
  raise notice 'The company_user_id_28 is %', company_user_id_28;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', 'A', 'Dube', '', 'self', 'ALeCc_i3xaMDoeY-urAN4tSi9kQwc2fFfY5MWamb1XUh1cpbnpNZ_BxOwmrhMCT5KmoRCs6hjZ3Q', '1965-12-18', 'F', company_id, user_id_28, '')
  RETURNING id into person_id_28;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 303', '', 'NASHUA', 'NH', '03061.0', company_id, person_id_28);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032615090', person_id_28);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 60320.0, '2013-11-01', 'FullTime', 'Active', now(), now(), person_id_28, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(60320.0, '11/01/2013', now(), now(), company_id, person_id_28, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Hannah', '', 'Tomaszewski', '', 'dependent', 'ALeCc_jwE_iohs1PZGiQmYC823kjC0mLdwC067pXLvB7pJ-uHkBTD-7tn4NqmPXKXHArow6x7RXB', '1990-04-07', 'F', company_id, user_id_28, '')
  RETURNING id into family_member_id_28_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 303', 'None', 'NASHUA', 'NH', '03061.0', company_id, family_member_id_28_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032615090', family_member_id_28_0);

END;


DECLARE
  user_id_29 int;
  person_id_29 int;
  company_user_id_29 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robynbrody@fairviewhealthcare.com', 't', 'f', 'f', 'Robyn', 'Brody', now(), now())
  RETURNING id into user_id_29;
  raise notice 'The user_id_29 after insert is %', user_id_29;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_29)
  RETURNING id into company_user_id_29;
  raise notice 'The company_user_id_29 is %', company_user_id_29;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robyn', '', 'Brody', '', 'self', 'ALeCc_gXonx3EGIabvTMQwSQgC9lgCgnGysNyRAjMieRgIz0UV-UORCsJpsiM6GE_pQlj_yzIfS6', '1975-02-23', 'F', company_id, user_id_29, '')
  RETURNING id into person_id_29;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '148R Webster Street', '', 'Hudson', 'NH', '03051', company_id, person_id_29);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038825261', person_id_29);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_29, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '09/01/2014', now(), now(), company_id, person_id_29, null, null, null);

END;


DECLARE
  user_id_30 int;
  person_id_30 int;
  company_user_id_30 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jillkracke@fairviewhealthcare.com', 't', 'f', 'f', 'Jill', 'Kracke', now(), now())
  RETURNING id into user_id_30;
  raise notice 'The user_id_30 after insert is %', user_id_30;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_30)
  RETURNING id into company_user_id_30;
  raise notice 'The company_user_id_30 is %', company_user_id_30;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Kracke', '', 'self', 'ALeCc_gtvg2Ofe1tFDW05elEQh2AbwNdJ8Vb-QDsmqfTDm08t3aI8Pzfru_DYIC425ITL_5ePd43', '1989-05-31', 'F', company_id, user_id_30, '')
  RETURNING id into person_id_30;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '75 Island Dr', '', 'Merrimack', 'NH', '03054', company_id, person_id_30);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '7819562294', person_id_30);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2015-07-12', 'FullTime', 'Active', now(), now(), person_id_30, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/12/2015', now(), now(), company_id, person_id_30, null, null, null);

END;


DECLARE
  user_id_31 int;
  person_id_31 int;
  company_user_id_31 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lisawood@fairviewhealthcare.com', 't', 'f', 'f', 'Lisa', 'Wood', now(), now())
  RETURNING id into user_id_31;
  raise notice 'The user_id_31 after insert is %', user_id_31;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_31)
  RETURNING id into company_user_id_31;
  raise notice 'The company_user_id_31 is %', company_user_id_31;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Lisa', '', 'Wood', '', 'self', '', '1967-12-26', 'F', company_id, user_id_31, '')
  RETURNING id into person_id_31;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '46 Union St', '', 'Milford', 'NH', '03055', company_id, person_id_31);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2014-08-05', 'FullTime', 'Active', now(), now(), person_id_31, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '08/05/2014', now(), now(), company_id, person_id_31, null, null, null);

END;


DECLARE
  user_id_32 int;
  person_id_32 int;
  family_member_id_32_1 int;
  family_member_id_32_0 int;
  family_member_id_32_3 int;
  family_member_id_32_2 int;
  family_member_id_32_4 int;
  company_user_id_32 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melissapinard@fairviewhealthcare.com', 't', 'f', 'f', 'Melissa', 'Pinard', now(), now())
  RETURNING id into user_id_32;
  raise notice 'The user_id_32 after insert is %', user_id_32;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_32)
  RETURNING id into company_user_id_32;
  raise notice 'The company_user_id_32 is %', company_user_id_32;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melissa', '', 'Pinard', '', 'self', 'ALeCc_iYWuR4XXsOyrXDgouS_Hk6IKdXYZETq8fWKklMZ-njLNDi4Vk9Rty4b4vHkjwo7PNzsjxo', '1969-01-29', 'F', company_id, user_id_32, '')
  RETURNING id into person_id_32;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Wende Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_32);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', person_id_32);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_32, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '09/01/2014', now(), now(), company_id, person_id_32, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Brandon', '', 'Pinard', '', 'dependent', 'ALeCc_hhny8_Vva63UKf50nQeDNAD1bT5eEnfbOnYmlIfG3kUCjiwCQ2o6FcOoAeMsvQ-fEl97bX', '1993-12-10', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_32_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Steven', '', 'Pinard', '', 'spouse', 'ALeCc_jFqViz3weLUBIJtwWBGPhT_Tq8Vry8XDq5H4NUNrzlnFGkGWjgXCmtBN4W_ITDadxvDdD7', '1967-07-25', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '603', family_member_id_32_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Matthew', '', 'Pinard', '', 'dependent', 'ALeCc_heo1L9-4biMhm87zGnnq6qEPwOT1Io1KGCBXdrE26UGZseWDjC2C_AQJGIq2dRoe3krhgV', '2005-07-01', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_3);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_32_3);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jacob', '', 'Pinard', '', 'dependent', 'ALeCc_gCpypHyAuqjt6UmZY8KgPdF4KoPUmXYnSBXdxTgHyqD6CbLGByu1HUBoGt-oRvZnRSkghC', '2003-10-07', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_32_2);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Samuel', '', 'Pinard', '', 'dependent', 'ALeCc_hnqVZB2GxjE8VFBVCY1H69VxSihJlDjZskd7KvY4-sSOlnPwWeOoMxgIp_kvDpLJuyKJEc', '2005-07-01', 'M', company_id, user_id_32, '')
  RETURNING id into family_member_id_32_4;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 TESSIER ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_32_4);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', family_member_id_32_4);

END;


DECLARE
  user_id_33 int;
  person_id_33 int;
  family_member_id_33_0 int;
  company_user_id_33 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lauriemarston@fairviewhealthcare.com', 't', 'f', 'f', 'Laurie', 'Marston', now(), now())
  RETURNING id into user_id_33;
  raise notice 'The user_id_33 after insert is %', user_id_33;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_33)
  RETURNING id into company_user_id_33;
  raise notice 'The company_user_id_33 is %', company_user_id_33;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Laurie', 'M', 'Marston', '', 'self', 'ALeCc_gT3fAdqhaweP5l-Wxl35Na2YJYNrq4o6BISFEcP2PPsNWFvWo8t52TF7zWlJIyUM97Qu5H', '1960-01-05', 'F', company_id, user_id_33, '')
  RETURNING id into person_id_33;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 DUGOUT RD', '', 'HUDSON', 'NH', '03051', company_id, person_id_33);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827881', person_id_33);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 26956.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_33, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(26956.8, '09/01/2008', now(), now(), company_id, person_id_33, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Donald', '', 'Marston', '', 'spouse', 'ALeCc_h_AzLyYdJjP0fwKlAHya55tZ2fVkxYDsh0f1UmGPxhrxald_NnNDQDx9-LhzhRMzG7mAqn', '1958-07-22', 'M', company_id, user_id_33, '')
  RETURNING id into family_member_id_33_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_33_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827881', family_member_id_33_0);

END;


DECLARE
  user_id_34 int;
  person_id_34 int;
  company_user_id_34 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'michelledavanzo@fairviewhealthcare.com', 't', 'f', 'f', 'Michelle', 'D''Avanzo', now(), now())
  RETURNING id into user_id_34;
  raise notice 'The user_id_34 after insert is %', user_id_34;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_34)
  RETURNING id into company_user_id_34;
  raise notice 'The company_user_id_34 is %', company_user_id_34;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'M', 'D''Avanzo', '', 'self', 'ALeCc_gm1VZqrMNVbc9Oni8AuXjpwqb6LG16KN37ldRKr2QA0auRTqDGzU3DzDCRaoE8BIwcgB_i', '1969-11-09', 'F', company_id, user_id_34, '')
  RETURNING id into person_id_34;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Troutbrook Dr', '', 'Nashua', 'NH', '03062', company_id, person_id_34);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035087134', person_id_34);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27865.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_34, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_34, null, 14.2900, 162.5000);

END;


DECLARE
  user_id_35 int;
  person_id_35 int;
  company_user_id_35 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'meghanlandry@fairviewhealthcare.com', 't', 'f', 'f', 'Meghan', 'Landry', now(), now())
  RETURNING id into user_id_35;
  raise notice 'The user_id_35 after insert is %', user_id_35;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_35)
  RETURNING id into company_user_id_35;
  raise notice 'The company_user_id_35 is %', company_user_id_35;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Meghan', '', 'Landry', '', 'self', '', '1983-11-25', 'F', company_id, user_id_35, '')
  RETURNING id into person_id_35;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Lorri Road', '', 'Derry', 'NH', '03038', company_id, person_id_35);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_35, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_35, null, null, null);

END;


DECLARE
  user_id_36 int;
  person_id_36 int;
  company_user_id_36 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'amandawhite@fairviewhealthcare.com', 't', 'f', 'f', 'Amanda', 'White', now(), now())
  RETURNING id into user_id_36;
  raise notice 'The user_id_36 after insert is %', user_id_36;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_36)
  RETURNING id into company_user_id_36;
  raise notice 'The company_user_id_36 is %', company_user_id_36;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'White', '', 'self', 'ALeCc_iGv_C7qpUWIDnW7qKnPV2a2B3HyScAw5VeBE2orI23LPqY21_NHTlXv6D5QOqzxBnUkJH9', '1989-02-17', 'F', company_id, user_id_36, '')
  RETURNING id into person_id_36;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Todd Road', '', 'Nashua', 'NH', '03064', company_id, person_id_36);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033056337', person_id_36);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22912.5, '2013-02-14', 'FullTime', 'Active', now(), now(), person_id_36, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '02/14/2013', now(), now(), company_id, person_id_36, null, 11.7500, 162.5000);

END;


DECLARE
  user_id_37 int;
  person_id_37 int;
  company_user_id_37 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alandupont@fairviewhealthcare.com', 't', 'f', 'f', 'Alan', 'Dupont', now(), now())
  RETURNING id into user_id_37;
  raise notice 'The user_id_37 after insert is %', user_id_37;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_37)
  RETURNING id into company_user_id_37;
  raise notice 'The company_user_id_37 is %', company_user_id_37;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alan', 'W', 'Dupont', '', 'self', '', '1955-10-19', 'M', company_id, user_id_37, '')
  RETURNING id into person_id_37;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20 Blackstone Street', '', 'Hudson', 'NH', '03051', company_id, person_id_37);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 59987.0, '2012-06-25', 'FullTime', 'Active', now(), now(), person_id_37, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(59987.0, '06/25/2012', now(), now(), company_id, person_id_37, null, null, null);

END;


DECLARE
  user_id_38 int;
  person_id_38 int;
  company_user_id_38 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ketliecamille@fairviewhealthcare.com', 't', 'f', 'f', 'Ketlie', 'Camille', now(), now())
  RETURNING id into user_id_38;
  raise notice 'The user_id_38 after insert is %', user_id_38;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_38)
  RETURNING id into company_user_id_38;
  raise notice 'The company_user_id_38 is %', company_user_id_38;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ketlie', '', 'Camille', '', 'self', 'ALeCc_hemZZKGFHKTyCtBvACC4Ujoig19gmp59ZIzaJzGjPsW4CPg4P7vRYYMIXomwseIhyUE0cj', '1958-07-21', 'F', company_id, user_id_38, '')
  RETURNING id into person_id_38;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '19 Paul Street', '', 'Nashua', 'NH', '03060', company_id, person_id_38);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8572880821', person_id_38);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37498.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_38, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37498.5, '09/01/2008', now(), now(), company_id, person_id_38, null, null, null);

END;


DECLARE
  user_id_39 int;
  person_id_39 int;
  company_user_id_39 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresaberry@fairviewhealthcare.com', 't', 'f', 'f', 'Theresa', 'Berry', now(), now())
  RETURNING id into user_id_39;
  raise notice 'The user_id_39 after insert is %', user_id_39;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_39)
  RETURNING id into company_user_id_39;
  raise notice 'The company_user_id_39 is %', company_user_id_39;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', 'A', 'Berry', '', 'self', 'ALeCc_iJCYylbhybZZKcja8uUQFbiuxQuCXPZdONmtpa8WTgz7sf_Ev0W7HVMDMzClsxD22PY_p9', '1960-08-01', 'F', company_id, user_id_39, '')
  RETURNING id into person_id_39;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '48 Mountain Rd', '', 'Erving', 'MA', '01344', company_id, person_id_39);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '4135489068', person_id_39);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 90000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_39, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(90000.0, '09/01/2008', now(), now(), company_id, person_id_39, null, null, null);

END;


DECLARE
  user_id_40 int;
  person_id_40 int;
  company_user_id_40 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rhondaboudreau@fairviewhealthcare.com', 't', 'f', 'f', 'Rhonda', 'Boudreau', now(), now())
  RETURNING id into user_id_40;
  raise notice 'The user_id_40 after insert is %', user_id_40;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_40)
  RETURNING id into company_user_id_40;
  raise notice 'The company_user_id_40 is %', company_user_id_40;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rhonda', '', 'Boudreau', '', 'self', 'ALeCc_iB1AYwaIzKn0PESoCe4-d6svX6j-TQ32FHyEj4mZctoGYlF71mVtauRsu1NOo-PN1jH7tW', '1969-02-26', 'F', company_id, user_id_40, '')
  RETURNING id into person_id_40;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '34 Growing Road', '', 'Hudson', 'NH', '03051', company_id, person_id_40);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_40);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62000.0, '2014-07-15', 'FullTime', 'Active', now(), now(), person_id_40, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62000.0, '07/15/2014', now(), now(), company_id, person_id_40, null, null, null);

END;


DECLARE
  user_id_41 int;
  person_id_41 int;
  company_user_id_41 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dawnturcotte@fairviewhealthcare.com', 't', 'f', 'f', 'Dawn', 'Turcotte', now(), now())
  RETURNING id into user_id_41;
  raise notice 'The user_id_41 after insert is %', user_id_41;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_41)
  RETURNING id into company_user_id_41;
  raise notice 'The company_user_id_41 is %', company_user_id_41;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dawn', 'G', 'Turcotte', '', 'self', 'ALeCc_jciVrIIRhOYXvU-3ha89hPVMXm8V_yaKRLptcIk7lH8avctG169K8o2w_UYUQ0TKC-7zKt', '1964-08-15', 'F', company_id, user_id_41, '')
  RETURNING id into person_id_41;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Heather Court', '', 'Nashua', 'NH', '03062', company_id, person_id_41);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033960668', person_id_41);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.5, '2012-06-05', 'FullTime', 'Active', now(), now(), person_id_41, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '06/05/2012', now(), now(), company_id, person_id_41, null, 10.7500, 162.5000);

END;


DECLARE
  user_id_42 int;
  person_id_42 int;
  company_user_id_42 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'debramelville@fairviewhealthcare.com', 't', 'f', 'f', 'Debra', 'Melville', now(), now())
  RETURNING id into user_id_42;
  raise notice 'The user_id_42 after insert is %', user_id_42;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_42)
  RETURNING id into company_user_id_42;
  raise notice 'The company_user_id_42 is %', company_user_id_42;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Debra', '', 'Melville', '', 'self', '', '1961-09-18', 'F', company_id, user_id_42, '')
  RETURNING id into person_id_42;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '150 Wason Road', '', 'Hudson', 'NH', '03051', company_id, person_id_42);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 56285.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_42, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56285.0, '09/01/2008', now(), now(), company_id, person_id_42, null, null, null);

END;


DECLARE
  user_id_43 int;
  person_id_43 int;
  company_user_id_43 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dwaynebernard@fairviewhealthcare.com', 't', 'f', 'f', 'Dwayne', 'Bernard', now(), now())
  RETURNING id into user_id_43;
  raise notice 'The user_id_43 after insert is %', user_id_43;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_43)
  RETURNING id into company_user_id_43;
  raise notice 'The company_user_id_43 is %', company_user_id_43;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dwayne', 'M', 'Bernard', '', 'self', 'ALeCc_hcAmwwXIVVflrvjvNho6nefOfU0y1Zs4Hk9WDWivJetO9AJDjn5awxsFrJN06eYVHZ04PS', '1959-01-08', 'M', company_id, user_id_43, '')
  RETURNING id into person_id_43;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '32 Grove Avenue', '', 'Manchester', 'NH', '03109', company_id, person_id_43);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039358680', person_id_43);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2014-09-26', 'FullTime', 'Active', now(), now(), person_id_43, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/26/2014', now(), now(), company_id, person_id_43, null, null, null);

END;


DECLARE
  user_id_44 int;
  person_id_44 int;
  company_user_id_44 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'daviddillavou@fairviewhealthcare.com', 't', 'f', 'f', 'David', 'Dillavou', now(), now())
  RETURNING id into user_id_44;
  raise notice 'The user_id_44 after insert is %', user_id_44;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_44)
  RETURNING id into company_user_id_44;
  raise notice 'The company_user_id_44 is %', company_user_id_44;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'David', 'A', 'Dillavou', '', 'self', 'ALeCc_jREBjnkx7D-Rdrns6Rg32nmtzUDIf5wUd_RiiNBuj_jvuDHfcDG1DRrAYvdAMY8SzgjXJM', '1986-03-23', 'M', company_id, user_id_44, '')
  RETURNING id into person_id_44;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Colson Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_44);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033655496', person_id_44);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_44, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '09/01/2008', now(), now(), company_id, person_id_44, null, null, null);

END;


DECLARE
  user_id_45 int;
  person_id_45 int;
  company_user_id_45 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sylviecotnoir@fairviewhealthcare.com', 't', 'f', 'f', 'Sylvie', 'Cotnoir', now(), now())
  RETURNING id into user_id_45;
  raise notice 'The user_id_45 after insert is %', user_id_45;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_45)
  RETURNING id into company_user_id_45;
  raise notice 'The company_user_id_45 is %', company_user_id_45;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sylvie', '', 'Cotnoir', '', 'self', 'ALeCc_iJGwOamh4D7t76_U2TSep3s61zx5RMEPqVE5AQVMMIos8ii8B5cZoBYCZ4p5uN0Ox6ysAJ', '1961-01-01', 'F', company_id, user_id_45, '')
  RETURNING id into person_id_45;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '41 Almont St', '', 'Nashua', 'NH', '03060', company_id, person_id_45);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035789081', person_id_45);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62504.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_45, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62504.0, '09/01/2008', now(), now(), company_id, person_id_45, null, null, null);

END;


DECLARE
  user_id_46 int;
  person_id_46 int;
  company_user_id_46 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'martinahill@fairviewhealthcare.com', 't', 'f', 'f', 'Martina', 'Hill', now(), now())
  RETURNING id into user_id_46;
  raise notice 'The user_id_46 after insert is %', user_id_46;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_46)
  RETURNING id into company_user_id_46;
  raise notice 'The company_user_id_46 is %', company_user_id_46;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Martina', '', 'Hill', '', 'self', '', '1995-06-02', 'F', company_id, user_id_46, '')
  RETURNING id into person_id_46;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23400.0, '2014-12-09', 'FullTime', 'Active', now(), now(), person_id_46, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23400.0, '12/09/2014', now(), now(), company_id, person_id_46, null, null, null);

END;


DECLARE
  user_id_47 int;
  person_id_47 int;
  company_user_id_47 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alysonfortier@fairviewhealthcare.com', 't', 'f', 'f', 'Alyson', 'Fortier', now(), now())
  RETURNING id into user_id_47;
  raise notice 'The user_id_47 after insert is %', user_id_47;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_47)
  RETURNING id into company_user_id_47;
  raise notice 'The company_user_id_47 is %', company_user_id_47;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alyson', '', 'Fortier', '', 'self', '', '1995-02-10', 'F', company_id, user_id_47, '')
  RETURNING id into person_id_47;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-02-03', 'FullTime', 'Active', now(), now(), person_id_47, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '02/03/2014', now(), now(), company_id, person_id_47, null, null, null);

END;


DECLARE
  user_id_48 int;
  person_id_48 int;
  company_user_id_48 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aliciarinaldi@fairviewhealthcare.com', 't', 'f', 'f', 'Alicia', 'Rinaldi', now(), now())
  RETURNING id into user_id_48;
  raise notice 'The user_id_48 after insert is %', user_id_48;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_48)
  RETURNING id into company_user_id_48;
  raise notice 'The company_user_id_48 is %', company_user_id_48;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alicia', '', 'Rinaldi', '', 'self', '', '1989-06-29', 'F', company_id, user_id_48, '')
  RETURNING id into person_id_48;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 Oak Drive', '', 'Litchfield', 'NH', '03052', company_id, person_id_48);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21060.0, '2015-06-22', 'FullTime', 'Active', now(), now(), person_id_48, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '06/22/2015', now(), now(), company_id, person_id_48, null, null, null);

END;


DECLARE
  user_id_49 int;
  person_id_49 int;
  family_member_id_49_0 int;
  company_user_id_49 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tiffanybrown@fairviewhealthcare.com', 't', 'f', 'f', 'Tiffany', 'Brown', now(), now())
  RETURNING id into user_id_49;
  raise notice 'The user_id_49 after insert is %', user_id_49;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_49)
  RETURNING id into company_user_id_49;
  raise notice 'The company_user_id_49 is %', company_user_id_49;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tiffany', '', 'Brown', '', 'self', 'ALeCc_ggjCXyenRT0RlSAKfo8xnIgxhQHgfpl9WARrTKIV6F9cEk_38t17dt0-oghnTMkSPIvdMV', '1972-09-09', 'F', company_id, user_id_49, '')
  RETURNING id into person_id_49;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '74 Gebig Road', '', 'Nottingham', 'NH', '03290', company_id, person_id_49);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035833890', person_id_49);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 67600.0, '2015-09-20', 'FullTime', 'Active', now(), now(), person_id_49, company_id, null, '2015-09-20');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(67600.0, '09/20/2015', now(), now(), company_id, person_id_49, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Delaney', '', 'Brown', '', 'dependent', 'ALeCc_j87PQ-Cm6h5Nwq98OyNQgkLGfRCIihegHMi9dlCdWUTaIXP9ZCmdGUjo3InJoNT0Ffgltx', '2002-04-07', 'F', company_id, user_id_49, '')
  RETURNING id into family_member_id_49_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '74 GEBING RD', 'None', 'NOTTINGHAM', 'NH', '03290.0', company_id, family_member_id_49_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035833890', family_member_id_49_0);

END;


DECLARE
  user_id_50 int;
  person_id_50 int;
  family_member_id_50_1 int;
  family_member_id_50_0 int;
  family_member_id_50_2 int;
  company_user_id_50 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dongphuongnguyen@fairviewhealthcare.com', 't', 'f', 'f', 'Dongphuong', 'Nguyen', now(), now())
  RETURNING id into user_id_50;
  raise notice 'The user_id_50 after insert is %', user_id_50;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_50)
  RETURNING id into company_user_id_50;
  raise notice 'The company_user_id_50 is %', company_user_id_50;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dongphuong', '', 'Nguyen', '', 'self', 'ALeCc_i2juxTHKd930qAxnCJ7pcjreuOzE8v8VS4jtPMKdlnvZVVZ6ItLPIoeqSlrI3-4bDCuzjW', '1982-08-14', 'F', company_id, user_id_50, '')
  RETURNING id into person_id_50;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 Dogwood Cir', '', 'Pelham', 'NH', '03076', company_id, person_id_50);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', person_id_50);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2012-09-01', 'FullTime', 'Active', now(), now(), person_id_50, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '09/01/2012', now(), now(), company_id, person_id_50, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Bryan', '', 'Nguyen', '', 'dependent', 'ALeCc_g1lHLbdXNzPVKpcXj7Ob9guDlMVLa2Uz-P1uL88QdFm5nY7g2PMCgESiREAKi2g_UqrxLW', '2008-11-25', 'M', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'D', '', 'Nguyen', '', 'spouse', 'ALeCc_hehb7xDIBe7TwM1p15G18tKzzShwKLnQ7yuOgyWEWF_WGGW1vW2lbaeJvugGqTqc6td00b', '1978-09-19', 'M', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Bryanna', '', 'Nguyen', '', 'dependent', 'ALeCc_hmHMtxF7sGAdYlACOeQbK1ZcMkxd3MM6ng06EqXIjOqQ-LDgKIuXcdWJJLUFXn_YO2wIzK', '2011-11-18', 'F', company_id, user_id_50, '')
  RETURNING id into family_member_id_50_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 DOODWOOD CIR', 'None', 'PELHAM', 'NH', '03076.0', company_id, family_member_id_50_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', family_member_id_50_2);

END;


DECLARE
  user_id_51 int;
  person_id_51 int;
  family_member_id_51_0 int;
  company_user_id_51 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'roselynnbenard@fairviewhealthcare.com', 't', 'f', 'f', 'Roselynn', 'Benard', now(), now())
  RETURNING id into user_id_51;
  raise notice 'The user_id_51 after insert is %', user_id_51;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_51)
  RETURNING id into company_user_id_51;
  raise notice 'The company_user_id_51 is %', company_user_id_51;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roselynn', '', 'Benard', '', 'self', 'ALeCc_hb5JWcVoMWFQnuzubOn5Uneq6fgq5LkVK0UwQw8U0JT8GvrX3dv7d3lFey7-scdwUHuYGW', '1972-02-11', 'F', company_id, user_id_51, '')
  RETURNING id into person_id_51;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Stonehenge Rd', 'Apt 4', 'Londonderry', 'NH', '03053', company_id, person_id_51);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032752152', person_id_51);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_51, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/01/2008', now(), now(), company_id, person_id_51, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Nicholas', '', 'Benard', '', 'dependent', 'ALeCc_iyX5XSR6tGDbskLSjEgkMAgL3kL_OmVlwyoJ7Q7jmJcs4i6aG4pDFqh6D1a1Epc1Gai_AF', '1995-02-06', 'M', company_id, user_id_51, '')
  RETURNING id into family_member_id_51_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 308', 'None', 'LONDONDERRY', 'NH', '03053.0', company_id, family_member_id_51_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032752152', family_member_id_51_0);

END;


DECLARE
  user_id_52 int;
  person_id_52 int;
  family_member_id_52_0 int;
  company_user_id_52 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'irenegillen@fairviewhealthcare.com', 't', 'f', 'f', 'Irene', 'Gillen', now(), now())
  RETURNING id into user_id_52;
  raise notice 'The user_id_52 after insert is %', user_id_52;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_52)
  RETURNING id into company_user_id_52;
  raise notice 'The company_user_id_52 is %', company_user_id_52;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Irene', 'N', 'Gillen', '', 'self', 'ALeCc_gySt8f3UAxS73H7vAEBSznHF_fn0AY7yutidcJBAg1JoBDNOXSOPPdMe4M2Fx9ybPjHiZw', '1964-12-29', 'F', company_id, user_id_52, '')
  RETURNING id into person_id_52;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '93 Walnut Rd', '', 'Derry', 'NH', '03038', company_id, person_id_52);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034212969', person_id_52);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-08-25', 'FullTime', 'Active', now(), now(), person_id_52, company_id, 1, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/25/2015', now(), now(), company_id, person_id_52, null, 26.0000, 173.3333);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kyle', '', 'Gillen', '', 'dependent', 'ALeCc_gN74ihYqCQ1eK-ZVL0nE4LcfyZ_lNsBvB6N_5HwGGq0GXoEKfSbX3z0vFAe-l1wZ7NNVju', '2000-05-26', 'M', company_id, user_id_52, '')
  RETURNING id into family_member_id_52_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '93 WALNUT HILL RD', 'None', 'DERRY', 'NH', '03038.0', company_id, family_member_id_52_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034212969', family_member_id_52_0);

END;


DECLARE
  user_id_53 int;
  person_id_53 int;
  family_member_id_53_2 int;
  family_member_id_53_3 int;
  family_member_id_53_0 int;
  family_member_id_53_1 int;
  company_user_id_53 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'richardleboeuf@fairviewhealthcare.com', 't', 'f', 'f', 'Richard', 'Leboeuf', now(), now())
  RETURNING id into user_id_53;
  raise notice 'The user_id_53 after insert is %', user_id_53;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_53)
  RETURNING id into company_user_id_53;
  raise notice 'The company_user_id_53 is %', company_user_id_53;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', 'M', 'Leboeuf', '', 'self', 'ALeCc_g7dRQ4L_yMwQq_bLycJY-wggG8nfqvZRx4Wl53NJ4sqj9XA3E59L4Oiy6RdWf8HR-duOy1', '1967-01-14', 'M', company_id, user_id_53, '')
  RETURNING id into person_id_53;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 Trout Brook Rd', '', 'Dracut', 'MA', '01826', company_id, person_id_53);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', person_id_53);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 137966.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_53, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(137966.4, '09/01/2008', now(), now(), company_id, person_id_53, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Lyndsey', '', 'Leboeuf', '', 'dependent', 'ALeCc_hNaPKpYoALgDFu-PzJ3ghRDjgQAPUcbpaxEmV93Y1IrCgpDOQ0ISnlXIMlcOSv61fviSqB', '1994-11-01', 'F', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_2);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ryan', '', 'Leboeuf', '', 'dependent', 'ALeCc_iEGE8XshBdg4x3oZehjUNqaelGPrbpRQm0aHD6A87u7X2M9sXEz6zHe3-sKrae3d9P0ogH', '1998-04-04', 'M', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_3;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_3);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_3);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Nancy', '', 'Leboeuf', '', 'spouse', 'ALeCc_gb-W3eQ7axsnGgPRAjhimaGFgaYzUMrqHZ4gWeOcSn3FT4_yi2vi_RTi2iYfuUXEZV0emw', '1968-06-16', 'F', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Justin', '', 'Leboeuf', '', 'dependent', 'ALeCc_idVvZH_rhXrk_-95d6iP5wOZYO01iv8_RWbTFYbWI7saQNNKUssJSCvzs2fImTC3rlzb4u', '1996-05-24', 'M', company_id, user_id_53, '')
  RETURNING id into family_member_id_53_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 TROUT BROOK RD', 'None', 'DRACUT', 'MA', '01826.0', company_id, family_member_id_53_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', family_member_id_53_1);

END;


DECLARE
  user_id_54 int;
  person_id_54 int;
  company_user_id_54 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'katherineconway@fairviewhealthcare.com', 't', 'f', 'f', 'Katherine', 'Conway', now(), now())
  RETURNING id into user_id_54;
  raise notice 'The user_id_54 after insert is %', user_id_54;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_54)
  RETURNING id into company_user_id_54;
  raise notice 'The company_user_id_54 is %', company_user_id_54;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', '', 'Conway', '', 'self', 'ALeCc_hoZSln57MLvZKjJ_uxjQxDJ4wfKzuguGSc-vF9fQnLjPpR5yutH0vQHhk2BR4zSE7pnbuU', '1992-06-19', 'F', company_id, user_id_54, '')
  RETURNING id into person_id_54;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 Chestnut Rd', '', 'Tyngsboro', 'MA', '01879', company_id, person_id_54);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9786493479', person_id_54);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-04-01', 'FullTime', 'Active', now(), now(), person_id_54, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '04/01/2015', now(), now(), company_id, person_id_54, null, null, null);

END;


DECLARE
  user_id_55 int;
  person_id_55 int;
  company_user_id_55 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robertmackay@fairviewhealthcare.com', 't', 'f', 'f', 'Robert', 'Mackay', now(), now())
  RETURNING id into user_id_55;
  raise notice 'The user_id_55 after insert is %', user_id_55;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_55)
  RETURNING id into company_user_id_55;
  raise notice 'The company_user_id_55 is %', company_user_id_55;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robert', '', 'Mackay', '', 'self', '', '1956-01-27', 'M', company_id, user_id_55, '')
  RETURNING id into person_id_55;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '100 London Court', '', 'Merrimack', 'NH', '03054', company_id, person_id_55);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2010-12-01', 'FullTime', 'Active', now(), now(), person_id_55, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '12/01/2010', now(), now(), company_id, person_id_55, null, null, null);

END;


DECLARE
  user_id_56 int;
  person_id_56 int;
  company_user_id_56 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kylesargent@fairviewhealthcare.com', 't', 'f', 'f', 'Kyle', 'Sargent', now(), now())
  RETURNING id into user_id_56;
  raise notice 'The user_id_56 after insert is %', user_id_56;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_56)
  RETURNING id into company_user_id_56;
  raise notice 'The company_user_id_56 is %', company_user_id_56;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kyle', 'J', 'Sargent', '', 'self', '', '1991-08-07', 'M', company_id, user_id_56, '')
  RETURNING id into person_id_56;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Cassandra Lane', '', 'Nashua', 'NH', '03064', company_id, person_id_56);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17680.0, '2012-08-14', 'FullTime', 'Active', now(), now(), person_id_56, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17680.0, '08/14/2012', now(), now(), company_id, person_id_56, null, null, null);

END;


DECLARE
  user_id_57 int;
  person_id_57 int;
  company_user_id_57 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jessicamorrell@fairviewhealthcare.com', 't', 'f', 'f', 'Jessica', 'Morrell', now(), now())
  RETURNING id into user_id_57;
  raise notice 'The user_id_57 after insert is %', user_id_57;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_57)
  RETURNING id into company_user_id_57;
  raise notice 'The company_user_id_57 is %', company_user_id_57;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Morrell', '', 'self', 'ALeCc_hYpMDl1PRFJAO1wFsHBJ-WXTB7AYHW1ErLsRBDMCy6HKJIzQVj9_qLrUSZJ2fskvccP52t', '1987-01-02', 'F', company_id, user_id_57, '')
  RETURNING id into person_id_57;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 1216', '', 'Pepperell', 'MA', '01463', company_id, person_id_57);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_57);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_57, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_57, null, null, null);

END;


DECLARE
  user_id_58 int;
  person_id_58 int;
  company_user_id_58 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'emilyteague@fairviewhealthcare.com', 't', 'f', 'f', 'Emily', 'Teague', now(), now())
  RETURNING id into user_id_58;
  raise notice 'The user_id_58 after insert is %', user_id_58;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_58)
  RETURNING id into company_user_id_58;
  raise notice 'The company_user_id_58 is %', company_user_id_58;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', '', 'Teague', '', 'self', 'ALeCc_hlYezLVmx4xAbexKFb-H9VWKwWu5bK7o_4rsYVlstnptZdxBLivxWzjeg0JSl_20bvWFOE', '1987-10-01', 'F', company_id, user_id_58, '')
  RETURNING id into person_id_58;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Longwood Ave #2', '', 'Manchester', 'NH', '03109', company_id, person_id_58);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033150098', person_id_58);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_58, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '05/11/2015', now(), now(), company_id, person_id_58, null, null, null);

END;


DECLARE
  user_id_59 int;
  person_id_59 int;
  company_user_id_59 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'juliabizzarro@fairviewhealthcare.com', 't', 'f', 'f', 'Julia', 'Bizzarro', now(), now())
  RETURNING id into user_id_59;
  raise notice 'The user_id_59 after insert is %', user_id_59;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_59)
  RETURNING id into company_user_id_59;
  raise notice 'The company_user_id_59 is %', company_user_id_59;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Julia', '', 'Bizzarro', '', 'self', '', '1992-09-09', 'F', company_id, user_id_59, '')
  RETURNING id into person_id_59;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Cottage Ave', '', 'Nashua', 'NH', '03060', company_id, person_id_59);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22360.0, '2014-11-02', 'FullTime', 'Active', now(), now(), person_id_59, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22360.0, '11/02/2014', now(), now(), company_id, person_id_59, null, null, null);

END;


DECLARE
  user_id_60 int;
  person_id_60 int;
  family_member_id_60_0 int;
  family_member_id_60_1 int;
  family_member_id_60_2 int;
  company_user_id_60 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'markfournier@fairviewhealthcare.com', 't', 'f', 'f', 'Mark', 'Fournier', now(), now())
  RETURNING id into user_id_60;
  raise notice 'The user_id_60 after insert is %', user_id_60;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_60)
  RETURNING id into company_user_id_60;
  raise notice 'The company_user_id_60 is %', company_user_id_60;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mark', '', 'Fournier', '', 'self', 'ALeCc_juJfIUV421UyRG8ZTYH_v0CjfsOjqGQXYCP1Vj9Q5sQGRiqcehpjxliyRcd9Qlru4G3DBO', '1980-11-02', 'M', company_id, user_id_60, '')
  RETURNING id into person_id_60;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_60);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', person_id_60);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2014-08-27', 'FullTime', 'Active', now(), now(), person_id_60, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '08/27/2014', now(), now(), company_id, person_id_60, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jessica', '', 'Fournier', '', 'spouse', 'ALeCc_g7IOcHqFjNjVBSdr05NaML1p4Dn6XHEbAWpve28kwoTPnbBqy4OheBJ7-jkPU1srPLnX2G', '1976-03-31', 'F', company_id, user_id_60, '')
  RETURNING id into family_member_id_60_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_60_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_60_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ethan', '', 'Fournier', '', 'dependent', 'ALeCc_gs1xmPk_W_3Xiwl75RPTjXmol84LEqmZcsGv15gUcVI6qwLdmCTbtD6Zwvilri_UFl-G93', '2011-09-03', 'M', company_id, user_id_60, '')
  RETURNING id into family_member_id_60_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_60_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_60_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Noah', '', 'Fournier', '', 'dependent', 'ALeCc_iOyafLv7wLpUIkjT_E3yK6MAwRl6Un_WpWhSv0NZxVjPOL3kcQE7xzWLeGnNeGPv0ZVpuf', '2014-11-14', 'M', company_id, user_id_60, '')
  RETURNING id into family_member_id_60_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_60_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', family_member_id_60_2);

END;


DECLARE
  user_id_61 int;
  person_id_61 int;
  company_user_id_61 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dariustavallai@fairviewhealthcare.com', 't', 'f', 'f', 'Darius', 'Tavallai', now(), now())
  RETURNING id into user_id_61;
  raise notice 'The user_id_61 after insert is %', user_id_61;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_61)
  RETURNING id into company_user_id_61;
  raise notice 'The company_user_id_61 is %', company_user_id_61;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Darius', '', 'Tavallai', '', 'self', '', '1989-07-22', 'M', company_id, user_id_61, '')
  RETURNING id into person_id_61;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '19 Ichabod Dr', '', 'Merrimack', 'NH', '03054', company_id, person_id_61);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17617.0, '2011-12-03', 'FullTime', 'Active', now(), now(), person_id_61, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17617.0, '12/03/2011', now(), now(), company_id, person_id_61, null, null, null);

END;


DECLARE
  user_id_62 int;
  person_id_62 int;
  company_user_id_62 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ashleylevison@fairviewhealthcare.com', 't', 'f', 'f', 'Ashley', 'Levison', now(), now())
  RETURNING id into user_id_62;
  raise notice 'The user_id_62 after insert is %', user_id_62;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_62)
  RETURNING id into company_user_id_62;
  raise notice 'The company_user_id_62 is %', company_user_id_62;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Levison', '', 'self', 'ALeCc_j7hWixflZQ8Y075DH-KB5DONuGwAUK82EoOZavi6-PhzOJkHoezzlepH_X_5vSeV3f7Rk8', '1988-05-02', 'F', company_id, user_id_62, '')
  RETURNING id into person_id_62;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Watercrest Dr', '', 'Londonberry', 'NH', '03053', company_id, person_id_62);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035484392', person_id_62);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27170.0, '2014-07-21', 'FullTime', 'Active', now(), now(), person_id_62, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27170.0, '07/21/2014', now(), now(), company_id, person_id_62, null, null, null);

END;


DECLARE
  user_id_63 int;
  person_id_63 int;
  company_user_id_63 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'shannonohearn@fairviewhealthcare.com', 't', 'f', 'f', 'Shannon', 'O''Hearn', now(), now())
  RETURNING id into user_id_63;
  raise notice 'The user_id_63 after insert is %', user_id_63;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_63)
  RETURNING id into company_user_id_63;
  raise notice 'The company_user_id_63 is %', company_user_id_63;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shannon', '', 'O''Hearn', '', 'self', 'ALeCc_h2llI1LZ4nV3FpFPYJZ_MELwbu9MFRFkoIUGkw1Sc6mC05C6B2vKjQwahnkbq6K7I7RzQ1', '1977-12-02', 'F', company_id, user_id_63, '')
  RETURNING id into person_id_63;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '16 Walnut Street', '', 'Hudson', 'NH', '03051', company_id, person_id_63);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9785129683', person_id_63);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-04-14', 'FullTime', 'Active', now(), now(), person_id_63, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '04/14/2015', now(), now(), company_id, person_id_63, null, null, null);

END;


DECLARE
  user_id_64 int;
  person_id_64 int;
  company_user_id_64 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'areliousthomas@fairviewhealthcare.com', 't', 'f', 'f', 'Arelious', 'Thomas', now(), now())
  RETURNING id into user_id_64;
  raise notice 'The user_id_64 after insert is %', user_id_64;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_64)
  RETURNING id into company_user_id_64;
  raise notice 'The company_user_id_64 is %', company_user_id_64;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Arelious', 'A', 'Thomas', '', 'self', 'ALeCc_ir5hV8KzTDWNjGE2HHQnwTkoy0QphANw7IVTkfvZ02m_rNE4vCqL7eRNvMXd6WZMuaOByj', '1952-11-18', 'M', company_id, user_id_64, '')
  RETURNING id into person_id_64;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Page Rd', '', 'Litchfield', 'NH', '03052', company_id, person_id_64);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039435819', person_id_64);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28662.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_64, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28662.0, '09/01/2008', now(), now(), company_id, person_id_64, null, null, null);

END;


DECLARE
  user_id_65 int;
  person_id_65 int;
  company_user_id_65 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aletheahoch@fairviewhealthcare.com', 't', 'f', 'f', 'Alethea', 'Hoch', now(), now())
  RETURNING id into user_id_65;
  raise notice 'The user_id_65 after insert is %', user_id_65;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_65)
  RETURNING id into company_user_id_65;
  raise notice 'The company_user_id_65 is %', company_user_id_65;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alethea', 'M', 'Hoch', '', 'self', 'ALeCc_gGc9AmsmjRaCYAsGMwaH_H3OPc9k742i12d2AA7OzadOBby1IoXNhIaSC5jR0moaYyWI30', '1954-06-26', 'F', company_id, user_id_65, '')
  RETURNING id into person_id_65;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '201 Chester Road', '', 'Candia', 'NH', '03034', company_id, person_id_65);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033203111', person_id_65);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 69222.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_65, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(69222.0, '09/01/2008', now(), now(), company_id, person_id_65, null, null, null);

END;


DECLARE
  user_id_66 int;
  person_id_66 int;
  family_member_id_66_0 int;
  company_user_id_66 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ashleycoleman@fairviewhealthcare.com', 't', 'f', 'f', 'Ashley', 'Coleman', now(), now())
  RETURNING id into user_id_66;
  raise notice 'The user_id_66 after insert is %', user_id_66;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_66)
  RETURNING id into company_user_id_66;
  raise notice 'The company_user_id_66 is %', company_user_id_66;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Coleman', '', 'self', 'ALeCc_hr8tmTfDKppTyrJY0EPYv80QVOK1kmPZAFhLLv_DHN5eei-lxCE9HCJH1RgOB3YYbar0rH', '1986-09-22', 'F', company_id, user_id_66, '')
  RETURNING id into person_id_66;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Clifton Avenue', '', 'Salem', 'NH', '03079', company_id, person_id_66);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034016987', person_id_66);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2015-02-27', 'FullTime', 'Active', now(), now(), person_id_66, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '02/27/2015', now(), now(), company_id, person_id_66, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Isabella', '', 'Coleman', '', 'dependent', 'ALeCc_hQz5SPZj7w7x9mcBcHPf8SAMCLKTOKpcjMF7gUNOuurermzOiq6Z6c3ElpRKqUjubCNQtE', '2015-09-10', 'F', company_id, user_id_66, '')
  RETURNING id into family_member_id_66_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 CLIFTON AVE', 'None', 'SALEM', 'NH', '03079.0', company_id, family_member_id_66_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034016987', family_member_id_66_0);

END;


DECLARE
  user_id_67 int;
  person_id_67 int;
  company_user_id_67 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melanieperry@fairviewhealthcare.com', 't', 'f', 'f', 'Melanie', 'Perry', now(), now())
  RETURNING id into user_id_67;
  raise notice 'The user_id_67 after insert is %', user_id_67;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_67)
  RETURNING id into company_user_id_67;
  raise notice 'The company_user_id_67 is %', company_user_id_67;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melanie', '', 'Perry', '', 'self', '', '1976-11-09', 'F', company_id, user_id_67, '')
  RETURNING id into person_id_67;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_67, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '07/14/2014', now(), now(), company_id, person_id_67, null, null, null);

END;


DECLARE
  user_id_68 int;
  person_id_68 int;
  company_user_id_68 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'melissarust@fairviewhealthcare.com', 't', 'f', 'f', 'Melissa', 'Rust', now(), now())
  RETURNING id into user_id_68;
  raise notice 'The user_id_68 after insert is %', user_id_68;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_68)
  RETURNING id into company_user_id_68;
  raise notice 'The company_user_id_68 is %', company_user_id_68;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melissa', '', 'Rust', '', 'self', '', '1982-10-02', 'F', company_id, user_id_68, '')
  RETURNING id into person_id_68;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '85 Clark Rd', '', 'Shirley', 'MA', '01464', company_id, person_id_68);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41800.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_68, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41800.0, '07/14/2014', now(), now(), company_id, person_id_68, null, null, null);

END;


DECLARE
  user_id_69 int;
  person_id_69 int;
  company_user_id_69 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'donaldrankins@fairviewhealthcare.com', 't', 'f', 'f', 'Donald', 'Rankins', now(), now())
  RETURNING id into user_id_69;
  raise notice 'The user_id_69 after insert is %', user_id_69;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_69)
  RETURNING id into company_user_id_69;
  raise notice 'The company_user_id_69 is %', company_user_id_69;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Donald', '', 'Rankins', '', 'self', '', '1967-02-03', 'M', company_id, user_id_69, '')
  RETURNING id into person_id_69;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '58 North Short St', '', 'Andover', 'NH', '03216', company_id, person_id_69);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 56992.0, '2011-04-04', 'FullTime', 'Active', now(), now(), person_id_69, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56992.0, '04/04/2011', now(), now(), company_id, person_id_69, null, null, null);

END;


DECLARE
  user_id_70 int;
  person_id_70 int;
  company_user_id_70 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'toddgrogg@fairviewhealthcare.com', 't', 'f', 'f', 'Todd', 'Grogg', now(), now())
  RETURNING id into user_id_70;
  raise notice 'The user_id_70 after insert is %', user_id_70;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_70)
  RETURNING id into company_user_id_70;
  raise notice 'The company_user_id_70 is %', company_user_id_70;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Todd', 'J', 'Grogg', '', 'self', 'ALeCc_h7xIJypO5IoAkTsOm9Hh8V9a1RXLsNgDmWt-Ub6DBGNs-4rVqN9AJx74ZZex2pWT_6zYUz', '1966-05-06', 'M', company_id, user_id_70, '')
  RETURNING id into person_id_70;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '31 Congress St #5', '', 'Nashua', 'NH', '03062', company_id, person_id_70);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039137939', person_id_70);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24668.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_70, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24668.8, '09/01/2008', now(), now(), company_id, person_id_70, null, null, null);

END;


DECLARE
  user_id_71 int;
  person_id_71 int;
  company_user_id_71 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jennyxayachack@fairviewhealthcare.com', 't', 'f', 'f', 'Jenny', 'Xayachack', now(), now())
  RETURNING id into user_id_71;
  raise notice 'The user_id_71 after insert is %', user_id_71;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_71)
  RETURNING id into company_user_id_71;
  raise notice 'The company_user_id_71 is %', company_user_id_71;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jenny', '', 'Xayachack', '', 'self', '', '1990-05-25', 'F', company_id, user_id_71, '')
  RETURNING id into person_id_71;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 48214.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_71, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_71, null, 23.1800, 173.3333);

END;


DECLARE
  user_id_72 int;
  person_id_72 int;
  company_user_id_72 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cindyboucher@fairviewhealthcare.com', 't', 'f', 'f', 'Cindy', 'Boucher', now(), now())
  RETURNING id into user_id_72;
  raise notice 'The user_id_72 after insert is %', user_id_72;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_72)
  RETURNING id into company_user_id_72;
  raise notice 'The company_user_id_72 is %', company_user_id_72;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cindy', 'A', 'Boucher', '', 'self', 'ALeCc_iJUJdHBvaDGo3ivVzOnSlBrCGedQ9pMeTn2lRnCkRbv3J3xHj9G6qeSpQ6A658yhNQY8Sf', '1957-02-15', 'F', company_id, user_id_72, '')
  RETURNING id into person_id_72;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 PAGE RD APT 19', '', 'LITCHFIELD', 'NH', '03052.0', company_id, person_id_72);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038648134', person_id_72);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25313.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_72, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25313.6, '09/01/2008', now(), now(), company_id, person_id_72, null, null, null);

END;


DECLARE
  user_id_73 int;
  person_id_73 int;
  company_user_id_73 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'maryscafidi@fairviewhealthcare.com', 't', 'f', 'f', 'Mary', 'Scafidi', now(), now())
  RETURNING id into user_id_73;
  raise notice 'The user_id_73 after insert is %', user_id_73;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_73)
  RETURNING id into company_user_id_73;
  raise notice 'The company_user_id_73 is %', company_user_id_73;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mary', '', 'Scafidi', '', 'self', 'ALeCc_jF252HgVjS3qDuS2y41T2Bn8R9TflQfwrY7-k-6UULMOd8BLTwB-xwy031hHltF_yLX-u5', '1959-01-18', 'F', company_id, user_id_73, '')
  RETURNING id into person_id_73;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '53 River Road', '', 'Hudson', 'NH', '03051', company_id, person_id_73);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034949588', person_id_73);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-02-18', 'FullTime', 'Active', now(), now(), person_id_73, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '02/18/2014', now(), now(), company_id, person_id_73, null, null, null);

END;


DECLARE
  user_id_74 int;
  person_id_74 int;
  company_user_id_74 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'alfredosanchez@fairviewhealthcare.com', 't', 'f', 'f', 'Alfredo', 'Sanchez', now(), now())
  RETURNING id into user_id_74;
  raise notice 'The user_id_74 after insert is %', user_id_74;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_74)
  RETURNING id into company_user_id_74;
  raise notice 'The company_user_id_74 is %', company_user_id_74;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alfredo', '', 'Sanchez', '', 'self', 'ALeCc_iTWqp7QW_1vbpnCMBmlDa_nPrC4T-haMRKJOox2ejB57nZ3vgwukUI2_B0cKqXZ4AJoqdl', '1980-04-05', 'M', company_id, user_id_74, '')
  RETURNING id into person_id_74;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '82 Ledge St Apt 4', '', 'Nashua', 'NH', '03060', company_id, person_id_74);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038205144', person_id_74);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22588.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_74, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22588.0, '09/01/2008', now(), now(), company_id, person_id_74, null, null, null);

END;


DECLARE
  user_id_75 int;
  person_id_75 int;
  company_user_id_75 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brunildamejia@fairviewhealthcare.com', 't', 'f', 'f', 'Brunilda', 'Mejia', now(), now())
  RETURNING id into user_id_75;
  raise notice 'The user_id_75 after insert is %', user_id_75;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_75)
  RETURNING id into company_user_id_75;
  raise notice 'The company_user_id_75 is %', company_user_id_75;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brunilda', '', 'Mejia', '', 'self', '', '1972-08-17', 'F', company_id, user_id_75, '')
  RETURNING id into person_id_75;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '21 Longview Terrace', '', 'Methuen', 'MA', '01844', company_id, person_id_75);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 66019.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_75, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(66019.2, '09/01/2008', now(), now(), company_id, person_id_75, null, null, null);

END;


DECLARE
  user_id_76 int;
  person_id_76 int;
  company_user_id_76 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jameshayes@fairviewhealthcare.com', 't', 'f', 'f', 'James', 'Hayes', now(), now())
  RETURNING id into user_id_76;
  raise notice 'The user_id_76 after insert is %', user_id_76;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_76)
  RETURNING id into company_user_id_76;
  raise notice 'The company_user_id_76 is %', company_user_id_76;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'James', '', 'Hayes', '', 'self', '', '1980-10-22', 'M', company_id, user_id_76, '')
  RETURNING id into person_id_76;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '12 pheasant St', '', 'Litchfield', 'NH', '03052', company_id, person_id_76);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2011-07-05', 'FullTime', 'Active', now(), now(), person_id_76, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '07/05/2011', now(), now(), company_id, person_id_76, null, null, null);

END;


DECLARE
  user_id_77 int;
  person_id_77 int;
  company_user_id_77 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sherimello@fairviewhealthcare.com', 't', 'f', 'f', 'Sheri', 'Mello', now(), now())
  RETURNING id into user_id_77;
  raise notice 'The user_id_77 after insert is %', user_id_77;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_77)
  RETURNING id into company_user_id_77;
  raise notice 'The company_user_id_77 is %', company_user_id_77;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheri', '', 'Mello', '', 'self', 'ALeCc_gdnxsAio7mQpEUwEmuj4EBd89z0KJZagoboDhaO_0vdvzQMXqe1TIO-E7jamT3iQQAufm3', '1979-09-04', 'F', company_id, user_id_77, '')
  RETURNING id into person_id_77;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '43A ABBOTT ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_77);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '5089338479', person_id_77);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21840.0, '2014-11-08', 'FullTime', 'Active', now(), now(), person_id_77, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21840.0, '11/08/2014', now(), now(), company_id, person_id_77, null, null, null);

END;


DECLARE
  user_id_78 int;
  person_id_78 int;
  family_member_id_78_1 int;
  family_member_id_78_0 int;
  company_user_id_78 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'charlottelavoie@fairviewhealthcare.com', 't', 'f', 'f', 'Charlotte', 'Lavoie', now(), now())
  RETURNING id into user_id_78;
  raise notice 'The user_id_78 after insert is %', user_id_78;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_78)
  RETURNING id into company_user_id_78;
  raise notice 'The company_user_id_78 is %', company_user_id_78;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Charlotte', '', 'Lavoie', '', 'self', 'ALeCc_ha4FR9bnZLttYZsIMsqQgXc0QKRuVNLrIb3fSDxQAYhImife3Ql78TzsN_1PKIz8NwxUwJ', '1955-09-02', 'F', company_id, user_id_78, '')
  RETURNING id into person_id_78;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 Willow Ln', '', 'Amherst', 'NH', '03031', company_id, person_id_78);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', person_id_78);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_78, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45000.0, '09/01/2008', now(), now(), company_id, person_id_78, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Andrew', '', 'Lavoie', '', 'disabled dependent', 'ALeCc_iowxVxjPWzSPpG8ERZBPNszQn0byPryZqxWB5C4eyUtKlmKeM24azKxNNMRSoaVW--azkD', '1987-07-01', 'M', company_id, user_id_78, '')
  RETURNING id into family_member_id_78_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 WILLOW LN', 'None', 'AMHERST', 'NH', '03031.0', company_id, family_member_id_78_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', family_member_id_78_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Paul', '', 'Lavoie', '', 'spouse', 'ALeCc_j3AKN66Ze-ASxF-Z_j8nTUKc9qB2RxIksW0n9aG9el-UYw8l1bRPR7S4VSwoCHuYLtQC_P', '1950-09-05', 'M', company_id, user_id_78, '')
  RETURNING id into family_member_id_78_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 WILLOW LN', 'None', 'AMHERST', 'NH', '03031.0', company_id, family_member_id_78_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', family_member_id_78_0);

END;


DECLARE
  user_id_79 int;
  person_id_79 int;
  company_user_id_79 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'clarettamalin@fairviewhealthcare.com', 't', 'f', 'f', 'Claretta', 'Malin', now(), now())
  RETURNING id into user_id_79;
  raise notice 'The user_id_79 after insert is %', user_id_79;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_79)
  RETURNING id into company_user_id_79;
  raise notice 'The company_user_id_79 is %', company_user_id_79;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Claretta', '', 'Malin', '', 'self', 'ALeCc_hftpfCjRO0Xp_squ4y0JpusBCdScMfgspWL0XAEPH5W3bLrID3O3VBVgEuPHO-U3FBUyKk', '1953-07-21', 'F', company_id, user_id_79, '')
  RETURNING id into person_id_79;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Barisano Way', '', 'Nashua', 'NH', '03063', company_id, person_id_79);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799077', person_id_79);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 38480.0, '2011-02-14', 'FullTime', 'Active', now(), now(), person_id_79, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(38480.0, '02/14/2011', now(), now(), company_id, person_id_79, null, null, null);

END;


DECLARE
  user_id_80 int;
  person_id_80 int;
  company_user_id_80 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'conraddupont@fairviewhealthcare.com', 't', 'f', 'f', 'Conrad', 'Dupont', now(), now())
  RETURNING id into user_id_80;
  raise notice 'The user_id_80 after insert is %', user_id_80;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_80)
  RETURNING id into company_user_id_80;
  raise notice 'The company_user_id_80 is %', company_user_id_80;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Conrad', '', 'Dupont', '', 'self', 'ALeCc_ifIsaiNjGYiq8iVM2xh5IgalxPhjXWSnsItiyFi5hsoaudyLM4A_fTnMTBOm8bvrI9Q6On', '1962-12-10', 'M', company_id, user_id_80, '')
  RETURNING id into person_id_80;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1 BEACON ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_80);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033206059', person_id_80);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_80, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27000.0, '06/09/2014', now(), now(), company_id, person_id_80, null, null, null);

END;


DECLARE
  user_id_81 int;
  person_id_81 int;
  company_user_id_81 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'lashandralong@fairviewhealthcare.com', 't', 'f', 'f', 'Lashandra', 'Long', now(), now())
  RETURNING id into user_id_81;
  raise notice 'The user_id_81 after insert is %', user_id_81;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_81)
  RETURNING id into company_user_id_81;
  raise notice 'The company_user_id_81 is %', company_user_id_81;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Lashandra', '', 'Long', '', 'self', '', '1977-06-19', 'F', company_id, user_id_81, '')
  RETURNING id into person_id_81;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '31 Arlington St #2', '', 'Nashua', 'NH', '03060', company_id, person_id_81);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21242.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_81, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21242.0, '08/04/2014', now(), now(), company_id, person_id_81, null, null, null);

END;


DECLARE
  user_id_82 int;
  person_id_82 int;
  family_member_id_82_0 int;
  family_member_id_82_1 int;
  family_member_id_82_2 int;
  company_user_id_82 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jillfavereau@fairviewhealthcare.com', 't', 'f', 'f', 'Jill', 'Favereau', now(), now())
  RETURNING id into user_id_82;
  raise notice 'The user_id_82 after insert is %', user_id_82;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_82)
  RETURNING id into company_user_id_82;
  raise notice 'The company_user_id_82 is %', company_user_id_82;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Favereau', '', 'self', 'ALeCc_iHyPFfGwEyywagrrxhQw_rZNaF_UsfuR6vpFMc2BcQUA6qL4r_8LhMwY7sYVyag1UF4Auc', '1972-07-03', 'F', company_id, user_id_82, '')
  RETURNING id into person_id_82;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Mockingbird Hill Road', '', 'Windham', 'NH', '03087', company_id, person_id_82);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', person_id_82);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2010-11-22', 'FullTime', 'Active', now(), now(), person_id_82, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '11/22/2010', now(), now(), company_id, person_id_82, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Clifford', '', 'Favereau', '', 'spouse', 'ALeCc_iJ32cSyzqeMr1qyiK1klZcL2s96VtR5oiOPLGYdAT9O7U5oY2C9e4jxqrmNPxZrwBL_oHO', '1968-06-15', 'M', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Anthony', '', 'Favereau', '', 'dependent', 'ALeCc_gMaYm6VSNIX6Cq-WdmI5HV7B6JgQPl-JT2E8Gts-A7qpnzPTVKkG8KEO_NuxUc9dGbLe_J', '2001-04-16', 'M', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Leah', '', 'Favereau', '', 'dependent', 'ALeCc_gZxdZ9eMxZB3tGL3tpXNc6iBjVxcMrMW3UQAlGEeCaweZFIH-9qdn0pYrFI5r1IFro_CWO', '2005-12-24', 'F', company_id, user_id_82, '')
  RETURNING id into family_member_id_82_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 HIDDEN VALLEY RD', 'None', 'WINDHAM', 'NH', '03087.0', company_id, family_member_id_82_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', family_member_id_82_2);

END;


DECLARE
  user_id_83 int;
  person_id_83 int;
  company_user_id_83 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'marianneclauss@fairviewhealthcare.com', 't', 'f', 'f', 'Marianne', 'Clauss', now(), now())
  RETURNING id into user_id_83;
  raise notice 'The user_id_83 after insert is %', user_id_83;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_83)
  RETURNING id into company_user_id_83;
  raise notice 'The company_user_id_83 is %', company_user_id_83;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Marianne', '', 'Clauss', '', 'self', 'ALeCc_ibwA2y2pjg1PrzUePX-7W_gaftiWUBgZy5bFw5qZ3cPBV1U0Gi9zkuDLwwwHlgLvBqLdLB', '1966-05-04', 'F', company_id, user_id_83, '')
  RETURNING id into person_id_83;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '61 Croteau Court', '2F', 'Manchester', 'NH', '03104', company_id, person_id_83);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034868424', person_id_83);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 43680.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_83, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(43680.0, '06/12/2014', now(), now(), company_id, person_id_83, null, null, null);

END;


DECLARE
  user_id_84 int;
  person_id_84 int;
  company_user_id_84 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'deniseparadise@fairviewhealthcare.com', 't', 'f', 'f', 'Denise', 'Paradise', now(), now())
  RETURNING id into user_id_84;
  raise notice 'The user_id_84 after insert is %', user_id_84;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_84)
  RETURNING id into company_user_id_84;
  raise notice 'The company_user_id_84 is %', company_user_id_84;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Denise', 'J', 'Paradise', '', 'self', '', '1972-05-11', 'F', company_id, user_id_84, '')
  RETURNING id into person_id_84;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Joseph Avenue', '', 'Hudson', 'NH', '03051', company_id, person_id_84);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 92705.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_84, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(92705.6, '09/01/2008', now(), now(), company_id, person_id_84, null, null, null);

END;


DECLARE
  user_id_85 int;
  person_id_85 int;
  company_user_id_85 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kalilamson@fairviewhealthcare.com', 't', 'f', 'f', 'Kali', 'Lamson', now(), now())
  RETURNING id into user_id_85;
  raise notice 'The user_id_85 after insert is %', user_id_85;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_85)
  RETURNING id into company_user_id_85;
  raise notice 'The company_user_id_85 is %', company_user_id_85;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kali', '', 'Lamson', '', 'self', '', '1987-08-01', 'F', company_id, user_id_85, '')
  RETURNING id into person_id_85;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '310 Brook Village Rd', '', 'Nashua', 'NH', '03062', company_id, person_id_85);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_85, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '06/09/2014', now(), now(), company_id, person_id_85, null, null, null);

END;


DECLARE
  user_id_86 int;
  person_id_86 int;
  company_user_id_86 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'stephanieperez@fairviewhealthcare.com', 't', 'f', 'f', 'Stephanie', 'Perez', now(), now())
  RETURNING id into user_id_86;
  raise notice 'The user_id_86 after insert is %', user_id_86;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_86)
  RETURNING id into company_user_id_86;
  raise notice 'The company_user_id_86 is %', company_user_id_86;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', '', 'Perez', '', 'self', '', '1984-03-25', 'F', company_id, user_id_86, '')
  RETURNING id into person_id_86;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '218 Pheasant Run Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_86);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 18439.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_86, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_86, null, 11.8200, 130.0000);

END;


DECLARE
  user_id_87 int;
  person_id_87 int;
  company_user_id_87 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'eleanorknowlton@fairviewhealthcare.com', 't', 'f', 'f', 'Eleanor', 'Knowlton', now(), now())
  RETURNING id into user_id_87;
  raise notice 'The user_id_87 after insert is %', user_id_87;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_87)
  RETURNING id into company_user_id_87;
  raise notice 'The company_user_id_87 is %', company_user_id_87;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Eleanor', '', 'Knowlton', '', 'self', 'ALeCc_h3FXvFwFHqPMhZ0QtPqhCDYcLUZ7MUV1I_GfZbFaFDQJpKpeTJ1c9myMaZoa1iSKax_rav', '1956-02-09', 'F', company_id, user_id_87, '')
  RETURNING id into person_id_87;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Emerald Drive', '', 'Merrimack', 'NH', '03054', company_id, person_id_87);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8576361697', person_id_87);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19012.0, '2010-06-30', 'FullTime', 'Active', now(), now(), person_id_87, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19012.0, '06/30/2010', now(), now(), company_id, person_id_87, null, null, null);

END;


DECLARE
  user_id_88 int;
  person_id_88 int;
  family_member_id_88_2 int;
  family_member_id_88_0 int;
  family_member_id_88_1 int;
  company_user_id_88 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sheilalamb@fairviewhealthcare.com', 't', 'f', 'f', 'Sheila', 'Lamb', now(), now())
  RETURNING id into user_id_88;
  raise notice 'The user_id_88 after insert is %', user_id_88;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_88)
  RETURNING id into company_user_id_88;
  raise notice 'The company_user_id_88 is %', company_user_id_88;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheila', 'M', 'Lamb', '', 'self', 'ALeCc_hN7KzSo_etIpmmtrPuxqOEWTptt0OK9miqQx3ml02UpfvJ5jmbaP0vFrSFQo1LRqizyJei', '1959-09-07', 'F', company_id, user_id_88, '')
  RETURNING id into person_id_88;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 Lake Shore Dr', '', 'Westford', 'MA', '01886', company_id, person_id_88);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', person_id_88);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-08-06', 'FullTime', 'Active', now(), now(), person_id_88, company_id, 1, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/06/2015', now(), now(), company_id, person_id_88, null, 28.0000, 173.3333);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ainsley', '', 'Lamb', '', 'dependent', 'ALeCc_jWO8Xe-CtqLrMYTnzfIpu9RnkOZOuL4_CAXwE3Vy4dV7WlUJoVVX7LEl1noqIboXH2fa-6', '1998-07-17', 'F', company_id, user_id_88, '')
  RETURNING id into family_member_id_88_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_88_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_88_2);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Daniel', '', 'Lamb', '', 'spouse', 'ALeCc_hSWdExeLqj_nE7ADUobo62z5h1wUwC9PQUaxLwJnNxiBHOLxDk9j3y_Ui_S3GaaaQyyNyz', '1962-01-26', 'M', company_id, user_id_88, '')
  RETURNING id into family_member_id_88_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_88_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_88_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Ethan', '', 'Lamb', '', 'dependent', 'ALeCc_hSwIw2oirCi-RpOolvP9klXv9dGlkB08eoqMbSP5tYlHoKfJVSAjEoDCgj1ik_8ALJLY_B', '1996-04-02', 'M', company_id, user_id_88, '')
  RETURNING id into family_member_id_88_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 LAKE SHORE DR', 'None', 'WESTFORD', 'MA', '01886.0', company_id, family_member_id_88_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', family_member_id_88_1);

END;


DECLARE
  user_id_89 int;
  person_id_89 int;
  family_member_id_89_0 int;
  company_user_id_89 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cathyriley@fairviewhealthcare.com', 't', 'f', 'f', 'Cathy', 'Riley', now(), now())
  RETURNING id into user_id_89;
  raise notice 'The user_id_89 after insert is %', user_id_89;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_89)
  RETURNING id into company_user_id_89;
  raise notice 'The company_user_id_89 is %', company_user_id_89;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cathy', '', 'Riley', '', 'self', 'ALeCc_gO_vQf1gcrMOVp781h4EJmgeXZAQr-0jMWQm8rCG3bp2oWziL5vWWTPK6bywKtwIome1wk', '1959-02-22', 'F', company_id, user_id_89, '')
  RETURNING id into person_id_89;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Chatham Street', '', 'Hudson', 'NH', '03051', company_id, person_id_89);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032332736', person_id_89);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2014-09-14', 'FullTime', 'Active', now(), now(), person_id_89, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '09/14/2014', now(), now(), company_id, person_id_89, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'William', '', 'Riley', '', 'spouse', 'ALeCc_gBg_iIIlW9CH1JYsRoOs_3vdEHf-xcvlX3yHfSUlijuLGjfIfLn0DAM-mTzuRI4IsvgED_', '1953-04-19', 'M', company_id, user_id_89, '')
  RETURNING id into family_member_id_89_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 CHATHAM ST', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_89_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032332736', family_member_id_89_0);

END;


DECLARE
  user_id_90 int;
  person_id_90 int;
  company_user_id_90 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'robertacarrigg@fairviewhealthcare.com', 't', 'f', 'f', 'Roberta', 'Carrigg', now(), now())
  RETURNING id into user_id_90;
  raise notice 'The user_id_90 after insert is %', user_id_90;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_90)
  RETURNING id into company_user_id_90;
  raise notice 'The company_user_id_90 is %', company_user_id_90;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roberta', 'A', 'Carrigg', '', 'self', 'ALeCc_hFp0j8cFAVzqqO9om7b8pywIIsimsQ5HmA1NfPsVzdV7tCf6cHCubIMdStPXjUvmJK2-yA', '1958-03-07', 'F', company_id, user_id_90, '')
  RETURNING id into person_id_90;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Sunrise Trail', '', 'Nashua', 'NH', '03060', company_id, person_id_90);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_90);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27040.0, '2013-06-10', 'FullTime', 'Active', now(), now(), person_id_90, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27040.0, '06/10/2013', now(), now(), company_id, person_id_90, null, null, null);

END;


DECLARE
  user_id_91 int;
  person_id_91 int;
  company_user_id_91 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'annplourde@fairviewhealthcare.com', 't', 'f', 'f', 'Ann', 'Plourde', now(), now())
  RETURNING id into user_id_91;
  raise notice 'The user_id_91 after insert is %', user_id_91;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_91)
  RETURNING id into company_user_id_91;
  raise notice 'The company_user_id_91 is %', company_user_id_91;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ann', 'M', 'Plourde', '', 'self', '', '1964-07-27', 'F', company_id, user_id_91, '')
  RETURNING id into person_id_91;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '18 School Street', '', 'Salem', 'NH', '03079', company_id, person_id_91);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 76169.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_91, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(76169.0, '09/01/2008', now(), now(), company_id, person_id_91, null, null, null);

END;


DECLARE
  user_id_92 int;
  person_id_92 int;
  company_user_id_92 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kathrynmasterson@fairviewhealthcare.com', 't', 'f', 'f', 'Kathryn', 'Masterson', now(), now())
  RETURNING id into user_id_92;
  raise notice 'The user_id_92 after insert is %', user_id_92;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_92)
  RETURNING id into company_user_id_92;
  raise notice 'The company_user_id_92 is %', company_user_id_92;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kathryn', '', 'Masterson', '', 'self', 'ALeCc_iQ1otA4pyfnUC3yv3YAD2tzH1Ttx1vN7j_ORiofWi8VSioYFjt9uwB1IcUZ3QFoANQiT0u', '1950-11-05', 'F', company_id, user_id_92, '')
  RETURNING id into person_id_92;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '70 Joppa Rd', '', 'Merrimack', 'NH', '03054', company_id, person_id_92);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039210228', person_id_92);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_92, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40000.0, '09/01/2008', now(), now(), company_id, person_id_92, null, null, null);

END;


DECLARE
  user_id_93 int;
  person_id_93 int;
  company_user_id_93 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'sarahst_john@fairviewhealthcare.com', 't', 'f', 'f', 'Sarah', 'St John', now(), now())
  RETURNING id into user_id_93;
  raise notice 'The user_id_93 after insert is %', user_id_93;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_93)
  RETURNING id into company_user_id_93;
  raise notice 'The company_user_id_93 is %', company_user_id_93;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sarah', '', 'St John', '', 'self', '', '1986-04-19', 'F', company_id, user_id_93, '')
  RETURNING id into person_id_93;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '88 3/4 Palm Street', '', 'Nasua', 'NH', '03060', company_id, person_id_93);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19851.0, '2013-07-26', 'FullTime', 'Active', now(), now(), person_id_93, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19851.0, '07/26/2013', now(), now(), company_id, person_id_93, null, null, null);

END;


DECLARE
  user_id_94 int;
  person_id_94 int;
  company_user_id_94 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'dianahall@fairviewhealthcare.com', 't', 'f', 'f', 'Diana', 'Hall', now(), now())
  RETURNING id into user_id_94;
  raise notice 'The user_id_94 after insert is %', user_id_94;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_94)
  RETURNING id into company_user_id_94;
  raise notice 'The company_user_id_94 is %', company_user_id_94;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diana', '', 'Hall', '', 'self', 'ALeCc_gJTKJwqnjuSKLZgD-oPrHZr4tLM0kUMWrTW0I05hUu5I56SR10mEMElta2h-h9LgsRyRkM', '1970-12-02', 'F', company_id, user_id_94, '')
  RETURNING id into person_id_94;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 JAMES WAY', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_94);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037933476', person_id_94);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20716.0, '2010-04-27', 'FullTime', 'Active', now(), now(), person_id_94, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20716.0, '04/27/2010', now(), now(), company_id, person_id_94, null, null, null);

END;


DECLARE
  user_id_95 int;
  person_id_95 int;
  company_user_id_95 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rosefournier@fairviewhealthcare.com', 't', 'f', 'f', 'Rose', 'Fournier', now(), now())
  RETURNING id into user_id_95;
  raise notice 'The user_id_95 after insert is %', user_id_95;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_95)
  RETURNING id into company_user_id_95;
  raise notice 'The company_user_id_95 is %', company_user_id_95;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rose', '', 'Fournier', '', 'self', '', '1962-04-05', 'F', company_id, user_id_95, '')
  RETURNING id into person_id_95;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32344.0, '2013-09-09', 'FullTime', 'Active', now(), now(), person_id_95, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32344.0, '09/09/2013', now(), now(), company_id, person_id_95, null, null, null);

END;


DECLARE
  user_id_96 int;
  person_id_96 int;
  company_user_id_96 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'paulinepoisson-levesque@fairviewhealthcare.com', 't', 'f', 'f', 'Pauline', 'Poisson-Levesque', now(), now())
  RETURNING id into user_id_96;
  raise notice 'The user_id_96 after insert is %', user_id_96;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_96)
  RETURNING id into company_user_id_96;
  raise notice 'The company_user_id_96 is %', company_user_id_96;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Pauline', 'A', 'Poisson-Levesque', '', 'self', '', '1949-05-19', 'F', company_id, user_id_96, '')
  RETURNING id into person_id_96;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Autumn Leaf Dr', 'Apt 2', 'Nashua', 'NH', '03062', company_id, person_id_96);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37167.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_96, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37167.0, '09/01/2008', now(), now(), company_id, person_id_96, null, null, null);

END;


DECLARE
  user_id_97 int;
  person_id_97 int;
  company_user_id_97 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jamesbush@fairviewhealthcare.com', 't', 'f', 'f', 'James', 'Bush', now(), now())
  RETURNING id into user_id_97;
  raise notice 'The user_id_97 after insert is %', user_id_97;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_97)
  RETURNING id into company_user_id_97;
  raise notice 'The company_user_id_97 is %', company_user_id_97;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'James', '', 'Bush', '', 'self', 'ALeCc_iTO6xBcjFdXxiyTwQFQH1rLrTxKn8N7kue_hMWc2n679h5HegqwsHGo8exrjfRGj2RQINL', '1989-01-09', 'M', company_id, user_id_97, '')
  RETURNING id into person_id_97;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 Hawkstead Hollow', '', 'Nashua', 'NH', '03063', company_id, person_id_97);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034403317', person_id_97);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21450.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_97, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '06/12/2014', now(), now(), company_id, person_id_97, null, null, null);

END;


DECLARE
  user_id_98 int;
  person_id_98 int;
  company_user_id_98 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'janetmaxfield@fairviewhealthcare.com', 't', 'f', 'f', 'Janet', 'Maxfield', now(), now())
  RETURNING id into user_id_98;
  raise notice 'The user_id_98 after insert is %', user_id_98;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_98)
  RETURNING id into company_user_id_98;
  raise notice 'The company_user_id_98 is %', company_user_id_98;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Janet', '', 'Maxfield', '', 'self', 'ALeCc_hifb4KjPsRw3y1jhhvLNQkogtigWk728b3R9q5o-3nCHUZN0QXzSAMaDYsABbYUoqBEzas', '1964-08-26', 'F', company_id, user_id_98, '')
  RETURNING id into person_id_98;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '30 Library St Apt 2', '', 'Hudson', 'NH', '03051', company_id, person_id_98);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033055088', person_id_98);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31616.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_98, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31616.0, '07/14/2014', now(), now(), company_id, person_id_98, null, null, null);

END;


DECLARE
  user_id_99 int;
  person_id_99 int;
  company_user_id_99 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'christophergrenier@fairviewhealthcare.com', 't', 'f', 'f', 'Christopher', 'Grenier', now(), now())
  RETURNING id into user_id_99;
  raise notice 'The user_id_99 after insert is %', user_id_99;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_99)
  RETURNING id into company_user_id_99;
  raise notice 'The company_user_id_99 is %', company_user_id_99;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Christopher', '', 'Grenier', '', 'self', '', '1989-08-20', 'M', company_id, user_id_99, '')
  RETURNING id into person_id_99;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23533.0, '2015-07-15', 'FullTime', 'Active', now(), now(), person_id_99, company_id, null, '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23533.0, '07/15/2015', now(), now(), company_id, person_id_99, null, null, null);

END;


DECLARE
  user_id_100 int;
  person_id_100 int;
  family_member_id_100_0 int;
  family_member_id_100_1 int;
  family_member_id_100_2 int;
  company_user_id_100 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'patricialavoie@fairviewhealthcare.com', 't', 'f', 'f', 'Patricia', 'Lavoie', now(), now())
  RETURNING id into user_id_100;
  raise notice 'The user_id_100 after insert is %', user_id_100;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_100)
  RETURNING id into company_user_id_100;
  raise notice 'The company_user_id_100 is %', company_user_id_100;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Patricia', 'A', 'Lavoie', '', 'self', 'ALeCc_hgFuBmJChqQTDVcmcV4UYmurlKUJUEcn2YYw5cZ_4KUs-Zm2okV8bwdOhJjq5gb_6rQPzc', '1965-06-09', 'F', company_id, user_id_100, '')
  RETURNING id into person_id_100;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 Cleveland Hill Road', '', 'Brookline', 'NH', '03033', company_id, person_id_100);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', person_id_100);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2013-05-29', 'FullTime', 'Active', now(), now(), person_id_100, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '05/29/2013', now(), now(), company_id, person_id_100, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Raymond', '', 'Lavoie', '', 'spouse', 'ALeCc_gh1AqTQUm99cIANznSpObN02SWVM6yQBscDQuYqSisQHn1F7IK9DngzjeW-wpuQ4TXHfl3', '1964-07-28', 'M', company_id, user_id_100, '')
  RETURNING id into family_member_id_100_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_100_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_100_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jessica', '', 'Lavoie', '', 'dependent', 'ALeCc_g8GE--6priZPU0Cdyqlakfgd9oymkypVYSayEZTBhK-gZanS0Uqd3Rl_dUkGrAYhGRlKuf', '1996-05-03', 'F', company_id, user_id_100, '')
  RETURNING id into family_member_id_100_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_100_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_100_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Molly', '', 'Lavoie', '', 'dependent', 'ALeCc_ixmQSjYGddoxH55ClaflokKYO_03VQ_IaQA22OSbSDH3J8wsxscwnnZybH_0hQkQEh3QCW', '1998-11-25', 'F', company_id, user_id_100, '')
  RETURNING id into family_member_id_100_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 CLEVELAND HILL RD', 'None', 'BROOKLINE', 'NH', '03033.0', company_id, family_member_id_100_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', family_member_id_100_2);

END;


DECLARE
  user_id_101 int;
  person_id_101 int;
  company_user_id_101 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'annagelinas@fairviewhealthcare.com', 't', 'f', 'f', 'Anna', 'Gelinas', now(), now())
  RETURNING id into user_id_101;
  raise notice 'The user_id_101 after insert is %', user_id_101;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_101)
  RETURNING id into company_user_id_101;
  raise notice 'The company_user_id_101 is %', company_user_id_101;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Anna', 'M', 'Gelinas', '', 'self', 'ALeCc_gDLRnbqcr8RB5TQBcCfOzamU8x6WD9U4p2HDY6CKXQqaQjXvA82S5g68L0y9PpKL85nLVP', '1972-10-03', 'F', company_id, user_id_101, '')
  RETURNING id into person_id_101;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Cross St', 'Apt 1', 'Nashua', 'NH', '03064', company_id, person_id_101);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038806149', person_id_101);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37689.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_101, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37689.0, '09/01/2008', now(), now(), company_id, person_id_101, null, null, null);

END;


DECLARE
  user_id_102 int;
  person_id_102 int;
  company_user_id_102 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'hollymatthew@fairviewhealthcare.com', 't', 'f', 'f', 'Holly', 'Matthew', now(), now())
  RETURNING id into user_id_102;
  raise notice 'The user_id_102 after insert is %', user_id_102;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_102)
  RETURNING id into company_user_id_102;
  raise notice 'The company_user_id_102 is %', company_user_id_102;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Holly', '', 'Matthew', '', 'self', 'ALeCc_juYxVt8fi8gl8dltdfSctvmozDXc1fME0Km7p0zDQgrqQfQ3vY-ecl2SP30dmfPFMq0j-3', '1971-05-20', 'F', company_id, user_id_102, '')
  RETURNING id into person_id_102;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '25 CHEYENNE DR', '', 'NASHUA', 'NH', '03063', company_id, person_id_102);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827389', person_id_102);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17550.0, '2012-08-01', 'FullTime', 'Active', now(), now(), person_id_102, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17550.0, '08/01/2012', now(), now(), company_id, person_id_102, null, null, null);

END;


DECLARE
  user_id_103 int;
  person_id_103 int;
  family_member_id_103_0 int;
  company_user_id_103 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'michelledodge@fairviewhealthcare.com', 't', 'f', 'f', 'Michelle', 'Dodge', now(), now())
  RETURNING id into user_id_103;
  raise notice 'The user_id_103 after insert is %', user_id_103;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_103)
  RETURNING id into company_user_id_103;
  raise notice 'The company_user_id_103 is %', company_user_id_103;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'L', 'Dodge', '', 'self', 'ALeCc_j-qXRKNKZoVdPoL8PqHUPkncoP3NTRRCg_m4V-Cn-LZH1gITVfoXc060oGjODmaMtr8L8B', '1968-09-21', 'F', company_id, user_id_103, '')
  RETURNING id into person_id_103;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Arcadian Lane', '', 'Litchfield', 'NH', '03052', company_id, person_id_103);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034247660', person_id_103);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 64542.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_103, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(64542.4, '09/01/2008', now(), now(), company_id, person_id_103, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Kent', '', 'Dodge', '', 'spouse', 'ALeCc_hhaio_RYooNivHDuKC1woDHJaWVmabtfR3F8rwJTKGwh7kIK3sNwEHxMJZq-1C8mhMCNqp', '1957-10-03', 'M', company_id, user_id_103, '')
  RETURNING id into family_member_id_103_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 ARCADIAN LN', 'None', 'LITCHFIELD', 'NH', '03052.0', company_id, family_member_id_103_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034247660', family_member_id_103_0);

END;


DECLARE
  user_id_104 int;
  person_id_104 int;
  family_member_id_104_0 int;
  company_user_id_104 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'elizabethfahey@fairviewhealthcare.com', 't', 'f', 'f', 'Elizabeth', 'Fahey', now(), now())
  RETURNING id into user_id_104;
  raise notice 'The user_id_104 after insert is %', user_id_104;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_104)
  RETURNING id into company_user_id_104;
  raise notice 'The company_user_id_104 is %', company_user_id_104;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', 'A', 'Fahey', '', 'self', 'ALeCc_iTtagfepPWoaYzIdACBaXu-E2uIhqJAl477gxGagWuiIOZa39ViDf3xf_I27fSH3kMbm-L', '1954-10-28', 'F', company_id, user_id_104, '')
  RETURNING id into person_id_104;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Radcliffe Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_104);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035981307', person_id_104);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24024.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_104, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24024.0, '09/01/2008', now(), now(), company_id, person_id_104, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Michael', '', 'Fahey', '', 'spouse', 'ALeCc_jxE6-yzSG-9kAnVRK8jyrFzLN-IjN-N82TE_-iSiSy5tCX-xu3raiz-7x5U5vSc2MeGZxw', '1953-02-09', 'M', company_id, user_id_104, '')
  RETURNING id into family_member_id_104_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 RADCLIFFE DR', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_104_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035981307', family_member_id_104_0);

END;


DECLARE
  user_id_105 int;
  person_id_105 int;
  company_user_id_105 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'theresacronin@fairviewhealthcare.com', 't', 'f', 'f', 'Theresa', 'Cronin', now(), now())
  RETURNING id into user_id_105;
  raise notice 'The user_id_105 after insert is %', user_id_105;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_105)
  RETURNING id into company_user_id_105;
  raise notice 'The company_user_id_105 is %', company_user_id_105;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', '', 'Cronin', '', 'self', 'ALeCc_gkWNRyrhB2sSau801Zoz4zPVTT0xWkGIiInVlFRGL8lFLKZGDWfcdJBhdqGLg5q2CS2odg', '1949-12-05', 'F', company_id, user_id_105, '')
  RETURNING id into person_id_105;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Heidi Lane', '', 'Nashua', 'NH', '03062', company_id, person_id_105);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038864214', person_id_105);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_105, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '09/01/2008', now(), now(), company_id, person_id_105, null, null, null);

END;


DECLARE
  user_id_106 int;
  person_id_106 int;
  company_user_id_106 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'richardford@fairviewhealthcare.com', 't', 'f', 'f', 'Richard', 'Ford', now(), now())
  RETURNING id into user_id_106;
  raise notice 'The user_id_106 after insert is %', user_id_106;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_106)
  RETURNING id into company_user_id_106;
  raise notice 'The company_user_id_106 is %', company_user_id_106;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', '', 'Ford', '', 'self', '', '1990-02-11', 'M', company_id, user_id_106, '')
  RETURNING id into person_id_106;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2006-06-05', 'FullTime', 'Active', now(), now(), person_id_106, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '06/05/2006', now(), now(), company_id, person_id_106, null, null, null);

END;


DECLARE
  user_id_107 int;
  person_id_107 int;
  company_user_id_107 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'brendamarquis@fairviewhealthcare.com', 't', 'f', 'f', 'Brenda', 'Marquis', now(), now())
  RETURNING id into user_id_107;
  raise notice 'The user_id_107 after insert is %', user_id_107;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_107)
  RETURNING id into company_user_id_107;
  raise notice 'The company_user_id_107 is %', company_user_id_107;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brenda', 'C', 'Marquis', '', 'self', 'ALeCc_gycFT3ZLrzlrWeNgk2emWIERJ--wn-5JaYN_jMlk7ZkwJKgco0gAlZhFQMj8vJ4hq5yOJQ', '1953-12-16', 'F', company_id, user_id_107, '')
  RETURNING id into person_id_107;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Metropolitan Ave', '', 'Nashua', 'NH', '03064', company_id, person_id_107);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035952792', person_id_107);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28294.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_107, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28294.5, '09/01/2008', now(), now(), company_id, person_id_107, null, null, null);

END;


DECLARE
  user_id_108 int;
  person_id_108 int;
  family_member_id_108_0 int;
  company_user_id_108 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'mariamiranda@fairviewhealthcare.com', 't', 'f', 'f', 'Maria', 'Miranda', now(), now())
  RETURNING id into user_id_108;
  raise notice 'The user_id_108 after insert is %', user_id_108;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_108)
  RETURNING id into company_user_id_108;
  raise notice 'The company_user_id_108 is %', company_user_id_108;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', '', 'Miranda', '', 'self', 'ALeCc_iQcaVvf-TmdzNWNWTnVsy5DbMPl3vO_WIKOIfqHjay2jH3WVKf_1Wyd6Cs_l7R5MX5q4b9', '1991-10-15', 'F', company_id, user_id_108, '')
  RETURNING id into person_id_108;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '208 Kinsley Street', '', 'Nashua', 'NH', '03060', company_id, person_id_108);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038207625', person_id_108);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2015-03-01', 'FullTime', 'Active', now(), now(), person_id_108, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '03/01/2015', now(), now(), company_id, person_id_108, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Reinaliz Guadalupe', '', 'Roig-Miranda', '', 'dependent', 'ALeCc_jjCL_0Gk4WsoL3Yz3_-ScboTuLfeRhJJcm-zimABbjEkWldnBb5SK640nQrzayPfLLNqns', '2013-10-14', 'F', company_id, user_id_108, '')
  RETURNING id into family_member_id_108_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '205 KINSLEY ST', 'None', 'NASHUA', 'NH', '03060.0', company_id, family_member_id_108_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038207625', family_member_id_108_0);

END;


DECLARE
  user_id_109 int;
  person_id_109 int;
  company_user_id_109 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'heatherbresee@fairviewhealthcare.com', 't', 'f', 'f', 'Heather', 'Bresee', now(), now())
  RETURNING id into user_id_109;
  raise notice 'The user_id_109 after insert is %', user_id_109;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_109)
  RETURNING id into company_user_id_109;
  raise notice 'The company_user_id_109 is %', company_user_id_109;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Heather', '', 'Bresee', '', 'self', 'ALeCc_gjrCrboAFrc3xnbd6y2mbxcO9RZufejN8E5a0KgiGowiDSRTvqbmX8s3qFRYtTN2H8j71L', '1988-04-14', 'F', company_id, user_id_109, '')
  RETURNING id into person_id_109;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '133 Conant Road', '', 'Nashua', 'NH', '03062', company_id, person_id_109);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038099915', person_id_109);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24375.0, '2012-08-10', 'FullTime', 'Active', now(), now(), person_id_109, company_id, 1, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/10/2012', now(), now(), company_id, person_id_109, null, 12.5000, 162.5000);

END;


DECLARE
  user_id_110 int;
  person_id_110 int;
  company_user_id_110 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'jessicasmith@fairviewhealthcare.com', 't', 'f', 'f', 'Jessica', 'Smith', now(), now())
  RETURNING id into user_id_110;
  raise notice 'The user_id_110 after insert is %', user_id_110;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_110)
  RETURNING id into company_user_id_110;
  raise notice 'The company_user_id_110 is %', company_user_id_110;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Smith', '', 'self', 'ALeCc_hhX4pWc6IVmJNe8uOQDqywzjW088Y8kT1QCx6W8QMO6X07Lc4YBpNv4ZSHw5lybx0RybBz', '1988-05-31', 'F', company_id, user_id_110, '')
  RETURNING id into person_id_110;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '2 Rega St', '', 'Hudson', 'NH', '03051', company_id, person_id_110);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034409908', person_id_110);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2014-09-08', 'FullTime', 'Active', now(), now(), person_id_110, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '09/08/2014', now(), now(), company_id, person_id_110, null, null, null);

END;


DECLARE
  user_id_111 int;
  person_id_111 int;
  family_member_id_111_2 int;
  family_member_id_111_0 int;
  family_member_id_111_1 int;
  company_user_id_111 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'shellybeaucage@fairviewhealthcare.com', 't', 'f', 'f', 'Shelly', 'Beaucage', now(), now())
  RETURNING id into user_id_111;
  raise notice 'The user_id_111 after insert is %', user_id_111;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_111)
  RETURNING id into company_user_id_111;
  raise notice 'The company_user_id_111 is %', company_user_id_111;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shelly', 'A', 'Beaucage', '', 'self', 'ALeCc_hZc_Q-I5-pSj4DZscbqkKrp-HZ4rQqcTh6IuvCcFj_5-BeZvWIZjm4UY1BeZAjkGSNPgYC', '1969-10-15', 'F', company_id, user_id_111, '')
  RETURNING id into person_id_111;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110b Pelham Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_111);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6036893731', person_id_111);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40539.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_111, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40539.0, '09/01/2008', now(), now(), company_id, person_id_111, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Justin', '', 'Saucier', '', 'dependent', 'ALeCc_iQKR2AavpBtSyNIvurSVl6vTyoYBSaZLYaupmTcRjMmBgSfJL1_zsFRRTDzKCin_z9pSN8', '1990-03-08', 'M', company_id, user_id_111, '')
  RETURNING id into family_member_id_111_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110B PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_111_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6036893731', family_member_id_111_2);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Britney', '', 'Beaucage', '', 'dependent', 'ALeCc_gwG1ggQT6XKRQJ671_klt0SfkKvnhMR88WWZZGW_WmXZOySRaaheC-CoHLsBP8hPl8m_1a', '1995-05-31', 'F', company_id, user_id_111, '')
  RETURNING id into family_member_id_111_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1108 PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_111_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039214039', family_member_id_111_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Paige', '', 'Beaucage', '', 'dependent', 'ALeCc_gbmh7taxw4aCaRXKw_TOsPoVfjwDRurd8LyBleCxGpyXrQf8xRV1qQ6_-EkdKMSuxpU0wc', '1993-01-22', 'F', company_id, user_id_111, '')
  RETURNING id into family_member_id_111_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110B PELHAM RD', 'None', 'HUDSON', 'NH', '03051.0', company_id, family_member_id_111_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038090084', family_member_id_111_1);

END;


DECLARE
  user_id_112 int;
  person_id_112 int;
  company_user_id_112 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'cristianechatfield@fairviewhealthcare.com', 't', 'f', 'f', 'Cristiane', 'Chatfield', now(), now())
  RETURNING id into user_id_112;
  raise notice 'The user_id_112 after insert is %', user_id_112;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_112)
  RETURNING id into company_user_id_112;
  raise notice 'The company_user_id_112 is %', company_user_id_112;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cristiane', '', 'Chatfield', '', 'self', '', '1973-09-10', 'F', company_id, user_id_112, '')
  RETURNING id into person_id_112;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '4 Torrey Rd', '', 'Nashua', 'NH', '06063', company_id, person_id_112);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28080.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_112, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28080.0, '04/07/2014', now(), now(), company_id, person_id_112, null, null, null);

END;


DECLARE
  user_id_113 int;
  person_id_113 int;
  company_user_id_113 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'danilledefranzo@fairviewhealthcare.com', 't', 'f', 'f', 'Danille', 'Defranzo', now(), now())
  RETURNING id into user_id_113;
  raise notice 'The user_id_113 after insert is %', user_id_113;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_113)
  RETURNING id into company_user_id_113;
  raise notice 'The company_user_id_113 is %', company_user_id_113;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danille', '', 'Defranzo', '', 'self', '', '1992-02-12', 'F', company_id, user_id_113, '')
  RETURNING id into person_id_113;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2015-01-20', 'FullTime', 'Active', now(), now(), person_id_113, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '01/20/2015', now(), now(), company_id, person_id_113, null, null, null);

END;


DECLARE
  user_id_114 int;
  person_id_114 int;
  company_user_id_114 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'kellymcnally@fairviewhealthcare.com', 't', 'f', 'f', 'Kelly', 'Mcnally', now(), now())
  RETURNING id into user_id_114;
  raise notice 'The user_id_114 after insert is %', user_id_114;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_114)
  RETURNING id into company_user_id_114;
  raise notice 'The company_user_id_114 is %', company_user_id_114;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kelly', '', 'Mcnally', '', 'self', 'ALeCc_gAhhCft8VMXxNtEdvHlEwHUBiDXI_AnpnLu3HlrBHspZlMgwqsmh4yDdM7_zTQ7Io16WaT', '1989-09-01', 'F', company_id, user_id_114, '')
  RETURNING id into person_id_114;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Sanborn Rd', '', 'Derry', 'NH', '03038', company_id, person_id_114);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22880.0, '2015-02-01', 'FullTime', 'Active', now(), now(), person_id_114, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22880.0, '02/01/2015', now(), now(), company_id, person_id_114, null, null, null);

END;


DECLARE
  user_id_115 int;
  person_id_115 int;
  company_user_id_115 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'amandaglazier@fairviewhealthcare.com', 't', 'f', 'f', 'Amanda', 'Glazier', now(), now())
  RETURNING id into user_id_115;
  raise notice 'The user_id_115 after insert is %', user_id_115;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_115)
  RETURNING id into company_user_id_115;
  raise notice 'The company_user_id_115 is %', company_user_id_115;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'Glazier', '', 'self', '', '1978-10-22', 'F', company_id, user_id_115, '')
  RETURNING id into person_id_115;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31200.0, '2015-05-01', 'FullTime', 'Active', now(), now(), person_id_115, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31200.0, '05/01/2015', now(), now(), company_id, person_id_115, null, null, null);

END;


DECLARE
  user_id_116 int;
  person_id_116 int;
  company_user_id_116 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'aubreyguillotte@fairviewhealthcare.com', 't', 'f', 'f', 'Aubrey', 'Guillotte', now(), now())
  RETURNING id into user_id_116;
  raise notice 'The user_id_116 after insert is %', user_id_116;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_116)
  RETURNING id into company_user_id_116;
  raise notice 'The company_user_id_116 is %', company_user_id_116;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Aubrey', '', 'Guillotte', '', 'self', '', '1990-04-12', 'F', company_id, user_id_116, '')
  RETURNING id into person_id_116;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-05-08', 'FullTime', 'Active', now(), now(), person_id_116, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '05/08/2015', now(), now(), company_id, person_id_116, null, null, null);

END;


DECLARE
  user_id_117 int;
  person_id_117 int;
  company_user_id_117 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'karenfothergill@fairviewhealthcare.com', 't', 'f', 'f', 'Karen', 'Fothergill', now(), now())
  RETURNING id into user_id_117;
  raise notice 'The user_id_117 after insert is %', user_id_117;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_117)
  RETURNING id into company_user_id_117;
  raise notice 'The company_user_id_117 is %', company_user_id_117;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Fothergill', '', 'self', 'ALeCc_gerWOzxfEyiExeYPYLXt8qvJV4lBbYjoNEkqSrA8WkYuv-2ersTJpp0xKacUQc7FnDR2iU', '1954-07-18', 'F', company_id, user_id_117, '')
  RETURNING id into person_id_117;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 496', '', 'AMHERST', 'NH', '03031.0', company_id, person_id_117);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032619901', person_id_117);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2014-06-24', 'FullTime', 'Active', now(), now(), person_id_117, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '06/24/2014', now(), now(), company_id, person_id_117, null, null, null);

END;


DECLARE
  user_id_118 int;
  person_id_118 int;
  company_user_id_118 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'nicholecurran@fairviewhealthcare.com', 't', 'f', 'f', 'Nichole', 'Curran', now(), now())
  RETURNING id into user_id_118;
  raise notice 'The user_id_118 after insert is %', user_id_118;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_118)
  RETURNING id into company_user_id_118;
  raise notice 'The company_user_id_118 is %', company_user_id_118;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Nichole', '', 'Curran', '', 'self', '', '1987-10-26', 'F', company_id, user_id_118, '')
  RETURNING id into person_id_118;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21060.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_118, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '08/04/2014', now(), now(), company_id, person_id_118, null, null, null);

END;


DECLARE
  user_id_119 int;
  person_id_119 int;
  family_member_id_119_0 int;
  family_member_id_119_1 int;
  company_user_id_119 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'tracieseidl@fairviewhealthcare.com', 't', 'f', 'f', 'Tracie', 'Seidl', now(), now())
  RETURNING id into user_id_119;
  raise notice 'The user_id_119 after insert is %', user_id_119;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_119)
  RETURNING id into company_user_id_119;
  raise notice 'The company_user_id_119 is %', company_user_id_119;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tracie', 'M', 'Seidl', '', 'self', 'ALeCc_jIi_LihzErO27qfREetO7pbgvfB17bSGsSLWwSF5IjBC6GEknthjR2J6OoDBxN767LimJn', '1973-09-17', 'F', company_id, user_id_119, '')
  RETURNING id into person_id_119;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Fairmont Street', '', 'Nashua', 'NH', '03064', company_id, person_id_119);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', person_id_119);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47132.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_119, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47132.0, '09/01/2008', now(), now(), company_id, person_id_119, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Michael', '', 'Seidl', '', 'spouse', 'ALeCc_i5CQWrJZSSBOxkf_6d32JQ5qTXNveTqK9UcuL365I0KKEnqZCUjvvPrCaAyIMDQYl7F6F7', '1973-03-29', 'M', company_id, user_id_119, '')
  RETURNING id into family_member_id_119_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 FAIRMOUNT ST', 'None', 'NASHUA', 'NH', '03064.0', company_id, family_member_id_119_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', family_member_id_119_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Shayne', '', 'Seidl', '', 'dependent', 'ALeCc_hl4E-c7gHDW62jb3bDVdfamtD7Ez37MWTibLH86babqv-Pzke7gaek5f32G2Vp-B_qyO-z', '1997-01-11', 'M', company_id, user_id_119, '')
  RETURNING id into family_member_id_119_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 FAIRMOUNT ST', 'None', 'NASHUA', 'NH', '03064.0', company_id, family_member_id_119_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', family_member_id_119_1);

END;


DECLARE
  user_id_120 int;
  person_id_120 int;
  company_user_id_120 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'rosemarysampson@fairviewhealthcare.com', 't', 'f', 'f', 'Rosemary', 'Sampson', now(), now())
  RETURNING id into user_id_120;
  raise notice 'The user_id_120 after insert is %', user_id_120;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_120)
  RETURNING id into company_user_id_120;
  raise notice 'The company_user_id_120 is %', company_user_id_120;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rosemary', '', 'Sampson', '', 'self', 'ALeCc_hxa32b_-PBBbYjllkY2LrOau730QR239h--qLNsLG-MNCuUW6_HWOyFeyqS3IOSwbCfvYx', '1962-05-02', 'F', company_id, user_id_120, '')
  RETURNING id into person_id_120;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '77 Cadogan Way', '', 'Nashua', 'NH', '03062', company_id, person_id_120);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157382', person_id_120);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2013-12-30', 'FullTime', 'Active', now(), now(), person_id_120, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '12/30/2013', now(), now(), company_id, person_id_120, null, null, null);

END;


DECLARE
  user_id_121 int;
  person_id_121 int;
  company_user_id_121 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'elizabethngugi@fairviewhealthcare.com', 't', 'f', 'f', 'Elizabeth', 'Ngugi', now(), now())
  RETURNING id into user_id_121;
  raise notice 'The user_id_121 after insert is %', user_id_121;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_121)
  RETURNING id into company_user_id_121;
  raise notice 'The company_user_id_121 is %', company_user_id_121;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', '', 'Ngugi', '', 'self', 'ALeCc_jcK3KJSjBU4Jq8oOMq70zKJkXtIZcJv7g03fKrHoIjrvF87n2h4CwoLXyiV5_Ok-BhB77K', '1973-03-05', 'F', company_id, user_id_121, '')
  RETURNING id into person_id_121;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '216 Elmwood Drive', '', 'Hudson', 'NH', '03051', company_id, person_id_121);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157994', person_id_121);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45011.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_121, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45011.0, '09/01/2008', now(), now(), company_id, person_id_121, null, null, null);

END;


DECLARE
  user_id_122 int;
  person_id_122 int;
  family_member_id_122_0 int;
  family_member_id_122_1 int;
  family_member_id_122_2 int;
  company_user_id_122 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'bonniedoran@fairviewhealthcare.com', 't', 'f', 'f', 'Bonnie', 'Doran', now(), now())
  RETURNING id into user_id_122;
  raise notice 'The user_id_122 after insert is %', user_id_122;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_122)
  RETURNING id into company_user_id_122;
  raise notice 'The company_user_id_122 is %', company_user_id_122;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Bonnie', 'L', 'Doran', '', 'self', 'ALeCc_g3HaVI4nw2iQ6T8TBwZvI7TzJ6_OwvIdakLVLV8yPMPH9mLkOQxgYhB1BijGE40T9L-GUk', '1956-07-27', 'F', company_id, user_id_122, '')
  RETURNING id into person_id_122;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', '', 'MERRIMACK', 'NH', '03054.0', company_id, person_id_122);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', person_id_122);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37440.0, '2012-02-15', 'FullTime', 'Active', now(), now(), person_id_122, company_id, null, '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '02/15/2012', now(), now(), company_id, person_id_122, null, null, null);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Carly', '', 'Doran', '', 'dependent', 'ALeCc_jy4lKwO6it-tEHFa3zqibTBiEHjh79NyYGG0uYxOw_w5A0KW0KgwR7npR_posTx3lLlWVL', '1990-04-30', 'F', company_id, user_id_122, '')
  RETURNING id into family_member_id_122_0;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_122_0);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_122_0);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Sadie', '', 'Doran', '', 'dependent', 'ALeCc_hnYLoRN_3zG6e5DH_-dMI_LHNkfHZPewUsOnrZIo4WEi_odfDXI2t0eeClbBpzVKUTybvG', '1994-08-11', 'F', company_id, user_id_122, '')
  RETURNING id into family_member_id_122_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_122_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_122_1);

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('family', 'Jonathan', '', 'Smith', '', 'life partner', 'ALeCc_gFR2azxYCxFAJ28D77hTBJ9amxgppMveOHaaXYlvmXkH9VpSWkIoB54AKlFPVfBTZfYQ9V', '1952-12-27', 'M', company_id, user_id_122, '')
  RETURNING id into family_member_id_122_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', 'None', 'MERRIMACK', 'NH', '03054.0', company_id, family_member_id_122_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', family_member_id_122_2);

END;

raise notice 'There are 122 users created ';
END
$$
