#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL VARIABLES DEFINITION #############################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Path to the script file to create (mandatory).
__ARG_PATH=$1;

 # Path to the resources file (optional).
 __ARG_SRC=$2;

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## MESSAGES

__ABORTING="Aborting the $0 script exection";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITION

##

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

if [ -z "$__ARG_PATH" ]; then
    echo "WARNING !! NO FILE PATH WAS GIVEN FOR THE $0 SCRIPT" >&2;
    echo "Please provide a valid file path to create" >&2;
    echo >&2;

    echo "$__ABORTING" >&2;
    echo >&2;

    exit 1;

elif [ -f "$__ARG_PATH" ]; then
    echo "WARNING !! THE $__ARG_PATH FILE ALREADY EXISTS !!!" >&2; echo >&2;
    echo "The file will not be overwritten" >&2;
    echo >&2;

    echo "$__ABORTING" >&2;
    echo >&2;

    exit 1;
fi

if [ ! -f "../dev-res/bin-generation.sh.txt" ] || [ ! -f "$__ARG_SRC" ]; then
    if [ -f "$HOME/.Bash-utils/Bash-utils-root-val.path" ]; then
        __new_file_path_tmp="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")";

        __new_file_path="$__new_file_path_tmp/res/dev-tools/dev-res/bin-generation.sh.txt";
    else
        echo "WARNING !! UNABLE TO FIND THE PATH TO THE '$HOME/.Bash-utils/Bash-utils-root-val.path' RESOURCES FILE" >&2;
        echo "Please provide the path to the resource file" >&2;
        echo >&2;

        echo "$__ABORTING" >&2;
        echo >&2;

        exit 1;
    fi
else
    __new_file_path='../dev-res/bin-generation.sh.txt';
fi

cat "$__new_file_path" > "$__ARG_PATH" || {
    echo "WARNING !! THE $0 SCRIPT WAS UNABLE TO CREATE THE $__ARG_PATH FILE" >&2;
    echo "Please check the permissions of the target directory" >&2;
    echo >&2;

    echo "$__ABORTING" >&2;
    echo >&2;

    exit 1;
};
