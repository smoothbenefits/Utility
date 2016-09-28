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

3. Run the parsing script without db component
./import_excel.py ../../Assurant\ Fairview\ Enrollment\ Report\ 10.15.2015.xls.xlsx ../../2015-10-14\ Fairview\ HCHP.csv.xlsx
If you have the db component, run the command below
./import_excel.py -b proddb -t ../../Assurant\ Fairview\ Enrollment\ Report\ 10.15.2015.xls.xlsx ../../2015-10-14\ Fairview\ HCHP.csv.xlsx

4. The generated sql file is at /excel_importer/serialized_users.sql

5. Within the psql console, do \i {path_to_serializerd_user.sql}

## How to use
Repeat the steps in "Testing" section above starting from step 2 

## Code structure:
The excel_importer have the following group of objects:
* model - These objects are the in memory models of the data parsed and retrieved.
* parser - These objects are the excel reader that would translate all the excel data into model data
* data_provider - These objects reads the needed data from BenefitMy_Python app database for company level data
* serializer - These objects takes the models and output the data within models to which ever serialization format needed. Current we have text and sql (PL/pgSQL)
* Company_benefits_provider - the main engine to read all the data from existing db and populate model
* import_excel - The main program
* users_db_data_provider - The engine to retrive and populate the company user data model from database
* users_excel_data_provider - The engine to retrieve data from excel for company user data model

Please note with in the model and parser, there are company specific model and parser like model.benefits.assurant_benefit_selection and assurant_benefit_selection_parser.

