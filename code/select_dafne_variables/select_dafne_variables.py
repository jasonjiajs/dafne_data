# Import packages
import pandas as pd, numpy as np
import os, sys, glob, re
from pathlib import Path

inputfilepath = Path(sys.argv[1])
outputfilepath = Path(sys.argv[2])

colstokeep = ['company_name', 'crefo_number', 'gkz_administrative_region_code', 'gkz_borough_code',
              'wz_2008_pri_actv_cd_1_digit', 'wz_2008_pri_actv_cd_3_digits', 
              'peer_group_name', 'peer_group_description', 'number_of_employees_2014', 'number_of_employees_2013', 'number_of_employees_2012',
              'number_of_employees_2011', 'number_of_employees_2010', 'number_of_employees_2009', 'number_of_employees_2008', 'number_of_employees_2007',
              'number_of_employees_2006', 'number_of_employees_2005', 'gross_results_2014', 'gross_results_2012', 'gross_results_2013', 'gross_results_2011',
              'gross_results_2010', 'gross_results_2009', 'gross_results_2008', 'gross_results_2007', 'gross_results_2006', 'gross_results_2005',
              'post_code', 'city', 'country', 'wz_2008_pri_actv_cd_4_digits', 'us_sic_all_codes', 'isin_number', 'bvd_id_number']

print("Input Filepath:", str(inputfilepath))
print("Output Filepath:", str(outputfilepath))
print("Columns to keep:", colstokeep)

# Filter to keep select variables, and save as .csv
def filter_cols(inputfilepath, outputfilepath, colstokeep):
    print(f"Filtering: {inputfilepath.name}")
    df = pd.read_csv(inputfilepath, low_memory=False, usecols=colstokeep)
    df.to_csv(outputfilepath, index=False)
    print("Saved file as:", outputfilepath)

filter_cols(inputfilepath, outputfilepath, colstokeep)