# Import packages
import pandas as pd, numpy as np
import os, sys, glob, re
from pathlib import Path

inputfilepath = Path(sys.argv[1])
outputfilepath = Path(sys.argv[2])

colstokeep = ['company_name', 'gkz_administrative_region_code', 'gkz_borough_code',
              'wz_2008_pri_actv_cd_3_digits', 'peer_group_name', 
              'number_of_employees_2011', 'gross_results_2011',
              'post_code', 'city', 'wz_2008_pri_actv_cd_4_digits', 'us_sic_all_codes', 'bvd_id_number']

colnames = [colname + '_2011' for colname in colstokeep]

print("Input Filepath:", str(inputfilepath))
print("Output Filepath:", str(outputfilepath))
print("Columns to keep:", colstokeep)
print("Column names:", colnames)

# Filter to keep select variables, rename them, and save as .csv
def filter_cols(inputfilepath, outputfilepath, colstokeep, colnames):
    print(f"Filtering: {inputfilepath.name}")
    df = pd.read_csv(inputfilepath, low_memory=False, usecols=colstokeep)
    df.columns = colnames
    df.to_csv(outputfilepath, index=False)
    print("Saved file as:", outputfilepath)
    print("df.shape:", df.shape)

filter_cols(inputfilepath, outputfilepath, colstokeep, colnames)