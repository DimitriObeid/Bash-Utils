#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################## CALLING SCRIPT'S DEPENDENCIES ##################################

#### INITIALIZING LINUX-REINSTALL

## DEFINING PROJECT SETTINGS

# Private or public project
PROJECT_ACCESSIBILITY="public"

# Determines whether text from library functions has to be redirected into a log file, and how (into the log file only or to the file AND to the terminal)
PROJECT_LOG_STATUS=""

# -----------------------------------------------

## INCLUDING THE INITALIZER FILE

if ! source "/usr/local/lib/Bash-Utils/lib/init/initializer.sh"; then
    echo "In Script-Generator.sh, line 79 --> Error : unable to include the initializer file"; echo; exit 1
fi
