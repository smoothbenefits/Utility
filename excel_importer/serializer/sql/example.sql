DO $$
DECLARE
  company_id int;
BEGIN


SELECT id INTO company_id from app_company where name = 'fairview healthcare';
raise notice 'the company_id from select %', company_id;

IF company_id is null THEN
  INSERT INTO app_company(name, pay_period_definition_id, ein, offer_of_coverage_code)
  VALUES('fairview healthcare', 4, '23432432', '1A')
  RETURNING id INTO company_id;
END IF;

raise notice 'the company_id after insert is %', company_id;

DECLARE
  user_id int := 0;
  company_user_id int;
  person_id int;
BEGIN
  raise notice 'the user_id is % and company_id is %', user_id, company_id;
  INSERT INTO app_authuser(password, last_login, email, is_active, is_admin, is_superuser, first_name, last_name, last_updated, date_created)
  VALUES('pbkdf2_sha256$15000$zfrpRRgAodKw$Ipm/j5EFPkA6kSYHwNVc03cmSSPms9taRfHkXEJH3zQ=', now(), 'churn@testing.com', 't', 'f', 'f', 'churn', 'last', now(), now())
  RETURNING id into user_id;
  raise notice 'the user_id after insert is %', user_id;

  INSERT INTO app_companyuser(company_user_type, new_employee, company_id, user_id)
  VALUES('employee', 'f', company_id, user_id)
  RETURNING id into company_user_id;
  raise notice 'the company_user_id is %', company_user_id;

  INSERT INTO app_person(person_type, first_name, middle_name, last_name, email, relationship, ssn, birth_date, gender, company_id, user_id, reason_for_change)
  VALUES('primary_contact', 'test', 'person', 'one', '', 'self', 'ALeCc_jEzK2NFn9DoGWqkbASEGnFrnFrnIWWFMr9mrk-rdz0SUNXi3PWgvletQJNBegG1kEKDN6J', '1988-05-27', 'M', company_id, user_id, '')
  RETURNING id into person_id;

  raise notice 'the person_id is %', person_id;
END;


END
$$
