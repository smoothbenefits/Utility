# Utility

## Description
This is the repository that provides utilities for system admins to perform data operations, such as batch importing for new client on-boarding

## Usage
* The command format is: "python data_import.py [action] [action arguments]"
* To see the list of available actions type "python data_import.py -h"
* To see the list of auguments for a selected action, type "python data_import.py [action] -h"
* Example:
  * The below command runs the time-off quota spec import utility to import from excel file "../TestAssets/timeoff_quota_data.xlsx", for company with ID "1", and into the stage environment of the system.
  * `python data_import.py timeoff_quota_spec_import -c 1 -e stage ../TestAssets/timeoff_quota_data.xlsx`

## Development

### Setting up prerequisites
1. If you do not have virtualenvwrapper installed on your computer, please follow https://virtualenvwrapper.readthedocs.org/en/latest/install.html to install
2. pip install openpyxl
3. Install psycopg2 from http://initd.org/psycopg/docs/install.html#install-from-a-package

### Code structure
* The "common" folder
  * Contains all common/shared constructs can be utilized by all utilities. Inlcuding base implementations, common utility services, etc.
* Under each utility program folder
  * The main utility program entry point (e.g. timeoff_quota_spec_import.py). This govern the programs behavior on command line, and needs to be registered in the main program "data_import.py".
  * data_provider. Contains implementations that provide (i.e. read) data from different types of sources, such as web services, files, databases, etc. These are expected to be read-only.
  * excel_parser (or xyz_parser). Contains implementations to parse data from data sources and formats. These normally serve as the proxy under data providers to work with data sources that need more complex logic in extraction and transformation.
  * model. Contains implementations that represent entities/objects in memory, in a structured and readable and object-orientied way, to participate all upper-level (i.e. model or business logic layer) logics. All data providers public facing APIs are expected to return models.
  * serialization. Contains implementations that capture the serialization/deserialization logics to convert domain models to their exchange formats, such as json, text, xml, sql or anything else.
  * data_aggregator. Contains implementations that serves as the highest level service that utilizes all constructs above, directly or indirectly, and perform packing, validation and aggregation of data. They are like the assembly line of a factory. 



