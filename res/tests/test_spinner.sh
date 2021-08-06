#!/usr/bin/env bash

function DisplaySpinner()
{
    #***** Parameters *****
    p_string=$1
    p_countdown=$2
    p_pid=$3

    #***** Variables *****
    i=1
    sp="/-\|"

    #***** Code *****
    echo -n ' '

   # while [ -d "/proc/$PID" ]; do
    while [[ "$j" < "$p_countdown" ]]; do
	printf "\b${sp:i++%${#sp}:1}"
    done
}

DisplaySpinner "Chaîne de caractères de test" "2" "$!"
