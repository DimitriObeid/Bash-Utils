# 
# /home/dimob/Projets/Bash-utils/config/projectStatus.conf
#!/usr/bin/env bash

# These status variables can be changed anywhere in the main script, except for the following variables :
#   - __STAT_DEBUG      -> This variable is used as (...).


# Project's debug variable

# This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__STAT_DEBUG="false"


# Project's error handling

# This variable accepts "fatal" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_ERROR=""


# Project's exit code

# This variable only accepts an integer.
# Default value : "1"
# shellcheck disable=SC2034
__STAT_EXIT_CODE="1"


# Project's main log file informations

# This variable only accepts "true" or "false" as values.
# Default value : "true"
# shellcheck disable=SC2034
__STAT_LOG="true"


# Project's main log file redirections status

# This variables accepts "log", "tee" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_LOG_REDIRECT=""


# Project's authorization to operate at the root directory or one of its sub-folders

# This variable accepts "authorized", "forbidden" or "restricted" as values.
# Default value : "forbidden" (by security).
# shellcheck disable=SC2034
__STAT_OPERATE_ROOT="forbidden"


# Project's messages display time

#This variable accepts any integer of floating number.
# Default value : ".5"
# shellcheck disable=SC2034
__STAT_TIME_TXT=".5"


# Project's handling text formatting

# This variable accepts "true" or "false" as value.
# Default value : "true"
# shellcheck disable=SC2034
__STAT_TXT_FMT="true"


# User's operating system (getting user's OS is important for OS-dependent processings, like package management)

# This variable will be completed with the "CheckSupportedOSType" function.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_USER_OS=""
# /home/dimob/Projets/Bash-utils/config/colors.conf
#!/usr/bin/env bash

# This configuration file stores color codes.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### FUNCTIONS DEFINTION

## COLOR CODES

# Writing the color code into a file, to be processed by any function which needs to know what is the current text color.
function WriteTextColor()
{
	#***** Parameters *****
	# $1 --> Color code

	#***** Code *****
	if CheckFmt; then
        if command -v tput &> /dev/null; then
            tput setaf "$1" && __BU_PROJECT_COLOR_CODE="$1"
        else
            echo -e "\e[38;5;$1m"
        fi
    else
        return 1
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### COLOR ENCODING

## COLOR CODES FOR ENCODING
__BU_COLOR_CODE_BLACK='0'
__BU_COLOR_CODE_BLUE='4'
__BU_COLOR_CODE_CYAN='6'
__BU_COLOR_CODE_GRAY="244"
__BU_COLOR_CODE_GREEN='82'
__BU_COLOR_CODE_ORANGE='166'
__BU_COLOR_CODE_PINK='200'
__BU_COLOR_CODE_PURPLE='165'
__BU_COLOR_CODE_RED='196'
__BU_COLOR_CODE_TURQUOISE='51'
__BU_COLOR_CODE_WHITE='15'
__BU_COLOR_CODE_YELLOW='226'

# -----------------------------------------------

## COLOR CODES FOR SPECIFIC TEXT DISPLAY, PRINTED AND REDIRECTED WITH THE "WriteTextColor" FUNCTIONS, THEN ENCODED WITH THE "tput" COMMAND

# Error text display color				| Default color : "196"	(red)
__BU_COLOR_CODE_ERROR="$(WriteTextColor "196")"

# Highlighted text display color		| Default color : "6"	(cyan)
__BU_COLOR_CODE_HIGHLIGHT="$(WriteTextColor "6")"

# Reset color to terminal's default text color | Always "tput sgr0"
__BU_COLOR_CODE_RESET="$(tput sgr0)"

# Success text display color			| Default color : "82"	(green)
__BU_COLOR_CODE_SUCCESS="$(WriteTextColor "82")"

# Warning text display color			| Default color : "226"	(yellow)
__BU_COLOR_CODE_WARNING="$(WriteTextColor "226")"

# -----------------------------------------------

## ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "WriteTextColor" FUNCTIONS

# Encodage des couleurs (codes de la commande "tput setaf") pour mieux lire les étapes de l'exécution du script.
__BU_COLOR_BLACK="$(WriteTextColor "$__BU_COLOR_CODE_BLACK")"       # Black
__BU_COLOR_BLUE="$(WriteTextColor "$__BU_COLOR_CODE_BLUE")"       	# Deep blue
__BU_COLOR_CYAN="$(WriteTextColor "$__BU_COLOR_CODE_CYAN")"       	# Cyan blue
__BU_COLOR_GRAY="$(WriteTextColor "$__BU_COLOR_CODE_GRAY")"         # Gray
__BU_COLOR_GREEN="$(WriteTextColor "$__BU_COLOR_CODE_GREEN")"     	# Light green
__BU_COLOR_ORANGE="$(WriteTextColor "$__BU_COLOR_CODE_ORANGE")"   	# Orange
__BU_COLOR_PINK="$(WriteTextColor "$__BU_COLOR_CODE_PINK")"         # Pink
__BU_COLOR_PURPLE="$(WriteTextColor "$__BU_COLOR_CODE_PURPLE")"		# Purple
__BU_COLOR_RED="$(WriteTextColor "$__BU_COLOR_CODE_RED")"	      	# Light red
__BU_COLOR_TURQUOISE=$(WriteTextColor "$__BU_COLOR_CODE_TURQUOISE") # Turquoise
__BU_COLOR_WHITE="$(WriteTextColor "$__BU_COLOR_CODE_WHITE")"       # White
__BU_COLOR_YELLOW="$(WriteTextColor "$__BU_COLOR_CODE_YELLOW")"		# Light yellow

__BU_COLOR_ERROR="$__BU_COLOR_CODE_ERROR"							# Error text display color
__BU_COLOR_HIGHLIGHT="$__BU_COLOR_CODE_HIGHLIGHT"					# Highlighted text display color
__BU_COLOR_RESET="$__BU_COLOR_CODE_RESET"							# Reset color to terminal's default text color
__BU_COLOR_SUCCESS="$__BU_COLOR_CODE_SUCCESS"						# Success text display color
__BU_COLOR_WARNING="$__BU_COLOR_CODE_WARNING"						# Warning text display color

# -----------------------------------------------
# /home/dimob/Projets/Bash-utils/config/text.conf
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### TEXT PROCESSING

## COLUMNS

# Get the columns number on the terminal according to its window's lenght
__BU_TXT_COLS="$(tput cols)"

# -----------------------------------------------

## PRINTING CHARACTERS

# Caractère utilisé pour dessiner les lignes des headers. Si vous souhaitez mettre un autre caractère à la place d'un tiret, changez le caractère entre les double guillemets.
# Ne mettez pas plus d'un caractère si vous ne souhaitez pas voir le texte de chaque header apparaître entre plusieurs lignes (une ligne de chaque caractère).
__BU_TXT_PRINT_HEADER_LINE_CHAR="-"		# Caractère à afficher en boucle pour créer une ligne des headers de changement d'étapes.


# Affichage de chevrons avant une chaîne de caractères (par exemple).
__BU_TXT_PRINT_TAB=">>>>"

# -----------------------------------------------

## TEXT FORMATTING

# Blink
__BU_TXT_FMT_BLINK="$(CheckFmt 'blink' '5')"
__BU_TXT_FMT_BLINK_RESET="$(CheckFmt 'sgr0' '25')"

# Bold
__BU_TXT_FMT_BOLD="$(CheckFmt 'bold' '1')"
__BU_TXT_FMT_BOLD_RESET="$(CheckFmt 'rmso' '21')"

# Dim
__BU_TXT_FMT_DIM="$(CheckFmt '' '2')"
__BU_TXT_FMT_DIM_RESET="$(CheckFmt '' '22')"

# Hidden (useful for password typing).
__BU_TXT_FMT_HIDDEN="$(CheckFmt '' '8')"
__BU_TXT_FMT_HIDDEN_RESET="$(CheckFmt '' '28')"

# Italic
__BU_TXT_FMT_ITALIC="$(CheckFmt 'sitm' '3')"
__BU_TXT_FMT_ITALIC_RESET=$(CheckFmt 'ritm' '23')

# Reset
__BU_TXT_FMT_RESET="$(CheckFmt 'sgr0' '0')"

# Strikethrough
__BU_TXT_FMT_STRIKETHROUGH="$(CheckFmt '' '9')"
__BU_TXT_FMT_STRIKETHROUGH_RESET="$(CheckFmt '' '29')"

# Underline
__BU_TXT_FMT_UNDERLINE="$(CheckFmt 'smul' '4')"
__BU_TXT_FMT_UNDERLINE_RESET="$(CheckFmt 'rmul' '24')"

# -----------------------------------------------
# /home/dimob/Projets/Bash-utils/config/time.conf
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### DATE

## GETTING THE DATE
# Saving the current date in YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second)
__BU_TIME_DATE=$(date +"%Y-%m-%d %Hh-%Mm-%Ss")

# -----------------------------------------------

## PRINTING THE DATE
# Displaying the current date YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second) with a colored text (for a better view in the log file).
__BU_TIME_DATE_DISPLAY=$(printf "$(tput setaf 78)[ $(tput setaf 111)$__BU_TIME_DATE $(tput setaf 78) ]$(tput sgr0)")
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/CASE.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### LIBRARY RESOURCES

## VARIABLES

__CASE_INVALID_ANSWER="Please enter a valid answer ($(DechoHighlight 'yes') or ($(DechoHighlight 'no')) !"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### READING CASE STATEMENTS BY FUNCTIONS

## "Checkings.lib" FILE

# "TriggerRootDirWarning" function.
function CaseRead_TriggerRootDirWarning()
{
	# shellcheck disable=SC2154
	case "${__read_TriggerRootDirWarning,,}" in
		"yes")
			;;
		"no")
			;;
		*)
			EchoError "$__CASE_INVALID_ANSWER"
			CaseRead_TriggerRootDirWarning
			;;
	esac
}

# "HandleErrors" function.
function CaseRead_HandleErrors()
{
	# shellcheck disable=SC2154
	case "${__read_HandleErrors,,}" in
		"yes")
			EchoNewstep "Resuming the execution of the $(DechoHighlight "$__BU_PROJECT_NAME") script."
			;;
		"no")
			EchoError "Aborting the $(DechoHighlight "$__BU_PROJECT_NAME")'s execution."
			;;
		*)
			EchoError "$__CASE_INVALID_ANSWER"
			CaseRead_HandleErrors
			;;
	esac
}
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/CHECKARGSMAIN.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### ARGUMENT VALUES CHECKING : UTILITES FUNCTIONS

## ARGUMENT PRESENCE CHECKING

# Checking if an argument is provided (like in the "Is..." functions (check the below "VARIABLES VALUES CHECKING" section for more informations)).
function CheckArgsMain_IsArgcNot0()
{
    if [ "$#" -eq 0 ]; then
        HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    fi
}

# -----------------------------------------------

## PATH CHECKING FUNCTIONS

# Check if the script is about to work at the root directory ('/').
function TriggerRootDirWarning()
{
	#***** Parameters *****
	p_path=$1

	#***** Code *****
	# Checking if the given path points towards the root directory or one of its subfolders
	# TODO : detecting if path points to a root sub-folder (like [ if "$p_path" = "/" ] || [ "$p_path" | cut blablabla ]).
	if [ "$p_path" = "/" ] || [ "$(GetParentDirectoryPath "$p_path")" = '/' ]; then
		if [ "$__STAT_OPERATE_ROOT" = "forbidden" ]; then
			EchoError "WARNING !!!!!! READ THIS MESSAGE CAREFULLY !!!!!!"
			EchoError "The script was trying to operate at the root directory (or one of its sub directories) without authorization"
			EchoError "Given path : $(DechoHighlight "$p_path")"
			Newline

			ExitError
		elif [ "$__STAT_OPERATE_ROOT" = "restricted" ]; then
			EchoWarning "WARNING !!!!!!! DO NOT SKIP THIS MESSAGE BEFORE READING IT CAREFULLY !!!!!!"
			EchoWarning "You are about to operate at the root directory or one of its present sub-folders !"
			EchoWarning "Given path : $(DechoHighlight "$p_path")"
			Newline
				
			EchoWarning "Do you want to continue the script's execution ? (yes / no)"
			read -rp "Enter your answer : " __read_TriggerRootDirWarning
			EchoRead "$__read_TriggerRootDirWarning"
			Newline

			# Calling the function that processes the given answer.
			CaseRead_TriggerRootDirWarning
		fi
	fi
}

# -----------------------------------------------

## QUICK MESSAGE PRINTING

# Print a message without the need to write the whole "HandleErrors()" function's second argument, and according to the test option which failed :
#   - z     : no value
#   - !d    : bad directory path argument
#   - !f    : bad file path argument
function __CheckArgsMain_PrintBadOption()
{
    #***** Parameters *****
    local p_option=$1   # Test option.
    local p_advice=$2   # "HandleErrors()"'s advice argument.
    local p_argname=$3  # Name of the parameter that stores the argument.
    local p_value=$4    # "HandleErrors()"'s value argument.
    local p_funcname=$5 # Name of the function where the test failed.
    local p_lineno=$6   # Line where the test failed.

    #***** Code *****
    if [ "$p_option" = 'z' ]; then
        # shellcheck disable=SC2116
		HandleErrors "1" "THE $(KeepFormatting "$(CutCheck "$p_funcname")'s") $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER HAS NO VALUE" \
            "$p_advice" "$p_value" "$(basename "${BASH_SOURCE[0]}")" "$(CutCheck "$p_funcname")" "$p_lineno"

    elif [ "$p_option" = '!d' ]; then
        # shellcheck disable=SC2116
        HandleErrors "1" "THE $(KeepFormatting "$(CutCheck "$p_funcname")'s") $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS INCORRECT" \
            "$p_advice" "$p_value" "$(basename "${BASH_SOURCE[0]}")" "$(CutCheck "$p_funcname")" "$p_lineno"

    elif [ "$p_option" = '!f' ]; then
        # shellcheck disable=SC2116
        HandleErrors "1" "THE $(KeepFormatting "$(CutCheck "$p_funcname")'s") $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS INCORRECT" \
            "$p_advice" "$p_value" "$(basename "${BASH_SOURCE[0]}")" "$(CutCheck "$p_funcname")" "$p_lineno"
    fi
}

# -----------------------------------------------

## TEXT FORMATING FUNCTIONS

# Cut the text of the function's name before and with the underscore.
function CutCheck()
{
	#shellcheck disable=SC2001
	sed 's/^[^_]*_//' <<< "$1"
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Directories.lib" FILE'S FUNCTION

## "Directories.lib" FILE'S FUNCTIONS - DIRECTORIES PROCESSING CATEGORY

# "ProcessingDir" function.
function CheckArgsMain_ProcessingDir()
{
    #***** Parameters *****
    local p_function=$1
    local p_parent=$2
    local p_name=$3

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_function" ]; then
        __CheckArgsMain_PrintBadOption 'z' "The function $(CutCheck "$(DechoHighlight "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
            'p_function' "$p_function" "${FUNCNAME[0]}" "$lineno"

    local lineno="$LINENO"; elif [ -z "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass a valid parent directory path as second argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

    local lineno="$LINENO"; elif [ -z "$p_name" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the name of the folder to process as third argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "OverwriteDir" function.
function CheckArgsMain_OverwriteDir()
{
    #***** Parameters ****
    local p_path=$1         # Path of the directory to overwrite.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

    # Else, if the given folder path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_path" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "Makedir" function.
function CheckArgsMain_Makedir()
{
    #***** Parameters *****
    local p_parent=$1       # Parent folder's path.
    local p_name=$2         # Name of the folder to create.

    #***** Code *****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z  "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption 'z' "" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption '!d' "" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

    # Else, if the folder's name is missing (no name is given).
    local lineno="$LINENO"; elif [ -z "$p_name" ]; then
		__CheckArgsMain_PrintBadOption 'z' "" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------

## "Directories.lib" FILE'S FUNCTIONS - PATH PROCESSING CATEGORY

# "GetDirectoryName" function.
function CheckArgsMain_GetDirectoryName()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "The $(CutCheck "$(DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "${FUNCNAME[0]}" "$lineno"
    fi
}

# "GetDirectoryPath" function.
function CheckArgsMain_GetDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "The $(CutCheck "$(DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "GetParentDirectoryName" function.
function CheckArgsMain_GetParentDirectoryName()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"
    local lineno="$LINENO"; if ! IsInt "$p_iterations"; then
        __CheckArgsMain_PrintBadOption '' "" 'p_iterations' "$p_iterations" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "GetParentDirectoryPath" function.
function CheckArgsMain_GetParentDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"
    local lineno="$LINENO"; if ! IsInt "$p_iterations"; then
        __CheckArgsMain_PrintBadOption '' "" 'p_iterations' "$p_iterations" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Lang.lib" FILE'S FUNCTIONS

## PARSING FUNCTIONS CATEGORY

#
function CheckArgsMain_ParseCSVLang()
{
    #***** Parameters *****
    local p_path=$1               # Path of the translations CSV file to parse.
    local p_lang=$2               # Language to fetch.
    local p_success_msg=$3        # Success message to display in the targeted language.
    local p_error_msg=$4          # Error message to display in the targeted language.

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

    local lineno="$LINENO"; elif [ ! -f "$p_path" ]; then
        __CheckArgsMain_PrintBadOption '!f' "Please pass the valid path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

    local lineno="$LINENO"; elif [ -z "$p_lang" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the <...> of the language to fetch as argument" 'p_lang' "$p_lang" "${FUNCNAME[0]}" "$lineno"

    ## TODO : Add a fail-safe if the targeted language is not found.

    local lineno="$LINENO"; elif [ -z "$p_success_msg" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the success message of your language as third argument" 'p_success_msg' "$p_success_msg" "${FUNCNAME[0]}" "$lineno"

    local lineno="$LINENO"; elif [ -z "$p_error_msg" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the error message of your language as forth argument" 'p_error_msg' "$p_error_msg" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Files.lib" FILE'S FUNCTIONS

## TEXT FILE PROCESSING CATEGORY

# "ProcessingFile" function.
function CheckArgsMain_ProcessingFile()
{
    #***** Parameters *****
    local p_function=$1     # 

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_function" ]; then
		__CheckArgsMain_PrintBadOption 'z' "Please pass a valid file processing function as first argument" 'p_function' "$p_function" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "OverwriteFile" function.
function CheckArgsMain_OverwriteFile()
{
    #***** Parameters ****
    local p_path=$1         	# Path of the file to overwrite.
	local p_authorization=$2	# Authorization to overwrite the file.

    #***** Code *****
    # If the target file's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

    # Else, if the given file path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_path" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"
			
	local lineno="$LINENO"; elif [ -z "$p_authorization" ]; then
		__CheckArgsMain_PrintBadOption 'z' "Please enter a valid value for the overwrite authorization as second argument" 'p_authorization' "$p_authorization" "${FUNCNAME[0]}" "$lineno" 
    fi
}

# "Makefile" function's arguments.
function CheckArgsMain_Makefile()
{
    #***** Parameters *****
    local p_parent=$1       # File to create's Parent folder path. 
    local p_name=$2         # Name of the file to create.

    #***** Code *****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the new directory's parent folder as first argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass a valid parent directory path as first argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

    # Else, if the file's name is missing (no name is given).
    local lineno="$LINENO"; elif [ -z "$p_name" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the name of the folder to create as second argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/CHECKINGS.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### VARIABLES VALUES CHECKING

## NUMBER VALUES

# Checking floating value.
function IsFloat()
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgsMain_IsArgcNot0 "$p_value"

    if [[ "$p_value" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking floating and integer value.
function IsFloatInt()
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgsMain_IsArgcNot0 "$p_value"

    if [[ "$p_value" =~ ^([0-9]+\.?|[0-9]*\.[0-9]+)$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking integer value.
function IsInt()
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgsMain_IsArgcNot0 "$p_value"

    if [[ "$p_value" =~ ^[+-]?[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------

## STRING VALUES

# Checking if value is an alphabetic string (not any number allowed)
function IsAlpha()
{
    #***** Parameters *****
    local p_value=$1
    
    #***** Code *****
    CheckArgsMain_IsArgcNot0 "$p_value"

    if [[ "$p_value" =~ [A-Z] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if vialue is an aplhanumeric string.
function IsAlphaNum()
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgsMain_IsArgcNot0 "$p_value"

    if [[ "$p_value" =~ [^a-zA-Z0-9\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DIFFERENT CHECKINGS

## CHECKING FOR IDENTIFIANTS

# Checking if the current effective UID (EUID) is not equal to 0 (root user's EUID).

# Required functions and files :
#   - HandleErrors      --> From this file.
function CheckRootEUID()
{
    if [ "$EUID" -ne 0 ]; then
        HandleErrors "1" "YOU NEED ROOT USER'S PRIVILEGES TO PERFORM THIS ACTION !" "Please launch your script with super-user privileges." \
            "EUID = 0" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
    fi
}

# -----------------------------------------------

## INITIALIZATION CHECKINGS

# Checking if the library is into its initialization process.
function CheckInitialization()
{
    if [ "$__INIT_IS_INITIALIZING" = "true" ]; then
        return 0
    else
        return 1
    fi
}


# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PATHS CHECKING

## DIRECTORIES PATHS CHECKING

# Checking for an existent directory path (for the "HandleErrors()" function mainly).
function CheckDirPathExists()
{
    #***** Parameters *****
    p_path=$1               # Path of the (in)existent directory.

    #***** Code *****
    if [ ! -f "$p_path" ]; then
        Decho_FMT_BoldI "<missing directory path>"
    fi
}

# -----------------------------------------------

## FILE PATHS CHECKING

# Checking for an existent file path (for the "HandleErrors()" function mainly).
function CheckFilePathExists()
{
    #***** Parameters *****
    p_path=$1               # Path of the (in)existent file.

    #***** Code *****
    if [ ! -f "$p_path" ]; then
        Decho_FMT_BoldI "<missing file path>"
    fi
}

# Checking for "$PROJECT_LOG_PATH"

# Required functions and files :
function CheckProjectLogPath()
{
    if [ -z "$__BU_PROJECT_LOG_FILE_PATH" ]; then
        echo -ne "${__BU_COLOR_ERROR}IN $(DechoHighlight "$(basename "${BASH_SOURCE[0]}")"), function $(DechoHighlight "${FUNCNAME[0]}"), LINE $(DechoHighlight "$(( LINENO-1 ))") --> " >&2
        echo -e "FATAL ERROR : NO PATH PROVIDED INTO THE $(DechoHighlight "PROJECT_LOG_PATH") VARIABLE" >&2
        echo -e "Please add the path as argument.${__BU_COLOR_RESET}" >&2; echo >&2
        ExitError

    elif [ ! -f "$__BU_PROJECT_LOG_FILE_PATH" ]; then
        echo -ne "${__BU_COLOR_ERROR}IN $(DechoHighlight "$(basename "${BASH_SOURCE[0]}")"), FUNCTION $(DechoHighlight "${FUNCNAME[0]}"), LINE $(DechoHighlight "$(( LINENO-1 ))") --> " >&2
        echo -e "FATAL ERROR : BAD PATH PROVIDED INTO THE $(DechoHighlight "PROJECT_LOG_PATH") VARIABLE" >&2
        echo -e "Please correct the path passed as argument.${__BU_COLOR_RESET}" >&2; echo >&2
        ExitError

    fi
}

# Checking for project's log file's status, then write the wanted text with 'echo' command's parameters.

# Accepted arguments : "nodate", '<an empty string>'
function CheckProjectLogStatus()
{
    #***** Parameters *****
    local p_string=$1       # String to display.
    local p_option=$2       # "echo" command options.
    shift 2

    local p_extraArgs=("$@")    # More processing arguments (like the processing of a whole line-long string).

    #***** Variables *****
    local v_errorEcho
		v_errorEcho="${__BU_COLOR_ERROR}Unable to write into the $(DechoHighlight "$__BU_PROJECT_LOG_FILE_PATH") file.${__BU_COLOR_RESET}"
	
	local v_warning_array_value
		v_warning_array_value="${__BU_COLOR_WARNING}Warning : incorrect argument given as extra argument array in $(DechoHighlight "${BASH_SOURCE[0]}"), function $(DechoHighlight "${FUNCNAME[0]}") --> $val${__BU_COLOR_RESET}"
    
    #**** Code *****
    CheckProjectLogPath
    CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    # If a log file exists AND if "$__STAT_LOG" value is "false" AND if "$__STAT_LOG_REDIRECT" has a redirection value.
    if [ -f "$__BU_PROJECT_LOG_FILE_PATH" ] && [ "$__STAT_LOG" = "true" ] && [ -n "$__STAT_LOG_REDIRECT" ]; then

        # If messages must be redirected in the log file only ("$__STAT_LOG_REDIRECT" value is equal to "log")
        if [ "$__STAT_LOG_REDIRECT" = "log" ]; then

            for val in "${p_extraArgs[@]}"; do

                # If the "nodate" value is passed as argument.
                if [ "$val" = "nodate" ]; then
                    case "$p_option" in
                        '-n')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$p_string")
                            else
                                echo -ne "$p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }                            
                            fi
                            ;;
                        '')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$p_string")
                            else
                                echo -e "$p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }                            
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$p_extraArgs" parameter array.
                elif [ "$val" = '' ]; then
                    case "$p_option" in
                        '-n')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                            else
                                echo -ne "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                        '')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                            else
                                echo -e "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                    esac
                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${p_extraArgs[@]}"; do) is still running (for the "log" option)).
                else
                    case "$p_option" in
                        '-n')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            else
                                echo -ne "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                        '')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            else
                                echo -e "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                    esac
                fi

            done

        # Else, if messages must be redirected in the log file AND to the terminal ("$__STAT_LOG_REDIRECT" value is equal to "tee")
        elif [ "$__STAT_LOG_REDIRECT" = "tee" ]; then

            for val in "${p_extraArgs[@]}"; do

                # If the "nodate" value is passed as argument.
                if [ "$val" = "nodate" ]; then
                    case "$p_option" in
                        '-n')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$p_string")
                            else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                        '')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$p_string")
                            else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$p_extraArgs" parameter array.
                elif [ "$val" = '' ]; then
                    case "$p_option" in
                    '-n')
                        if CheckInitialization; then
                            __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                        else
                            echo -ne "$p_string"
                            echo -ne "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        fi
                        ;;
                    '')
                        if CheckInitialization; then
                            __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                        else
                            echo -e "$p_string"
                            echo -e "$__BU_TIME_DATE_DISPLAY $p_string" >> "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        fi
                        ;;
                    esac

                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${p_extraArgs[@]}"; do) is still running (for the "tee" option)).
                else
                    case "$p_option" in
                        '-n')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                        '')
                            if CheckInitialization; then
                                __INIT_STR_ARRAY+=("$__BU_TIME_DATE_DISPLAY $p_string")
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                CheckProjectLogStatus "$v_warning_array_value" '-n' '' 2>&1 | tee -a "$__BU_PROJECT_LOG_FILE_PATH" || { echo >&2; echo -e "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                            fi
                            ;;
                    esac
                fi
            done
            
            sleep "$__STAT_TIME_TXT"
        fi

    # Else, if no log file exists OR if "$__STAT_LOG" value is "false" OR if "$__STAT_LOG_REDIRECT" has no redirection value. 
    else
        case "$p_option" in
			'-n')
				echo -ne "$p_string"
				;;
			'')
				echo -e "$p_string"
				;;
		esac

        sleep "$__STAT_TIME_TXT"
	fi
}

# Check project related file presence, or create this file.
function CheckProjectRelatedFile()
{
	#***** Parameters *****
	p_path=$1

	#***** Code *****
	if [ -f "$p_path" ]; then
        if [ -s "$p_path" ]; then
            true > "$p_path"
        fi
    else
        if [ ! -d "$(GetParentDirectoryPath "$p_path")" ]; then
            EchoNewstep "Creating the $(DechoHighlight "$(GetParentDirectoryPath "$p_path")") temporary folder."

            mkdir -p "$(GetParentDirectoryPath "$p_path")" || HandleErrors "$?" "UNABLE TO CREATE THE $(DechoHighlight "$(GetParentDirectoryPath "$p_path")") FOLDER !" "" "$(GetParentDirectoryPath "$p_path")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"

            EchoSuccess "Successfully created the $(DechoHighlight "$(GetParentDirectoryPath "$p_path")") parent folder."
        fi

        EchoNewstep "Creating the $(DechoHighlight "$p_path") project's file."

        touch "$p_path"

        HandleErrors "$?" "UNABLE TO CREATE THE $(DechoHighlight "$p_path") PROJECT'S FILE !" "" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
            
        EchoSuccess "Successfully created the $(DechoHighlight "$p_path") project's file."
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### TEXT CHECKINGS

## FORMATTING CHECKINGS

# Checking if the project's color code file exists or not.
function CheckDecho()
{
    #***** Code *****
    if [ -z "${__BU_PROJECT_COLOR_CODE+x}" ] || [ "$__STAT_TXT_FMT" = "false" ]; then
        return 1

    elif [ -n "${__BU_PROJECT_COLOR_CODE+x}" ] && [ "$__BU_PROJECT_COLOR_CODE" = '' ]; then
        __BU_PROJECT_COLOR_CODE="$__BU_COLOR_RESET"
    else
        return 0
	fi
}

# Checking if the "$__STAT_TXT_FMT" status variable's value is "true".
function CheckFmt()
{
    if [ "$__STAT_TXT_FMT" = "true" ]; then
        # Formatting text with the tput command or directly with the backslash escapes.
        tput "$1" || echo -e "\e[$2m"
        
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ERRORS HANDLING FUNCTIONS

## EXIT HANDLING

# Handling exit command from sourced files, as it's impossible to properly exit the script from these.
function ExitError()
{
    # In case the "exit" command didn't worked, the program has to be killed.
    CheckSTAT_EXIT_CODE "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; exit "$__STAT_EXIT_CODE"; kill "$$"
}

# -----------------------------------------------

## SCRIPT'S ERRORS HANDLING

# Handling command outputs.
# Featured functions and files from the "basis" category :
#   - 
function HandleErrors()
{
	#***** Paramètres *****
	local p_returnCode=$1     # Return code of the last command executed. If you didn't launched any command before calling this function, you can pass any number different of '0' as first argument.
	local p_errorString=$2    # Chaîne de caractères du type d'erreur à afficher.
	local p_adviceString=$3   # Chaîne de caractères affichants un conseil pour orienter l'utilisateur vers la meilleure solution en cas de problème.
    local p_badValue=$4       # Incorrect value which caused the error.
	local p_file=$5           # The name of the file where the error occured.
	local p_function=$6       # The name of the function where the error occured.
	local p_lineno=$7         # Ligne à laquelle le message d'erreur s'est produite.

    #***** Variables *****
    local v_hdrString
	
	if [ -n "$p_function" ]; then
		v_hdrString="$(echo -e "IN $(DechoHighlight "$p_file"), FUNCTION $(DechoHighlight "$p_function"), LINE $(DechoHighlight "$p_lineno") -->")"
	else
		v_hdrString="$(echo -e "IN $(DechoHighlight "$p_file"), LINE $(DechoHighlight "$p_lineno") -->")"
	fi

	# ***** Code *****
	CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	if [ "$p_returnCode" -eq 0 ]; then
        return
    else
        if [ "$__STAT_LOG_REDIRECT" = "log" ]; then
            __STAT_LOG_REDIRECT="tee"; CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi

        if [ -n "$__STAT_ERROR" ] && [ "$__STAT_ERROR" = "fatal" ]; then
            HeaderRed "$v_hdrString FATAL ERROR : ${p_errorString^^}" >&2
        else
            HeaderRed "$v_hdrString ERROR : ${p_errorString^^}" >&2
        fi

        if [ -z "$p_adviceString" ]; then
            EchoError "No advice to give."; Newline >&2
        else
            EchoError "$(DechoHighlight "Advice") : $p_adviceString" >&2; Newline >&2
        fi
            
        if [ -z "$p_badValue" ]; then
            EchoError "Value(s) that caused this error : $(DechoOrange 'no value') OR $(DechoOrange 'an unknown error')"; Newline >&2
        else
            EchoError "Value(s) that caused this error : $(DechoHighlight "$p_badValue")"; Newline >&2
        fi

        if [ "$__STAT_ERROR" = "fatal" ]; then
            EchoError "Stopping the execution of $(DechoHighlight "$(basename "$0")")."; Newline >&2
            ExitError "$__STAT_EXIT_CODE"
        else
			# Calling the function that processes the given answer.
			CaseRead_HandleErrors
        fi
    fi
}

# -----------------------------------------------

# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/CHECKSTAT.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### VARIABLES VALUES CHECKING

## HANDLINGS

# Easy writing text function.
function ConfEcho()
{
    #***** Parameters *****
    local p_file=$1;
    local p_lineno=$2;
    local p_badVal=$3;
    local p_varVal=$4

    # Shifting the same number of time as the former arguments number
    # to avoid including these arguments values in the allowed values array.
    shift 4
    local p_array=("$@")

    #***** Variables *****
    local i=0

    #***** Code *****
    echo >&2; echo -n "${__BU_COLOR_ERROR}$__BU_TXT_TAB$__BU_TXT_TAB In ${__BU_COLOR_HIGHLIGHT}$p_file${__BU_COLOR_ERROR}, line ${__BU_COLOR_HIGHLIGHT}$p_lineno${__BU_COLOR_ERROR} --> " >&2
    echo -e "Error : the ${__BU_COLOR_HIGHLIGHT}$p_varVal${__BU_COLOR_ERROR} variable's value is incorrect.${__BU_COLOR_RESET}" >&2

    if [ -z "$p_badVal" ]; then
        echo >&2; echo -e "${__BU_COLOR_ERROR}$__BU_TXT_TAB$__BU_TXT_TAB Bad value :${__BU_COLOR_YELLOW} An empty string.${__BU_COLOR_RESET}" >&2
    else
        echo >&2; echo -e "${__BU_COLOR_ERROR}$__BU_TXT_TAB$__BU_TXT_TAB Bad value : ${__BU_COLOR_HIGHLIGHT}$p_badVal.${__BU_COLOR_RESET}" >&2
    fi

    echo >&2; echo -e "${__BU_COLOR_ERROR}$__BU_TXT_TAB$__BU_TXT_TAB The allowed values are :${__BU_COLOR_RESET}" >&2

    # Displaying the list of every allowed arguments.
    for val in "${p_array[@]}"; do
        i=$(( i+1 ))

        # If an empty argument is allowed.
        if [ -z "$val" ]; then
            echo -e "${__BU_COLOR_ERROR}$i/${#p_array[@]}  --> ${__BU_COLOR_ORANGE}An empty argument.${__BU_COLOR_RESET}" >&2
        else
            echo -e "${__BU_COLOR_ERROR}$i/${#p_array[@]}  --> ${__BU_COLOR_HIGHLIGHT}$val${__BU_COLOR_RESET}" >&2
        fi
    done

    echo >&2; ExitError 1
}

# -----------------------------------------------

## CHECKINGS

# Checking the "$__STAT_DEBUG" status variable's value.
function CheckSTAT_DEBUG()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_DEBUG" != "true" ] && [ "$__STAT_DEBUG" != "false" ]; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_DEBUG" "__STAT_DEBUG" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_ERROR" status variable's value.
function CheckSTAT_ERROR()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("" "fatal")

    #***** Code *****
    if [ -n "$__STAT_ERROR" ] && [ "$__STAT_ERROR" != "fatal" ]; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_ERROR" "__STAT_ERROR" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_EXIT_CODE" status variable's value.
function CheckSTAT_EXIT_CODE()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("")

    #***** Code *****
    if ! IsInt "$__STAT_EXIT_CODE"; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_EXIT" "__STAT_EXIT" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_LOG" status variable's value.
function CheckSTAT_LOG()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_LOG" != "true" ] && [ "$__STAT_LOG" != "false" ]; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_LOG" "__STAT_LOG" "${a_array[@]}"

    elif [ "$__STAT_LOG" = "true" ] && [ ! -f "$__BU_PROJECT_LOG_FILE_PATH" ]; then
        
        if [ ! -d "$__BU_PROJECT_LOG_DIR_PATH" ]; then

            # Even if the initialization process is still ongoing, it's possible to call an "Echo<...>()" function,
            # as the text display in this condition is managed by the "CheckProjectLogStatus()" function.
			EchoNewstep "Creating the ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_LOG_DIR_PATH${__BU_COLOR_NEWSTEP} folder."

			mkdir -pv "$__BU_PROJECT_LOG_DIR_PATH" || { __STAT_TXT_FMT="false"; echo >&2; echo -e "${__BU_COLOR_ERROR}THE PROJECT'S TEMPORARY LOGS FOLDER CREATION FAILED" "" "$__BU_PROJECT_LOG_DIR_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"; echo >&2; exit 1; }
		fi

		echo -e "${__BU_COLOR_NEWSTEP}Creating the ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_LOG_FILE_PATH${__BU_COLOR_NEWSTEP} file.${BU_COLOR_RESET}"

		touch "$__BU_PROJECT_LOG_FILE_PATH" || { __STAT_TXT_FMT="false"; echo >&2; echo -e "${__BU_COLOR_ERROR}THE PROJECT'S LOG FILE CREATION FAILED" "" "$__BU_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"; echo >&2; exit 1; }

		if CheckInitialization; then
            # shellcheck disable=SC2034
            __INIT_IS_INITALIZING="false"
        fi
		
		# Redirecting the initializer's log file content into the log file.
		HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT"

		EchoNewstep "Sourced configuration files :"; for val in "${__INIT_CONFIG_FILES_PATH_ARRAY[@]}"; do EchoMsg "$val"; done; Newline
		EchoNewstep "Sourced library files : "; for val in "${__INIT_LIB_FILES_PATH_ARRAY[@]}"; do EchoMsg "$val"; done; Newline
		
		if [ -n "$__INIT_STR_ARRAY" ]; then
            EchoNewstep "Initialization log output :"; Newline

            for val in "${__INIT_STR_ARRAY[@]}"; do
                CheckProjectLogStatus "$val"
            done
		fi

		# Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Linux distribution.
		HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

		# Getting operating system family.
		EchoNewstep "Operating system family : $(DechoN "$OSTYPE")"
		Newline

		# Gathering OS informations from the "/etc/os-release" file.
		EchoNewstep "Operating system general informations :"
		EchoMsg "$(cat "/etc/os-release")" "" "nodate"
		Newline

		EchoNewstep "Bash version : $(DechoN "$BASH_VERSION")"
		Newline

		EchoSuccess "Successfully got the user's system's informations."

	fi
}

# Checking the "$__STAT_LOG_REDIRECT" status variable's value.
function CheckSTAT_LOG_REDIRECT()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("" "true" "false")

    #***** Code *****
    if [ -n "$__STAT_LOG_REDIRECT" ] && [ "$__STAT_LOG_REDIRECT" != 'log' ] && [ "$__STAT_LOG_REDIRECT" != 'tee' ]; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_LOG_REDIRECT" "__STAT_LOG_REDIRECT" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_OPERATE_ROOT" status variable's value.
function CheckSTAT_OPERATE_ROOT()
{
	#***** Parameters *****
	local p_file=$1
	local p_lineno=$2

	#***** Variables *****
	local a_array=("authorized" "forbidden" "restricted")

	#***** Code *****
	if [ "$__STAT_OPERATE_ROOT" != "authorized" ] && [ "$__STAT_OPERATE_ROOT" != "forbidden" ] && [ "$__STAT_OPERATE_ROOT" != "restricted" ]; then
		Confecho -e "$p_file" "$p_lineno" "$__STAT_OPERATE_ROOT" "__STAT_OPERATE_ROOT" "${a_array[@]}"
	fi
}

# Checking the "$__STAT_TIME_TXT" status variable's value.
function CheckSTAT_TIME_TXT()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("${__BU_COLOR_ORANGE}An integer or a floating number")

    #***** Code *****
    # If the status variable's value is not a float or an integer.
    if ! IsFloatInt "$__STAT_TIME_TXT"; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_TIME_TXT" "__STAT_TIME_TXT" "${a_array[@]}" >&2
    fi
}

# Checking the "$__STAT_TXT_FMT" status variable's value.
function CheckSTAT_TXT_FMT()
{
    #***** Parameters *****
    p_file=$1
    p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_TXT_FMT" != "true" ] && [ "$__STAT_TXT_FMT" != "false" ]; then
        Confecho -e "$p_file" "$p_lineno" "$__STAT_TXT_FMT" '__STAT_TXT_FMT' "${a_array[@]}"
    fi
}
# Checking the "$__STAT_USER_OS" status variable's value.
# This function is empty now, as the OS handling is still in work.
function CheckSTAT_USER_OS()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Code *****
    return
}


# Checking all the project's status variables values if multiple values had been modified.
function CheckProjectStatusVars()
{
    #***** Parameters *****
    local p_file=$1error
    local p_lineno=$2

    #***** Code *****
    # Processing first the "STAT_LOG_REDIRECT" variable, to make sure the following error messages will be correctly displayed if another error happened.
    CheckSTAT_LOG_REDIRECT  "$p_file" "$p_lineno"
    CheckSTAT_DEBUG         "$p_file" "$p_lineno"
    CheckSTAT_ERROR         "$p_file" "$p_lineno"
    CheckSTAT_TXT_FMT       "$p_file" "$p_lineno"
    CheckSTAT_EXIT_CODE     "$p_file" "$p_lineno"
	CheckSTAT_OPERATE_ROOT  "$p_file" "$p_lineno"
    CheckSTAT_LOG           "$p_file" "$p_lineno"
	CheckSTAT_OPERATE_ROOT  "$p_file" "$p_lineno"
    CheckSTAT_TIME_TXT      "$p_file" "$p_lineno"
}
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/DECHO.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TEXT WRITING AND DECORATION (FORMATTING)

## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT

# Quick multi commands execution for the below "Decho()" function.
function __Decho { local v_oldColor=$1; tput setaf "$v_oldColor" && IsInt "$v_oldColor" && echo -e "$v_oldColor" > "$__BASH_UTILS_FILE_COLOR_CODE_PATH"; }

# Text's inside decoration/formatting procssing.

# Featured functions and files from the "functions" folder :
#   - CheckDecho                        --> This file.
#       - 
function Decho()
{
    #***** Parameters *****
    local p_string=$1
    local p_newColor=$2
    shift 2

    local pa_formatting=$("$@")

    #***** Variables *****
    local v_oldColor

    #***** Code *****
    CheckDecho

    if [ "$?" -ne 0 ]; then
        echo -e " ' $p_string ' "
        
        return 1
    else
        local v_oldColor
            v_oldColor="$__BU_PROJECT_COLOR_CODE"
    fi

    if [ "$p_newColor" = "$v_oldColor" ]; then

        # TODO : Développer un meilleur système de changement de couleur (P-Ê en appelant une fonction à créer, ou en utilisant une formule mathématique). Se renseigner sur la commande "tput setaf".
		p_newColor="$(( p_newColor+38 ))"
		tput setaf "$p_newColor"
	fi

    #***** Code *****    
    for val in "${pa_formatting[@]^^}"; do
        case "$val" in
            'Blink')
                echo -ne "${__BU_TXT_FMT_BLINK}"
                ;;  
            'Bold')
                echo -ne "${__BU_TXT_FMT_BOLD}"
                ;; 
            'D')
                echo -ne "${__BU_TXT_FMT_DIM}"
                ;;
            'I')
                echo -ne "${__BU_TXT_FMT_ITALIC}"
                ;;
            'S')
                echo -ne "${__BU_TXT_FMT_STRIKETHROUGH}"
                ;;
            'U')
                echo -ne "${__BU_TXT_FMT_UNDERLINE}"
                ;;
            *)
                echo -e "Invalid value"; exit 1
                ;; 
        esac
    done

    echo -e "$p_string$p_newcolor$__BU_TXT_RESET"

}

# Easy "Decho()" function calls with colors.
function DechoHighlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'C'; }
function DechoBlack     { Decho "$1" "$__BU_COLOR_BLACK"        'C'; }
function DechoBlue      { Decho "$1" "$__BU_COLOR_BLUE"         'C'; }
function DechoCyan      { Decho "$1" "$__BU_COLOR_CYAN"         'C'; }
function DechoGray      { Decho "$1" "$__BU_COLOR_GRAY"         'C'; }
function DechoGreen     { Decho "$1" "$__BU_COLOR_GREEN"        'C'; }
function DechoOrange    { Decho "$1" "$__BU_COLOR_ORANGE"       'C'; }
function DechoPink      { Decho "$1" "$__BU_COLOR_PINK"         'C'; }
function DechoPurple    { Decho "$1" "$__BU_COLOR_PURPLE"       'C'; }
function DechoRed       { Decho "$1" "$__BU_COLOR_RED"          'C'; }
function DechoTurquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'C'; }
function DechoWhite     { Decho "$1" "$__BU_COLOR_WHITE"        'C'; }
function DechoYellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'C'; }

# Blink formatting.
function Decho_FMT_Blink            { Decho "$1" "" 'Blink'; }
function Decho_FMT_BlinkBold        { Decho "$1" "" 'Blink' 'Bold'; }
function Decho_FMT_BlinkBoldD       { Decho "$1" "" 'Blink' 'Bold' 'D'; }
function Decho_FMT_BlinkBoldDI      { Decho "$1" "" 'Blink' 'Bold' 'D' 'I'; }
function Decho_FMT_BlinkBoldDIS     { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'S'; }
function Decho_FMT_BlinkBoldDISU    { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'S' 'U'; }
function Decho_FMT_BlinkBoldDIU     { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'U' }
function Decho_FMT_BlinkBoldDS      { Decho "$1" "" 'Blink' 'Bold' 'D' 'S'; }
function Decho_FMT_BlinkBoldDSU     { Decho "$1" "" 'Blink' 'Bold' 'D' 'S' 'U'; }
function Decho_FMT_BlinkBoldDU      { Decho "$1" "" 'Blink' 'Bold' 'D' 'U'; }
function Decho_FMT_BlinkBoldI       { Decho "$1" "" 'Blink' 'Bold' 'I'; }
function Decho_FMT_BlinkBoldIS      { Decho "$1" "" 'Blink' 'Bold' 'I' 'S'; }
function Decho_FMT_BlinkBoldISU     { Decho "$1" "" 'Blink' 'Bold' 'I' 'S' 'U'; }
function Decho_FMT_BlinkBoldIU      { Decho "$1" "" 'Blink' 'Bold' 'I' 'U'; }
function Decho_FMT_BlinkBoldS       { Decho "$1" "" 'Blink' 'Bold' 'S'; }
function Decho_FMT_BlinkBoldSU      { Decho "$1" "" 'Blink' 'Bold' 'S' 'U'; }
function Decho_FMT_BlinkBoldU       { Decho "$1" "" 'Blink' 'Bold' 'U'; }

function Decho_FMT_BlinkD       { Decho "$1" "" 'Blink' 'D'; }
function Decho_FMT_BlinkDI      { Decho "$1" "" 'Blink' 'D' 'I'; }
function Decho_FMT_BlinkDIS     { Decho "$1" "" 'Blink' 'D' 'I' 'S'; }
function Decho_FMT_BlinkDISU    { Decho "$1" "" 'Blink' 'D' 'I' 'S' 'U'; }
function Decho_FMT_BlinkDIU     { Decho "$1" "" 'Blink' 'D' 'I' 'U' }
function Decho_FMT_BlinkDS      { Decho "$1" "" 'Blink' 'D' 'S'; }
function Decho_FMT_BlinkDSU     { Decho "$1" "" 'Blink' 'D' 'S' 'U'; }
function Decho_FMT_BlinkDU      { Decho "$1" "" 'Blink' 'D' 'U'; }
function Decho_FMT_BlinkI       { Decho "$1" "" 'Blink' 'I'; }
function Decho_FMT_BlinkIS      { Decho "$1" "" 'Blink' 'I' 'S'; }
function Decho_FMT_BlinkISU     { Decho "$1" "" 'Blink' 'I' 'S' 'U'; }
function Decho_FMT_BlinkIU      { Decho "$1" "" 'Blink' 'I' 'U'; }
function Decho_FMT_BlinkS       { Decho "$1" "" 'Blink' 'S'; }
function Decho_FMT_BlinkSU      { Decho "$1" "" 'Blink' 'S' 'U'; }
function Decho_FMT_BlinkU       { Decho "$1" "" 'Blink' 'U'; }

# Bold formatting.
function Decho_FMT_Bold     { Decho "$1" "" 'Bold'; }
function Decho_FMT_BoldD    { Decho "$1" "" 'Bold' 'D'; }
function Decho_FMT_BoldDI   { Decho "$1" "" 'Bold' 'D' 'I'; }
function Decho_FMT_BoldDIS  { Decho "$1" "" 'Bold' 'D' 'I' 'S'; }
function Decho_FMT_BoldDISU { Decho "$1" "" 'Bold' 'D' 'I' 'S' 'U'; }
function Decho_FMT_BoldDIU  { Decho "$1" "" 'Bold' 'D' 'I' 'U'; }
function Decho_FMT_BoldDS   { Decho "$1" "" 'Bold' 'D' 'S'; }
function Decho_FMT_BoldDSU  { Decho "$1" "" 'Bold' 'D' 'S' 'U'; }
function Decho_FMT_BoldDU   { Decho "$1" "" 'Bold' 'D' 'U'; }
function Decho_FMT_BoldI    { Decho "$1" "" 'Bold' 'I'; }
function Decho_FMT_BoldIS   { Decho "$1" "" 'Bold' 'I' 'S'; }
function Decho_FMT_BoldISU  { Decho "$1" "" 'Bold' 'I' 'S' 'U'; }
function Decho_FMT_BoldIU   { Decho "$1" "" 'Bold' 'I' 'U'; }
function Decho_FMT_BoldS    { Decho "$1" "" 'Bold' 'S'; }
function Decho_FMT_BoldSU   { Decho "$1" "" 'Bold' 'S' 'U'; }
function Decho_FMT_BoldU    { Decho "$1" "" 'Bold' 'U'; }

# Dim formatting
function Decho_FMT_D    { Decho "$1" "" 'D'; }
function Decho_FMT_DI   { Decho "$1" "" 'D' 'I'; }
function Decho_FMT_DIS  { Decho "$1" "" 'D' 'I' 'S'; }
function Decho_FMT_DISU { Decho "$1" "" 'D' 'I' 'S' 'U'; }
function Decho_FMT_DIU  { Decho "$1" "" 'D' 'I' 'U'; }
function Decho_FMT_DS   { Decho "$1" "" 'D' 'S'; }
function Decho_FMT_DSU  { Decho "$1" "" 'D' 'S' 'U'; }
function Decho_FMT_DU   { Decho "$1" "" 'D' 'U'; }

# Italic formatting.
function Decho_FMT_I     { Decho "$1" "" 'I';    }
function Decho_FMT_IU    { Decho "$1" "" 'I' 'U';   }

# Underline formatting.
function Decho_FMT_U     { Decho "$1" "" 'U';    }

# Easy "Decho_FMT_Blink()" function calls with colors.
function Decho_FMT_Blink_C_Highlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'Blink' 'C'; }
function Decho_FMT_Blink_C_Black     { Decho "$1" "$__BU_COLOR_BLACK"        'Blink' 'C'; }
function Decho_FMT_Blink_C_Blue      { Decho "$1" "$__BU_COLOR_BLUE"         'Blink' 'C'; }
function Decho_FMT_Blink_C_Cyan      { Decho "$1" "$__BU_COLOR_CYAN"         'Blink' 'C'; }
function Decho_FMT_Blink_C_Gray      { Decho "$1" "$__BU_COLOR_GRAY"         'Blink' 'C'; }
function Decho_FMT_Blink_C_Green     { Decho "$1" "$__BU_COLOR_GREEN"        'Blink' 'C'; }
function Decho_FMT_Blink_C_Orange    { Decho "$1" "$__BU_COLOR_ORANGE"       'Blink' 'C'; }
function Decho_FMT_Blink_C_Pink      { Decho "$1" "$__BU_COLOR_PINK"         'Blink' 'C'; }
function Decho_FMT_Blink_C_Purple    { Decho "$1" "$__BU_COLOR_PURPLE"       'Blink' 'C'; }
function Decho_FMT_Blink_C_Red       { Decho "$1" "$__BU_COLOR_RED"          'Blink' 'C'; }
function Decho_FMT_Blink_C_Turquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'Blink' 'C'; }
function Decho_FMT_Blink_C_White     { Decho "$1" "$__BU_COLOR_WHITE"        'Blink' 'C'; }
function Decho_FMT_Blink_C_Yellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'Blink' 'C'; }

# Easy "Decho_FMT_Bold()" function calls with colors.
function Decho_FMT_Bold_C_Highlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'Bold' 'C'; }
function Decho_FMT_Bold_C_Black     { Decho "$1" "$__BU_COLOR_BLACK"        'Bold' 'C'; }
function Decho_FMT_Bold_C_Blue      { Decho "$1" "$__BU_COLOR_BLUE"         'Bold' 'C'; }
function Decho_FMT_Bold_C_Cyan      { Decho "$1" "$__BU_COLOR_CYAN"         'Bold' 'C'; }
function Decho_FMT_Bold_C_Gray      { Decho "$1" "$__BU_COLOR_GRAY"         'Bold' 'C'; }
function Decho_FMT_Bold_C_Green     { Decho "$1" "$__BU_COLOR_GREEN"        'Bold' 'C'; }
function Decho_FMT_Bold_C_Orange    { Decho "$1" "$__BU_COLOR_ORANGE"       'Bold' 'C'; }
function Decho_FMT_Bold_C_Pink      { Decho "$1" "$__BU_COLOR_PINK"         'Bold' 'C'; }
function Decho_FMT_Bold_C_Purple    { Decho "$1" "$__BU_COLOR_PURPLE"       'Bold' 'C'; }
function Decho_FMT_Bold_C_Red       { Decho "$1" "$__BU_COLOR_RED"          'Bold' 'C'; }
function Decho_FMT_Bold_C_Turquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'Bold' 'C'; }
function Decho_FMT_Bold_C_White     { Decho "$1" "$__BU_COLOR_WHITE"        'Bold' 'C'; }
function Decho_FMT_Bold_C_Yellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'Bold' 'C'; }

# Easy "Decho_FMT_BoldI()" function calls with colors.
function Decho_FMT_BoldI_C_Highlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Black     { Decho "$1" "$__BU_COLOR_BLACK"        'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Blue      { Decho "$1" "$__BU_COLOR_BLUE"         'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Cyan      { Decho "$1" "$__BU_COLOR_CYAN"         'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Gray      { Decho "$1" "$__BU_COLOR_GRAY"         'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Green     { Decho "$1" "$__BU_COLOR_GREEN"        'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Orange    { Decho "$1" "$__BU_COLOR_ORANGE"       'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Pink      { Decho "$1" "$__BU_COLOR_PINK"         'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Purple    { Decho "$1" "$__BU_COLOR_PURPLE"       'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Red       { Decho "$1" "$__BU_COLOR_RED"          'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Turquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_White     { Decho "$1" "$__BU_COLOR_WHITE"        'Bold' 'C' 'I'; }
function Decho_FMT_BoldI_C_Yellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'Bold' 'C' 'I'; }

# Easy "Decho_FMT_BoldIU()" function calls with color.
function Decho_FMT_BoldIU_C_Highlight   { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Black       { Decho "$1" "$__BU_COLOR_BLACK"        'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Blue        { Decho "$1" "$__BU_COLOR_BLUE"         'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Cyan        { Decho "$1" "$__BU_COLOR_CYAN"         'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Gray        { Decho "$1" "$__BU_COLOR_GRAY"         'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Green       { Decho "$1" "$__BU_COLOR_GREEN"        'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Orange      { Decho "$1" "$__BU_COLOR_ORANGE"       'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Pink        { Decho "$1" "$__BU_COLOR_PINK"         'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Purple      { Decho "$1" "$__BU_COLOR_PURPLE"       'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Red         { Decho "$1" "$__BU_COLOR_RED"          'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Turquoise   { Decho "$1" "$__BU_COLOR_TURQUOISE"    'Bold' 'C' 'I' 'U'; }
function Decho_FMT_BoldIU_C_Yellow      { Decho "$1" "$__BU_COLOR_YELLOW"       'Bold' 'C' 'I' 'U'; }

# Easy "Decho_FMT_I()" function calls with colors.
function Decho_FMT_I_C_Highlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'C' 'I'; }
function Decho_FMT_I_C_Black     { Decho "$1" "$__BU_COLOR_BLACK"        'C' 'I'; }
function Decho_FMT_I_C_Blue      { Decho "$1" "$__BU_COLOR_BLUE"         'C' 'I'; }
function Decho_FMT_I_C_Cyan      { Decho "$1" "$__BU_COLOR_CYAN"         'C' 'I'; }
function Decho_FMT_I_C_Gray      { Decho "$1" "$__BU_COLOR_GRAY"         'C' 'I'; }
function Decho_FMT_I_C_Green     { Decho "$1" "$__BU_COLOR_GREEN"        'C' 'I'; }
function Decho_FMT_I_C_Orange    { Decho "$1" "$__BU_COLOR_ORANGE"       'C' 'I'; }
function Decho_FMT_I_C_Pink      { Decho "$1" "$__BU_COLOR_PINK"         'C' 'I'; }
function Decho_FMT_I_C_Purple    { Decho "$1" "$__BU_COLOR_PURPLE"       'C' 'I'; }
function Decho_FMT_I_C_Red       { Decho "$1" "$__BU_COLOR_RED"          'C' 'I'; }
function Decho_FMT_I_C_Turquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'C' 'I'; }
function Decho_FMT_I_C_White     { Decho "$1" "$__BU_COLOR_WHITE"        'C' 'I'; }
function Decho_FMT_I_C_Yellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'C' 'I'; }

# Easy "Decho_FMT_IU()" function calls with colors.
function Decho_FMT_IU_C_Highlight    { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'C' 'I' 'U'; }
function Decho_FMT_IU_C_Black        { Decho "$1" "$__BU_COLOR_BLACK"        'C' 'I' 'U'; }
function Decho_FMT_IU_C_Blue         { Decho "$1" "$__BU_COLOR_BLUE"         'C' 'I' 'U'; }
function Decho_FMT_IU_C_Cyan         { Decho "$1" "$__BU_COLOR_CYAN"         'C' 'I' 'U'; }
function Decho_FMT_IU_C_Gray         { Decho "$1" "$__BU_COLOR_GRAY"         'C' 'I' 'U'; }
function Decho_FMT_IU_C_Green        { Decho "$1" "$__BU_COLOR_GREEN"        'C' 'I' 'U'; }
function Decho_FMT_IU_C_Orange       { Decho "$1" "$__BU_COLOR_ORANGE"       'C' 'I' 'U'; }
function Decho_FMT_IU_C_Pink         { Decho "$1" "$__BU_COLOR_PINK"         'C' 'I' 'U'; }
function Decho_FMT_IU_C_Purple       { Decho "$1" "$__BU_COLOR_PURPLE"       'C' 'I' 'U'; }
function Decho_FMT_IU_C_Red          { Decho "$1" "$__BU_COLOR_RED"          'C' 'I' 'U'; }
function Decho_FMT_IU_C_Turquoise    { Decho "$1" "$__BU_COLOR_TURQUOISE"    'C' 'I' 'U'; }
function Decho_FMT_IU_C_White        { Decho "$1" "$__BU_COLOR_WHITE"        'C' 'I' 'U'; }
function Decho_FMT_IU_C_Yellow       { Decho "$1" "$__BU_COLOR_YELLOW"       'C' 'I' 'U'; }

# Easy "Decho_FMT_U()" function calls with colors.
function Decho_FMT_U_C_Highlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'C' 'U'; }
function Decho_FMT_U_C_Black     { Decho "$1" "$__BU_COLOR_BLACK"        'C' 'U'; }
function Decho_FMT_U_C_Blue      { Decho "$1" "$__BU_COLOR_BLUE"         'C' 'U'; }
function Decho_FMT_U_C_Cyan      { Decho "$1" "$__BU_COLOR_CYAN"         'C' 'U'; }
function Decho_FMT_U_C_Gray      { Decho "$1" "$__BU_COLOR_GRAY"         'C' 'U'; }
function Decho_FMT_U_C_Green     { Decho "$1" "$__BU_COLOR_GREEN"        'C' 'U'; }
function Decho_FMT_U_C_Orange    { Decho "$1" "$__BU_COLOR_ORANGE"       'C' 'U'; }
function Decho_FMT_U_C_Pink      { Decho "$1" "$__BU_COLOR_PINK"         'C' 'U'; }
function Decho_FMT_U_C_Purple    { Decho "$1" "$__BU_COLOR_PURPLE"       'C' 'U'; }
function Decho_FMT_U_C_Red       { Decho "$1" "$__BU_COLOR_RED"          'C' 'U'; }
function Decho_FMT_U_C_Turquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'C' 'U'; }
function Decho_FMT_U_C_White     { Decho "$1" "$__BU_COLOR_WHITE"        'C' 'U'; }
function Decho_FMT_U_C_Yellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'C' 'U'; }

# -----------------------------------------------
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/DIRECTORIES.LIB
# 
#!/usr/bin/env bash

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DIRECTORIES FUNCTIONS

## PROCESSING FUNCTIONS

# Separate processing steps displays from the rest of the main script with a line.

# Featured functions and files from the "functions" folder :
#   - DrawLine      -> Headers.lib
#   - HandleErrors  -> Headers.lib
function ProcessingDir()
{
    #***** Parameters *****
    local p_function=$1
    local p_parent=$2
    local p_name=$3
    
    #***** Variables *****
    local v_char='"'
    local v_path="$p_parent/$p_name"
    
    #***** Code *****
    # Arguments checking.
	CheckArgsMain_ProcessingDir "$p_function" "$p_parent" "$p_name"
    
	sleep "$PROJECT_STATUS_SLEEP_LINE"
    EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
    EchoNewstep "Processing the $(DechoHighlight "$p_name") folder in the parent folder $(DechoHighlight "$p_parent")."
    Newline
    
    if "$p_function"; then
        EchoSuccess "End of processing the $(DechoHighlight "$p_name/") folder."
		EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
		sleep "$PROJECT_STATUS_SLEEP_LINE"
		Newline
    else
        EchoError "End of processing the $(DechoHighlight "$p_name/") folder."
		EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
		sleep "$PROJECT_STATUS_SLEEP_LINE"
		Newline
    fi
}

# -----------------------------------------------

## FOLDER CREATION FUNCTIONS

# Overwriting an existing directory's content

# Featured functions and files from the "functions" folder :
#	- EchoError			-> Echo.lib
#	- EchoNewstep		-> Echo.lib
#	- EchoSuccess		-> Echo.lib
#	- Newline			-> Echo.lib
function OverwriteDir()
{
    #***** Parameters *****
    local p_path=$1
	local p_authorization=$2

    #***** Code *****
    # Checking first if the awaited arguments are given
    CheckArgsMain_OverwriteDir "$p_path" "$p_authorization"
	
    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$p_path"

    EchoNewstep "A non-empty folder with exactly the same name ($(DechoHighlight "$p_name")) is already in the target folder $(DechoHighlight "$p_parent/")"
	EchoNewstep "Deleting the contents of the $(DechoHighlight "$v_path/") folder"
	Newline

	if [ "$p_authorization" = "true" ]; then
        # TODO : Si la variable n'est pas initialisée.
        if [ -n "${p_path+x}" ]; then
            # WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM WILL OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${v_path/:?}/"*
            HandleErrors "$?" "UNABLE TO DELETE THE CONTENT OF THE $(KeepFormatting "$(DechoHighlight "$v_path/")") FOLDER." \
                "Please check the permissions of the targeted directory" "$v_path" "$v_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
            EchoSuccess "Deletion of the contents of the folder $(DechoHighlight "$v_path/") performed successfully"
            Newline
        else
            # shellcheck disable=SC2034
            __STAT_ERROR="fatal"; CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            HandleErrors
        fi
	fi

    return 0
}



# Folder creation AND recursively assigning read and write rights to the user.
# When this function is called, if a log file is used in the project, the output of this function must be redirected either to the terminal AND the log file (2>&1 | tee -a "$FILE_LOG_PATH"), or to the log file only (>> "$FILE_LOG_PATH") after passing all the mandatory arguments. Otherwise, leave everything blank after passing the arguments.

# Featured functions and files from the "functions" folder :
#   - Echo.sh       -> EchoErrorTimer
#   - Echo.sh       -> EchoNewstepTimer
#   - Echo.sh       -> EchoSuccessTimer
#   - Headers.sh    -> DrawLine   
#   - Headers.sh    -> HandleErrors
function Makedir()
{
	#***** Parameters *****
	local p_parent=$1  # Emplacement of the currently processed directory's parent folder from the root directory.
	local p_name=$2    # Name of the folder to process (into its parent directory).

	#***** Variables *****
	local v_path="$p_parent/$p_name"	# Path of the file to process.

	#***** Code *****
	# Checking first if the awaited arguments are given
    CheckArgsMain_Makedir "$p_parent" "$p_name"
    
    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$v_path"
	
	# If the folder to create doesn't exists, ths script creates it with the help of the "mkdir" command.
	if [ ! -d "$v_path" ]; then
		EchoNewstep "Creating the $(DechoHighlight "$p_name") folder in the parent folder $(DechoHighlight "$p_parent/")."
		Newline

        mkdir -pv "$v_path"
        HandleErrors "$?" "${FUNCNAME[0]} : THE $(DechoHighlight "$p_name/") FOLDER CANNOT BE CREATED IN THE PARENT FOLDER $(DechoHighlight "$p_parent/") !" \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
        EchoSuccess "The $(DechoHighlight "$p_name") folder was successfully created in the $(DechoHighlight "$p_parent/") folder."
        Newline
        
        return 0

    # Else, if the folder to create already exists in its parent directory AND this folder already contains AT LEAST one file or folder.
	elif [ -d "$v_path" ] && [ "$(ls -A "$v_path")" ]; then
        OverwriteDir "$p_parent" "$p_name"
        if test "$?" -eq 0; then
            return 0
		else
            return 1
		fi

	# Else, if the folder to create already exists in its parent directory AND this folder is empty.
	elif [ -d "$v_path" ] && [ ! "$(ls -A "$v_path")" ]; then
		EchoSuccess "The $(DechoHighlight "$p_name/") folder already exists in the $(DechoHighlight "$p_parent/") folder and is empty."
		Newline

		return 0
    fi
}

# The function "CheckSTAT_LOG()" creates the log file and its path when the __STAT_LOG variable's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
function MkTmpDir()
{
    local lineno="$LINENO"; if [ ! -d "$__BU_PROJECT_TMP_DIR_PATH" ]; then
        mkdir -p "$__BU_PROJECT_TMP_DIR_PATH"

        HandleErrors "$?" "THE $(CheckFilePathExists "$(DechoHighlight "$__BU_PROJECT_TMP_DIR_PATH")") CANNOT BE CREATED !" \
            "Please check at the mentionned line in the mentionned file." "$__BU_PROJECT_TMP_DIR_PATH" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------

## PATH PROCESSING

# Getting the name of a target directory without its path.
function GetDirectoryName()
{
    #***** Parameters *****
    local p_path=$1
    
    #***** Code *****
    CheckArgsMain_GetDirectoryName "$p_path"
    
    if [ -d "$p_path" ]; then
        shopt -s extglob            # enable +(...) glob syntax

        result=${p_path%%+(/)}      # trim however many trailing slashes exist
        result=${result##*/}        # remove everything before the last / that still remains

        echo -e "$dirname"

    else
        HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-6 ))"
    fi
}

# Checking if the directory's sub-folders paths passed as argument exists, then print its path.
function GetDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    CheckArgsMain_GetDirectoryPath "$p_path"

    if [ -d "$p_path" ]; then
        echo -e "$p_path"
    else
        HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Please check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
    fi
}

# Getting parent folder's name only (without its full path from the root directory), then printing it.
function GetParentDirectoryName()
{
    #***** Parameters *****
    local p_path=$1         # Path of the child file or folder.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #***** Code *****
    CheckArgsMain_GetParentDirectoryName "$p_path" "$p_iterations"

    if [ -z "$p_iterations" ]; then
        p_iterations='0'
    fi

    for (( i=0; i<p_iterations; i++)); do
        parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
            }; pwd -P )"
        p_path="$parent"
    done

    shopt -s extglob            # enable +(...) glob syntax
    result=${p_path%%+(/)}      # trim however many trailing slashes exist
    result=${result##*/}        # remove everything before the last / that still remains

    echo -e "$result"
}

# Getting parent folder's path from the root directory, then printing it
function GetParentDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the child file or folder.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #***** Code *****
    CheckArgsMain_GetParentDirectoryPath "$p_path" "$p_iterations"

    if [ -z "$p_iterations" ]; then
        p_iterations='0'
    fi

    for (( i=0; i<p_iterations; i++)); do
        parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
            }; pwd -P )"
        p_path="$parent"
    done

    shopt -s extglob            # enable +(...) glob syntax
    result=${p_path%%+(/)}      # trim however many trailing slashes exist

    echo -e "$result"
}
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/ECHO.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !"; echo
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo -e "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

####

## DISPLAYING A COLORED MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__STAT_TIME_TXT" status variable.

# "Echo<...>()" functions debug output for a better view during a "bash - x" debug process.
function __EchoOutput()
{
	#***** Parameters *****
	local p_string=$1		# String to display.
	local p_context=$2		# Begin or end of the debug process.
	local p_type=$3			# Type of message (error 'E', newstep 'N', success 'S' or warning 'W').

	#***** Code *****
	if [ ! -f "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH" ]; then
		touch "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH" || { \
            echo >&2
            echo -e "${__BU_COLOR_ERROR}Unable to create the ${__BU_COLOR_HIGHLIGHT}$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH${__BU_COLOR_ERROR} file${__BU_COLOR_RESET}" >&2
            echo >&2; exit 1
        }
	fi
	
	if [ "$p_context" = "begin" ]; then
		if [ "${p_type,,}" = "E" ]; then
			EchoMsg "$(HeaderError "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'N' ]; then
			EchoMsg "$(HeaderNewstep "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'S' ]; then
			EchoMsg "$(HeaderSuccess "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'W' ]; then
			EchoMsg "$(HeaderWarning "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		fi
		
		return 0
	fi

	if [ "$p_context" = "end" ]; then
		if [ "${p_type,,}" = "E" ]; then
			EchoMsg "$(HeaderError "END DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'N' ]; then
			EchoMsg "$(HeaderNewstep "END DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'S' ]; then
			EchoMsg "$(HeaderSuccess "END DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		elif [ "${p_type,,}" = 'W' ]; then
			EchoMsg "$(HeaderWarning "END DEBUGGING TEXT : $p_string")" > "$__BU_PROJECT_ECHO_OUTPUT_FILE_PATH"
		fi
	fi
}

# Error message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoError()
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
	__EchoOutput "$p_string" 'begin' 'E'
    CheckProjectLogStatus "${__BU_COLOR_ERROR}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" >&2

    sleep "$__STAT_TIME_TXT"
	__EchoOutput "$p_string" 'end' 'E'
}

# Normal message (without any extra color), with redirection checking.

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoMsg()
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
    CheckProjectLogStatus "$p_string" "$p_option" "${p_arrExtraArgs[@]}"

    sleep "$__STAT_TIME_TXT"
}

# New sub-step message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoNewstep()
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
	__EchoOutput "$p_string" 'begin' 'N'
    CheckProjectLogStatus "${__BU_COLOR_ORANGE}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}"

    sleep "$__STAT_TIME_TXT"
	__EchoOutput "$p_string" 'end' 'N'
}

# Read input values

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#	- CheckProjectLogStatus		--> Checkings.lib
function EchoRead()
{
	#***** Parameters *****
	local p_string=$1      # User's keyboard input.
	
	#***** Code *****
	if [ -f "$__BU_PROJECT_LOG_FILE_PATH" ] && [ "$__STAT_LOG" = "true" ] && [ -n "$__STAT_LOG_REDIRECT" ]; then
		echo -e "$p_string" >> "$__BU_PROJECT_LOG_FILE_PATH"
	fi
}

# Success message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoSuccess()
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
	__EchoOutput "$p_string" 'begin' 'S'
    CheckProjectLogStatus "${__BU_COLOR_SUCCESS}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" >&1

    sleep "$__STAT_TIME_TXT"
	__EchoOutput "$p_string" 'end' 'S'
}

# Warning message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoWarning()
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
	__EchoOutput "$p_string" 'begin' 'W'
    CheckProjectLogStatus "${__BU_COLOR_WARNING}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" 1>&2

    sleep "$__STAT_TIME_TXT"
	__EchoOutput "$p_string" 'end' 'W'
}

# -----------------------------------------------

## TEXT FORMATTING

# Keep the same text format between lowercased or uppercased text printed by a formatting text function ("ToLowercase()" OR "ToUppercase()") or a parameter expansion.
function KeepFormatting()
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	# echo -e "$p_string" | tr '[upper]' '[upper]'
	return
}

# Print a lowercased text.

# Usage :
#	ToLowercase "<Text to write>"
function ToLowercase()
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[:upper:]' '[:lower:]'
}

# Print an uppercased text.

# Usage :
#	ToUppercase "<Text to write>"
function ToUppercase()
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[:lower:]' '[:upper:]'
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### LINE BREAKS

## LINE BREAKS ACCORDING TO THE "$MAIN_SCRIPT_LOG" VARIABLE VALUE.

# Redirecting the output of the "echo" command

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
#	- HandleErrors				--> Checkings.lib
function Newline()
{
    #***** Parameters *****
    local number=$1

    #***** Code *****
    if [ -n "$number" ]; then
        if ! IsInt "$number"; then
            HandleErrors "1" "THE NUMBER OF LINE BREAKS MUST BE AN INTEGER" \
                "Check at the mentionned file in the 4th $(DechoHighlight "HandleErrors") function's argument" "$number" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
        else
            # Doing X line breaks according to the number passed as argument.
            for ((i=0; i<number; i++)); do
                CheckProjectLogStatus "" "" "nodate"
            done
        fi
    else
        CheckProjectLogStatus "" "" "nodate"
    fi
}
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/FILES.LIB
# 
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TEXT FILES PROCESSING FUNCTIONS

# This function only repeats some parts of the following function.
function __ProcessingFile()
{
    #***** Parameters *****
    p_output=$1
    p_name=$2
    p_char=$3

    #***** Code *****
    if [ "$p_output" = 'E' ]; then
        EchoError "End of processing the $(DechoHighlight "$p_name") file"
        EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
        Newline
            
        sleep "$__STAT_TIME_TXT"

    elif [ "$p_output" = 'S' ]; then
        EchoSuccess "End of processing the $(DechoS "$p_name") file"
        EchoMsg "$(DrawLine "$__COL_RESET" "$p_char")" '-n' 'nodate'
        Newline
        
        sleep "$__STAT_TIME_TXT"
    else
        EchoWarning ""
    fi
}

# Separate processing steps displays from the rest of the main script between two horizontal lines.

# Featured functions and files from the "functions" folder :
#   - DrawLine      -> Headers.lib
#   - HandleErrors  -> Headers.lib
function ProcessingFile()
{
    #***** Parameters *****
    local p_function=$1; shift
    local p_name=$2
    local arr; arr=$("$@")
    
    #***** Variables *****
    local v_char="'"
    
    #***** Code *****
    # Arguments checking.
    CheckArgs_ProcessingFile "$p_function"
    
	sleep "$__STAT_TIME_TXT"
    EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
    EchoNewstep "Processing the $(DechoHighlight "$p_name") file in the $(DechoHighlight "$p_parent") parent directory."
    Newline
    
    case "$p_function" in
        'Makefile')
            if Makefile "${arr[@]}"; then
                __ProcessingFile 'S' "$p_name" "$p_char"
            else
                __ProcessingFile 'E' "$p_name" "$p_char"
            fi
            ;;
        'OverwriteFile')
            if OverwriteFile "$arr"; then
                __ProcessingFile 'S' "$p_name" "$p_char"
            else
                __ProcessingFile 'E' "$p_name" "$p_char"
            fi
            ;;
    esac
}

## OVERWRITING CONTENT

# Overwrite a file

# Featured functions and files from the "functions" folder :
#	- EchoError			-> Echo.lib
#	- EchoNewstep		-> Echo.lib
#	- EchoSuccess		-> Echo.lib
#	- Newline			-> Echo.lib
function OverwriteFile()
{
    #***** Parameters *****
    local p_path=$1
	local p_authorization=$2
    
    #***** Code *****
    # Checking first if the awaited arguments are given
    CheckArgs_OverwriteFile

    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$p_path"

    if [ "$p_authorization" = "true" ]; then
		EchoNewstep "The $(DechoHighlight "$p_path/") file already exists and is not empty."
		EchoNewstep "Overwriting data from file $(DechoHighlight "$p_path/")"
		Newline

		true > "$p_path"
		HandleErrors "$?" "THE CONTENT OF THE $(KeepFormatting "$(DechoHighlight "$p_path/")") FILE HAD NOT BEEN OVERWRITTEN" "" "$p_path" \
			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
		EchoSuccess "The content of the $(DechoS "$p_path/") file has been successfully overwritten"
		Newline
	else
		return
	fi

	return 0
}

# -----------------------------------------------

## FILE CREATION

# File creation function.
# LORS DE SON APPEL, LA SORTIE DE CETTE FONCTION DOIT ÊTRE REDIRIGÉE SOIT VERS LE TERMINAL ET LE FICHIER DE LOGS, SOIT VERS LE FICHIER DE LOGS UNIQUEMENT.

# Featured functions and files from the "functions" folder :
#   - DrawLine          -> Headers.lib
#   - EchoError         -> Echo.lib
#   - EchoNewstep       -> Echo.lib
#   - EchoSuccess       -> Echo.lib
#   - HandleErrors      -> Handles.lib
function Makefile()
{
	#***** Parameters *****
	local p_parent=$1      # Emplacement of the currently processed file's parent folder from the root directory.
	local p_name=$2        # Name of the file to process (into its parent directory).

	#***** Variables *****
	local v_path="$p_parent/$p_name"	# Path of the file to process.

	#***** Code *****
	# Checking first if the awaited arguments are given
    CheckArgs_Makefile "$p_parent" "$p_name"

    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$v_path"

	# If the file to create doesn't exists, ths script creates it with the help of the "touch" command.
	if [ ! -f "$v_path" ]; then
        EchoNewstep "Creating the $(DechoHighlight "$p_name") file in the parent folder $(DechoHighlight "$p_parent/")."

		touch "$v_path"
        # Testing if the file has been created by checking the return code of the "touch" command via the "HandleErrors" function.
        # An error may come from the fact that the user did not run the script in superuser mode, a script that tried to create a
        # file in a folder where the user is not allowed to create a file without superuser privileges.
        HandleErrors "$?" "THE $(KeepFormatting "$(DechoHighlight "$p_name")") FILE CANNOT BE CREATED IN THE $(KeepFormatting "$(DechoHighlight "$p_parent/")") PARENT FOLDER." \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))"
        EchoSuccess "The $(DechoS "$p_name") file was successfully created in the $(DechoS "$p_parent") folder."
        Newline
        
        return 0
	
	# Else, if the file to be created already exists AND it is NOT empty.
	elif [ -f "$p_path" ] && [ -s "$p_path" ]; then
        if OverwriteFile "$p_path"; then
            return 0
        else
            return 1
        fi

	# Else, if the file to be created already exists AND it is empty.
	elif [ -f "$p_path" ] && [ ! -s "$p_path" ]; then
		EchoSuccess "The $(DechoS "$p_path/") file already exists in the $(DechoS "$p_parent/") folder and is empty."
		Newline

		return 0
	fi
}

# -----------------------------------------------

## FILE SOURCING

# Sourcing dependencies files.
function SourceFile()
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    if [ -f "$p_path" ]; then
        # shellcheck disable=SC1090
        if source "$p_path"; then
            EchoSuccess "Sourced file : $(DechoS "$p_path")"
        else
            HandleErrors "1" "UNABLE TO SOURCE THIS FILE ! $(KeepFormatting "$(DechoHighlight "$p_path")")" "Please verify that the filepath passed as argument exists." "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))"
        fi
    else
        HandleErrors "1" "UNABLE TO FIND THIS FILE : $(KeepFormatting "$(DechoHighlight "$p_path")")" "Please pass a filepath as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))"
    fi
}

# -----------------------------------------------

## TEXT FILES PARSING

# Getting a specific line from a text file.
function GetLineFromTextFile()
{
    #***** Parameters *****
    local p_source=$1           # File to parse
    local p_wanted_line=$2      # Line to get in the file
    
    #***** Variables *****
    local i=0                   # Line incrementer
    
    #***** Code *****
	# shellcheck disable=SC2002
    cat "$p_source" | while read -r line; do
        # Incrementing the line incrementer variable's value...
        i=$(( i+1 ))
        
        # ... until it reaches the wanted line.
        if [ "$i" -eq "$p_wanted_line" ]; then
            # Creating a variable and storing the wanted line's text.
            __BU_TXT_GOT_LINE="$line"
        fi
    done
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARCHIVES PROCESSING FUNCTIONS

## (UN)COMPRESSION FUNCTIONS

# 

# Featured functions and files from the "functions" folder :
#   - 
function Compress()
{
    #***** Parameters *****
    local cmd=$1      # Compression command.
    local opts=$2     # Options of the compression command.
    local p_path=$3     # Path to the file/folder to archivate.
    local p_name=$4     # Archive's name (only used into displayed messages).
    
    #***** Code *****
    
    
    return 0
}

# Uncompressing archives according to the used compression method.

# Featured functions and files from the "functions" folder :
#   - HandleErrors      -> Handles.lib
#   - EchoSuccess       -> Echo.lib
#   - Newline           -> Echo.lib
function Uncompress()
{
    #***** Paramètres *****
    local p_cmd=$1      # Compression command.
    # TODO : Vérifier si cette procédure est bonne
    local p_opts=$2     # Options of the compression command. (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
    local p_path=$3     # Path to the l'archive to uncompress.
    local p_name=$4     # Archive's name (only used into displayed messages).

    #***** Code *****
    # On exécute la commande de décompression en passant en arguments ses options et le chemin vers l'archive.
    "$cmd $opts $p_path"
    HandleErrors "$?" "${FUNCNAME[0]} : LA DÉCOMPRESSION DE L'ARCHIVE $(DechoHighlight "$p_name") A ÉCHOUÉE"
    EchoSuccess "La décompression de l'archive $(DechoHighlight "$p_name") s'est effectuée avec brio."
    Newline
    
    return 0
}
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/HEADERS.LIB
# 
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### FUNCTIONS WITHOUT REDIRECTIONS TOWARDS A LOG FILE

## DÉFINITION DES FONCTIONS DE CRÉATION DE HEADERS

# Fonction de création et d'affichage de lignes selon le nombre de colonnes de la zone de texte du terminal.
function DrawLine()
{
	#***** Parameters *****
	local p_lineColor=$1	# Deuxième paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction.
	local p_lineChar=$2	# Premier paramètre servant à définir le caractère souhaité lors de l'appel de la fonction.
	
	#***** Code *****
    # Defining the color of the wished character for the whole line before displaying the first character.
    # If the value of the "$p_lineColor" parameter (which stores the text's color encoding) is not empty,
    # then we write the color's encoding into the terminal, which displays the color, and not its encoding in text.
    
    # The color's encoding can be written via the "tput setaf $value" command. The line is empty before the first
    # ASCII characters if the first parameter "$p_lineColor" is passed as an empty string, which means that no
    # "tput setaf $value" command was executed.

    # Since we want to write the characters composing the header line after the color encoding string, we use the options
	# '-n' (no line breaks) and '-e' (interpret backslashes) of the "echo" command to avoid making a line break after the
	# end of the string, to write the next string directly after the line.
    
	# Since all the columns in the row are used, the following characters will be written in the row, as if a line break has been made.
	if test "$p_lineColor" != ""; then
		echo -ne "$p_lineColor"
	fi

    # Displaying the desired character on the whole line. To do this, using a "for" loop, we start reading it from
	# the first column (1), then we read the entire line to the end of the terminal's text box. At each call
	# of the "echo" command, a character is displayed and colored according to the encoding defined and written above.

	# The 'i' variable in the "for i in" loop has been replaced by an underscore '_' to stop Shellcheck from sending a warning
	# message due to the non-declaration of the variable 'i', although this does not change anything when the script is executed.
	for _ in $(eval echo -e "{1..$__TXT_COLS}"); do
		echo -n "$p_lineChar"
	done

    # Definition (here, reinitialization) of the color of the characters following the last character of the header line
	# using the same code snippet as the first condition, to write the terminal's base color encoding (it is recommended 
	# to call the "tput sgr0" command to reset the color according to the profile options of the terminal).
	# As with any color encoding, this plain text will not be displayed on the terminal.

	# En pratique, La couleur des caractères suivants est déjà encodée quand ils sont appelés via une des fonctions d'affichage.
	# Cette réinitialisation de la couleur du texte n'est qu'une mini-sécurité permettant d'éviter d'avoir la couleur de l'invite de
	# commandes encodée avec la couleur des headers si l'exécution du script est interrompue de force avec la combinaison "CTRL + C"
	# ou mise en pause avec la combinaison "CTRL + Z", par exemple.
	if test "$p_lineColor" != ""; then
        echo -ne "$__BU_COLOR_RESET"
	fi

	# Étant donné que l'on a utilisé l'option '-n' de la commande "echo", on effectue un saut de ligne pour éviter d'avoir à le répéter après chaque appel de la commande pour laisser un espace vide entre la ligne et le prochain caractère.
	echo

	return
}

# Fonction de création de base d'un header (Couleur et caractère de ligne, couleur et chaîne de caractères).
function HeaderBase()
{
	#***** Parameters *****
	local p_lineColor=$1      # Deuxième paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction.
	local p_lineChar=$2       # Premier paramètre servant à définir le caractère souhaité lors de l'appel de la fonction.
	local p_stringColor=$3	  # Définition de la couleur de la chaîne de caractères du header.
	local p_stringTxt=$4      # Chaîne de caractères affichée dans chaque header.

	#***** Variables *****	
# 	HEADERBASE_COLOR_LINE="$p_lineColor"
# 	HEADERBASE_COLOR_TEXT="$p_stringColor"

	#***** Code *****    
	Newline

	EchoMsg "$(DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
	EchoMsg "$p_stringColor##> $p_stringTxt${__BU_COLOR_RESET}"
	EchoMsg "$(DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
	Newline

	return
}

# Header to display in case of an error.
function HeaderError    { HeaderBase "$__BU_COLOR_ERROR"    "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ERROR"      "$1"; }

# Header to display when switching to a new package category during package installation.
function HeaderInstall  { HeaderBase "$__BU_COLOR_YELLOW"   "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }

# Header to display when changing step.
function HeaderStep     { HeaderBase "$__BU_COLOR_CYAN"     "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }

# Header to display in case of a successfully done step.
function HeaderSuccess  { HeaderBase "$__BU_COLOR_SUCCESS"  "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_SUCCESS"    "$1"; }

# Header to display in case of a minor error.
function HeaderWarning  { HeaderBase "$__BU_COLOR_WARNING"  "$__BU_TXT_PRINT_HEADER_LINE_CHAR"  "$__BU_COLOR_WARNING"   "$1"; }

# -----------------------------------------------

## UNICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating unicolor headers :
# function Header<col> { HeaderBase "$__BU_COLOR_<COLOR>" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_<COLOR>" "$1"; }

function HeaderBlack        { HeaderBase "$__BU_COLOR_BLACK"        "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"      "$1"; }
function HeaderBlue         { HeaderBase "$__BU_COLOR_BLUE"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderCyan         { HeaderBase "$__BU_COLOR_CYAN"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderGray         { HeaderBase "$__BU_COLOR_GRAY"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderGreen        { HeaderBase "$__BU_COLOR_GREEN"        "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderOrange       { HeaderBase "$__BU_COLOR_ORANGE"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderPink         { HeaderBase "$__BU_COLOR_PINK"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderPurple       { HeaderBase "$__BU_COLOR_PURPLE"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderRed          { HeaderBase "$__BU_COLOR_RED"          "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderTurquoise    { HeaderBase "$__BU_COLOR_TURQUOISE"    "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderWhite        { HeaderBase "$__BU_COLOR_WHITE"        "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"      "$1"; }
function HeaderYellow       { HeaderBase "$__BU_COLOR_YELLOW"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# -----------------------------------------------

## BICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating multicolor headers :
# function Header<col1><col2> { HeaderBase "$__BU_COLOR_<COLOR>" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_<COLOR>" "$1"; }

# Black line, differently colored text.
function HeaderBlue             { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"      "$1"; }
function HeaderBlackCyan        { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"      "$1"; }
function HeaderBlackGray        { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"      "$1"; }
function HeaderBlackGreen       { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"     "$1"; }
function HeaderBlackOrange      { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"    "$1"; }
function HeaderBlackPink        { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"      "$1"; }
function HeaderBlackPurple      { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"    "$1"; }
function HeaderBlackRed         { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"       "$1"; }
function HeaderBlackTurquoise   { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderBlackWhite       { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"     "$1"; }
function HeaderBlackYellow      { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"    "$1"; }

# Blue lines, differently colored text.
function HeaderBlueBlack        { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"      "$1"; }
function HeaderBlueCyan         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderBlueGray         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderBlueGreen        { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderBlueOrange       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderBluePink         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderBluePurple       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderBlueRed          { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderBlueTurquoise    { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderBlueWhite        { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"      "$1"; }
function HeaderBlueYellow       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Cyan lines, differently colored text.
function HeaderCyanBlack        { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"      "$1"; }
function HeaderCyanBlue         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderCyanGray         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderCyanGreen        { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderCyanOrange       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderCyanPink         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderCyanPurple       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderCyanRed          { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderCyanTurquoise    { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderCyanWhite        { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"      "$1"; }
function HeaderCyanYellow       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Gray lines, differently colored text.
function HeaderGrayBlack        { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"      "$1"; }
function HeaderGrayBlue         { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderGrayCyan         { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderGrayGreen        { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderGrayOrange       { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderGrayPink         { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderGrayPurple       { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderGrayRed          { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderGrayTurquoise    { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderGrayWhite        { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"      "$1"; }
function HeaderGrayYellow       { HeaderBase "$__BU_COLOR_GRAY" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Green lines, differently colored text.
function HeaderGreenBlack       { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"     "$1"; }
function HeaderGreenBlue        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"      "$1"; }
function HeaderGreenCyan        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN" 	    "$1"; }
function HeaderGreenGray        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY" 	    "$1"; }
function HeaderGreenOrange      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"	"$1"; }
function HeaderGreenPink        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"      "$1"; }
function HeaderGreenPurple      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"	"$1"; }
function HeaderGreenRed         { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"       "$1"; }
function HeaderGreenTurquoise   { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderGreenWhite       { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"     "$1"; }
function HeaderGreenYellow      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW" 	"$1"; }

# Orange lines, differently colored text.
function HeaderOrangeBlack      { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"        "$1"; }
function HeaderOrangeBlue       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderOrangeCyan       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderOrangeGray       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderOrangeGreen      { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderOrangePink       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderOrangePurple     { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"       "$1"; }
function HeaderOrangeRed        { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderOrangeTurquoise  { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
function HeaderOrangeWhite      { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"        "$1"; }
function HeaderOrangeYellow     { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"       "$1"; }

# Pink lines, differently colored text.
function HeaderPinkBlack        { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"      "$1"; }
function HeaderPinkBlue         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderPinkCyan         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderPinkGray         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderPinkGreen        { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderPinkOrange       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderPinkPurple       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderPinkRed          { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderPinkTurquoise    { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderPinkWhite        { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"      "$1"; }
function HeaderPinkYellow       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Purple lines, differently colored text.
function HeaderPurpleBlack      { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"        "$1"; }
function HeaderPurpleBlue       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderPurpleCyan       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderPurpleGray       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderPurpleGreen      { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderPurpleOrange     { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"       "$1"; }
function HeaderPurplePink       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderPurpleRed        { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderPurpleTurquoise  { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
function HeaderPurpleWhite      { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"        "$1"; }
function HeaderPurpleYellow     { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"       "$1"; }

# Red lines, differently colored text.
function HeaderRedBlack     { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"       "$1"; }
function HeaderRedBlue      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"        "$1"; }
function HeaderRedCyan      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"        "$1"; }
function HeaderRedGray      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"        "$1"; }
function HeaderRedGreen     { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"       "$1"; }
function HeaderRedOrange    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"      "$1"; }
function HeaderRedPink      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"        "$1"; }
function HeaderRedPurple    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"      "$1"; }
function HeaderRedTurquoise { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"   "$1"; }
function HeaderRedWhite     { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"       "$1"; }
function HeaderRedYellow    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"      "$1"; }

# Turquoise lines, differently colored text.
function HeaderTurquoiseBlack   { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"     "$1"; }
function HeaderTurquoiseBlue    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"      "$1"; }
function HeaderTurquoiseCyan    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"      "$1"; }
function HeaderTurquoiseGray    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"      "$1"; }
function HeaderTurquoiseGreen   { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"     "$1"; }
function HeaderTurquoiseOrange  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"    "$1"; }
function HeaderTurquoisePink    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"      "$1"; }
function HeaderTurquoisePurple  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"    "$1"; }
function HeaderTurquoiseRed     { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderTurquoiseWhite   { HeaderBase "$__BU_COLOR_BLACK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE" "$1"; }
function HeaderTurquoiseYellow  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"    "$1"; }

# White lines, differently colored text.
function HeaderWhiteBlack       { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"     "$1"; }
function HeaderWhiteBlue        { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"      "$1"; }
function HeaderWhiteCyan        { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"      "$1"; }
function HeaderWhiteGray        { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"      "$1"; }
function HeaderWhiteGreen       { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"     "$1"; }
function HeaderWhiteOrange      { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"    "$1"; }
function HeaderWhitePink        { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"      "$1"; }
function HeaderWhitePurple      { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"    "$1"; }
function HeaderWhiteRed         { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"       "$1"; }
function HeaderWhiteTurquoise   { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderWhiteYellow      { HeaderBase "$__BU_COLOR_WHITE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"    "$1"; }

# Yellow lines, differently colored text.
function HeaderYellowBlack      { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLACK"        "$1"; }
function HeaderYellowBlue       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderYellowCyan       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderYellowGray       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderYellowGreen      { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderYellowOrange     { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"       "$1"; }
function HeaderYellowPink       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderYellowPurple     { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"       "$1"; }
function HeaderYellowRed        { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderYellowWhite      { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_WHITE"        "$1"; }
function HeaderYellowTurquoise  { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/PERMISSIONS.LIB
# 
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### RECURSIVE PERMISSION AND OWNERSHIP PROCESSING

## RECURSIVE OWNERSHIP SWAPPING

# Calling the "chown" command to change recursively directory ownership

# Required functions and files into the "Bash-Utils/src/functions" folder :
#	- CheckRootEUID		-> Checkings.lib
#	- EchoError			-> Echo.lib
#	- EchoNewstep		-> Echo.lib
#	- EchoSuccess		-> Echo.lib
#	- Newline			-> Echo.lib
#	- HandleErrors		-> Headers.lib
function ChownRec()
{
    #***** Paramètres *****
    local p_currentOwner=$1    # This parameter is used in the messages.
    local p_newOwner=$2
    local p_path=$3

    #***** Code *****
    # The "chown" command has to be used with super-user privileges,
    CheckRootEUID

    # If the path passed as argument doesn't exists.
    if [ ! -d "$p_path" ]; then
        HandleError "1" "" "" ""
    fi

    EchoNewstep "Recursive change of the ownership rights of the new folder $(DechoHighlight "$p_path/") from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")"
	Newline

    # On change les droits du fichier créé par le script.
	# Comme il est exécuté en mode super-utilisateur, tout dossier ou fichier créé appartient à l'utilisateur root.
	# Pour attribuer les droits de lecture, d'écriture et d'exécution (rwx) à l'utilisateur normal, on appelle
	# la commande chown avec pour arguments :
	#		- Le nom de l'utilisateur à qui donner les droits.
	#		- Le chemin du dossier cible.
	if chown -Rv "$p_newOwner" "$p_path"; then
		EchoSuccess "The rights of the $(DechoHighlight "$p_path/") folder have been successfully changed from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")"
		Newline

		return 0
	else
        EchoError "Unable to change the rights of the $(DechoHighlight "$p_path/") folder"
		Newline

		return 1
    fi
}


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### NON-RECURSIVE PERMISSION AND OWNERSHIP PROCESSING

## NON-RECURSIVE OWNERSHIP SWAPPING

# Fonctions d'attribution de propriété de fichier à l'utilisateur.

# Required functions and files into the "Bash-Utils/src/functions" folder :
#   - CheckRootEUID -> Checkings.lib
#   - EchoError     -> Echo.lib
#   - EchoNewstep   -> Echo.lib
#   - EchoSuccess   -> Echo.lib
#   - DrawLine      -> Headers.lib
#   - HandleErrors  -> Headers.lib
function Chown()
{
    #***** Parameters *****
    p_currentOwner=$1    # This parameter is used in the translated messages, stored into their own variables.
    p_newOwner=$2
    p_path=$3
    p_option=$4   # Recursive swapping or not.
    
    #***** Code *****
    # The "chown" command has to be used with super-user privileges,
    CheckRootEUID

    # If the path passed as argument doesn't exists.
    if [ -d "$p_path" ]; then
        EchoNewstep "Changing the ownership rights of the  $(DechoHighlight "$p_path/") folder from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")."
        Newline
        
        # Changing ownership recursively.
        case "$p_option" in
            'R')
                if chown -Rv "$p_newOwner" "$p_path"; then
                    EchoSuccess "The rights of the $(DechoHighlight "$p_path") folder have been successfully changed from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")"
                    Newline

                    return 0
                else
                    HandleErrors "1" "Unable to change the rights of the $(DechoHighlight "$p_path/") folder" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-7 ))"
                    Newline

                    return 1
                fi
                ;;
            '')
                # Changing ownership non-recursively.
                if chown -v "$p_newOwner" "$p_path"; then
                    EchoSuccess "The rights of the $(DechoHighlight "$p_path") folder have been successfully changed from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")"
                    Newline

                    return 0

                else
                    HandleErrors "1" "UNABLE TO CHANGE THE RIGHTS OF THE $(DechoHighlight "$p_path/") FOLDER" \
                        "Please run the script with the command $(DechoHighlight "bash -x $PROJECT_NAME") to check what happened" \
                        "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-11 ))"
                    Newline

                    return 1
                fi
                ;;
            *)
                HandleError "1" "THE $(DechoHighlight "${FUNCNAME[0]}")'S FUNCTION $(DechoHighlight "$p_option") OPTION PASSED AS 4TH ARGUMENT IS NOT SUPPORTED" \
                    "The supported options for directory processing are :" "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
                ;;
        esac
        
        
    else
        # Checking first if the path is a filepath. If not, then no correct path is passed as argument.
        if [ -f "$p_path" ]; then
            EchoNewstep "Changing the ownership rights of the  $(DechoHighlight "$p_path/") file from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")."
            Newline

            # Changing ownership
            if chown -v "$p_newOwner" "$p_path"; then
                EchoSuccess "The rights of the $(DechoHighlight "$p_path") file have been successfully changed from $(DechoHighlight "$p_currentOwner") to $(DechoHighlight "$p_newOwner")."
                Newline

                return 0
            else
                HandleErrors "$?" "Unable to change the rights of the $(DechoHighlight "$p_path") file !"
                Newline

                return 1
            fi
        else
            HandleErrors "1" "THE $(DechoHighlight "$p_path") FILE DOESN'T EXISTS" && return 1
        fi
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #
# 
# /HOME/DIMOB/PROJETS/BASH-UTILS/LIB/FUNCTIONS/MAIN/TIME.LIB
# 
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

