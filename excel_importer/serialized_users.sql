DO $$
DECLARE
  company_id int := 23;
BEGIN
raise notice 'The company_id to start is %', company_id;
raise notice 'There are 0 users created ';
END
$$
