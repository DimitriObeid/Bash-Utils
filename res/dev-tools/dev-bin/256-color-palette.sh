#!/bin/bash

# --------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS

# Name          : 256-color-palette.sh
# Author(s)     : A Stack Overflow user
# Version       : 1.0

# ------------------
# FILE DESCRIPTION :

# This script prints every color code of an XTERM palette table in a 6 * 40 table, with the corresponding color of each code printed in the background.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

for((i=16; i<256; i++)); do
    printf "\e[48;5;${i}m%03d" "${i}";
    printf '\e[0m';
    [ ! $((( i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
done
