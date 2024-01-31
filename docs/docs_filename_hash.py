#!/usr/bin/python3

import os
import hashlib
import argparse

# Function to generate a short code from the filename in English
def generate_short_code(filename):

    # Convert the filename to lowercase to avoid case sensitivity
    filename_lower = filename.lower()

    # Use the SHA-256 hashing algorithm to generate the hash
    sha256_hash = hashlib.sha256(filename_lower.encode()).hexdigest()

    # Convert the hash to uppercase
    sha256_hash_upper = sha256_hash.upper()

    # Return the first 5 characters of the uppercase hash
    return sha256_hash_upper[:5]

# Define command-line arguments
parser = argparse.ArgumentParser(description='Generate short code for .tex files.')
parser.add_argument('--keep-path', action='store_true', help='Keep the file path in output')

# Parse command-line arguments
args = parser.parse_args()

# Root folder containing the files
root_folder = 'en'

prev_folder = None

print("This file was generated with the \"./docs_filename_hash.py --keep-path | tee -a FILES_HASH_CODES.TXT\" command\n")
print("It contains the list of every English documentation files with the five first characters of the hash of their name\n")

# Recursively traverse files in the root folder and its subfolders
for foldername, subfolders, filenames in os.walk(root_folder):
    for filename in filenames:

        # Check if the file has the .tex extension
        if filename.endswith('.tex'):

            # Complete path of the file
            file_path = os.path.join(foldername, filename)

            # If the previous folder is different from the current folder, skip a line
            if prev_folder != foldername:
                print()

            # Generate the short code for the file while keeping or not the relative path
            short_code = generate_short_code(file_path)

            # Display the relative path or not based on the argument
            print("Short Code for", file_path if args.keep_path else filename, ":", short_code)

            # Update the previous folder
            prev_folder = foldername





















# V2

#!/usr/bin/python3

import os
import hashlib
import argparse

# Function to generate a short code from the filename in English
def generate_short_code(filename):

    # Convert the filename to lowercase to avoid case sensitivity
    filename_lower = filename.lower()

    # Check if the filename contains the pattern " - ABCDE.tex" just before the extension
    if " - " in filename_lower:
        filename_parts = filename_lower.rsplit('.tex', 1)
        if len(filename_parts) == 2:
            filename_lower = filename_parts[0] + '.tex'  # Include the .tex extension

    # Use the SHA-256 hashing algorithm to generate the hash
    sha256_hash = hashlib.sha256(filename_lower.encode()).hexdigest()

    # Convert the hash to uppercase
    sha256_hash_upper = sha256_hash.upper()

    # Return the first 5 characters of the uppercase hash
    return sha256_hash_upper[:5]

# Define command-line arguments
parser = argparse.ArgumentParser(description='Generate short code for .tex files.')
parser.add_argument('--keep-path', action='store_true', help='Keep the file path in output')

# Parse command-line arguments
args = parser.parse_args()

# Root folder containing the files
root_folder = 'en'

prev_folder = None

if args.keep_path:
    print("# This file was generated with the \"./docs_filename_hash.py --keep-path | tee -a FILES_HASH_CODES.TXT\" command\n")
else:
    print("# This file was generated with the \"./docs_filename_hash.py\" command\n")

print("# It contains the list of every English documentation files with the five first characters of the hash of their name")
print("# //////////////////////////////////////////////////////////////////////////////////////////////////////////////////")

# Recursively traverse files in the root folder and its subfolders
for foldername, subfolders, filenames in os.walk(root_folder):
    for filename in filenames:

        # Check if the file has the .tex extension
        if filename.endswith('.tex'):

            # Complete path of the file
            file_path = os.path.join(foldername, filename)

            # If the previous folder is different from the current folder, skip a line
            if prev_folder != foldername:
                print()

            # Generate the short code for the file while keeping or not the relative path
            short_code = generate_short_code(filename)

            # Display the relative path or not based on the argument
            print("Short Code for", file_path if args.keep_path else filename, ":", short_code)

            # Update the previous folder
            prev_folder = foldername
