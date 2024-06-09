#!/bin/sh

import os
import sys
import json


LANDING_DIR=''
FILE_NAME=''
WAREHOUSE_DB=''
WAREHOUSE_TABLE=''



with open('/home/data-transit/dataprom/%s.json' %sys.argv[1]) as f:
    data = json.load(f)
    LANDING_DIR=data['landing_dir']
    FILE_NAME=data['input_file']
    WAREHOUSE_DB=data['database']
    WAREHOUSE_TABLE=data['input_table']

os.system(f"/home/data-transit/dataprom/stgload.sh -a {LANDING_DIR} -b {FILE_NAME} -c {WAREHOUSE_DB} -d {WAREHOUSE_TABLE}" )

os.system(f"hive -e 'msck repair table {WAREHOUSE_DB}.{WAREHOUSE_TABLE}'")



# print(f'landIdir is {LANDING_DIR}, \n input file is {FILE_NAME}, \n database is {WAREHOUSE_DB}, \n table is {WAREHOUSE_TABLE}')

