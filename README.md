# Utility

## Description
This is the repository that have the scripts for the following purpose
1. Parse a list of excel files to generate employee data for a company


## Get started
1. If you do not have virtualenvwrapper installed on your computer, please follow https://virtualenvwrapper.readthedocs.org/en/latest/install.html to install
2. pip install openpyxl
3. Install psycopg2 from http://initd.org/psycopg/docs/install.html#install-from-a-package

## Design
For data population, the we use a visitor pattern. We provide the data to the ModelDataSupplier
ModelDataSupplier contains all the ModelDataFactory objects
ModelDataFactory would create all the ModelSerializer based on the data from each row
ModelSerializer would also contain the row number it's data comes from so it can generate based on dependency
ModelSerializer would have reference to other ModelSerializers to define our model relationships
ModelSerializers would serialize data to SQL file or other forms



