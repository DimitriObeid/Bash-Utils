#!/usr/bin/env bash

# This script was made to avoid oversizing the main script with all the files sourcing.

# Including variables first.
echo "In $0, line $LINENO" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; for f in "$BASH_UTILS_ROOT/lib/variables/"*.var; do
    source "$f"
    
    if test "$?" -ne 0; then
        echo "$f : Unable to source this file"
    else
        echo "Included file : $f" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
    fi
done

echo

# Including functions next.
echo "In $0, line $LINENO" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"; for f in "$BASH_UTILS_ROOT/lib/functions/"*.lib; do
    source "$f"
    
    if test "$?" -ne 0; then
        echo "$f : Unable to source this file"
    else
        echo "Included file : $f" 2>&1 | tee -a "$MAIN_SCRIPT_LOG_PATH"
    fi
done

echo
