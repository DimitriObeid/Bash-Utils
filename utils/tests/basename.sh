#!/usr/bin/env bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
dirname="$SCRIPTPATH"
    
shopt -s extglob           # enable +(...) glob syntax
result=${dirname%%+(/)}    # trim however many trailing slashes exist
echo "$result"


echo
echo
echo
echo


SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; cd .. && pwd -P )"
echo "$SCRIPTPATH"
echo


dirname="$SCRIPTPATH"
shopt -s extglob           # enable +(...) glob syntax
result=${dirname%%+(/)}    # trim however many trailing slashes exist
echo "$result"

result=${result##*/}       # remove everything before the last / that still remains
echo "$result"
