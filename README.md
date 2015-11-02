# Utility

## Description
This is the repository that have the scripts for the following purpose
1. Parse a list of excel files to generate employee data for a company


## Get started
1. If you do not have virtualenvwrapper installed on your computer, please follow https://virtualenvwrapper.readthedocs.org/en/latest/install.html to install
2. pip install openpyxl
3. Install psycopg2 from http://initd.org/psycopg/docs/install.html#install-from-a-package

## Design
For data population, the we use a visitor pattern.

## Testing
1. Download the prod db snapshot
createdb proddb
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d proddb ~/Downloads/proddump
psql proddb

2. Make sure you added excluding emails into the /excel_importer/exclude.txt

3. Run the parsing script
./import_excel.py ../../Assurant\ Fairview\ Enrollment\ Report\ 10.15.2015.xls.xlsx ../../2015-10-14\ Fairview\ HCHP.csv.xlsx

4. The generated sql file is at /excel_importer/serialized_users.sql

5. Within the psql console, do \i <path_to_serializerd_user.sql>

## How to use
Repeat the steps in "Testing" section above starting from step 2 
