#!/usr/bin/env bash

# ----------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS :

# Name          : latex-compilation-recursive.sh
# Author(s)     : Dimitri OBEID
# Version       : 1.0

# ------------------
# FILE DESCRIPTION :

# This script recursively compiles EVERY ".tex" files from a specific folder.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

find . -name '*.tex' -execdir latexmk -pdf {} \;
