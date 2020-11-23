#!/usr/bin/env bash

# This script was made to avoid oversizing the main script with all the files sourcing.

# Including variables first.
for _ in $MAIN_PROJECT_ROOT/$MAIN_L_VARS; do
    source "$MAIN_PROJECT_ROOT/$MAIN_L_VARS/*.var" && echo "Included file : $MAIN_PROJECT_ROOT/$MAIN_L_VARS/$_" 2>&1 | tee -a "$MAIN_LOG"
done

# Including functions next.
for _ in $MAIN_PROJECT_ROOT/$MAIN_L_FNCTS; do
    source "$MAIN_PROJECT_ROOT/$MAIN_L_FNCTS/*.lib" && echo "Included file : $MAIN_PROJECT_ROOT/$MAIN_L_VARS/$_" 2>&1 | tee -a "$MAIN_LOG"
done
