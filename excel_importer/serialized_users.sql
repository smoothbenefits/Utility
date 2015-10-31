DO $$
DECLARE
  company_id int := 40;
BEGIN
raise notice 'The company_id to start is %', company_id;

DECLARE
  user_id_1 int;
  person_id_1 int;
  company_user_id_1 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'TINALECLAIR@fairviewhealthcare.com', 't', 'f', 'f', 'TINA', 'LECLAIR', now(), now())
  RETURNING id into user_id_1;
  raise notice 'The user_id_1 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_1)
  RETURNING id into company_user_id_1;
  raise notice 'The company_user_id_1 is %', company_user_id_1;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tina', '', 'Leclair', '', 'self', 'ALeCc_jpnFsG9qbGM9VyxqGul85_IHzklrS8Xx0ODCTfXAH2AEEJszNDMzmalsfjLoFruNohwVRY', '1983-02-06', 'F', company_id, user_id_1, '')
  RETURNING id into person_id_1;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '5 Tsiennato Rd', '#162', 'Derry', 'NH', '03038', company_id, person_id_1);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032312889', person_id_1);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_1, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_1, '', null, null);

END;


DECLARE
  user_id_2 int;
  person_id_2 int;
  company_user_id_2 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SELINAFLETCHER@fairviewhealthcare.com', 't', 'f', 'f', 'SELINA', 'FLETCHER', now(), now())
  RETURNING id into user_id_2;
  raise notice 'The user_id_2 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_2)
  RETURNING id into company_user_id_2;
  raise notice 'The company_user_id_2 is %', company_user_id_2;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Selina', '', 'Fletcher', '', 'self', 'ALeCc_g5NvJHj42keCVsWZwaRnOCXTzAmGBawLL508el7OJTgaV1qjRLQ6vWnR0nvmcdoN9ZBoGi', '1978-12-11', 'F', company_id, user_id_2, '')
  RETURNING id into person_id_2;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '105 SPIT BROOK RD', 'APT 16B', 'NASHUA', 'NH', '03062.0', company_id, person_id_2);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8179832986', person_id_2);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2014-09-04', 'FullTime', 'Active', now(), now(), person_id_2, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '09/04/2014', now(), now(), company_id, person_id_2, '', null, null);

END;


DECLARE
  user_id_3 int;
  person_id_3 int;
  company_user_id_3 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SUSANTRUBACZ@fairviewhealthcare.com', 't', 'f', 'f', 'SUSAN', 'TRUBACZ', now(), now())
  RETURNING id into user_id_3;
  raise notice 'The user_id_3 after insert is %', user_id;
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
  VALUES('', 21450.0, '2015-03-02', 'FullTime', 'Active', now(), now(), person_id_3, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '03/02/2015', now(), now(), company_id, person_id_3, '', null, null);

END;


DECLARE
  user_id_4 int;
  person_id_4 int;
  company_user_id_4 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'THERESEWARRINGTON@fairviewhealthcare.com', 't', 'f', 'f', 'THERESE', 'WARRINGTON', now(), now())
  RETURNING id into user_id_4;
  raise notice 'The user_id_4 after insert is %', user_id;
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
  VALUES('', 19721.0, '2015-02-09', 'FullTime', 'Active', now(), now(), person_id_4, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19721.0, '02/09/2015', now(), now(), company_id, person_id_4, '', null, null);

END;


DECLARE
  user_id_5 int;
  person_id_5 int;
  company_user_id_5 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JERENEVEILLEUX@fairviewhealthcare.com', 't', 'f', 'f', 'JERENE', 'VEILLEUX', now(), now())
  RETURNING id into user_id_5;
  raise notice 'The user_id_5 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_5)
  RETURNING id into company_user_id_5;
  raise notice 'The company_user_id_5 is %', company_user_id_5;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jerene', '', 'Veilleux', '', 'self', 'ALeCc_iayr0r_LvYFGEVSzRDYyHIRI_r5Cf9l7p4wJbDwtSOGOJffKlvEQF73cTHcRRLrE9skpFs', '1967-06-21', 'F', company_id, user_id_5, '')
  RETURNING id into person_id_5;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Charles Bancroft Hwy', '', 'Litchfield', 'NH', '03052', company_id, person_id_5);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035217174', person_id_5);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-03-31', 'FullTime', 'Active', now(), now(), person_id_5, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '03/31/2015', now(), now(), company_id, person_id_5, '', null, null);

END;


DECLARE
  user_id_6 int;
  person_id_6 int;
  company_user_id_6 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DIANEZACHER@fairviewhealthcare.com', 't', 'f', 'f', 'DIANE', 'ZACHER', now(), now())
  RETURNING id into user_id_6;
  raise notice 'The user_id_6 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_6)
  RETURNING id into company_user_id_6;
  raise notice 'The company_user_id_6 is %', company_user_id_6;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diane', '', 'Zacher', '', 'self', 'ALeCc_h4vJUe8cHUzeAH4ucbZx-YGec3IRtDKu6kq9pWBHNNAjlBRjQALR_EVUYrzQtxk_JIaGvK', '1956-10-03', 'F', company_id, user_id_6, '')
  RETURNING id into person_id_6;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Anvil Dr', '', 'Nashua', 'NH', '03060', company_id, person_id_6);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039307795', person_id_6);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25324.0, '2013-12-11', 'FullTime', 'Active', now(), now(), person_id_6, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25324.0, '12/11/2013', now(), now(), company_id, person_id_6, '', null, null);

END;


DECLARE
  user_id_7 int;
  person_id_7 int;
  company_user_id_7 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'EMILYINGLIS@fairviewhealthcare.com', 't', 'f', 'f', 'EMILY', 'INGLIS', now(), now())
  RETURNING id into user_id_7;
  raise notice 'The user_id_7 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_7)
  RETURNING id into company_user_id_7;
  raise notice 'The company_user_id_7 is %', company_user_id_7;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', 'S', 'Inglis', '', 'self', 'ALeCc_g2H88OjOvjl1WQEEwrKiV19SzWvBtdmGS-VQL9OckPyl9s-zK3KkrhWuGiZW9beXH3_sTk', '1987-06-05', 'F', company_id, user_id_7, '')
  RETURNING id into person_id_7;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Windham Dr', '', 'Concord', 'NH', '03301', company_id, person_id_7);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038607924', person_id_7);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46342.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_7, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46342.4, '09/01/2008', now(), now(), company_id, person_id_7, '', null, null);

END;


DECLARE
  user_id_8 int;
  person_id_8 int;
  company_user_id_8 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CATHERINELAJOIE@fairviewhealthcare.com', 't', 'f', 'f', 'CATHERINE', 'LAJOIE', now(), now())
  RETURNING id into user_id_8;
  raise notice 'The user_id_8 after insert is %', user_id;
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
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_8, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_8, '', null, null);

END;


DECLARE
  user_id_9 int;
  person_id_9 int;
  company_user_id_9 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROBINLUCIANO@fairviewhealthcare.com', 't', 'f', 'f', 'ROBIN', 'LUCIANO', now(), now())
  RETURNING id into user_id_9;
  raise notice 'The user_id_9 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_9)
  RETURNING id into company_user_id_9;
  raise notice 'The company_user_id_9 is %', company_user_id_9;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robin', '', 'Luciano', '', 'self', 'ALeCc_gcKMqseVJXOkVS-k6jXJ44EDbx4wAO6mId659ddgMuplv8JyF1twMJNW-ajtG81z8HbsD-', '1974-12-14', 'F', company_id, user_id_9, '')
  RETURNING id into person_id_9;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '23b Chandler Ct', '', 'Hudson', 'NH', '03051', company_id, person_id_9);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9788088398', person_id_9);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_9, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(54080.0, '08/04/2014', now(), now(), company_id, person_id_9, '', null, null);

END;


DECLARE
  user_id_10 int;
  person_id_10 int;
  company_user_id_10 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ANGELAKRAUS@fairviewhealthcare.com', 't', 'f', 'f', 'ANGELA', 'KRAUS', now(), now())
  RETURNING id into user_id_10;
  raise notice 'The user_id_10 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_10)
  RETURNING id into company_user_id_10;
  raise notice 'The company_user_id_10 is %', company_user_id_10;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Angela', 'J', 'Kraus', '', 'self', 'ALeCc_hIik54sw25q-wVYVd1AzJck8VaulTkKy2XnqlUb3T0AodsV1qwrXSyKI1zfQmrtR8E6adB', '1980-08-21', 'F', company_id, user_id_10, '')
  RETURNING id into person_id_10;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 A Shadowbrook Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_10);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038094297', person_id_10);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62400.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_10, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62400.0, '09/01/2008', now(), now(), company_id, person_id_10, '', null, null);

END;


DECLARE
  user_id_11 int;
  person_id_11 int;
  company_user_id_11 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KRISTINENUTTER@fairviewhealthcare.com', 't', 'f', 'f', 'KRISTINE', 'NUTTER', now(), now())
  RETURNING id into user_id_11;
  raise notice 'The user_id_11 after insert is %', user_id;
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
  VALUES('', 58552.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_11, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58552.0, '09/01/2008', now(), now(), company_id, person_id_11, '', null, null);

END;


DECLARE
  user_id_12 int;
  person_id_12 int;
  company_user_id_12 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'TASHAVANCELETTE@fairviewhealthcare.com', 't', 'f', 'f', 'TASHA', 'VANCELETTE', now(), now())
  RETURNING id into user_id_12;
  raise notice 'The user_id_12 after insert is %', user_id;
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
  VALUES('', 20280.0, '2014-08-14', 'FullTime', 'Active', now(), now(), person_id_12, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20280.0, '08/14/2014', now(), now(), company_id, person_id_12, '', null, null);

END;


DECLARE
  user_id_13 int;
  person_id_13 int;
  company_user_id_13 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALYSSAMACKAY@fairviewhealthcare.com', 't', 'f', 'f', 'ALYSSA', 'MACKAY', now(), now())
  RETURNING id into user_id_13;
  raise notice 'The user_id_13 after insert is %', user_id;
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
  VALUES('', 46000.0, '2013-09-01', 'FullTime', 'Active', now(), now(), person_id_13, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '09/01/2013', now(), now(), company_id, person_id_13, '', null, null);

END;


DECLARE
  user_id_14 int;
  person_id_14 int;
  company_user_id_14 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'BRITTANYSHAY@fairviewhealthcare.com', 't', 'f', 'f', 'BRITTANY', 'SHAY', now(), now())
  RETURNING id into user_id_14;
  raise notice 'The user_id_14 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_14)
  RETURNING id into company_user_id_14;
  raise notice 'The company_user_id_14 is %', company_user_id_14;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brittany', '', 'Shay', '', 'self', 'ALeCc_iTrJeHGEcOx4ohHSAqdAmHB6OeQ2ybYsAl7Qfm1e2vn_gWI1mqUNG28ULLZQ13JHh0yuua', '1990-07-12', 'F', company_id, user_id_14, '')
  RETURNING id into person_id_14;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Tolles St', '', 'Nashua', 'NH', '03064', company_id, person_id_14);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038975852', person_id_14);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-10-12', 'FullTime', 'Active', now(), now(), person_id_14, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '10/12/2014', now(), now(), company_id, person_id_14, '', null, null);

END;


DECLARE
  user_id_15 int;
  person_id_15 int;
  company_user_id_15 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MAUREENAMADI@fairviewhealthcare.com', 't', 'f', 'f', 'MAUREEN', 'AMADI', now(), now())
  RETURNING id into user_id_15;
  raise notice 'The user_id_15 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_15)
  RETURNING id into company_user_id_15;
  raise notice 'The company_user_id_15 is %', company_user_id_15;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maureen', '', 'Amadi', '', 'self', '', '1974-06-27', 'F', company_id, user_id_15, '')
  RETURNING id into person_id_15;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.0, '2011-05-05', 'FullTime', 'Active', now(), now(), person_id_15, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20962.0, '05/05/2011', now(), now(), company_id, person_id_15, '', null, null);

END;


DECLARE
  user_id_16 int;
  person_id_16 int;
  company_user_id_16 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KATIEPICARD@fairviewhealthcare.com', 't', 'f', 'f', 'KATIE', 'PICARD', now(), now())
  RETURNING id into user_id_16;
  raise notice 'The user_id_16 after insert is %', user_id;
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
  VALUES('', 18720.0, '2014-08-18', 'FullTime', 'Active', now(), now(), person_id_16, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(18720.0, '08/18/2014', now(), now(), company_id, person_id_16, '', null, null);

END;


DECLARE
  user_id_17 int;
  person_id_17 int;
  company_user_id_17 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DANIELLEQUINN@fairviewhealthcare.com', 't', 'f', 'f', 'DANIELLE', 'QUINN', now(), now())
  RETURNING id into user_id_17;
  raise notice 'The user_id_17 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_17)
  RETURNING id into company_user_id_17;
  raise notice 'The company_user_id_17 is %', company_user_id_17;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danielle', '', 'Quinn', '', 'self', 'ALeCc_iBuQnO5XZseqlLuVpJ7EjjlvQMxDuMzBlw7JLqBVkjhJ-wT_Ta7rF2XF4GtrL4df_A7eiI', '1980-06-16', 'F', company_id, user_id_17, '')
  RETURNING id into person_id_17;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 WASHINGTON CIR', '', 'HILLSBOROUGH', 'NH', '03244.0', company_id, person_id_17);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033450151', person_id_17);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 55000.0, '2014-01-15', 'FullTime', 'Active', now(), now(), person_id_17, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(55000.0, '01/15/2014', now(), now(), company_id, person_id_17, '', null, null);

END;


DECLARE
  user_id_18 int;
  person_id_18 int;
  company_user_id_18 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CAROLYNBEAULIEU@fairviewhealthcare.com', 't', 'f', 'f', 'CAROLYN', 'BEAULIEU', now(), now())
  RETURNING id into user_id_18;
  raise notice 'The user_id_18 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_18)
  RETURNING id into company_user_id_18;
  raise notice 'The company_user_id_18 is %', company_user_id_18;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carolyn', 'S', 'Beaulieu', '', 'self', 'ALeCc_hPPYbASSqNamIWabXS2s0eQstKdh-o434YDf4aZkBOBiQkbTFducSOWtv2MNridJrQFMQD', '1953-08-27', 'F', company_id, user_id_18, '')
  RETURNING id into person_id_18;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '86-9 Sargent Station Rd', '', 'Weare', 'NH', '03281', company_id, person_id_18);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035666314', person_id_18);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 42577.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_18, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(42577.6, '09/01/2008', now(), now(), company_id, person_id_18, '', null, null);

END;


DECLARE
  user_id_19 int;
  person_id_19 int;
  company_user_id_19 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CARLAWHOLEY@fairviewhealthcare.com', 't', 'f', 'f', 'CARLA', 'WHOLEY', now(), now())
  RETURNING id into user_id_19;
  raise notice 'The user_id_19 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_19)
  RETURNING id into company_user_id_19;
  raise notice 'The company_user_id_19 is %', company_user_id_19;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Carla', '', 'Wholey', '', 'self', '', '1963-06-08', 'F', company_id, user_id_19, '')
  RETURNING id into person_id_19;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2011-03-03', 'FullTime', 'Active', now(), now(), person_id_19, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '03/03/2011', now(), now(), company_id, person_id_19, '', null, null);

END;


DECLARE
  user_id_20 int;
  person_id_20 int;
  company_user_id_20 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROBERTHUTCHINGS@fairviewhealthcare.com', 't', 'f', 'f', 'ROBERT', 'HUTCHINGS', now(), now())
  RETURNING id into user_id_20;
  raise notice 'The user_id_20 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_20)
  RETURNING id into company_user_id_20;
  raise notice 'The company_user_id_20 is %', company_user_id_20;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robert', '', 'Hutchings', '', 'self', 'ALeCc_h7skoAKoMbpRlxMVRET_4UKpKCYF-pspdjMpFkKvv4iOZwLlgfknPOjzOZeTfalNZJYBTK', '1952-03-14', 'M', company_id, user_id_20, '')
  RETURNING id into person_id_20;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Quill Lane', '', 'Salem', 'NH', '03079', company_id, person_id_20);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_20);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2013-03-01', 'FullTime', 'Active', now(), now(), person_id_20, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '03/01/2013', now(), now(), company_id, person_id_20, '', null, null);

END;


DECLARE
  user_id_21 int;
  person_id_21 int;
  company_user_id_21 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DARLENECROSS@fairviewhealthcare.com', 't', 'f', 'f', 'DARLENE', 'CROSS', now(), now())
  RETURNING id into user_id_21;
  raise notice 'The user_id_21 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_21)
  RETURNING id into company_user_id_21;
  raise notice 'The company_user_id_21 is %', company_user_id_21;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Darlene', '', 'Cross', '', 'self', 'ALeCc_jsqcax05HaHN80WrHU4M_8zUYX4rRgTuv6ubS6WUpr2iFoEOA05NpdsMAS5be3vhU-2z8m', '1962-05-25', 'F', company_id, user_id_21, '')
  RETURNING id into person_id_21;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '66 Farmwood Drive', '', 'Nashua', 'NH', '03062', company_id, person_id_21);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_21, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '06/09/2014', now(), now(), company_id, person_id_21, '', null, null);

END;


DECLARE
  user_id_22 int;
  person_id_22 int;
  company_user_id_22 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CHRISTINECARPENTER@fairviewhealthcare.com', 't', 'f', 'f', 'CHRISTINE', 'CARPENTER', now(), now())
  RETURNING id into user_id_22;
  raise notice 'The user_id_22 after insert is %', user_id;
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
  VALUES('', 37440.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_22, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '05/11/2015', now(), now(), company_id, person_id_22, '', null, null);

END;


DECLARE
  user_id_23 int;
  person_id_23 int;
  company_user_id_23 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'STEPHANIESAOUMA@fairviewhealthcare.com', 't', 'f', 'f', 'STEPHANIE', 'SAOUMA', now(), now())
  RETURNING id into user_id_23;
  raise notice 'The user_id_23 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_23)
  RETURNING id into company_user_id_23;
  raise notice 'The company_user_id_23 is %', company_user_id_23;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', 'A', 'Saouma', '', 'self', 'ALeCc_jQNQ63RDrY96ItSwlRFq_GtMHWaL6Kqh2PIkwgMez9_tGlERE34UmaH6czJ8CXrck_lty1', '1967-06-02', 'F', company_id, user_id_23, '')
  RETURNING id into person_id_23;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1301 Bodwell Rd', 'Apt 9', 'Manchester', 'NH', '03109', company_id, person_id_23);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035401487', person_id_23);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 44283.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_23, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(44283.2, '09/01/2008', now(), now(), company_id, person_id_23, '', null, null);

END;


DECLARE
  user_id_24 int;
  person_id_24 int;
  company_user_id_24 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CARLAWHOLEY@fairviewhealthcare.com', 't', 'f', 'f', 'CARLA', 'WHOLEY', now(), now())
  RETURNING id into user_id_24;
  raise notice 'The user_id_24 after insert is %', user_id;
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
  VALUES('', 45760.0, '2010-06-07', 'FullTime', 'Active', now(), now(), person_id_24, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '06/07/2010', now(), now(), company_id, person_id_24, '', null, null);

END;


DECLARE
  user_id_25 int;
  person_id_25 int;
  company_user_id_25 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KATHERINEPHILBRICK@fairviewhealthcare.com', 't', 'f', 'f', 'KATHERINE', 'PHILBRICK', now(), now())
  RETURNING id into user_id_25;
  raise notice 'The user_id_25 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_25)
  RETURNING id into company_user_id_25;
  raise notice 'The company_user_id_25 is %', company_user_id_25;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', 'S', 'Philbrick', '', 'self', 'ALeCc_hbvFzA49EbfjoyvUh5EFCTQpi8cadDoyYFNepzjqPLfrdgosWYyTCfPOxXx6w58CN56H5g', '1970-08-18', 'F', company_id, user_id_25, '')
  RETURNING id into person_id_25;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Oliver Drive', '', 'Hudson', 'NH', '03061', company_id, person_id_25);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799356', person_id_25);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2012-05-29', 'FullTime', 'Active', now(), now(), person_id_25, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '05/29/2012', now(), now(), company_id, person_id_25, '', null, null);

END;


DECLARE
  user_id_26 int;
  person_id_26 int;
  company_user_id_26 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KRISTINMAFFEE@fairviewhealthcare.com', 't', 'f', 'f', 'KRISTIN', 'MAFFEE', now(), now())
  RETURNING id into user_id_26;
  raise notice 'The user_id_26 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_26)
  RETURNING id into company_user_id_26;
  raise notice 'The company_user_id_26 is %', company_user_id_26;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kristin', '', 'Maffee', '', 'self', 'ALeCc_jrSzU8iyMS14uBV_tjMA_D8wCM4thvrpAaW1bEO5LQrLZxdBldV_Pqt3_KSS_q3GskSKCQ', '1959-06-29', 'F', company_id, user_id_26, '')
  RETURNING id into person_id_26;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO Box 159', '379 Amhearst Street', 'Nashua', 'NH', '03063', company_id, person_id_26);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033052974', person_id_26);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_26, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31000.0, '06/09/2014', now(), now(), company_id, person_id_26, '', null, null);

END;


DECLARE
  user_id_27 int;
  person_id_27 int;
  company_user_id_27 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KARENTIERNEY@fairviewhealthcare.com', 't', 'f', 'f', 'KAREN', 'TIERNEY', now(), now())
  RETURNING id into user_id_27;
  raise notice 'The user_id_27 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_27)
  RETURNING id into company_user_id_27;
  raise notice 'The company_user_id_27 is %', company_user_id_27;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Tierney', '', 'self', 'ALeCc_h-GcKSfHG6OvicVW2-rhr2zk6--6t0o-AqOYC5HNQ_nbbnrVASnyHdm2xp5NqV0NKI84oi', '1960-06-11', 'F', company_id, user_id_27, '')
  RETURNING id into person_id_27;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 High Plain Ave', '', 'Litchfield', 'NH', '03052', company_id, person_id_27);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035055348', person_id_27);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47320.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_27, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47320.0, '04/07/2014', now(), now(), company_id, person_id_27, '', null, null);

END;


DECLARE
  user_id_28 int;
  person_id_28 int;
  company_user_id_28 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARIADUBE@fairviewhealthcare.com', 't', 'f', 'f', 'MARIA', 'DUBE', now(), now())
  RETURNING id into user_id_28;
  raise notice 'The user_id_28 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_28)
  RETURNING id into company_user_id_28;
  raise notice 'The company_user_id_28 is %', company_user_id_28;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', 'A', 'Dube', '', 'self', 'ALeCc_i8waTrAHkIhaWkQvCHpoRW6o757jL2mdA24aywgRS954P1Gd-tmiZHlrkTTCCRRPewERNO', '1965-12-18', 'F', company_id, user_id_28, '')
  RETURNING id into person_id_28;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 303', '', 'NASHUA', 'NH', '03061.0', company_id, person_id_28);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032615090', person_id_28);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 60320.0, '2013-11-01', 'FullTime', 'Active', now(), now(), person_id_28, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(60320.0, '11/01/2013', now(), now(), company_id, person_id_28, '', null, null);

END;


DECLARE
  user_id_29 int;
  person_id_29 int;
  company_user_id_29 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROBYNBRODY@fairviewhealthcare.com', 't', 'f', 'f', 'ROBYN', 'BRODY', now(), now())
  RETURNING id into user_id_29;
  raise notice 'The user_id_29 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_29)
  RETURNING id into company_user_id_29;
  raise notice 'The company_user_id_29 is %', company_user_id_29;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Robyn', '', 'Brody', '', 'self', 'ALeCc_gm25RBD6RtBzzGGDA7uyDnLwflDLu8ML2ssr13tCl6UdZJFjFyRM4FKFJ-4l93c4Vw8Jav', '1975-02-23', 'F', company_id, user_id_29, '')
  RETURNING id into person_id_29;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '148R Webster Street', '', 'Hudson', 'NH', '03051', company_id, person_id_29);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038825261', person_id_29);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_29, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '09/01/2014', now(), now(), company_id, person_id_29, '', null, null);

END;


DECLARE
  user_id_30 int;
  person_id_30 int;
  company_user_id_30 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JILLKRACKE@fairviewhealthcare.com', 't', 'f', 'f', 'JILL', 'KRACKE', now(), now())
  RETURNING id into user_id_30;
  raise notice 'The user_id_30 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_30)
  RETURNING id into company_user_id_30;
  raise notice 'The company_user_id_30 is %', company_user_id_30;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Kracke', '', 'self', 'ALeCc_gonKdVNBPwALUeWuu-6JX1YvUTohHhmRoTyOVjLzozPPjS7QUS8cKtvJAWHy6R1at3Dv3A', '1989-05-31', 'F', company_id, user_id_30, '')
  RETURNING id into person_id_30;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '75 Island Dr', '', 'Merrimack', 'NH', '03054', company_id, person_id_30);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '7819562294', person_id_30);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 50000.0, '2015-07-12', 'FullTime', 'Active', now(), now(), person_id_30, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/12/2015', now(), now(), company_id, person_id_30, '', null, null);

END;


DECLARE
  user_id_31 int;
  person_id_31 int;
  company_user_id_31 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'LISAWOOD@fairviewhealthcare.com', 't', 'f', 'f', 'LISA', 'WOOD', now(), now())
  RETURNING id into user_id_31;
  raise notice 'The user_id_31 after insert is %', user_id;
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
  VALUES('', 24960.0, '2014-08-05', 'FullTime', 'Active', now(), now(), person_id_31, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '08/05/2014', now(), now(), company_id, person_id_31, '', null, null);

END;


DECLARE
  user_id_32 int;
  person_id_32 int;
  company_user_id_32 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MELISSAPINARD@fairviewhealthcare.com', 't', 'f', 'f', 'MELISSA', 'PINARD', now(), now())
  RETURNING id into user_id_32;
  raise notice 'The user_id_32 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_32)
  RETURNING id into company_user_id_32;
  raise notice 'The company_user_id_32 is %', company_user_id_32;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melissa', '', 'Pinard', '', 'self', 'ALeCc_hO0L3JJdMIZg3DJYlOoHfYfrMAPULAd1lTXxkRav8wSyi9vBFz6uq5v28YGZ8cXglPCwal', '1969-01-29', 'F', company_id, user_id_32, '')
  RETURNING id into person_id_32;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Wende Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_32);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038861727', person_id_32);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2014-09-01', 'FullTime', 'Active', now(), now(), person_id_32, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '09/01/2014', now(), now(), company_id, person_id_32, '', null, null);

END;


DECLARE
  user_id_33 int;
  person_id_33 int;
  company_user_id_33 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'LAURIEMARSTON@fairviewhealthcare.com', 't', 'f', 'f', 'LAURIE', 'MARSTON', now(), now())
  RETURNING id into user_id_33;
  raise notice 'The user_id_33 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_33)
  RETURNING id into company_user_id_33;
  raise notice 'The company_user_id_33 is %', company_user_id_33;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Laurie', 'M', 'Marston', '', 'self', 'ALeCc_i0mTI1hYGNRtX2gSICO33AzjIPMTaCibOSEN244UaKlAtQgyWNZFeOcDbg9c2rGk5l6VFe', '1960-01-05', 'F', company_id, user_id_33, '')
  RETURNING id into person_id_33;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 DUGOUT RD', '', 'HUDSON', 'NH', '03051', company_id, person_id_33);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827881', person_id_33);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 26956.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_33, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(26956.8, '09/01/2008', now(), now(), company_id, person_id_33, '', null, null);

END;


DECLARE
  user_id_34 int;
  person_id_34 int;
  company_user_id_34 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MICHELLEDAVANZO@fairviewhealthcare.com', 't', 'f', 'f', 'MICHELLE', 'D''AVANZO', now(), now())
  RETURNING id into user_id_34;
  raise notice 'The user_id_34 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_34)
  RETURNING id into company_user_id_34;
  raise notice 'The company_user_id_34 is %', company_user_id_34;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'M', 'D''Avanzo', '', 'self', 'ALeCc_gA6AcikpEXLO5hK5BIgx65Zur-HoQrDLhwkRGRUej7HTu6ky4oI9qEt9PTJuBBFZzjZBeL', '1969-11-09', 'F', company_id, user_id_34, '')
  RETURNING id into person_id_34;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Troutbrook Dr', '', 'Nashua', 'NH', '03062', company_id, person_id_34);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035087134', person_id_34);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27865.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_34, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_34, '', 14.2900, 162.5000);

END;


DECLARE
  user_id_35 int;
  person_id_35 int;
  company_user_id_35 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MEGHANLANDRY@fairviewhealthcare.com', 't', 'f', 'f', 'MEGHAN', 'LANDRY', now(), now())
  RETURNING id into user_id_35;
  raise notice 'The user_id_35 after insert is %', user_id;
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
  VALUES('', 50000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_35, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(50000.0, '07/14/2014', now(), now(), company_id, person_id_35, '', null, null);

END;


DECLARE
  user_id_36 int;
  person_id_36 int;
  company_user_id_36 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'AMANDAWHITE@fairviewhealthcare.com', 't', 'f', 'f', 'AMANDA', 'WHITE', now(), now())
  RETURNING id into user_id_36;
  raise notice 'The user_id_36 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_36)
  RETURNING id into company_user_id_36;
  raise notice 'The company_user_id_36 is %', company_user_id_36;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'White', '', 'self', 'ALeCc_iYPbK06GGoo2mUP8u_EzlUKLenUdcvyqbKhqaN1t2IC8VN0_3iAq0YSQ_oo-pIgf5eXau7', '1989-02-17', 'F', company_id, user_id_36, '')
  RETURNING id into person_id_36;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Todd Road', '', 'Nashua', 'NH', '03064', company_id, person_id_36);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033056337', person_id_36);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22912.5, '2013-02-14', 'FullTime', 'Active', now(), now(), person_id_36, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '02/14/2013', now(), now(), company_id, person_id_36, '', 11.7500, 162.5000);

END;


DECLARE
  user_id_37 int;
  person_id_37 int;
  company_user_id_37 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALANDUPONT@fairviewhealthcare.com', 't', 'f', 'f', 'ALAN', 'DUPONT', now(), now())
  RETURNING id into user_id_37;
  raise notice 'The user_id_37 after insert is %', user_id;
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
  VALUES('', 59987.0, '2012-06-25', 'FullTime', 'Active', now(), now(), person_id_37, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(59987.0, '06/25/2012', now(), now(), company_id, person_id_37, '', null, null);

END;


DECLARE
  user_id_38 int;
  person_id_38 int;
  company_user_id_38 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KETLIECAMILLE@fairviewhealthcare.com', 't', 'f', 'f', 'KETLIE', 'CAMILLE', now(), now())
  RETURNING id into user_id_38;
  raise notice 'The user_id_38 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_38)
  RETURNING id into company_user_id_38;
  raise notice 'The company_user_id_38 is %', company_user_id_38;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ketlie', '', 'Camille', '', 'self', 'ALeCc_iiCng2XxDz7KK9TlPiMdBM7ZHQuEewwyraSo8nyOL4zkxqYccD69oXRF4gzseQkht-dV30', '1958-07-21', 'F', company_id, user_id_38, '')
  RETURNING id into person_id_38;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '19 Paul Street', '', 'Nashua', 'NH', '03060', company_id, person_id_38);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8572880821', person_id_38);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37498.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_38, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37498.5, '09/01/2008', now(), now(), company_id, person_id_38, '', null, null);

END;


DECLARE
  user_id_39 int;
  person_id_39 int;
  company_user_id_39 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'THERESABERRY@fairviewhealthcare.com', 't', 'f', 'f', 'THERESA', 'BERRY', now(), now())
  RETURNING id into user_id_39;
  raise notice 'The user_id_39 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_39)
  RETURNING id into company_user_id_39;
  raise notice 'The company_user_id_39 is %', company_user_id_39;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', 'A', 'Berry', '', 'self', 'ALeCc_gbA7yyHhP-1H3RQwl-VsJWCt-2PlRly9lmkrZjwLKttKg_rh3awnS9pyNJGLwzAl9BE11T', '1960-08-01', 'F', company_id, user_id_39, '')
  RETURNING id into person_id_39;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '48 Mountain Rd', '', 'Erving', 'MA', '01344', company_id, person_id_39);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '4135489068', person_id_39);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 90000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_39, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(90000.0, '09/01/2008', now(), now(), company_id, person_id_39, '', null, null);

END;


DECLARE
  user_id_40 int;
  person_id_40 int;
  company_user_id_40 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'RHONDABOUDREAU@fairviewhealthcare.com', 't', 'f', 'f', 'RHONDA', 'BOUDREAU', now(), now())
  RETURNING id into user_id_40;
  raise notice 'The user_id_40 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_40)
  RETURNING id into company_user_id_40;
  raise notice 'The company_user_id_40 is %', company_user_id_40;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rhonda', '', 'Boudreau', '', 'self', 'ALeCc_hmZXlNFB30ONovuOkbnfVKredyCOxpYUXxifd7WhrO6lYb3cD4hCHDUZZJTT-NAJcyxkNS', '1969-02-26', 'F', company_id, user_id_40, '')
  RETURNING id into person_id_40;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '34 Growing Road', '', 'Hudson', 'NH', '03051', company_id, person_id_40);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_40);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62000.0, '2014-07-15', 'FullTime', 'Active', now(), now(), person_id_40, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62000.0, '07/15/2014', now(), now(), company_id, person_id_40, '', null, null);

END;


DECLARE
  user_id_41 int;
  person_id_41 int;
  company_user_id_41 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DAWNTURCOTTE@fairviewhealthcare.com', 't', 'f', 'f', 'DAWN', 'TURCOTTE', now(), now())
  RETURNING id into user_id_41;
  raise notice 'The user_id_41 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_41)
  RETURNING id into company_user_id_41;
  raise notice 'The company_user_id_41 is %', company_user_id_41;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dawn', 'G', 'Turcotte', '', 'self', 'ALeCc_gg9EI-8k_ah07t1MOYDo6RcnH64nWO2od3JLg0BfK0pYxrEEuQX6fCiENaCTH97crUynk2', '1964-08-15', 'F', company_id, user_id_41, '')
  RETURNING id into person_id_41;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Heather Court', '', 'Nashua', 'NH', '03062', company_id, person_id_41);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033960668', person_id_41);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20962.5, '2012-06-05', 'FullTime', 'Active', now(), now(), person_id_41, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '06/05/2012', now(), now(), company_id, person_id_41, '', 10.7500, 162.5000);

END;


DECLARE
  user_id_42 int;
  person_id_42 int;
  company_user_id_42 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DEBRAMELVILLE@fairviewhealthcare.com', 't', 'f', 'f', 'DEBRA', 'MELVILLE', now(), now())
  RETURNING id into user_id_42;
  raise notice 'The user_id_42 after insert is %', user_id;
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
  VALUES('', 56285.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_42, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56285.0, '09/01/2008', now(), now(), company_id, person_id_42, '', null, null);

END;


DECLARE
  user_id_43 int;
  person_id_43 int;
  company_user_id_43 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DWAYNEBERNARD@fairviewhealthcare.com', 't', 'f', 'f', 'DWAYNE', 'BERNARD', now(), now())
  RETURNING id into user_id_43;
  raise notice 'The user_id_43 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_43)
  RETURNING id into company_user_id_43;
  raise notice 'The company_user_id_43 is %', company_user_id_43;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dwayne', 'M', 'Bernard', '', 'self', 'ALeCc_hsz_sQ5bQIiWaFz6eHgSzbNMz27e21uCSjzvYiMM4X_KHSLtAZ08DRlMm0b34pPagRppMU', '1959-01-08', 'M', company_id, user_id_43, '')
  RETURNING id into person_id_43;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '32 Grove Avenue', '', 'Manchester', 'NH', '03109', company_id, person_id_43);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039358680', person_id_43);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2014-09-26', 'FullTime', 'Active', now(), now(), person_id_43, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/26/2014', now(), now(), company_id, person_id_43, '', null, null);

END;


DECLARE
  user_id_44 int;
  person_id_44 int;
  company_user_id_44 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DAVIDDILLAVOU@fairviewhealthcare.com', 't', 'f', 'f', 'DAVID', 'DILLAVOU', now(), now())
  RETURNING id into user_id_44;
  raise notice 'The user_id_44 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_44)
  RETURNING id into company_user_id_44;
  raise notice 'The company_user_id_44 is %', company_user_id_44;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'David', 'A', 'Dillavou', '', 'self', 'ALeCc_hUlm08khWI8mxRJuwtEK4PZblRS7byo9EjTwT-Y5753HQgDBO35EQwOp8ktr8JnHBY62lj', '1986-03-23', 'M', company_id, user_id_44, '')
  RETURNING id into person_id_44;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Colson Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_44);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033655496', person_id_44);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_44, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '09/01/2008', now(), now(), company_id, person_id_44, '', null, null);

END;


DECLARE
  user_id_45 int;
  person_id_45 int;
  company_user_id_45 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SYLVIECOTNOIR@fairviewhealthcare.com', 't', 'f', 'f', 'SYLVIE', 'COTNOIR', now(), now())
  RETURNING id into user_id_45;
  raise notice 'The user_id_45 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_45)
  RETURNING id into company_user_id_45;
  raise notice 'The company_user_id_45 is %', company_user_id_45;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sylvie', '', 'Cotnoir', '', 'self', 'ALeCc_g-BS5nvGXRnsOjrqtEAZ6fcVE44PPS8OFbshbAJB04J9YEt2n2wuvHGwfrLLQVNdzzywy6', '1961-01-01', 'F', company_id, user_id_45, '')
  RETURNING id into person_id_45;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '41 Almont St', '', 'Nashua', 'NH', '03060', company_id, person_id_45);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035789081', person_id_45);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 62504.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_45, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(62504.0, '09/01/2008', now(), now(), company_id, person_id_45, '', null, null);

END;


DECLARE
  user_id_46 int;
  person_id_46 int;
  company_user_id_46 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARTINAHILL@fairviewhealthcare.com', 't', 'f', 'f', 'MARTINA', 'HILL', now(), now())
  RETURNING id into user_id_46;
  raise notice 'The user_id_46 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_46)
  RETURNING id into company_user_id_46;
  raise notice 'The company_user_id_46 is %', company_user_id_46;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Martina', '', 'Hill', '', 'self', '', '1995-06-02', 'F', company_id, user_id_46, '')
  RETURNING id into person_id_46;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23400.0, '2014-12-09', 'FullTime', 'Active', now(), now(), person_id_46, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23400.0, '12/09/2014', now(), now(), company_id, person_id_46, '', null, null);

END;


DECLARE
  user_id_47 int;
  person_id_47 int;
  company_user_id_47 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALYSONFORTIER@fairviewhealthcare.com', 't', 'f', 'f', 'ALYSON', 'FORTIER', now(), now())
  RETURNING id into user_id_47;
  raise notice 'The user_id_47 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_47)
  RETURNING id into company_user_id_47;
  raise notice 'The company_user_id_47 is %', company_user_id_47;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alyson', '', 'Fortier', '', 'self', '', '1995-02-10', 'F', company_id, user_id_47, '')
  RETURNING id into person_id_47;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24440.0, '2014-02-03', 'FullTime', 'Active', now(), now(), person_id_47, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24440.0, '02/03/2014', now(), now(), company_id, person_id_47, '', null, null);

END;


DECLARE
  user_id_48 int;
  person_id_48 int;
  company_user_id_48 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALICIARINALDI@fairviewhealthcare.com', 't', 'f', 'f', 'ALICIA', 'RINALDI', now(), now())
  RETURNING id into user_id_48;
  raise notice 'The user_id_48 after insert is %', user_id;
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
  VALUES('', 21060.0, '2015-06-22', 'FullTime', 'Active', now(), now(), person_id_48, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '06/22/2015', now(), now(), company_id, person_id_48, '', null, null);

END;


DECLARE
  user_id_49 int;
  person_id_49 int;
  company_user_id_49 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'TIFFANYBROWN@fairviewhealthcare.com', 't', 'f', 'f', 'TIFFANY', 'BROWN', now(), now())
  RETURNING id into user_id_49;
  raise notice 'The user_id_49 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_49)
  RETURNING id into company_user_id_49;
  raise notice 'The company_user_id_49 is %', company_user_id_49;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tiffany', '', 'Brown', '', 'self', 'ALeCc_jR0rM75wCWHCq9NVjkG5vBZFVsiYySQqp54gfznpFUsU9BGlRrLe7UaRtXi866omGUaFKi', '1972-09-09', 'F', company_id, user_id_49, '')
  RETURNING id into person_id_49;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '74 Gebig Road', '', 'Nottingham', 'NH', '03290', company_id, person_id_49);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035833890', person_id_49);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 67600.0, '2015-09-20', 'FullTime', 'Active', now(), now(), person_id_49, company_id, '', '2015-09-20');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(67600.0, '09/20/2015', now(), now(), company_id, person_id_49, '', null, null);

END;


DECLARE
  user_id_50 int;
  person_id_50 int;
  company_user_id_50 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DONGPHUONGNGUYEN@fairviewhealthcare.com', 't', 'f', 'f', 'DONGPHUONG', 'NGUYEN', now(), now())
  RETURNING id into user_id_50;
  raise notice 'The user_id_50 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_50)
  RETURNING id into company_user_id_50;
  raise notice 'The company_user_id_50 is %', company_user_id_50;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Dongphuong', '', 'Nguyen', '', 'self', 'ALeCc_jwgkGgpLU_2s5OaFO7cqwGRfMebIhTu8Wz1-8GMmOsqAguauYNGcYtsYL5_TJJaDvZ11bp', '1982-08-14', 'F', company_id, user_id_50, '')
  RETURNING id into person_id_50;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '52 Dogwood Cir', '', 'Pelham', 'NH', '03076', company_id, person_id_50);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038914955', person_id_50);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2012-09-01', 'FullTime', 'Active', now(), now(), person_id_50, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '09/01/2012', now(), now(), company_id, person_id_50, '', null, null);

END;


DECLARE
  user_id_51 int;
  person_id_51 int;
  company_user_id_51 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROSELYNNBENARD@fairviewhealthcare.com', 't', 'f', 'f', 'ROSELYNN', 'BENARD', now(), now())
  RETURNING id into user_id_51;
  raise notice 'The user_id_51 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_51)
  RETURNING id into company_user_id_51;
  raise notice 'The company_user_id_51 is %', company_user_id_51;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roselynn', '', 'Benard', '', 'self', 'ALeCc_gVL3XA0OL9eWbdZ0Jwii6Fc-uUE08zMmUvb-u0BGuUtsdW3GWTrCdf4blru65cpP9dHco2', '1972-02-11', 'F', company_id, user_id_51, '')
  RETURNING id into person_id_51;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '33 Stonehenge Rd', 'Apt 4', 'Londonderry', 'NH', '03053', company_id, person_id_51);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032752152', person_id_51);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_51, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32000.0, '09/01/2008', now(), now(), company_id, person_id_51, '', null, null);

END;


DECLARE
  user_id_52 int;
  person_id_52 int;
  company_user_id_52 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'IRENEGILLEN@fairviewhealthcare.com', 't', 'f', 'f', 'IRENE', 'GILLEN', now(), now())
  RETURNING id into user_id_52;
  raise notice 'The user_id_52 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_52)
  RETURNING id into company_user_id_52;
  raise notice 'The company_user_id_52 is %', company_user_id_52;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Irene', 'N', 'Gillen', '', 'self', 'ALeCc_hIfUr10KnfqrW4FAJtcEc72Sala5P6Huv5fJ37XPlw59jJ21itelpI4-kgFE9LX1-AtCZ6', '1964-12-29', 'F', company_id, user_id_52, '')
  RETURNING id into person_id_52;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '93 Walnut Rd', '', 'Derry', 'NH', '03038', company_id, person_id_52);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034212969', person_id_52);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 54080.0, '2015-08-25', 'FullTime', 'Active', now(), now(), person_id_52, company_id, '1', '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/25/2015', now(), now(), company_id, person_id_52, '', 26.0000, 173.3333);

END;


DECLARE
  user_id_53 int;
  person_id_53 int;
  company_user_id_53 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'RICHARDLEBOEUF@fairviewhealthcare.com', 't', 'f', 'f', 'RICHARD', 'LEBOEUF', now(), now())
  RETURNING id into user_id_53;
  raise notice 'The user_id_53 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_53)
  RETURNING id into company_user_id_53;
  raise notice 'The company_user_id_53 is %', company_user_id_53;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', 'M', 'Leboeuf', '', 'self', 'ALeCc_juQIYTFPPu_s_jo7bY3ear1ANySHzzIiT3TkJfG4WdooMWv2skLl3xS5yTJ0JnQhiA-LcQ', '1967-01-14', 'M', company_id, user_id_53, '')
  RETURNING id into person_id_53;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '177 Trout Brook Rd', '', 'Dracut', 'MA', '01826', company_id, person_id_53);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9789753728', person_id_53);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 137966.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_53, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(137966.4, '09/01/2008', now(), now(), company_id, person_id_53, '', null, null);

END;


DECLARE
  user_id_54 int;
  person_id_54 int;
  company_user_id_54 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KATHERINECONWAY@fairviewhealthcare.com', 't', 'f', 'f', 'KATHERINE', 'CONWAY', now(), now())
  RETURNING id into user_id_54;
  raise notice 'The user_id_54 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_54)
  RETURNING id into company_user_id_54;
  raise notice 'The company_user_id_54 is %', company_user_id_54;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Katherine', '', 'Conway', '', 'self', 'ALeCc_jsYaogs6JRF8FbgN353js9KWPUtRVVWZXBVsFbV1T7Fx9FcVk28Dlr_w-LVdN-AEArMdRI', '1992-06-19', 'F', company_id, user_id_54, '')
  RETURNING id into person_id_54;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '28 Chestnut Rd', '', 'Tyngsboro', 'MA', '01879', company_id, person_id_54);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9786493479', person_id_54);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-04-01', 'FullTime', 'Active', now(), now(), person_id_54, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '04/01/2015', now(), now(), company_id, person_id_54, '', null, null);

END;


DECLARE
  user_id_55 int;
  person_id_55 int;
  company_user_id_55 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROBERTMACKAY@fairviewhealthcare.com', 't', 'f', 'f', 'ROBERT', 'MACKAY', now(), now())
  RETURNING id into user_id_55;
  raise notice 'The user_id_55 after insert is %', user_id;
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
  VALUES('', 24960.0, '2010-12-01', 'FullTime', 'Active', now(), now(), person_id_55, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '12/01/2010', now(), now(), company_id, person_id_55, '', null, null);

END;


DECLARE
  user_id_56 int;
  person_id_56 int;
  company_user_id_56 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KYLESARGENT@fairviewhealthcare.com', 't', 'f', 'f', 'KYLE', 'SARGENT', now(), now())
  RETURNING id into user_id_56;
  raise notice 'The user_id_56 after insert is %', user_id;
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
  VALUES('', 17680.0, '2012-08-14', 'FullTime', 'Active', now(), now(), person_id_56, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17680.0, '08/14/2012', now(), now(), company_id, person_id_56, '', null, null);

END;


DECLARE
  user_id_57 int;
  person_id_57 int;
  company_user_id_57 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JESSICAMORRELL@fairviewhealthcare.com', 't', 'f', 'f', 'JESSICA', 'MORRELL', now(), now())
  RETURNING id into user_id_57;
  raise notice 'The user_id_57 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_57)
  RETURNING id into company_user_id_57;
  raise notice 'The company_user_id_57 is %', company_user_id_57;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Morrell', '', 'self', 'ALeCc_gF12m38r6pLFOzdu-oOp4mmjqPpUN6d1voKRLXxoYtNBK6pUQLrI2s6WmBtAGm-qf-hHK_', '1987-01-02', 'F', company_id, user_id_57, '')
  RETURNING id into person_id_57;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 1216', '', 'Pepperell', 'MA', '01463', company_id, person_id_57);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035664318', person_id_57);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 41860.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_57, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41860.0, '06/12/2014', now(), now(), company_id, person_id_57, '', null, null);

END;


DECLARE
  user_id_58 int;
  person_id_58 int;
  company_user_id_58 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'EMILYTEAGUE@fairviewhealthcare.com', 't', 'f', 'f', 'EMILY', 'TEAGUE', now(), now())
  RETURNING id into user_id_58;
  raise notice 'The user_id_58 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_58)
  RETURNING id into company_user_id_58;
  raise notice 'The company_user_id_58 is %', company_user_id_58;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Emily', '', 'Teague', '', 'self', 'ALeCc_gXwqQwZPL-P8Pmr-CRhIXUIYJbygvm6iy3wnCXGrje5OYkdS0NXFd9u7Gvoux-XzwcLctM', '1987-10-01', 'F', company_id, user_id_58, '')
  RETURNING id into person_id_58;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '90 Longwood Ave #2', '', 'Manchester', 'NH', '03109', company_id, person_id_58);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033150098', person_id_58);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2015-05-11', 'FullTime', 'Active', now(), now(), person_id_58, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '05/11/2015', now(), now(), company_id, person_id_58, '', null, null);

END;


DECLARE
  user_id_59 int;
  person_id_59 int;
  company_user_id_59 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JULIABIZZARRO@fairviewhealthcare.com', 't', 'f', 'f', 'JULIA', 'BIZZARRO', now(), now())
  RETURNING id into user_id_59;
  raise notice 'The user_id_59 after insert is %', user_id;
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
  VALUES('', 22360.0, '2014-11-02', 'FullTime', 'Active', now(), now(), person_id_59, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22360.0, '11/02/2014', now(), now(), company_id, person_id_59, '', null, null);

END;


DECLARE
  user_id_60 int;
  person_id_60 int;
  company_user_id_60 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARKFOURNIER@fairviewhealthcare.com', 't', 'f', 'f', 'MARK', 'FOURNIER', now(), now())
  RETURNING id into user_id_60;
  raise notice 'The user_id_60 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_60)
  RETURNING id into company_user_id_60;
  raise notice 'The company_user_id_60 is %', company_user_id_60;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mark', '', 'Fournier', '', 'self', 'ALeCc_gi6JKrOGuSSKyyofIyGa3KmSrAUxJ6Zh3ceFXlBlvs1WSU8gh5wTjrjfaNUVzfHIyfhDPe', '1980-11-02', 'M', company_id, user_id_60, '')
  RETURNING id into person_id_60;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '20A DUGOUT RD', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_60);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033211922', person_id_60);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45760.0, '2014-08-27', 'FullTime', 'Active', now(), now(), person_id_60, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45760.0, '08/27/2014', now(), now(), company_id, person_id_60, '', null, null);

END;


DECLARE
  user_id_61 int;
  person_id_61 int;
  company_user_id_61 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DARIUSTAVALLAI@fairviewhealthcare.com', 't', 'f', 'f', 'DARIUS', 'TAVALLAI', now(), now())
  RETURNING id into user_id_61;
  raise notice 'The user_id_61 after insert is %', user_id;
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
  VALUES('', 17617.0, '2011-12-03', 'FullTime', 'Active', now(), now(), person_id_61, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17617.0, '12/03/2011', now(), now(), company_id, person_id_61, '', null, null);

END;


DECLARE
  user_id_62 int;
  person_id_62 int;
  company_user_id_62 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ASHLEYLEVISON@fairviewhealthcare.com', 't', 'f', 'f', 'ASHLEY', 'LEVISON', now(), now())
  RETURNING id into user_id_62;
  raise notice 'The user_id_62 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_62)
  RETURNING id into company_user_id_62;
  raise notice 'The company_user_id_62 is %', company_user_id_62;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Levison', '', 'self', 'ALeCc_jmKGu26YTeUMqPLzyC0f-rRNPq17jsczFgLEEwvRKvpRHMoC35cMUPAbN_YDbXwKVmytDO', '1988-05-02', 'F', company_id, user_id_62, '')
  RETURNING id into person_id_62;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Watercrest Dr', '', 'Londonberry', 'NH', '03053', company_id, person_id_62);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035484392', person_id_62);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27170.0, '2014-07-21', 'FullTime', 'Active', now(), now(), person_id_62, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27170.0, '07/21/2014', now(), now(), company_id, person_id_62, '', null, null);

END;


DECLARE
  user_id_63 int;
  person_id_63 int;
  company_user_id_63 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SHANNONOHEARN@fairviewhealthcare.com', 't', 'f', 'f', 'SHANNON', 'O''HEARN', now(), now())
  RETURNING id into user_id_63;
  raise notice 'The user_id_63 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_63)
  RETURNING id into company_user_id_63;
  raise notice 'The company_user_id_63 is %', company_user_id_63;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shannon', '', 'O''Hearn', '', 'self', 'ALeCc_gqSS-ogfLQGM5sU_XbPljH_TD6iwd8_ZC5qDcxgeHFJcn8VP-kWUKUArX9l3ARCvqv8j_C', '1977-12-02', 'F', company_id, user_id_63, '')
  RETURNING id into person_id_63;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '16 Walnut Street', '', 'Hudson', 'NH', '03051', company_id, person_id_63);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9785129683', person_id_63);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-04-14', 'FullTime', 'Active', now(), now(), person_id_63, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '04/14/2015', now(), now(), company_id, person_id_63, '', null, null);

END;


DECLARE
  user_id_64 int;
  person_id_64 int;
  company_user_id_64 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ARELIOUSTHOMAS@fairviewhealthcare.com', 't', 'f', 'f', 'ARELIOUS', 'THOMAS', now(), now())
  RETURNING id into user_id_64;
  raise notice 'The user_id_64 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_64)
  RETURNING id into company_user_id_64;
  raise notice 'The company_user_id_64 is %', company_user_id_64;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Arelious', 'A', 'Thomas', '', 'self', 'ALeCc_jT93oj-beMKjy3nJWrmEmPLgqf303XZcDYvcidAft8KVRTtvN2DlL4rD2tUpNLXKvbYa2G', '1952-11-18', 'M', company_id, user_id_64, '')
  RETURNING id into person_id_64;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Page Rd', '', 'Litchfield', 'NH', '03052', company_id, person_id_64);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039435819', person_id_64);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28662.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_64, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28662.0, '09/01/2008', now(), now(), company_id, person_id_64, '', null, null);

END;


DECLARE
  user_id_65 int;
  person_id_65 int;
  company_user_id_65 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALETHEAHOCH@fairviewhealthcare.com', 't', 'f', 'f', 'ALETHEA', 'HOCH', now(), now())
  RETURNING id into user_id_65;
  raise notice 'The user_id_65 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_65)
  RETURNING id into company_user_id_65;
  raise notice 'The company_user_id_65 is %', company_user_id_65;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alethea', 'M', 'Hoch', '', 'self', 'ALeCc_ixauL-NNFA0mW9M_L54cd15BFhmhCzgSOQQrD-w8z8CDSjh86kCz1wkONvK0LIz2esURef', '1954-06-26', 'F', company_id, user_id_65, '')
  RETURNING id into person_id_65;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '201 Chester Road', '', 'Candia', 'NH', '03034', company_id, person_id_65);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033203111', person_id_65);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 69222.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_65, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(69222.0, '09/01/2008', now(), now(), company_id, person_id_65, '', null, null);

END;


DECLARE
  user_id_66 int;
  person_id_66 int;
  company_user_id_66 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ASHLEYCOLEMAN@fairviewhealthcare.com', 't', 'f', 'f', 'ASHLEY', 'COLEMAN', now(), now())
  RETURNING id into user_id_66;
  raise notice 'The user_id_66 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_66)
  RETURNING id into company_user_id_66;
  raise notice 'The company_user_id_66 is %', company_user_id_66;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ashley', '', 'Coleman', '', 'self', 'ALeCc_iSlQUghdeOzIESfPolXvth1QOoQHRXyFEqjPaYasP7QRc3WKL7Oq3uX3uLoT2HCC3a-hPd', '1986-09-22', 'F', company_id, user_id_66, '')
  RETURNING id into person_id_66;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Clifton Avenue', '', 'Salem', 'NH', '03079', company_id, person_id_66);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034016987', person_id_66);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47840.0, '2015-02-27', 'FullTime', 'Active', now(), now(), person_id_66, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47840.0, '02/27/2015', now(), now(), company_id, person_id_66, '', null, null);

END;


DECLARE
  user_id_67 int;
  person_id_67 int;
  company_user_id_67 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MELANIEPERRY@fairviewhealthcare.com', 't', 'f', 'f', 'MELANIE', 'PERRY', now(), now())
  RETURNING id into user_id_67;
  raise notice 'The user_id_67 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_67)
  RETURNING id into company_user_id_67;
  raise notice 'The company_user_id_67 is %', company_user_id_67;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Melanie', '', 'Perry', '', 'self', '', '1976-11-09', 'F', company_id, user_id_67, '')
  RETURNING id into person_id_67;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 68000.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_67, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(68000.0, '07/14/2014', now(), now(), company_id, person_id_67, '', null, null);

END;


DECLARE
  user_id_68 int;
  person_id_68 int;
  company_user_id_68 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MELISSARUST@fairviewhealthcare.com', 't', 'f', 'f', 'MELISSA', 'RUST', now(), now())
  RETURNING id into user_id_68;
  raise notice 'The user_id_68 after insert is %', user_id;
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
  VALUES('', 41800.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_68, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(41800.0, '07/14/2014', now(), now(), company_id, person_id_68, '', null, null);

END;


DECLARE
  user_id_69 int;
  person_id_69 int;
  company_user_id_69 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DONALDRANKINS@fairviewhealthcare.com', 't', 'f', 'f', 'DONALD', 'RANKINS', now(), now())
  RETURNING id into user_id_69;
  raise notice 'The user_id_69 after insert is %', user_id;
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
  VALUES('', 56992.0, '2011-04-04', 'FullTime', 'Active', now(), now(), person_id_69, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(56992.0, '04/04/2011', now(), now(), company_id, person_id_69, '', null, null);

END;


DECLARE
  user_id_70 int;
  person_id_70 int;
  company_user_id_70 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'TODDGROGG@fairviewhealthcare.com', 't', 'f', 'f', 'TODD', 'GROGG', now(), now())
  RETURNING id into user_id_70;
  raise notice 'The user_id_70 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_70)
  RETURNING id into company_user_id_70;
  raise notice 'The company_user_id_70 is %', company_user_id_70;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Todd', 'J', 'Grogg', '', 'self', 'ALeCc_gNvZ_ddn6Fyycyi_6vr-Akk9Z3bAQ8hzZJugQy-9K3N6K0M1ej3MP4KMHlxC1KNEoCvaTt', '1966-05-06', 'M', company_id, user_id_70, '')
  RETURNING id into person_id_70;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '31 Congress St #5', '', 'Nashua', 'NH', '03062', company_id, person_id_70);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039137939', person_id_70);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24668.8, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_70, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24668.8, '09/01/2008', now(), now(), company_id, person_id_70, '', null, null);

END;


DECLARE
  user_id_71 int;
  person_id_71 int;
  company_user_id_71 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JENNYXAYACHACK@fairviewhealthcare.com', 't', 'f', 'f', 'JENNY', 'XAYACHACK', now(), now())
  RETURNING id into user_id_71;
  raise notice 'The user_id_71 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_71)
  RETURNING id into company_user_id_71;
  raise notice 'The company_user_id_71 is %', company_user_id_71;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jenny', '', 'Xayachack', '', 'self', '', '1990-05-25', 'F', company_id, user_id_71, '')
  RETURNING id into person_id_71;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 48214.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_71, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_71, '', 23.1800, 173.3333);

END;


DECLARE
  user_id_72 int;
  person_id_72 int;
  company_user_id_72 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CINDYBOUCHER@fairviewhealthcare.com', 't', 'f', 'f', 'CINDY', 'BOUCHER', now(), now())
  RETURNING id into user_id_72;
  raise notice 'The user_id_72 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_72)
  RETURNING id into company_user_id_72;
  raise notice 'The company_user_id_72 is %', company_user_id_72;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cindy', 'A', 'Boucher', '', 'self', 'ALeCc_hl_V-GVVjIKOj5ZnH-xu4yWv4a0VuAaJfVF8yNGRKW_yyLD0gpUFREnuKH-j8JtZfR78xl', '1957-02-15', 'F', company_id, user_id_72, '')
  RETURNING id into person_id_72;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 PAGE RD APT 19', '', 'LITCHFIELD', 'NH', '03052.0', company_id, person_id_72);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038648134', person_id_72);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25313.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_72, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25313.6, '09/01/2008', now(), now(), company_id, person_id_72, '', null, null);

END;


DECLARE
  user_id_73 int;
  person_id_73 int;
  company_user_id_73 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARYSCAFIDI@fairviewhealthcare.com', 't', 'f', 'f', 'MARY', 'SCAFIDI', now(), now())
  RETURNING id into user_id_73;
  raise notice 'The user_id_73 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_73)
  RETURNING id into company_user_id_73;
  raise notice 'The company_user_id_73 is %', company_user_id_73;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Mary', '', 'Scafidi', '', 'self', 'ALeCc_h8CafVCxTDoInWaRBYuBub6uxeSIhQ0jZyObF6M35MuKajUZLHvFjXufePt0KQ8VHVJr1u', '1959-01-18', 'F', company_id, user_id_73, '')
  RETURNING id into person_id_73;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '53 River Road', '', 'Hudson', 'NH', '03051', company_id, person_id_73);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034949588', person_id_73);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2014-02-18', 'FullTime', 'Active', now(), now(), person_id_73, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '02/18/2014', now(), now(), company_id, person_id_73, '', null, null);

END;


DECLARE
  user_id_74 int;
  person_id_74 int;
  company_user_id_74 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ALFREDOSANCHEZ@fairviewhealthcare.com', 't', 'f', 'f', 'ALFREDO', 'SANCHEZ', now(), now())
  RETURNING id into user_id_74;
  raise notice 'The user_id_74 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_74)
  RETURNING id into company_user_id_74;
  raise notice 'The company_user_id_74 is %', company_user_id_74;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Alfredo', '', 'Sanchez', '', 'self', 'ALeCc_hTPMwQu06wDHb0T7DdCHbcNyE_L_TMgpkp-g1uyJnQlMWkJDtjhIjzRZjtM3_QgnjoDp8B', '1980-04-05', 'M', company_id, user_id_74, '')
  RETURNING id into person_id_74;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '82 Ledge St Apt 4', '', 'Nashua', 'NH', '03060', company_id, person_id_74);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038205144', person_id_74);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22588.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_74, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22588.0, '09/01/2008', now(), now(), company_id, person_id_74, '', null, null);

END;


DECLARE
  user_id_75 int;
  person_id_75 int;
  company_user_id_75 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'BRUNILDAMEJIA@fairviewhealthcare.com', 't', 'f', 'f', 'BRUNILDA', 'MEJIA', now(), now())
  RETURNING id into user_id_75;
  raise notice 'The user_id_75 after insert is %', user_id;
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
  VALUES('', 66019.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_75, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(66019.2, '09/01/2008', now(), now(), company_id, person_id_75, '', null, null);

END;


DECLARE
  user_id_76 int;
  person_id_76 int;
  company_user_id_76 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JAMESHAYES@fairviewhealthcare.com', 't', 'f', 'f', 'JAMES', 'HAYES', now(), now())
  RETURNING id into user_id_76;
  raise notice 'The user_id_76 after insert is %', user_id;
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
  VALUES('', 20800.0, '2011-07-05', 'FullTime', 'Active', now(), now(), person_id_76, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '07/05/2011', now(), now(), company_id, person_id_76, '', null, null);

END;


DECLARE
  user_id_77 int;
  person_id_77 int;
  company_user_id_77 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SHERIMELLO@fairviewhealthcare.com', 't', 'f', 'f', 'SHERI', 'MELLO', now(), now())
  RETURNING id into user_id_77;
  raise notice 'The user_id_77 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_77)
  RETURNING id into company_user_id_77;
  raise notice 'The company_user_id_77 is %', company_user_id_77;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheri', '', 'Mello', '', 'self', 'ALeCc_jDuwj4FW9QGJKadVC5eW9qko8cZxXx0yXzLMiWkfsGVARKfNiVXwbgocaqzd_TkB1tMjvN', '1979-09-04', 'F', company_id, user_id_77, '')
  RETURNING id into person_id_77;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '43A ABBOTT ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_77);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '5089338479', person_id_77);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21840.0, '2014-11-08', 'FullTime', 'Active', now(), now(), person_id_77, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21840.0, '11/08/2014', now(), now(), company_id, person_id_77, '', null, null);

END;


DECLARE
  user_id_78 int;
  person_id_78 int;
  company_user_id_78 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CHARLOTTELAVOIE@fairviewhealthcare.com', 't', 'f', 'f', 'CHARLOTTE', 'LAVOIE', now(), now())
  RETURNING id into user_id_78;
  raise notice 'The user_id_78 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_78)
  RETURNING id into company_user_id_78;
  raise notice 'The company_user_id_78 is %', company_user_id_78;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Charlotte', '', 'Lavoie', '', 'self', 'ALeCc_g0QkBQzKjkzbxOBZ4l4x2DvYC1o6o1gD-I3-lAIILwJDVjXpCsIvcgTuvS5joR5i28x3SH', '1955-09-02', 'F', company_id, user_id_78, '')
  RETURNING id into person_id_78;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '11 Willow Ln', '', 'Amherst', 'NH', '03031', company_id, person_id_78);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034000668', person_id_78);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_78, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45000.0, '09/01/2008', now(), now(), company_id, person_id_78, '', null, null);

END;


DECLARE
  user_id_79 int;
  person_id_79 int;
  company_user_id_79 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CLARETTAMALIN@fairviewhealthcare.com', 't', 'f', 'f', 'CLARETTA', 'MALIN', now(), now())
  RETURNING id into user_id_79;
  raise notice 'The user_id_79 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_79)
  RETURNING id into company_user_id_79;
  raise notice 'The company_user_id_79 is %', company_user_id_79;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Claretta', '', 'Malin', '', 'self', 'ALeCc_jW9Cevm7byeueXU_dSgR5-2myuqjf7CKMSZwX-GIqJaWg1IzHaRI1Zxggxm7NXIRo1yI0s', '1953-07-21', 'F', company_id, user_id_79, '')
  RETURNING id into person_id_79;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '3 Barisano Way', '', 'Nashua', 'NH', '03063', company_id, person_id_79);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038799077', person_id_79);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 38480.0, '2011-02-14', 'FullTime', 'Active', now(), now(), person_id_79, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(38480.0, '02/14/2011', now(), now(), company_id, person_id_79, '', null, null);

END;


DECLARE
  user_id_80 int;
  person_id_80 int;
  company_user_id_80 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CONRADDUPONT@fairviewhealthcare.com', 't', 'f', 'f', 'CONRAD', 'DUPONT', now(), now())
  RETURNING id into user_id_80;
  raise notice 'The user_id_80 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_80)
  RETURNING id into company_user_id_80;
  raise notice 'The company_user_id_80 is %', company_user_id_80;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Conrad', '', 'Dupont', '', 'self', 'ALeCc_iadu_h0ZRZOwU6Qdy8qfRhbkg_doNfs-tavZwtFDUtiFoaeCL9JyyGKJh2lsmCW5ZgKPGc', '1962-12-10', 'M', company_id, user_id_80, '')
  RETURNING id into person_id_80;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '1 BEACON ST', '', 'NASHUA', 'NH', '03064.0', company_id, person_id_80);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033206059', person_id_80);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_80, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27000.0, '06/09/2014', now(), now(), company_id, person_id_80, '', null, null);

END;


DECLARE
  user_id_81 int;
  person_id_81 int;
  company_user_id_81 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'LASHANDRALONG@fairviewhealthcare.com', 't', 'f', 'f', 'LASHANDRA', 'LONG', now(), now())
  RETURNING id into user_id_81;
  raise notice 'The user_id_81 after insert is %', user_id;
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
  VALUES('', 21242.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_81, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21242.0, '08/04/2014', now(), now(), company_id, person_id_81, '', null, null);

END;


DECLARE
  user_id_82 int;
  person_id_82 int;
  company_user_id_82 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JILLFAVEREAU@fairviewhealthcare.com', 't', 'f', 'f', 'JILL', 'FAVEREAU', now(), now())
  RETURNING id into user_id_82;
  raise notice 'The user_id_82 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_82)
  RETURNING id into company_user_id_82;
  raise notice 'The company_user_id_82 is %', company_user_id_82;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jill', '', 'Favereau', '', 'self', 'ALeCc_gm9Pp7PxjPkQWkonQ0_KYnOQHogXVZQvgY5gZU9Ti3ssARJwwuhayvE1ecnusiE8TAyt1Q', '1972-07-03', 'F', company_id, user_id_82, '')
  RETURNING id into person_id_82;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Mockingbird Hill Road', '', 'Windham', 'NH', '03087', company_id, person_id_82);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039654870', person_id_82);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2010-11-22', 'FullTime', 'Active', now(), now(), person_id_82, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(58240.0, '11/22/2010', now(), now(), company_id, person_id_82, '', null, null);

END;


DECLARE
  user_id_83 int;
  person_id_83 int;
  company_user_id_83 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARIANNECLAUSS@fairviewhealthcare.com', 't', 'f', 'f', 'MARIANNE', 'CLAUSS', now(), now())
  RETURNING id into user_id_83;
  raise notice 'The user_id_83 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_83)
  RETURNING id into company_user_id_83;
  raise notice 'The company_user_id_83 is %', company_user_id_83;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Marianne', '', 'Clauss', '', 'self', 'ALeCc_iBUuQBhCODzrIZ0HkKOC9HyRR6aqwVwZryUBtGq7f5-6Ht5ISf7v7XIbzDRrTE88TQWqCA', '1966-05-04', 'F', company_id, user_id_83, '')
  RETURNING id into person_id_83;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '61 Croteau Court', '2F', 'Manchester', 'NH', '03104', company_id, person_id_83);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034868424', person_id_83);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 43680.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_83, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(43680.0, '06/12/2014', now(), now(), company_id, person_id_83, '', null, null);

END;


DECLARE
  user_id_84 int;
  person_id_84 int;
  company_user_id_84 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DENISEPARADISE@fairviewhealthcare.com', 't', 'f', 'f', 'DENISE', 'PARADISE', now(), now())
  RETURNING id into user_id_84;
  raise notice 'The user_id_84 after insert is %', user_id;
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
  VALUES('', 92705.6, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_84, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(92705.6, '09/01/2008', now(), now(), company_id, person_id_84, '', null, null);

END;


DECLARE
  user_id_85 int;
  person_id_85 int;
  company_user_id_85 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'RICHARDRAFFERTY@fairviewhealthcare.com', 't', 'f', 'f', 'RICHARD', 'RAFFERTY', now(), now())
  RETURNING id into user_id_85;
  raise notice 'The user_id_85 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_85)
  RETURNING id into company_user_id_85;
  raise notice 'The company_user_id_85 is %', company_user_id_85;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', 'J', 'Rafferty', '', 'self', 'ALeCc_i33EJKZyrf1XBPf6YFMrzg4p6_Q5BzEa7V3kJo2Gqn7YKMGu8GQPMgRdvbcyFi79KGt_kn', '1952-10-29', 'M', company_id, user_id_85, '')
  RETURNING id into person_id_85;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '10-1 Cabernet Drive', '', 'Concord', 'NH', '03303', company_id, person_id_85);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037317719', person_id_85);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_85, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '09/01/2008', now(), now(), company_id, person_id_85, '', null, null);

END;


DECLARE
  user_id_86 int;
  person_id_86 int;
  company_user_id_86 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KALILAMSON@fairviewhealthcare.com', 't', 'f', 'f', 'KALI', 'LAMSON', now(), now())
  RETURNING id into user_id_86;
  raise notice 'The user_id_86 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_86)
  RETURNING id into company_user_id_86;
  raise notice 'The company_user_id_86 is %', company_user_id_86;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kali', '', 'Lamson', '', 'self', '', '1987-08-01', 'F', company_id, user_id_86, '')
  RETURNING id into person_id_86;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '310 Brook Village Rd', '', 'Nashua', 'NH', '03062', company_id, person_id_86);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 46000.0, '2014-06-09', 'FullTime', 'Active', now(), now(), person_id_86, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(46000.0, '06/09/2014', now(), now(), company_id, person_id_86, '', null, null);

END;


DECLARE
  user_id_87 int;
  person_id_87 int;
  company_user_id_87 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'STEPHANIEPEREZ@fairviewhealthcare.com', 't', 'f', 'f', 'STEPHANIE', 'PEREZ', now(), now())
  RETURNING id into user_id_87;
  raise notice 'The user_id_87 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_87)
  RETURNING id into company_user_id_87;
  raise notice 'The company_user_id_87 is %', company_user_id_87;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Stephanie', '', 'Perez', '', 'self', '', '1984-03-25', 'F', company_id, user_id_87, '')
  RETURNING id into person_id_87;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '218 Pheasant Run Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_87);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 18439.2, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_87, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '09/01/2008', now(), now(), company_id, person_id_87, '', 11.8200, 130.0000);

END;


DECLARE
  user_id_88 int;
  person_id_88 int;
  company_user_id_88 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ELEANORKNOWLTON@fairviewhealthcare.com', 't', 'f', 'f', 'ELEANOR', 'KNOWLTON', now(), now())
  RETURNING id into user_id_88;
  raise notice 'The user_id_88 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_88)
  RETURNING id into company_user_id_88;
  raise notice 'The company_user_id_88 is %', company_user_id_88;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Eleanor', '', 'Knowlton', '', 'self', 'ALeCc_jXxivT7xd-t594151-ZKRDOoZNm5EMLACQO-tRIWSxoYddF_N-aWQzObFk3xrnOPfsjfJ3', '1956-02-09', 'F', company_id, user_id_88, '')
  RETURNING id into person_id_88;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Emerald Drive', '', 'Merrimack', 'NH', '03054', company_id, person_id_88);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '8576361697', person_id_88);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19012.0, '2010-06-30', 'FullTime', 'Active', now(), now(), person_id_88, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19012.0, '06/30/2010', now(), now(), company_id, person_id_88, '', null, null);

END;


DECLARE
  user_id_89 int;
  person_id_89 int;
  company_user_id_89 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SHEILALAMB@fairviewhealthcare.com', 't', 'f', 'f', 'SHEILA', 'LAMB', now(), now())
  RETURNING id into user_id_89;
  raise notice 'The user_id_89 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_89)
  RETURNING id into company_user_id_89;
  raise notice 'The company_user_id_89 is %', company_user_id_89;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sheila', 'M', 'Lamb', '', 'self', 'ALeCc_inKAVmeQpynjrgdZgadlUfYSTKZEyPbpdHHzy5s4DXHgIHl21z_q8dOZG4uBY7u4pv0iGA', '1959-09-07', 'F', company_id, user_id_89, '')
  RETURNING id into person_id_89;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '49 Lake Shore Dr', '', 'Westford', 'MA', '01886', company_id, person_id_89);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '9783928752', person_id_89);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 58240.0, '2015-08-06', 'FullTime', 'Active', now(), now(), person_id_89, company_id, '1', '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/06/2015', now(), now(), company_id, person_id_89, '', 28.0000, 173.3333);

END;


DECLARE
  user_id_90 int;
  person_id_90 int;
  company_user_id_90 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CATHYRILEY@fairviewhealthcare.com', 't', 'f', 'f', 'CATHY', 'RILEY', now(), now())
  RETURNING id into user_id_90;
  raise notice 'The user_id_90 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_90)
  RETURNING id into company_user_id_90;
  raise notice 'The company_user_id_90 is %', company_user_id_90;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cathy', '', 'Riley', '', 'self', 'ALeCc_jy3u81-SNAouz5Xyo_34_SBd06wIkTt2J6vgBpfXMRH_6vFOfSuKDT6ChwoSMC3ATYFfIA', '1959-02-22', 'F', company_id, user_id_90, '')
  RETURNING id into person_id_90;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '9 Chatham Street', '', 'Hudson', 'NH', '03051', company_id, person_id_90);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032332736', person_id_90);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2014-09-14', 'FullTime', 'Active', now(), now(), person_id_90, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '09/14/2014', now(), now(), company_id, person_id_90, '', null, null);

END;


DECLARE
  user_id_91 int;
  person_id_91 int;
  company_user_id_91 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROBERTACARRIGG@fairviewhealthcare.com', 't', 'f', 'f', 'ROBERTA', 'CARRIGG', now(), now())
  RETURNING id into user_id_91;
  raise notice 'The user_id_91 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_91)
  RETURNING id into company_user_id_91;
  raise notice 'The company_user_id_91 is %', company_user_id_91;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Roberta', 'A', 'Carrigg', '', 'self', 'ALeCc_guJwr-kjxlMO4ChWbjV1ImJphtUp4HOqREo4zTPsnASNmumWE04yyIQDjr4KrBMEckOfhq', '1958-03-07', 'F', company_id, user_id_91, '')
  RETURNING id into person_id_91;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Sunrise Trail', '', 'Nashua', 'NH', '03060', company_id, person_id_91);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '0000000000', person_id_91);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 27040.0, '2013-06-10', 'FullTime', 'Active', now(), now(), person_id_91, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(27040.0, '06/10/2013', now(), now(), company_id, person_id_91, '', null, null);

END;


DECLARE
  user_id_92 int;
  person_id_92 int;
  company_user_id_92 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ANNPLOURDE@fairviewhealthcare.com', 't', 'f', 'f', 'ANN', 'PLOURDE', now(), now())
  RETURNING id into user_id_92;
  raise notice 'The user_id_92 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_92)
  RETURNING id into company_user_id_92;
  raise notice 'The company_user_id_92 is %', company_user_id_92;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Ann', 'M', 'Plourde', '', 'self', '', '1964-07-27', 'F', company_id, user_id_92, '')
  RETURNING id into person_id_92;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '18 School Street', '', 'Salem', 'NH', '03079', company_id, person_id_92);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 76169.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_92, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(76169.0, '09/01/2008', now(), now(), company_id, person_id_92, '', null, null);

END;


DECLARE
  user_id_93 int;
  person_id_93 int;
  company_user_id_93 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KATHRYNMASTERSON@fairviewhealthcare.com', 't', 'f', 'f', 'KATHRYN', 'MASTERSON', now(), now())
  RETURNING id into user_id_93;
  raise notice 'The user_id_93 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_93)
  RETURNING id into company_user_id_93;
  raise notice 'The company_user_id_93 is %', company_user_id_93;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kathryn', '', 'Masterson', '', 'self', 'ALeCc_iKL0v66xFf3EOCBc7Fq9TO32JkAPOsBuEPMlyCwB3e4PoTI5ToB5qki0M2JBcC8hDJsclA', '1950-11-05', 'F', company_id, user_id_93, '')
  RETURNING id into person_id_93;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '70 Joppa Rd', '', 'Merrimack', 'NH', '03054', company_id, person_id_93);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6039210228', person_id_93);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_93, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40000.0, '09/01/2008', now(), now(), company_id, person_id_93, '', null, null);

END;


DECLARE
  user_id_94 int;
  person_id_94 int;
  company_user_id_94 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SARAHST_JOHN@fairviewhealthcare.com', 't', 'f', 'f', 'SARAH', 'ST JOHN', now(), now())
  RETURNING id into user_id_94;
  raise notice 'The user_id_94 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_94)
  RETURNING id into company_user_id_94;
  raise notice 'The company_user_id_94 is %', company_user_id_94;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Sarah', '', 'St John', '', 'self', '', '1986-04-19', 'F', company_id, user_id_94, '')
  RETURNING id into person_id_94;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '88 3/4 Palm Street', '', 'Nasua', 'NH', '03060', company_id, person_id_94);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 19851.0, '2013-07-26', 'FullTime', 'Active', now(), now(), person_id_94, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(19851.0, '07/26/2013', now(), now(), company_id, person_id_94, '', null, null);

END;


DECLARE
  user_id_95 int;
  person_id_95 int;
  company_user_id_95 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DIANAHALL@fairviewhealthcare.com', 't', 'f', 'f', 'DIANA', 'HALL', now(), now())
  RETURNING id into user_id_95;
  raise notice 'The user_id_95 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_95)
  RETURNING id into company_user_id_95;
  raise notice 'The company_user_id_95 is %', company_user_id_95;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Diana', '', 'Hall', '', 'self', 'ALeCc_hMAEPWEGgqLoiB4Sco-1U0laejbh49oyUrqLdt04cdnfRPoJ3UJBsEM9u7B1YwRARoFw7w', '1970-12-02', 'F', company_id, user_id_95, '')
  RETURNING id into person_id_95;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 JAMES WAY', '', 'HUDSON', 'NH', '03051.0', company_id, person_id_95);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037933476', person_id_95);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20716.0, '2010-04-27', 'FullTime', 'Active', now(), now(), person_id_95, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20716.0, '04/27/2010', now(), now(), company_id, person_id_95, '', null, null);

END;


DECLARE
  user_id_96 int;
  person_id_96 int;
  company_user_id_96 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROSEFOURNIER@fairviewhealthcare.com', 't', 'f', 'f', 'ROSE', 'FOURNIER', now(), now())
  RETURNING id into user_id_96;
  raise notice 'The user_id_96 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_96)
  RETURNING id into company_user_id_96;
  raise notice 'The company_user_id_96 is %', company_user_id_96;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rose', '', 'Fournier', '', 'self', '', '1962-04-05', 'F', company_id, user_id_96, '')
  RETURNING id into person_id_96;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 32344.0, '2013-09-09', 'FullTime', 'Active', now(), now(), person_id_96, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(32344.0, '09/09/2013', now(), now(), company_id, person_id_96, '', null, null);

END;


DECLARE
  user_id_97 int;
  person_id_97 int;
  company_user_id_97 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'PAULINEPOISSON-LEVESQUE@fairviewhealthcare.com', 't', 'f', 'f', 'PAULINE', 'POISSON-LEVESQUE', now(), now())
  RETURNING id into user_id_97;
  raise notice 'The user_id_97 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_97)
  RETURNING id into company_user_id_97;
  raise notice 'The company_user_id_97 is %', company_user_id_97;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Pauline', 'A', 'Poisson-Levesque', '', 'self', '', '1949-05-19', 'F', company_id, user_id_97, '')
  RETURNING id into person_id_97;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '6 Autumn Leaf Dr', 'Apt 2', 'Nashua', 'NH', '03062', company_id, person_id_97);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37167.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_97, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37167.0, '09/01/2008', now(), now(), company_id, person_id_97, '', null, null);

END;


DECLARE
  user_id_98 int;
  person_id_98 int;
  company_user_id_98 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JAMESBUSH@fairviewhealthcare.com', 't', 'f', 'f', 'JAMES', 'BUSH', now(), now())
  RETURNING id into user_id_98;
  raise notice 'The user_id_98 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_98)
  RETURNING id into company_user_id_98;
  raise notice 'The company_user_id_98 is %', company_user_id_98;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'James', '', 'Bush', '', 'self', 'ALeCc_h7r3qxWn_fWpQ8DYwGD6gkh1AlAcPlc4GXxdC79ur7muJfFIF9NJwVpN12cKfSMG0dMCFx', '1989-01-09', 'M', company_id, user_id_98, '')
  RETURNING id into person_id_98;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '15 Hawkstead Hollow', '', 'Nashua', 'NH', '03063', company_id, person_id_98);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034403317', person_id_98);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21450.0, '2014-06-12', 'FullTime', 'Active', now(), now(), person_id_98, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21450.0, '06/12/2014', now(), now(), company_id, person_id_98, '', null, null);

END;


DECLARE
  user_id_99 int;
  person_id_99 int;
  company_user_id_99 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JANETMAXFIELD@fairviewhealthcare.com', 't', 'f', 'f', 'JANET', 'MAXFIELD', now(), now())
  RETURNING id into user_id_99;
  raise notice 'The user_id_99 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_99)
  RETURNING id into company_user_id_99;
  raise notice 'The company_user_id_99 is %', company_user_id_99;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Janet', '', 'Maxfield', '', 'self', 'ALeCc_jNGQ3ZXMZlo6cDj1Tqgu0oc-fxrQmB-QTh8FjiRhCi6GCXBKxMwcW4j3R7NC-50TUHOt2_', '1964-08-26', 'F', company_id, user_id_99, '')
  RETURNING id into person_id_99;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '30 Library St Apt 2', '', 'Hudson', 'NH', '03051', company_id, person_id_99);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033055088', person_id_99);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31616.0, '2014-07-14', 'FullTime', 'Active', now(), now(), person_id_99, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31616.0, '07/14/2014', now(), now(), company_id, person_id_99, '', null, null);

END;


DECLARE
  user_id_100 int;
  person_id_100 int;
  company_user_id_100 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CHRISTOPHERGRENIER@fairviewhealthcare.com', 't', 'f', 'f', 'CHRISTOPHER', 'GRENIER', now(), now())
  RETURNING id into user_id_100;
  raise notice 'The user_id_100 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_100)
  RETURNING id into company_user_id_100;
  raise notice 'The company_user_id_100 is %', company_user_id_100;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Christopher', '', 'Grenier', '', 'self', '', '1989-08-20', 'M', company_id, user_id_100, '')
  RETURNING id into person_id_100;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23533.0, '2015-07-15', 'FullTime', 'Active', now(), now(), person_id_100, company_id, '', '2015-10-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23533.0, '07/15/2015', now(), now(), company_id, person_id_100, '', null, null);

END;


DECLARE
  user_id_101 int;
  person_id_101 int;
  company_user_id_101 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'PATRICIALAVOIE@fairviewhealthcare.com', 't', 'f', 'f', 'PATRICIA', 'LAVOIE', now(), now())
  RETURNING id into user_id_101;
  raise notice 'The user_id_101 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_101)
  RETURNING id into company_user_id_101;
  raise notice 'The company_user_id_101 is %', company_user_id_101;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Patricia', 'A', 'Lavoie', '', 'self', 'ALeCc_ixIKmpHe5-K4O1Z9p0ZyDm53Wn5Lc158Uls0dA0rvHK8unoBd4YdcCo-csoH1h7_NabQaW', '1965-06-09', 'F', company_id, user_id_101, '')
  RETURNING id into person_id_101;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '72 Cleveland Hill Road', '', 'Brookline', 'NH', '03033', company_id, person_id_101);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032047878', person_id_101);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21000.0, '2013-05-29', 'FullTime', 'Active', now(), now(), person_id_101, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21000.0, '05/29/2013', now(), now(), company_id, person_id_101, '', null, null);

END;


DECLARE
  user_id_102 int;
  person_id_102 int;
  company_user_id_102 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ANNAGELINAS@fairviewhealthcare.com', 't', 'f', 'f', 'ANNA', 'GELINAS', now(), now())
  RETURNING id into user_id_102;
  raise notice 'The user_id_102 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_102)
  RETURNING id into company_user_id_102;
  raise notice 'The company_user_id_102 is %', company_user_id_102;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Anna', 'M', 'Gelinas', '', 'self', 'ALeCc_hzDVZS6_0bTp04Vx8GaZ7hQ_BzW66ghc1gtXYVYnXT3kcp0Xmmwe0xmalinvMraZ70lnLC', '1972-10-03', 'F', company_id, user_id_102, '')
  RETURNING id into person_id_102;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '27 Cross St', 'Apt 1', 'Nashua', 'NH', '03064', company_id, person_id_102);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038806149', person_id_102);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37689.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_102, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37689.0, '09/01/2008', now(), now(), company_id, person_id_102, '', null, null);

END;


DECLARE
  user_id_103 int;
  person_id_103 int;
  company_user_id_103 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'HOLLYMATTHEW@fairviewhealthcare.com', 't', 'f', 'f', 'HOLLY', 'MATTHEW', now(), now())
  RETURNING id into user_id_103;
  raise notice 'The user_id_103 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_103)
  RETURNING id into company_user_id_103;
  raise notice 'The company_user_id_103 is %', company_user_id_103;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Holly', '', 'Matthew', '', 'self', 'ALeCc_jeMCRM6btq15lWSQJ_298UMoFpnq02BpQLUrNvvuceRjcbaER9JpdvJK4xZnM0N9zOVWyO', '1971-05-20', 'F', company_id, user_id_103, '')
  RETURNING id into person_id_103;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '25 CHEYENNE DR', '', 'NASHUA', 'NH', '03063', company_id, person_id_103);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038827389', person_id_103);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 17550.0, '2012-08-01', 'FullTime', 'Active', now(), now(), person_id_103, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(17550.0, '08/01/2012', now(), now(), company_id, person_id_103, '', null, null);

END;


DECLARE
  user_id_104 int;
  person_id_104 int;
  company_user_id_104 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MICHELLEDODGE@fairviewhealthcare.com', 't', 'f', 'f', 'MICHELLE', 'DODGE', now(), now())
  RETURNING id into user_id_104;
  raise notice 'The user_id_104 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_104)
  RETURNING id into company_user_id_104;
  raise notice 'The company_user_id_104 is %', company_user_id_104;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Michelle', 'L', 'Dodge', '', 'self', 'ALeCc_gcNV5vFvueqVg8drkYmmAikqYrq9iEXQmzoHXDUCim2A_vIZ-bwAIGFCf1L79sUFwSGLBc', '1968-09-21', 'F', company_id, user_id_104, '')
  RETURNING id into person_id_104;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '14 Arcadian Lane', '', 'Litchfield', 'NH', '03052', company_id, person_id_104);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034247660', person_id_104);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 64542.4, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_104, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(64542.4, '09/01/2008', now(), now(), company_id, person_id_104, '', null, null);

END;


DECLARE
  user_id_105 int;
  person_id_105 int;
  company_user_id_105 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ELIZABETHFAHEY@fairviewhealthcare.com', 't', 'f', 'f', 'ELIZABETH', 'FAHEY', now(), now())
  RETURNING id into user_id_105;
  raise notice 'The user_id_105 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_105)
  RETURNING id into company_user_id_105;
  raise notice 'The company_user_id_105 is %', company_user_id_105;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', 'A', 'Fahey', '', 'self', 'ALeCc_hIV2fZOSe38qKj4ND7gBAy8kEjGRzaz2KnkNlu3pfWyV4EpW9UCow2_7nvqX5Bg9gE4_ju', '1954-10-28', 'F', company_id, user_id_105, '')
  RETURNING id into person_id_105;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '17 Radcliffe Dr', '', 'Hudson', 'NH', '03051', company_id, person_id_105);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035981307', person_id_105);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24024.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_105, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24024.0, '09/01/2008', now(), now(), company_id, person_id_105, '', null, null);

END;


DECLARE
  user_id_106 int;
  person_id_106 int;
  company_user_id_106 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'THERESACRONIN@fairviewhealthcare.com', 't', 'f', 'f', 'THERESA', 'CRONIN', now(), now())
  RETURNING id into user_id_106;
  raise notice 'The user_id_106 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_106)
  RETURNING id into company_user_id_106;
  raise notice 'The company_user_id_106 is %', company_user_id_106;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Theresa', '', 'Cronin', '', 'self', 'ALeCc_i7_RFngphwpd3Nz7QnMR2p-r1yu-K-ZTAlatlaIzvq4ShLSc9JuCE2H6UE_rRSv6czcK3n', '1949-12-05', 'F', company_id, user_id_106, '')
  RETURNING id into person_id_106;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Heidi Lane', '', 'Nashua', 'NH', '03062', company_id, person_id_106);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038864214', person_id_106);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 25000.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_106, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(25000.0, '09/01/2008', now(), now(), company_id, person_id_106, '', null, null);

END;


DECLARE
  user_id_107 int;
  person_id_107 int;
  company_user_id_107 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'RICHARDFORD@fairviewhealthcare.com', 't', 'f', 'f', 'RICHARD', 'FORD', now(), now())
  RETURNING id into user_id_107;
  raise notice 'The user_id_107 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_107)
  RETURNING id into company_user_id_107;
  raise notice 'The company_user_id_107 is %', company_user_id_107;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Richard', '', 'Ford', '', 'self', '', '1990-02-11', 'M', company_id, user_id_107, '')
  RETURNING id into person_id_107;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2006-06-05', 'FullTime', 'Active', now(), now(), person_id_107, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '06/05/2006', now(), now(), company_id, person_id_107, '', null, null);

END;


DECLARE
  user_id_108 int;
  person_id_108 int;
  company_user_id_108 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'BRENDAMARQUIS@fairviewhealthcare.com', 't', 'f', 'f', 'BRENDA', 'MARQUIS', now(), now())
  RETURNING id into user_id_108;
  raise notice 'The user_id_108 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_108)
  RETURNING id into company_user_id_108;
  raise notice 'The company_user_id_108 is %', company_user_id_108;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Brenda', 'C', 'Marquis', '', 'self', 'ALeCc_jky9ZK08ZVNzJchBe6sJ-ATY07hZQimmuW2H7nx20PQpjcn9SDnQqF2knXDbOeA0YK80yj', '1953-12-16', 'F', company_id, user_id_108, '')
  RETURNING id into person_id_108;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Metropolitan Ave', '', 'Nashua', 'NH', '03064', company_id, person_id_108);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6035952792', person_id_108);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28294.5, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_108, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28294.5, '09/01/2008', now(), now(), company_id, person_id_108, '', null, null);

END;


DECLARE
  user_id_109 int;
  person_id_109 int;
  company_user_id_109 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'MARIAMIRANDA@fairviewhealthcare.com', 't', 'f', 'f', 'MARIA', 'MIRANDA', now(), now())
  RETURNING id into user_id_109;
  raise notice 'The user_id_109 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_109)
  RETURNING id into company_user_id_109;
  raise notice 'The company_user_id_109 is %', company_user_id_109;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Maria', '', 'Miranda', '', 'self', 'ALeCc_hiW2VnfsZi2eETCSjiZVS8DywrPbKdwpKRE_iMdEQBOhitixjbkbhd0onm3AuAAiv2nIBr', '1991-10-15', 'F', company_id, user_id_109, '')
  RETURNING id into person_id_109;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '208 Kinsley Street', '', 'Nashua', 'NH', '03060', company_id, person_id_109);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038207625', person_id_109);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24960.0, '2015-03-01', 'FullTime', 'Active', now(), now(), person_id_109, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(24960.0, '03/01/2015', now(), now(), company_id, person_id_109, '', null, null);

END;


DECLARE
  user_id_110 int;
  person_id_110 int;
  company_user_id_110 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'HEATHERBRESEE@fairviewhealthcare.com', 't', 'f', 'f', 'HEATHER', 'BRESEE', now(), now())
  RETURNING id into user_id_110;
  raise notice 'The user_id_110 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_110)
  RETURNING id into company_user_id_110;
  raise notice 'The company_user_id_110 is %', company_user_id_110;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Heather', '', 'Bresee', '', 'self', 'ALeCc_hAMAZO0tUw5G_zKnudmB3Tf-m3l0YDHvWNt0OnMa7wVfuqqHQlUwhk7Ge8n-dhaFsqw8c8', '1988-04-14', 'F', company_id, user_id_110, '')
  RETURNING id into person_id_110;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '133 Conant Road', '', 'Nashua', 'NH', '03062', company_id, person_id_110);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6038099915', person_id_110);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 24375.0, '2012-08-10', 'FullTime', 'Active', now(), now(), person_id_110, company_id, '1', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(null, '08/10/2012', now(), now(), company_id, person_id_110, '', 12.5000, 162.5000);

END;


DECLARE
  user_id_111 int;
  person_id_111 int;
  company_user_id_111 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'JESSICASMITH@fairviewhealthcare.com', 't', 'f', 'f', 'JESSICA', 'SMITH', now(), now())
  RETURNING id into user_id_111;
  raise notice 'The user_id_111 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_111)
  RETURNING id into company_user_id_111;
  raise notice 'The company_user_id_111 is %', company_user_id_111;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Jessica', '', 'Smith', '', 'self', 'ALeCc_i6sz_o6ssenCQfNhZAUL89SF_qTVeYfiaB689jFeq0z8JUMexOWZwVnl5rTzwuM8_mUtse', '1988-05-31', 'F', company_id, user_id_111, '')
  RETURNING id into person_id_111;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '2 Rega St', '', 'Hudson', 'NH', '03051', company_id, person_id_111);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6034409908', person_id_111);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 16770.0, '2014-09-08', 'FullTime', 'Active', now(), now(), person_id_111, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(16770.0, '09/08/2014', now(), now(), company_id, person_id_111, '', null, null);

END;


DECLARE
  user_id_112 int;
  person_id_112 int;
  company_user_id_112 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'SHELLYBEAUCAGE@fairviewhealthcare.com', 't', 'f', 'f', 'SHELLY', 'BEAUCAGE', now(), now())
  RETURNING id into user_id_112;
  raise notice 'The user_id_112 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_112)
  RETURNING id into company_user_id_112;
  raise notice 'The company_user_id_112 is %', company_user_id_112;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Shelly', 'A', 'Beaucage', '', 'self', 'ALeCc_jvEOLY7EgVImfFhBCSQ0y4CTlBRFACMnP6k2JUhyZLGkl6F1MDZAHFoI1k9NRJBQvhf1B5', '1969-10-15', 'F', company_id, user_id_112, '')
  RETURNING id into person_id_112;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '110b Pelham Rd', '', 'Hudson', 'NH', '03051', company_id, person_id_112);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6036893731', person_id_112);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 40539.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_112, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(40539.0, '09/01/2008', now(), now(), company_id, person_id_112, '', null, null);

END;


DECLARE
  user_id_113 int;
  person_id_113 int;
  company_user_id_113 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'CRISTIANECHATFIELD@fairviewhealthcare.com', 't', 'f', 'f', 'CRISTIANE', 'CHATFIELD', now(), now())
  RETURNING id into user_id_113;
  raise notice 'The user_id_113 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_113)
  RETURNING id into company_user_id_113;
  raise notice 'The company_user_id_113 is %', company_user_id_113;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Cristiane', '', 'Chatfield', '', 'self', '', '1973-09-10', 'F', company_id, user_id_113, '')
  RETURNING id into person_id_113;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '4 Torrey Rd', '', 'Nashua', 'NH', '06063', company_id, person_id_113);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 28080.0, '2014-04-07', 'FullTime', 'Active', now(), now(), person_id_113, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(28080.0, '04/07/2014', now(), now(), company_id, person_id_113, '', null, null);

END;


DECLARE
  user_id_114 int;
  person_id_114 int;
  company_user_id_114 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'DANILLEDEFRANZO@fairviewhealthcare.com', 't', 'f', 'f', 'DANILLE', 'DEFRANZO', now(), now())
  RETURNING id into user_id_114;
  raise notice 'The user_id_114 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_114)
  RETURNING id into company_user_id_114;
  raise notice 'The company_user_id_114 is %', company_user_id_114;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Danille', '', 'Defranzo', '', 'self', '', '1992-02-12', 'F', company_id, user_id_114, '')
  RETURNING id into person_id_114;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 23712.0, '2015-01-20', 'FullTime', 'Active', now(), now(), person_id_114, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(23712.0, '01/20/2015', now(), now(), company_id, person_id_114, '', null, null);

END;


DECLARE
  user_id_115 int;
  person_id_115 int;
  company_user_id_115 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KELLYMCNALLY@fairviewhealthcare.com', 't', 'f', 'f', 'KELLY', 'MCNALLY', now(), now())
  RETURNING id into user_id_115;
  raise notice 'The user_id_115 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_115)
  RETURNING id into company_user_id_115;
  raise notice 'The company_user_id_115 is %', company_user_id_115;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Kelly', '', 'Mcnally', '', 'self', 'ALeCc_h-Dut6B9qT0o5JUcD4sVV5yL5g6wB1ROyT37o21cfNfiHaGx953FCw8cOhDOw3hMG9e2NI', '1989-09-01', 'F', company_id, user_id_115, '')
  RETURNING id into person_id_115;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '7 Sanborn Rd', '', 'Derry', 'NH', '03038', company_id, person_id_115);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 22880.0, '2015-02-01', 'FullTime', 'Active', now(), now(), person_id_115, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(22880.0, '02/01/2015', now(), now(), company_id, person_id_115, '', null, null);

END;


DECLARE
  user_id_116 int;
  person_id_116 int;
  company_user_id_116 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'AMANDAGLAZIER@fairviewhealthcare.com', 't', 'f', 'f', 'AMANDA', 'GLAZIER', now(), now())
  RETURNING id into user_id_116;
  raise notice 'The user_id_116 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_116)
  RETURNING id into company_user_id_116;
  raise notice 'The company_user_id_116 is %', company_user_id_116;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Amanda', '', 'Glazier', '', 'self', '', '1978-10-22', 'F', company_id, user_id_116, '')
  RETURNING id into person_id_116;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 31200.0, '2015-05-01', 'FullTime', 'Active', now(), now(), person_id_116, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(31200.0, '05/01/2015', now(), now(), company_id, person_id_116, '', null, null);

END;


DECLARE
  user_id_117 int;
  person_id_117 int;
  company_user_id_117 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'AUBREYGUILLOTTE@fairviewhealthcare.com', 't', 'f', 'f', 'AUBREY', 'GUILLOTTE', now(), now())
  RETURNING id into user_id_117;
  raise notice 'The user_id_117 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_117)
  RETURNING id into company_user_id_117;
  raise notice 'The company_user_id_117 is %', company_user_id_117;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Aubrey', '', 'Guillotte', '', 'self', '', '1990-04-12', 'F', company_id, user_id_117, '')
  RETURNING id into person_id_117;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20800.0, '2015-05-08', 'FullTime', 'Active', now(), now(), person_id_117, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20800.0, '05/08/2015', now(), now(), company_id, person_id_117, '', null, null);

END;


DECLARE
  user_id_118 int;
  person_id_118 int;
  company_user_id_118 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'KARENFOTHERGILL@fairviewhealthcare.com', 't', 'f', 'f', 'KAREN', 'FOTHERGILL', now(), now())
  RETURNING id into user_id_118;
  raise notice 'The user_id_118 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_118)
  RETURNING id into company_user_id_118;
  raise notice 'The company_user_id_118 is %', company_user_id_118;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Karen', '', 'Fothergill', '', 'self', 'ALeCc_jpvMtjW9fTKcm8lJo_3WcH2ir8S7GqPqLZeGpxGo7uk_SVDTukZwX4xOjYIKAcrOJm1RQl', '1954-07-18', 'F', company_id, user_id_118, '')
  RETURNING id into person_id_118;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', 'PO BOX 496', '', 'AMHERST', 'NH', '03031.0', company_id, person_id_118);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6032619901', person_id_118);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 20000.0, '2014-06-24', 'FullTime', 'Active', now(), now(), person_id_118, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(20000.0, '06/24/2014', now(), now(), company_id, person_id_118, '', null, null);

END;


DECLARE
  user_id_119 int;
  person_id_119 int;
  company_user_id_119 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'NICHOLECURRAN@fairviewhealthcare.com', 't', 'f', 'f', 'NICHOLE', 'CURRAN', now(), now())
  RETURNING id into user_id_119;
  raise notice 'The user_id_119 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_119)
  RETURNING id into company_user_id_119;
  raise notice 'The company_user_id_119 is %', company_user_id_119;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Nichole', '', 'Curran', '', 'self', '', '1987-10-26', 'F', company_id, user_id_119, '')
  RETURNING id into person_id_119;

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 21060.0, '2014-08-04', 'FullTime', 'Active', now(), now(), person_id_119, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(21060.0, '08/04/2014', now(), now(), company_id, person_id_119, '', null, null);

END;


DECLARE
  user_id_120 int;
  person_id_120 int;
  company_user_id_120 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'TRACIESEIDL@fairviewhealthcare.com', 't', 'f', 'f', 'TRACIE', 'SEIDL', now(), now())
  RETURNING id into user_id_120;
  raise notice 'The user_id_120 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_120)
  RETURNING id into company_user_id_120;
  raise notice 'The company_user_id_120 is %', company_user_id_120;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Tracie', 'M', 'Seidl', '', 'self', 'ALeCc_hyJ8qLYAWviMMCfz3-81ALk9kXtmk2iIH_WV4Eo-gv0jZt1ugP6aXcbMsKLLjyEy5o6Fb9', '1973-09-17', 'F', company_id, user_id_120, '')
  RETURNING id into person_id_120;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '8 Fairmont Street', '', 'Nashua', 'NH', '03064', company_id, person_id_120);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6037655785', person_id_120);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 47132.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_120, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(47132.0, '09/01/2008', now(), now(), company_id, person_id_120, '', null, null);

END;


DECLARE
  user_id_121 int;
  person_id_121 int;
  company_user_id_121 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ROSEMARYSAMPSON@fairviewhealthcare.com', 't', 'f', 'f', 'ROSEMARY', 'SAMPSON', now(), now())
  RETURNING id into user_id_121;
  raise notice 'The user_id_121 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_121)
  RETURNING id into company_user_id_121;
  raise notice 'The company_user_id_121 is %', company_user_id_121;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Rosemary', '', 'Sampson', '', 'self', 'ALeCc_ijgS2VfeJaCkgMaueSxWwWU-xEgSI56GBfNzTJuIxvxZHommKPtRYYdAJNLVoWu64909y5', '1962-05-02', 'F', company_id, user_id_121, '')
  RETURNING id into person_id_121;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '77 Cadogan Way', '', 'Nashua', 'NH', '03062', company_id, person_id_121);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157382', person_id_121);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 70000.0, '2013-12-30', 'FullTime', 'Active', now(), now(), person_id_121, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(70000.0, '12/30/2013', now(), now(), company_id, person_id_121, '', null, null);

END;


DECLARE
  user_id_122 int;
  person_id_122 int;
  company_user_id_122 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'ELIZABETHNGUGI@fairviewhealthcare.com', 't', 'f', 'f', 'ELIZABETH', 'NGUGI', now(), now())
  RETURNING id into user_id_122;
  raise notice 'The user_id_122 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_122)
  RETURNING id into company_user_id_122;
  raise notice 'The company_user_id_122 is %', company_user_id_122;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Elizabeth', '', 'Ngugi', '', 'self', 'ALeCc_iV-T-65osNVk5pQ1vyjKY2TtAiLWTQ0TdtGsWY5j_JE0q-JkFvS6RjgslnTQ0to8TJl3Tv', '1973-03-05', 'F', company_id, user_id_122, '')
  RETURNING id into person_id_122;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '216 Elmwood Drive', '', 'Hudson', 'NH', '03051', company_id, person_id_122);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033157994', person_id_122);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 45011.0, '2008-09-01', 'FullTime', 'Active', now(), now(), person_id_122, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(45011.0, '09/01/2008', now(), now(), company_id, person_id_122, '', null, null);

END;


DECLARE
  user_id_123 int;
  person_id_123 int;
  company_user_id_123 int; 
BEGIN
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$GAyg51JDojge$maah6d3l+UgThTc9ia/19yJv2ose5hBdtfrY9x+BL8c=', now(), 'BONNIEDORAN@fairviewhealthcare.com', 't', 'f', 'f', 'BONNIE', 'DORAN', now(), now())
  RETURNING id into user_id_123;
  raise notice 'The user_id_123 after insert is %', user_id;
  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id_123)
  RETURNING id into company_user_id_123;
  raise notice 'The company_user_id_123 is %', company_user_id_123;
  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'Bonnie', 'L', 'Doran', '', 'self', 'ALeCc_jO9vAaDZ-x7jy8ZHEaVEP17M2bl8gqbwhScPfKeusSP-RB959p05PFFH4-Jt1ZfkaND8-W', '1956-07-27', 'F', company_id, user_id_123, '')
  RETURNING id into person_id_123;

  INSERT INTO app_address(address_type, street_1, street_2, city, state, zipcode, company_id, person_id)
  VALUES('home', '29 BEACON DR', '', 'MERRIMACK', 'NH', '03054.0', company_id, person_id_123);

  INSERT INTO app_phone(phone_type, number, person_id)
  VALUES('home', '6033154000', person_id_123);

  INSERT INTO app_employeeprofile(job_title, annual_base_salary, start_date, employment_type, employment_status, created_at, updated_at, person_id, company_id, pay_rate_id, benefit_start_date)
  VALUES('', 37440.0, '2012-02-15', 'FullTime', 'Active', now(), now(), person_id_123, company_id, '', '2015-09-01');

  INSERT INTO app_employeecompensation(annual_base_salary, effective_date, created_at, updated_at, company_id, person_id, reason_id, hourly_rate, projected_hour_per_month)
  VALUES(37440.0, '02/15/2012', now(), now(), company_id, person_id_123, '', null, null);

END;

raise notice 'There are 124 users created '
END
$$
