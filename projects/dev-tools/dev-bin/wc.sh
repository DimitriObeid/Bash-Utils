#!/usr/bin/env bash

# shellcheck disable=SC1091
if ! source "/usr/local/lib/Bash-utils/lib/Initializer.sh"; then
	echo; echo "Unable to source the initializer file"; echo; exit 1
fi

# Sourcing the tool's source files.
for f in "../dev-src/$PROJECT_NAME/"*.sh; do
    SourceFile "$f"
done

# //////////////////////////////////////////////////////////////////////////// #

# Lenght=0    # '-L' argument
# lines=0     # '-l' argument
# chars=0     # '-m' argument
# words=0     # '-w' argument

# For more convenience, you should execute this file and pass its argument right in the project's directory.
if [ "$#" -eq 1 ]; then
    PROJECT_PATH="$1"
fi

function GetWCWordsNumber
{
	wc -w "$PROJ/Linux-reinstall.sh"

    for f in $(ls -R "$BASH_UTILS_FUNCTS_BASIS/"*.lib); do
        wc -w "$f"
    done

    for f in $(ls -R "$BASH_UTILS_FUNCTS/"*.lib); do
        wc -w "$f"
    done

    for f in $(ls -R "$BASH_UTILS_VARS/"*.lib); do
        wc -w "$f"
    done
}

GetWCBytes
GetWCCharsNumber
GetWCMaxLineLenght
GetWCLinesNumber
GetWCWordsNumber

# else
# 	HandleError "1" "INCORRECT ARGUMENT" "The allowed arguments are $(DechoE "c"), $(DechoE "L"), $(DechoE "l"), $(DechoE "m") and $(DechoE "w")." "$(basename "$0")" "" ""
# fi
