#!/usr/bin/env python3

# Import modules
import sys
from os import path

# Code
def main():
    # Argument list
    CSV_INPUT_FILEPATH=sys.argv[1]      # Assign first argument here
    CSV_LANG=sys.argv[2]                # Assign second argument here
    CSV_OUTPUT_FILEPATH=sys.argv[3]     # Assign third argument here
	
	# Checking argument count
    if len(sys.argv) != 3:
        print("Error : 3 arguments are awaited :\n"
              " - The path to the CSV file\n"
              " - The language\n"
			  " - The output file\n")
        print("Abort")

        exit(1)
    else:
		# Checking argument values
        if not path.exists(CSV_INPUT_FILEPATH):
            print("Error : the CSV input file was not found in the", CSV_INPUT_FILEPATH, "path.")

		if not path.exists(CSV_OUTPUT_FILEPATH):
			print("Error : the output file was not found in the", CSV_OUTPUT_FILEPATH "!")
			exit 1

        ## GETTING LANGUAGE ROW
        #***** Variables *****
        i_index=0
        i_targetCell="VARIABLE"

        j_index=0
        j_targetCell=lang

        #***** Code *****
        else:
            with open(CSV_INPUT_FILEPATH, 'r') as csv_file:
                # Get "VARIABLE" cell first, then CSVLANG language's column from the first row.
                for i in range(i_index)

main()
