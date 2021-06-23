#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### CHECKING FOR OPERATING SYSTEM RELATED INFORMATIONS

## CHECKING OPERATING SYSTEM TYPE

function CheckSupportedOSType
{
    case "$OSTYPE" in
        "linux-gnu")
            ModUserOSStatVars
            
            ;;
        *)
            STAT_ERROR="fatal"
            HandleErrors "1" "YOUR OS IS NOT SUPPORTED (YET)" "" "$LINENO"
    esac
}

# -----------------------------------------------

## MODIFYING STATUS VARIABLES

function ModUserOSStatVars
{
    if [ -z "$STAT_USER_OS" ]; then
        STAT_USER_OS="$OSTYPE"
    fi
}
