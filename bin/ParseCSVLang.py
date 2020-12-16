#!/usr/bin/env python3

import sys


def main():
    if len(sys.argv) != 2:
        print("Error : 2 arguments are awaited :\n"
              " - The language\n"
              " - The path to the CSV file\n")
        print("Abort")

        exit(1)


main()
