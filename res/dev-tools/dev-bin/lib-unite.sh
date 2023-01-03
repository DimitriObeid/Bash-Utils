#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################# GLOBAL VARIABLES DEFINITION #############################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Authorization to delete the generated file.
__BU_ARG_RM="$1";

# Delete empty lines.
__BU_ARG_DEL_EMPTY_LINES="$2";

# Delete comments that are not on the same line as a piece of code.
__BU_ARG_DEL_LINE_COMMENTS="$3";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## PATHS

# Getting the path of the library's root path from the path file.
if [ -d '/usr/local/lib/Bash-utils' ]; then __BU_ROOT_PATH='/usr/local/lib/Bash-utils';

elif [ -d "$HOME/.Bash-utils/Bash-utils" ]; then __BU_ROOT_PATH="$HOME/.Bash-utils/Bash-utils";

else __BU_ROOT_PATH="$(cat "$HOME/.Bash-utils/Bash-utils-root-val.path")";

fi

# Path of the modules initializer file.
__BU_MAIN_FULL_FILE_PATH="${__BU_ROOT_PATH}/Bash-utils.sh";

__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES="${__BU_ROOT_PATH}/Bash-utils-nolines.sh";

__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE="${__BU_ROOT_PATH}/Bash-utils-no-line-comments--base.sh";

__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES="${__BU_ROOT_PATH}/Bash-utils-no-line-comments--no-lines.sh";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_CONFIGS_PATH="${__BU_ROOT_PATH}/install/.Bash-utils/config/initializer";

# Path of the modules initialization script's translations files.
__BU_MODULE_INIT_TRANSLATIONS_PATH="$__BU_MODULE_INIT_CONFIGS_PATH/locale";

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITION

# Printing a line according to the terminal's columns number.
function PrintLine()
{
    __cols="$(tput cols)"

	for _ in $(eval echo -e "{1..$__cols}"); do
            printf '-';
    done; printf "\n";
}

# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.

# Initial source of this AWK script (since it's not mine and I added more informations as comments) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BytesToHuman()
{
    #**** Parameters ****
    local L_BYTES="${1:-0}";    # Int       - Default : 0       - Raw size in bytes.
    local L_PAD="${2:-no}";     # String    - Default : "no"    - Allow result display padding.
    local L_BASE="${3:-1024}";  # Int       - Default : 1024    - Base (1000 (metric) or 1024 (binary notation))

    #**** Code ****
    # Creating a command substitution to calculate the byte count according to the values passed as arguments, with an AWK script.
    local BYTESTOHUMAN_RESULT; BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" 'function human(x, pad, base) {

        # If the desired base format is not the binary prefix, then the base format used will be the metric one.
         if(base!=1024)base=1000

        # Ternary condition : if the base format uses the binary prefix, then the "iB" ([prefix]bibyte) unit is displayed after the value. Else the "[prefix]byte" unit is displayed after the value.
         basesuf=(base==1024)?"iB":"B"

        # Setting the prefixes list (K = kilo, M = mega, G = giga, T = tera, P = peta, E = exa, Z = zeta, Y = yotta), and corrected the inversion of the Exa with Peta, and Zeta with Yotta.
         s="BKMGTPEZY"

        # While the "x" ("human" function first parameter value) is superior or equal to the "base" (human function third parameter value) AND
         while (x>=base && length(s)>1)
               {x/=base; s=substr(s,2)}
         s=substr(s,1,1)

         xf=(pad=="yes") ? ((s=="B")?"%5d   ":"%8.2f") : ((s=="B")?"%d":"%.2f")
         s=(s!="B") ? (s basesuf) : ((pad=="no") ? s : ((basesuf=="iB")?(s "  "):(s " ")))

         return sprintf( (xf " %s\n"), x, s)
      }
      BEGIN{print human(bytes, pad, base)}')

    printf "%s" "$BYTESTOHUMAN_RESULT";

    return 0;
}

# function BU.Main.Echo.Newline { local iterations="$1"; for ((i=0; i<iterations; i++)); do echo -e "" | tee -a "${__BU_MAIN_FULL_FILE_PATH}"; done; }
function CatBU { cat "$1" | tee -a "${__BU_MAIN_FULL_FILE_PATH}" || { echo "UNABLE TO DISPLAY THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }
function EchoBU { echo -e "# $1" | tee -a "${__BU_MAIN_FULL_FILE_PATH}" || { echo "UNABLE TO WRITE THE $1 FILE'S CONTENT ! Please check its path and if it exists."; exit 1; }; }

if [ ! -f "${__BU_MAIN_FULL_FILE_PATH}" ]; then
	touch "${__BU_MAIN_FULL_FILE_PATH}";
fi

if [ -s "${__BU_MAIN_FULL_FILE_PATH}" ]; then
	true > "${__BU_MAIN_FULL_FILE_PATH}";
fi

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

# Path of the modules initialization script's configuration files.
for i in "$__BU_MODULE_INIT_CONFIGS_PATH/"*.conf; do
    # BU.Main.Echo.Newline '2';
    EchoBU "${i^^}";

    #BU.Main.Echo.Newline "1"';
    CatBU "$i";
done

# Path of the modules initialization script's translations files.
for i in "$__BU_MODULE_INIT_TRANSLATIONS_PATH/"*.locale; do
    # BU.Main.Echo.Newline '2';
    EchoBU "${i^^}";

    #BU.Main.Echo.Newline "1"';
    CatBU "$i";
done

# Processing the modules initializer file.
EchoBU "$HOME/Bash-utils-init.sh"; # BU.Main.Echo.Newline '1';
CatBU "$HOME/Bash-utils-init.sh";

# Processing the function files.
for i in "${__BU_ROOT_PATH}/lib/functions/main/"*.lib; do
	# BU.Main.Echo.Newline '2';
    EchoBU "${i^^}";

    #BU.Main.Echo.Newline "1"';
    CatBU "$i";
done

# Processing the modules configuration files.
for i in "$HOME/.Bash-utils/config/modules/main/"*.conf; do
	# BU.Main.Echo.Newline '2';
    EchoBU "${i^^}";

    # BU.Main.Echo.Newline "1"';
    CatBU "$i";
done

# Processing the modules files.
for i in "$HOME/.Bash-utils/modules/main/"*; do
	# BU.Main.Echo.Newline '2';
    EchoBU "${i^^}";

    # BU.Main.Echo.Newline "1"';
    CatBU "$i";
done

# Processing the remaining files.
# Nothing to process for now.

PrintLine;

echo "Library statistics :"; echo;

echo "Size in bytes           : $(BytesToHuman "$(wc -c < "${__BU_MAIN_FULL_FILE_PATH}")" '' 1000)";
echo "Number of characters    : $(wc -m < "${__BU_MAIN_FULL_FILE_PATH}") characters";
echo "Number of lines         : $(wc -l < "${__BU_MAIN_FULL_FILE_PATH}") lines";
echo "Maximum display width   : $(wc -L < "${__BU_MAIN_FULL_FILE_PATH}") columns";
echo "Number of words         : $(wc -w < "${__BU_MAIN_FULL_FILE_PATH}") words";

# Deleting the empty lines if the awaited value is passed as script's second argument.
if [ "${__BU_ARG_DEL_EMPTY_LINES,,}" == 'rmlines' ]; then
    echo;

    cat "${__BU_MAIN_FULL_FILE_PATH}" | sed '/^[[:space:]]*$/d' > "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES";

    PrintLine;

    echo "Library statistics (without newlines) :"; echo;

    echo "Size in bytes           : $(BytesToHuman "$(wc -c < "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES")" '' 1000)";
    echo "Number of characters    : $(wc -m < "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES") characters";
    echo "Number of lines         : $(wc -l < "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES") lines";
    echo "Maximum display width   : $(wc -L < "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES") columns";
    echo "Number of words         : $(wc -w < "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES") words";
fi

# Deleting the comments in the "${__BU_MAIN_FULL_FILE_PATH}" file that are not on the same line as a piece of code, if the awaited value is passed as script's third argument.
if [ "${__BU_ARG_DEL_LINE_COMMENTS,,}" == 'rmcomments-base' ]; then
    echo;

    if [ -f "${__BU_MAIN_FULL_FILE_PATH}" ]; then
        cat "${__BU_MAIN_FULL_FILE_PATH}" | sed '/^#/d' < "${__BU_MAIN_FULL_FILE_PATH}" > "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE";

        rm "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES";

        PrintLine;

        echo "Library statistics (with empty lines and without line comments) :"; echo;

        echo "Size in bytes           : $(BytesToHuman "$(wc -c < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE")" '' 1000)";
        echo "Number of characters    : $(wc -m < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE") characters";
        echo "Number of lines         : $(wc -l < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE") lines";
        echo "Maximum display width   : $(wc -L < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE") columns";
        echo "Number of words         : $(wc -w < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE") words";
    fi
fi

# Deleting the comments in the "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES" file that are not on the same line as a piece of code, if the awaited value is passed as script's third argument.
if [ "${__BU_ARG_DEL_LINE_COMMENTS,,}" == 'rmcomments-lines' ]; then
    echo;

    if [ -f "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES" ]; then
        cat "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES" | sed '/^#/d' < "${__BU_MAIN_FULL_FILE_PATH}" > "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES";

        rm "${__BU_MAIN_FULL_FILE_PATH}";

        PrintLine;

        echo "Library statistics (without empty lines and line comments) :"; echo;

        echo "Size in bytes           : $(BytesToHuman "$(wc -c < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES")" '' 1000)";
        echo "Number of characters    : $(wc -m < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES") characters";
        echo "Number of lines         : $(wc -l < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES") lines";
        echo "Maximum display width   : $(wc -L < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES") columns";
        echo "Number of words         : $(wc -w < "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES") words";
    fi

fi

# Deleting the generated file if the awaited value is passed as script's first argument.
if [ "${__BU_ARG_RM,,}" == 'rm' ]; then
    if rm "${__BU_MAIN_FULL_FILE_PATH}"; then
        echo ; echo "The generated « $__BU_MAIN_FULL_FILE_PATH » file was successfully deleted";
    else
        echo >&2; echo "Unable to delete the generated « $__BU_MAIN_FULL_FILE_PATH » file" >&2; exit 1;
    fi

    if [ -f "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES" ]; then if rm "$__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES"; then
        echo; echo "The generated « $__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES » file was successfully deleted";
    else
        echo >&2; echo "Unable to delete the generated « $__BU_MAIN_FULL_FILE_PATH_NO_EMPTYLINES » file" >&2; exit 1;
    fi; fi

    if [ -f "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE" ]; then if rm "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE"; then
        echo; echo "The generated « $__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE » file was successfully deleted";
    else
        echo >&2; echo "Unable to delete the generated « $__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__BASE » file" >&2; exit 1;
    fi; fi

    if [ -f "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES" ]; then if rm "$__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES"; then
        echo; echo "The generated « $__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES » file was successfully deleted";
    else
        echo >&2; echo "Unable to delete the generated « $__BU_MAIN_FULL_FILE_PATH_NO_LINE_COMMENTS__NO_LINES » file" >&2; exit 1;
    fi; fi
fi

exit 0;
