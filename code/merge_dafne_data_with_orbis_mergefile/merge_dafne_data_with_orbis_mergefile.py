# Import packages
import pandas as pd, numpy as np
import os, sys, glob, re
from pathlib import Path

df1filepath = Path(sys.argv[1])
df2filepath = Path(sys.argv[2])
outputfilepath = str(sys.argv[3])
left_on = sys.argv[4]
right_on = sys.argv[5]

print("df1 Filepath:", str(df1filepath))
print("df2 Filepath:", str(df2filepath))
print("Output Filepath:", str(outputfilepath))
print(f"Merging on: left - {left_on}, right - {right_on}")

# Merge datasets and save as .csv and .dta
def merge(df1filepath, df2filepath, outputfilepath, left_on, right_on, how='left'):
    df1 = pd.read_csv(df1filepath, low_memory=False)
    df2 = pd.read_csv(df2filepath, low_memory=False)
    df = df1.merge(df2, left_on=left_on, right_on=right_on, how=how)
    outputfilepath_csv = Path(outputfilepath + '.csv')
    outputfilepath_dta = Path(outputfilepath + '.dta')
    df.to_csv(outputfilepath_csv, index=False)
    print("Saved merged file as:", outputfilepath_csv)
    df.to_stata(outputfilepath_dta, write_index=False)
    print("Saved merged file as:", outputfilepath_dta)
    print('Shape of merged file:', df.shape)

merge(df1filepath, df2filepath, outputfilepath, left_on, right_on)