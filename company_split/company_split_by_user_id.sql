--Major short falls of this script:
--1. The script is not idempotent. It means running the script multiple times result in undesired data created
--2. The company do not have jobs, departments nor divisions. These require more development
--3. Only 1 company group created. Multiple company groups require group to group mapping on membership
--4. No benefit setup for the company, and therefore no benefit enrollment
--5. No document template setup for the company, hence no document created for the employees
--6. No company level uploaded documents
--7. Need to create a new admin outside of this script

DO $$
DECLARE
  user_ids int[] := '{645,647,650,653,657,659,660,661,663,666,667,668,671,672,677,678,682,719,718,716,748,752,944,945,946,958,985,999}';
  old_company_id int := 31;
  new_company_id int := 34;
  new_group int;
BEGIN
    insert into app_companygroup (name, created, updated, company_id) select name, now(), now(), new_company_id from app_companygroup where company_id=old_company_id RETURNING id into new_group;
    update app_companygroupmember set company_group_id=new_group where user_id=ANY(user_ids);
    update app_companyuser set company_id=new_company_id where user_id = ANY(user_ids) and company_id=old_company_id;
    update app_person p set company_id=new_company_id where p.user_id = ANY(user_ids);
    update app_employeecompensation ecom set company_id=new_company_id from app_person p where p.id=ecom.person_id and p.user_id=ANY(user_ids);
    update app_employeeprofile ep set company_id=new_company_id from app_person p where p.id=ep.person_id and p.user_id=ANY(user_ids);
    update app_employee1095c ec set company_id=new_company_id from app_person p where p.id=ec.person_id and p.user_id=ANY(user_ids);
END;
$$