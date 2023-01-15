#!/usr/bin/env bash

# --------------------------------------
# DEV-TOOLS EXECUTABLE FILE INFORMATIONS

# Name          : lib-install.sh
# Author(s)     : Dimitri OBEID
# Version       : 2.0

# ------------------
# FILE DESCRIPTION :

# A very simple script, which copies the "Bash-utils-init.sh" file and the ".Bash-utils" folder in the user's home directory.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

cp "install/Bash-utils-init.sh" ~   || { echo "Unable to copy the initializer script in the ${HOME} directory"; exit 1; }
echo "Successfully copied the initializer script in the ${HOME} directory";
echo;

cp -r "install/.Bash-utils" ~       || { echo "Unable to copy the Bash Utils modules directory in the ${HOME} directory"; exit 1; }
echo "Successfully copied the Bash Utils modules directory in the ${HOME} directory";