#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################# SOURCING PROJECT'S DEPENDENCIES #################################

#### INITIALIZING [__PROJECT__]

## SOURCING THE INITALIZER FILE

# shellcheck disable=SC1091
lineno=$LINENO; if ! source "/usr/local/lib/Bash-Utils/src/Initializer.sh"; then
    echo "In $(basename "$0"), line $lineno --> Error : unable to source the initialization file."; echo; exit 1
fi

# -----------------------------------------------

## DEFINING RESOURCE FILES AND FOLDERS

# Define your project's initialization variables here.
# If you need an example, please check the "Bash-utils/src/Linux-reinstall/Linux-reinstall.sh" file.
# [__PROJECT__]'s sub-folders paths.


# Ending the initialization process.
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2";
WriteInitLog "END OF THE $(Decho "${PROJECT_NAME^^}")'S INITIALIZATION";
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"; WriteInitLog;



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################### CODE ##############################################

# You can write your code now here.
