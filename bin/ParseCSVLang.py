#!/usr/bin/env python3

# Import modules
import sys
from os import path

# Defining global variables
CSVPATH=sys.argv[1]  # Assign first argument here
CSVLANG=sys.argv[2]  # Assign second argument here

# Code
def AssignVarColWithLangColValues(col, row):

def GetColAndRow():
    if not path.exists(CSVPATH):
        print("Error : the CSV file was not found in the", CSVPATH, "path.")
    else:
        with open(CSVPATH, 'r') as csv_file:
            # Get CSVLANG language's column from the first row.

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
