#!/usr/bin/env bash
LOG=$1
CMD=$2

if test "$#" -eq 0; then
	exit 2
elif [ -z "${CMD}" ]; then
	exit 3
elif [ -s "${CMD}" ]; then
	"$CMD" || exit 1
	exit 0
elif test "$#" -gt 2; then
    exit 4
else
    exit 5
fi
