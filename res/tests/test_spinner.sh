#!/usr/bin/env bash

# Display a spinner while a task is ongoing.
function BU.Main.PosixTermDisplaySpinner()
{
    #**** Parameters ****
    p_string=$1
    p_countdown=$2
    p_pid=$3

    #**** Variables ****
    i=1
    sp="/-\|"

    #**** Code ****
    echo -n ' '

    echo ">>>> $p_string"

    while true; do
        printf "\b${sp:i++%${#sp}:1}"
    done
}

BU.Main.PosixTermDisplaySpinner "Chaîne de caractères de test" "2" "$!"
