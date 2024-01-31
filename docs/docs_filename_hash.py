#!/usr/bin/python3

import os
import hashlib
import re
import argparse
import json
import sys

# Function to extract the content of the \pdfinfo{...} /Title tag in a .tex file
def extract_pdfinfo_title(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()

        # Using a regular expression to extract the content of the title for hashing
        match = re.search(r'% Title for hashing : (.+\.tex)', content)

        if match:
            return match.group(1).strip()
        else:
            return None

# Function to generate a short code from a string
def generate_short_code(string):
    # Using the SHA-256 hashing algorithm to generate the hash
    sha256_hash = hashlib.sha256(string.encode()).hexdigest()

    # Convert the hash to uppercase
    sha256_hash_upper = sha256_hash.upper()

    # Return the first 5 characters of the uppercase hash
    return sha256_hash_upper[:5]

# Define command-line arguments
parser = argparse.ArgumentParser(description='Generate short code based on the PDF Title from .tex files.')
parser.add_argument('--remove-relative-path', action='store_true', help='Removes the relative path of the file in output')

# Parse command-line arguments
args = parser.parse_args()

# Folder containing the files in English
folder_en = 'en'

# List to store the information of each file
file_info_list = []

# Redirecting stdout to both terminal and file
original_stdout = sys.stdout

output_file_name = 'FILES_HASH_CODES.JSON'

print("Generating the", output_file_name, "file data\n")

# Open the output file for writing
with open(output_file_name, 'w') as file:
    sys.stdout = file

    if args.remove_relative_path:
        print("/////////////////////////////////////////////////////////////////////////////////////////////////////////////")
        print("This file was generated with the \"./docs_filename_hash.py\" command with the \"--remove-relative-path\" argument\n")
    else:
        print("//////////////////////////////////////////////////////////////////")
        print("This file was generated with the \"./docs_filename_hash.py\" command\n")

    print("It contains the list of every English documentation files with the five first characters of the hash of their name")
    print("//////////////////////////////////////////////////////////////////////////////////////////////////////////////////")

    # Traverse files in the "en" folder
    for foldername, subfolders, filenames in os.walk(folder_en):
        for filename in filenames:
            if filename.endswith('.tex'):
                file_path = os.path.join(foldername, filename)

                # Extract the content of \pdfinfo{...} /Title
                title_content = extract_pdfinfo_title(file_path)

                if title_content:
                    # Generate the short code from the extracted content
                    short_code = generate_short_code(title_content)

                    # Build a dictionary with the file information
                    file_info = {
                        "file_path": filename if args.remove_relative_path else file_path,
                        "tex_title": title_content,
                        "hex__code": short_code
                    }

                    # Add the dictionary to the list of information
                    file_info_list.append(file_info)

    # Print the list of information outside of the loop
    print(json.dumps(file_info_list, indent=4))

# Restore original stdout
sys.stdout = original_stdout

print("The", output_file_name, "file was successfully created and / or written !")
