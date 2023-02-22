# Import packages
import pandas as pd, numpy as np
import os, sys, glob, re
from pathlib import Path

inputfilepath = Path(sys.argv[1])
outputfilepath = Path(sys.argv[2])

colstokeep = ['Unnamed: 0', 'BvDID', 'NAME_INTERNAT', 'Postcode', 'City', 
              'Number of employees', 'Operating revenue (Turnover)', 'Primary code(s) in this classification', 
              'Secondary code(s) in this classification', 'US SIC, Primary code(s)', 'US SIC, Secondary code(s)', 
              'US SIC secondary code, text description']

colnames = ['unnamed_0', 'bvdid', 'name_internat', 'postcode', 'city', 
              'number_of_employees', 'operating_revenue_turnover', 'primary_code', 
              'secondary_code', 'us_sic_primary_code', 'us_sic_secondary_code', 
              'us_sic_secondary_code_desc']
colnames = [colname + '_2019' for colname in colnames]

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