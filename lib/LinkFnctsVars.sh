#!/usr/bin/env bash

# This script was made to avoid oversizing the initializer script with all the files sourcing.

# Including variables first.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO"; for f in "$BASH_UTILS_LIB_VARS/"*.var; do    
    if source "$f"; then
        WriteInitLog "Included file : $f"
    else
        echo "$f : Unable to source this file"; exit 1
    fi
done

echo

# Including functions next.
WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO"; for f in "$BASH_UTILS_LIB_FUNCTS/"*.lib; do
    if source "$f"; then
        WriteInitLog "Included file : $f"
    else
        echo "$f : Unable to source this file"; exit 1
    fi
done

WriteInitLog
