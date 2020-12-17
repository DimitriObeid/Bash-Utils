#!/usr/bin/env python3

# Import modules
import sys
from os import path

# Defining global variables
CSVPATH=""  # Assign first argument here
CSVLANG=""  # Assign second argument here

# Code
def AssignVarColWithLangColValues(col, row):

def GetColAndRow(col, row):
    if path.exists(CSVPATH):
        with open(CSVPATH, 'r') as csv_file:
            # Column

def main():
    if len(sys.argv) != 2:
        print("Error : 2 arguments are awaited :\n"
              " - The path to the CSV file\n"        
              " - The language\n")
        print("Abort")

        exit(1)


main()
