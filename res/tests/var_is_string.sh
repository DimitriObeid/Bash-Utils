#!/usr/bin/env bash

function char__()
{
	if [[ "$1" =~ [A-Z] ]]; then
    		echo "Not a valid input"
	else
    		echo "Its a valid input"
	fi
}

char__ '2'
