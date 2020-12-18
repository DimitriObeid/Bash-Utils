#!/usr/bin/env python3

# Import modules
import sys
from os import path

# Defining global variables
CSVPATH=sys.argv[1]  # Assign first argument here
CSVLANG=sys.argv[2]  # Assign second argument here

# Code
def AssignVarColWithMessageAndLangColValues(col, row):

def GetLanguageColumn():
    #***** Variables *****
    i_index=0
    i_targetCell="VARIABLE"
    
    j_index=0
    j_targetCell=CSVLANG
    
    #***** Code *****
    if not path.exists(CSVPATH):
        print("Error : the CSV file was not found in the", CSVPATH, "path.")
    else:
        with open(CSVPATH, 'r') as csv_file:
            # Get "VARIABLE" cell first, then CSVLANG language's column from the first row.
            for i in range(i_index)

def main():
    if len(sys.argv) != 2:
        print("Error : 2 arguments are awaited :\n"
              " - The path to the CSV file\n"        
              " - The language\n")
        print("Abort")

        exit(1)
    else:
        GetColAndRow()


main()
