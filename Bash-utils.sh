#!/usr/bin/env bash

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINTION

## TEXT PROCESSING FUNCTIONS

# Checking if the "$__STAT_TXT_FMT" status variable's value is "true".
function CheckFmt
{
    if [ "$__STAT_TXT_FMT" = "true" ]; then
        return 0
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PROJECT'S VARIABLES

## PROJECT'S PATH VARIABLES

# Script file's informations
__PROJECT_FILE=$(basename "$0")                           # Project file's name.
__PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')         # Name of the project (project file's name without its file extension).

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    __PROJECT_TMP_DIR_PATH="$__BASH_UTILS_TMP/$__PROJECT_NAME - ROOT"	# Default --> "$__BASH_UTILS_TMP/$__PROJECT_NAME - ROOT"

else
    __PROJECT_TMP_DIR_PATH="$__BASH_UTILS_TMP/$__PROJECT_NAME"			# Default --> "$__BASH_UTILS_TMP/$__PROJECT_NAME"
fi

# Defining project's log file's path.
__PROJECT_LOG_DIR_NAME="logs"												# Default --> "logs"
__PROJECT_LOG_DIR_PATH="$__PROJECT_TMP_DIR_PATH/$__PROJECT_LOG_DIR_NAME"	# Default --> "$__PROJECT_TMP_DIR/$__PROJECT_LOG_DIR_NAME"
__PROJECT_LOG_FILE_NAME="$__PROJECT_NAME.log"								# Default --> "$__PROJECT_NAME.log"
__PROJECT_LOG_FILE_PATH="$__PROJECT_LOG_DIR_PATH/$__PROJECT_LOG_FILE_NAME"	# Default --> "$__PROJECT_LOG_DIR_PATH/$__PROJECT_LOG_FILE_NAME"

# Defining project's text formatting building's output file.
__PROJECT_TR_FILE_NAME="tr.tmp"												# Default --> "tr.tmp"
__PROJECT_TR_FILE_PATH="$__PROJECT_TMP_DIR_PATH/$__PROJECT_TR_FILE_NAME"	# Default --> "$__PROJECT_TMP_DIR_PATH/$__PROJECT_TR_FILE_NAME"

# Defining
__PROJECT_COLOR_CODE_FILE_NAME="colors.tmp"
__PROJECT_COLOR_CODE_FILE_PATH="$_PROJECT_TMP_DIR_PATH/$__PROJECT_COLOR_CODE_FILE_NAME"

# -----------------------------------------------
#!/usr/bin/env bash

# These status variables can be changed anywhere in the main script, except for the following variables :
#   - __STAT_DEBUG      -> This variable is used as (...).

# Project's debug variable --> This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__STAT_DEBUG="false"

# Project's error handling --> This variable accepts "fatal" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_ERROR=""

# Project's exit code --> This variable only accepts an integer.
# Default value : "1"
# shellcheck disable=SC2034
__STAT_EXIT_CODE="1"

# Project's text color redirection to a FIFO (to store the tput setaf <code> integer) --> This variable accepts "true" or "false" as value.
# Default value : "false"
# shellcheck disable=SC2034
__STAT_FIFO_REDIRECT="false"

# Project's main log file informations --> This variable only accepts "true" or "false" as values.
# Default value : "true"
# shellcheck disable=SC2034
__STAT_LOG="true"

# Project's main log file redirections status --> This variables accepts "log", "tee" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_LOG_REDIRECT=""

# Project's authorization to operate at the root directory or one of its sub-folders --> This variable accepts "authorized", "forbidden" or "restricted" as values.
# Default value : "forbidden" (by security).
# shellcheck disable=SC2034
__STAT_OPERATE_ROOT="forbidden"

# Project's messages display time --> This variable accepts any integer of floating number.
# Default value : ".5"
# shellcheck disable=SC2034
__STAT_TIME_TXT=".5"

# Project's handling text formatting --> This variable accepts "true" or "false" as value.
# Default value : "true"
# shellcheck disable=SC2034
__STAT_TXT_FMT="true"

# User's operating system (getting user's OS is important for OS-dependent processings, like package management)
# --> This variable will be completed with the "CheckSupportedOSType" function.
# Default value : "" (no value)
# shellcheck disable=SC2034
__STAT_USER_OS=""
#!/usr/bin/env bash

# This configuration file stores color codes.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### FUNCTIONS DEFINTION

## COLOR CODES

# Writing the color code into a file, to be processed by any function which needs to know what is the current text color.
function WriteTextColor
{
	#***** Parameters *****
	p_colorCode=$1

	#***** Code *****
	if CheckFmt; then
        if [ -n "$__PROJECT_COLOR_CODE_FILE_PATH" ] && [ -f "$__PROJECT_COLOR_CODE_FILE_PATH" ]; then
            tput setaf "$p_colorCode" && echo "$p_colorCode" > "$__PROJECT_COLOR_CODE_FILE_PATH"
        else
            tput setaf "$p_colorCode"
        fi
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### COLOR ENCODING

## COLOR CODES FOR ENCODING
__BU_COLOR_CODE_BLUE='4'
__BU_COLOR_CODE_CYAN='6'
__BU_COLOR_CODE_GRAY="244"
__BU_COLOR_CODE_GREEN='82'
__BU_COLOR_CODE_ORANGE='166'
__BU_COLOR_CODE_PINK='200'
__BU_COLOR_CODE_PURPLE='165'
__BU_COLOR_CODE_RED='196'
__BU_COLOR_CODE_TURQUOISE='51'
__BU_COLOR_CODE_YELLOW='226'

# -----------------------------------------------

## COLOR CODES FOR SPECIFIC TEXT DISPLAY

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

## ENCODING WITH THE "tput" COMMAND.

# Encodage des couleurs (codes de la commande "tput setaf") pour mieux lire les étapes de l'exécution du script.
__BU_COLOR_BLUE="$(WriteTextColor "$__BU_COLOR_CODE_BLUE")"       	# Deep blue
__BU_COLOR_CYAN="$(WriteTextColor "$__BU_COLOR_CODE_CYAN")"       	# Cyan blue
__BU_COLOR_GRAY="$(WriteTextColor "$__BU_COLOR_CODE_GRAY")"         # Gray
__BU_COLOR_GREEN="$(WriteTextColor "$__BU_COLOR_CODE_GREEN")"     	# Light green
__BU_COLOR_ORANGE="$(WriteTextColor "$__BU_COLOR_CODE_ORANGE")"   	# Orange
__BU_COLOR_PINK="$(WriteTextColor "$__BU_COLOR_CODE_PINK")"         # Pink
__BU_COLOR_PURPLE="$(WriteTextColor "$__BU_COLOR_CODE_PURPLE")"		# Purple
__BU_COLOR_RED="$(WriteTextColor "$__BU_COLOR_CODE_RED")"	      	# Light red
__BU_COLOR_TURQUOISE=$(WriteTextColor "$__BU_COLOR_CODE_TURQUOISE") # Turquoise
__BU_COLOR_YELLOW="$(WriteTextColor "$__BU_COLOR_CODE_YELLOW")"		# Light yellow

__BU_COLOR_ERROR="$__BU_COLOR_CODE_ERROR"							# Error text display color
__BU_COLOR_HIGHLIGHT="$__BU_COLOR_CODE_HIGHLIGHT"					# Highlighted text display color
__BU_COLOR_RESET="$__BU_COLOR_CODE_RESET"							# Reset color to terminal's default text color
__BU_COLOR_SUCCESS="$__BU_COLOR_CODE_SUCCESS"						# Success text display color
__BU_COLOR_WARNING="$__BU_COLOR_CODE_WARNING"						# Warning text display color

# -----------------------------------------------
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

# Bold
__BU_TXT_BOLD="$(CheckFmt && tput bold)"
__BU_TXT_BOLD_RESET="$(CheckFmt && tput rmso)"

# Italic
__BU_TXT_ITALIC="$(CheckFmt && tput sitm)"
__BU_TXT_ITALIC_RESET=$(CheckFmt && tput ritm)

# Reset
__BU_TXT_RESET="$(CheckFmt && tput sgr0)"

# Underline
__BU_TXT_UNDERLINE="$(CheckFmt && tput smul)"
__BU_TXT_UNDERLINE_RESET="$(CheckFmt && tput rmul)"

# -----------------------------------------------
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### DATE

## GETTING THE DATE
# Saving the current date in YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second)
__TIME_DATE=$(date +"%Y-%m-%d %Hh-%Mm-%Ss")

# -----------------------------------------------

## PRINTING THE DATE
# Displaying the current date YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second) with a colored text (for a better view in the log file).
__TIME_DATE_DISPLAY=$(printf "$(tput setaf 111)$__TIME_DATE$(tput sgr0)")
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !" >&2; echo >&2
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### INITIALIZATION

## INITIALIZING THE ARGUMENTS ARRAY

function InitARG
{
    # shellcheck disable=SC2034
    __PROJECT_ARGV=("$@")
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### OPERATING SYSTEM SPECIFIC ARGUMENTS

## INSTALLATION CATEGORY

function DeclareARG_INSTALL_CAT
{
    #***** Parameters *****
    p_install=$1

    #***** Code *****
    # shellcheck disable=SC2034
    __PROJECT_ARG_INSTALL_CAT="$p_install"
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### USER'S ARGUMENTS

## USER'S NAME

function DeclareARG_USERNAME
{
    #***** Parameters *****
    p_username=$1

    #***** Code *****
    # shellcheck disable=SC2034    
    __PROJECT_ARG_USERNAME="$p_username"
}
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

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
function CaseRead_TriggerRootDirWarning
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
function CaseRead_HandleErrors
{
	# shellcheck disable=SC2154
	case "${__read_HandleErrors,,}" in
		"yes")
			EchoNewstep "Resuming the execution of the $(DechoHighlight "$__PROJECT_FIlE") script."
			;;
		"no")
			EchoError "Aborting the $(DechoHighlight "$__PROJECT_FIlE")'s execution."
			;;
		*)
			EchoError "$__CASE_INVALID_ANSWER"
			CaseRead_HandleErrors
			;;
	esac
}#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### CHECKING FOR IDENTIFIANTS

## EFFECTIVE USER IDENTIFIANTS CHECKING

# Checking if the current effective UID (EUID) is not equal to 0 (root user's EUID).

# Required functions and files :
#   - HandleErrors      -> Bash-Utils/lib/functions/basis/Handles.lib
function CheckRootEUID
{
    if [ "$EUID" -ne 0 ]; then
        HandleErrors "1" "YOU NEED ROOT USER'S PRIVILEGES TO PERFORM THIS ACTION !" "Please launch your script with super-user privileges." \
            "EUID = 0" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ARGUMENT VALUES CHECKING : UTILITES FUNCTIONS

## TEXT FORMATING FUNCTIONS

# Cut the text of the function's name before and with the underscore.
function CutCheck
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	#shellcheck disable=SC2001
	sed 's/^[^_]*_//' <<< "$p_string"
}

# -----------------------------------------------

## PATH CHECKING FUNCTIONS

# Check if the script is about to work at the root directory ('/').
function TriggerRootDirWarning
{
	#***** Parameters *****
	p_path=$1

	#***** Variables *****
#	v_root_directories=$( \/snap
		'/' '/bin' '/boot' \
		'/dev' '/etc' '/home' \
		'/lib' '/lib32' '/lib64' \
		'/libx32' '/lost+found' \
		'/media' '/mnt' '/opt' \
		'/proc' '/root' '/run' '/sbin' \
		'/snap' '/srv' '/sys' \
		'/tmp' '/usr' '/var' \)

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
			EchoWarning "WARNING !!!!!!! DO NOT SKIP THIS MESSAGE BEFORE READING IT !!!!!!"
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



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BASIS FUNCTIONS ARGUMENT VALUES CHECKING

## "basis/Checkings.lib" FILE

# Checking if an argument is provided in the "Is..." functions (check the below "VARIABLES VALUES CHECKING" section for more informations).
function CheckArgs_IsCorrectValue
{
    if [ "$#" -eq 0 ]; then
        HandleErrors "1" "" "" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MAIN FUNCTIONS ARGUMENT VALUES CHECKING

## "main/Directories.lib" FILE'S FUNCTION

# "ProcessingDir" function.
function CheckArgs_ProcessingDir
{
    #***** Parameters *****
    local p_function=$1
    local p_parent=$2
    local p_name=$3

    #***** Code *****
    if [ -z "$p_function" ]; then
        HandleErrors "1" "NO FUNCTION NAME PASSED AS ARGUMENT" \
            "THE FUNCTION $(DechoHighlight "$(CutCheck "${FUNCNAME[0]}")") NEEDS A FUNCTION PASSED AS FIRST ARGUMENT TO WORK PROPERLY" \
            "$p_function" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    elif [ -z "$p_parent" ] || [ -z "$p_name" ]; then
        HandleErrors "1" "AT LEAST ONE OF THE TWO $(DechoHighlight "$(CutCheck "${FUNCNAME[0]}")")'S LAST ARGUMENTS IS MISSING" \
            "The function $(DechoHighlight "$(CutCheck "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
            "$p_function" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    fi
}

# "OverwriteDir" function.
function CheckArgs_OverwriteDir
{
    #***** Parameters ****
    local p_path=$1         # Path of the directory to overwrite.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_path')") PARAMETER HAS NO VALUE" "Please pass the path of the directory to overwrite as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the given folder path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_path" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_path')") PARAMETER'S VALUE IS INCORRECT" "Please pass the correct path of the directory to overwrite as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "Makedir" function.
function CheckArgs_Makedir
{
    #***** Parameters *****
    local p_parent=$1       # Parent folder's path.
    local p_name=$2         # Name of the folder to create.

    #***** Code *****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z  "$p_parent" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_parent')") PARAMETER HAS NO VALUE" "" "$p_parent" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_parent" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_parent')") PARAMETER'S VALUE IS INCORRECT" "" "$p_parent" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the folder's name is missing (no name is given).
    local lineno="$LINENO"; elif [ -z "$p_name" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_name')") PARAMETER HAS NO VALUE" "" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------

## "main/Files.lib" FILE's FUNCTION

# "ProcessingFile" function.
function CheckArgs_ProcessingFile
{
    #***** Parameters *****
    local p_function=$1     # 

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_function" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_function')") PARAMETER'S VALUE IS INCORRECT" "Please pass a valid file processing function as first argument" \
            "$p_function" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
    fi
}

# "OverwriteFile" function.
function CheckArgs_OverwriteFile
{
    #***** Parameters ****
    local p_path=$1         	# Path of the file to overwrite.
	local p_authorization=$2	# Authorization to overwrite the file.

    #***** Code *****
    # If the target file's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_path')") PARAMETER HAS NO VALUE" "Please pass the path of the directory to overwrite as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the given file path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_path" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_path')") PARAMETER'S VALUE IS INCORRECT" "Please pass the correct path of the directory to overwrite as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
			
	local lineno="$LINENO"; elif [ -z "$p_authorization" ]; then

		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_authorization')") PARAMETER HAS NO VALUE" "Please enter a valid value for the overwrite authorization" "$p_authorization" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno" 
    fi
}

# "Makefile" function's arguments.
function CheckArgs_Makefile
{
    #***** Parameters *****
    local p_parent=$1       # File to create's Parent folder path. 
    local p_name=$2         # Name of the file to create.

    #***** Code *****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_parent" ]; then
        
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_parent')") PARAMETER HAS NO VALUE" "Please pass the path of the new directory's parent folder as first argument" \
            "$p_parent" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; elif [ ! -d "$p_parent" ]; then
    
		# shellcheck disable=SC2016
		HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_parent')") PARAMETER'S VALUE IS INCORRECT" "Please pass a valid parent directory path as first argument" \
				"$p_parent" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

    # Else, if the file's name is missing (no name is given).
    local lineno="$LINENO"; elif [ -z "$p_name" ]; then

		# shellcheck disable=SC2016
        HandleErrors "1" "THE $(ToLowercase "$(CutCheck "${FUNCNAME[0]}")'s") $(DechoHighlight "$(ToLowercase '$p_name')") PARAMETER HAS NO VALUE" "Please pass the name of the folder to create as second argument" \
            "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BASIS FUNCTIONS VALUES HANDLING

## "basis/Echo.lib" FILE

# Checking if the color code file exists.
function HandleVal_Decho
{
    if [ ! -f "$__PROJECT_COLOR_CODE_FILE_PATH" ]; then
        echo "$__BU_COLOR_RESET" >&2; echo "${__BU_COLOR_WARNING}Warning ! The ${__BU_COLOR_HIGHLIGHT}$__PROJECT_COLOR_CODE_FILE_PATH${__BU_COLOR_WARNING} temporary file doesn't exists !${__BU_COLOR_RESET}" >&2; echo >&2

		CheckProjectRelatedFile "$__PROJECT_COLOR_CODE_FILE_PATH"
		
		touch "$__PROJECT_COLOR_CODE_FILE_PATH" || { echo >&2; echo "${__BU_COLOR_ERROR}BASH UTILS ERROR ! The ${__BU_COLOR_HIGHLIGHT}$__PROJECT_COLOR_CODE_FILE_PATH${__BU_COLOR_ERROR} temporary file doesn't exists !${__BU_COLOR_RESET}" >&2; echo >&2; ExitError; }
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES VALUES CHECKING

## NUMBER VALUES

# Checking floating value.
function IsFloat
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgs_IsCorrectValue "$p_value"

    if [[ "$p_value" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking floating and integer value.
function IsFloatInt
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgs_IsCorrectValue "$p_value"

    if [[ "$p_value" =~ ^([0-9]+\.?|[0-9]*\.[0-9]+)$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking integer value.
function IsInt
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgs_IsCorrectValue "$p_value"

    if [[ "$p_value" =~ ^[+-]?[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------

## STRING VALUES

# Checking if value is an alphabetic string (not any number allowed)
function IsAlpha
{
    #***** Parameters *****
    local p_value=$1
    
    #***** Code *****
    CheckArgs_IsCorrectValue "$p_value"

    if [[ "$p_value" =~ [A-Z] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if vialue is an aplhanumeric string.
function IsAlphaNum
{
    #***** Parameters *****
    local p_value=$1

    #***** Code *****
    CheckArgs_IsCorrectValue "$p_value"

    if [[ "$p_value" =~ [^a-zA-Z0-9\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PATHS CHECKING

## FILE PATHS CHECKING

# Checking for an existent directory path (for the "HandleErrors()" function mainly).
function CheckDirPathExists
{
    #***** Parameters *****
    p_path=$1               # Path of the (in)existent directory.

    #***** Code *****
    if [ ! -f "$p_path" ]; then
        DechoBoldItalic "<missing directory path>"
    fi
}

# Checking for an existent file path (for the "HandleErrors()" function mainly).
function CheckFilePathExists
{
    #***** Parameters *****
    p_path=$1               # Path of the (in)existent file.

    #***** Code *****
    if [ ! -f "$p_path" ]; then
        DechoBoldItalic "<missing file path>"
    fi
}

# Checking for "$PROJECT_LOG_PATH"

# Required functions and files :
function CheckProjectLogPath
{
    if [ -z "$__PROJECT_LOG_FILE_PATH" ]; then
        echo -ne "${__BU_COLOR_ERROR}IN $(DechoHighlight "$(basename "${BASH_SOURCE[0]}")"), function $(DechoHighlight "${FUNCNAME[0]}"), LINE $(DechoHighlight "$(( LINENO-1 ))") --> " >&2
        echo "FATAL ERROR : NO PATH PROVIDED INTO THE $(DechoHighlight "PROJECT_LOG_PATH") VARIABLE" >&2
        echo "Please add the path as argument.${__BU_COLOR_RESET}" >&2; echo >&2
        ExitError

    elif [ ! -f "$__PROJECT_LOG_FILE_PATH" ]; then
        echo -ne "${__BU_COLOR_ERROR}IN $(DechoHighlight "$(basename "${BASH_SOURCE[0]}")"), FUNCTION $(DechoHighlight "${FUNCNAME[0]}"), LINE $(DechoHighlight "$(( LINENO-1 ))") --> " >&2
        echo "FATAL ERROR : BAD PATH PROVIDED INTO THE $(DechoHighlight "PROJECT_LOG_PATH") VARIABLE" >&2
        echo "Please correct the path passed as argument.${__BU_COLOR_RESET}" >&2; echo >&2
        ExitError

    fi
}

# Checking for project's log file's status, then write the wanted text with 'echo' command's parameters.
function CheckProjectLogStatus
{
    #***** Parameters *****
    local p_string=$1       # String to display.
    local p_option=$2       # "echo" command options.
    shift 2

    local p_extraArgs=("$@")    # More processing arguments (like the processing of a whole line-long string).

    #***** Variables *****
    local a_acceptedExtraArgs=('nodate')        # Allowed extra arguments list for the "$p_extraArgs" array of arguments.
    local v_errorEcho
		v_errorEcho="${__BU_COLOR_ERROR}Unable to write into the $(Decho "$__PROJECT_LOG_FILE_PATH" "${__BU_COLOR_HIGHLIGHT}") file.${__BU_COLOR_RESET}"
	
	local v_warning_array_value
		v_warning_array_value="${__BU_COLOR_WARNING}Warning : incorrect argument given as extra argument array in ${__BU_COLOR_HIGHLIGHT}${BASH_SOURCE[0]}${__BU_COLOR_WARNING},  function ${__BU_COLOR_HIGHLIGHT}${FUNCNAME[0]}${__BU_COLOR_WARNING} --> $val${__BU_COLOR_RESET}"

    # If the text is redirected towards the log path only, it's better to put every timer status variables values to '0'.
    if [ "$__STAT_LOG_REDIRECT" = "true" ]; then
        if [ "$__STAT_LOG_REDIRECT" = "log" ] && [ "$__STAT_TIME_TXT" -gt 0 ]; then

            # Backup the old values to restore them when the log processing will be done.
            local __BU_OLD_STAT_TIME_TXT="$__STAT_TIME_TXT"
            __STAT_TIME_TXT="0"; CheckSTAT_TIME_TXT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi
    
    #**** Code *****
    CheckProjectLogPath
    CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    # If a log file exists AND if "$__STAT_LOG" value is "false" AND if "$__STAT_LOG_REDIRECT" has a redirection value.
    if [ -f "$__PROJECT_LOG_FILE_PATH" ] && [ "$__STAT_LOG" = "true" ] && [ -n "$__STAT_LOG_REDIRECT" ]; then

        # If messages must be redirected in the log file only ("$__STAT_LOG_REDIRECT" value is equal to "log")
        if [ "$__STAT_LOG_REDIRECT" = "log" ]; then

            # Checking if the extra arguments array contains an allowed value, by checking the "$a_acceptedExtraArgs" array's values.
            if [[ "${p_extraArgs[*]}" =~ ${a_acceptedExtraArgs[*]} ]]; then

                for val in "${p_extraArgs[@]}"; do

                    # If the "nodate" value is passed as argument.
                    if [ "$val" = "nodate" ]; then
                        case "$p_option" in
                            '-n')
                                echo -ne "$p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                            '')
                                echo -e "$p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                        esac

                    # Else, if an unsupported option is passed (note for myself : the extra args checking
                    # "for" loop (for val in "${p_extraArgs[@]}"; do) is still running (for the "log" option)).
                    else
                        case "$p_option" in
                            '-n')
                                echo -ne "[$__TIME_DATE] $p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                echo -e "$v_warning_array_value" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                            '')
                                echo -e "[$__TIME_DATE]$p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                echo -e "$v_warning_array_value" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                        esac
                    fi
                done

            # Else, if no argument is passed in "$p_extraArgs" parameter array.
            else
                case "$p_option" in
                    '-n')
                        echo -ne "[$__TIME_DATE] $p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        ;;
                    '')
                        echo -e "[$__TIME_DATE] $p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        ;;
                esac
            fi

        sleep "$__STAT_TIME_TXT"

        # Else, if messages must be redirected in the log file AND to the terminal ("$__STAT_LOG_REDIRECT" value is equal to "tee")
        elif [ "$__STAT_LOG_REDIRECT" = "tee" ]; then

            # Checking if the extra arguments array contains an allowed value, by checking the "$a_acceptedExtraArgs" array's values.
            if [[ "${p_extraArgs[*]}" =~ ${a_acceptedExtraArgs[*]} ]]; then

                for val in "${p_extraArgs[@]}"; do

                    # If the "nodate" value is passed as argument.
                    if [ "$val" = "nodate" ]; then
                        case "$p_option" in
                            '-n')
                                echo -ne "$p_string" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                            '')
                                echo -e "$p_string" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                                ;;
                        esac

					# Else, if an unsupported option is passed (note for myself : the extra args checking
					# "for" loop (for val in "${p_extraArgs[@]}"; do) is still running (for the "tee" option)).
					else
						case "$p_option" in
							'-n')
								echo -ne "$p_string" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
								echo -e "$v_warning_array_value" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
								;;
							'')
								echo -e "$p_string" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
								echo -e "$v_warning_array_value" 2>&1 | tee -a "$__PROJECT_LOG_FILE_PATH" || { echo >&2; echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
								;;
						esac
					fi
				done

            # Else, if no argument is passed in "$p_extraArgs" parameter array.
            else
                case "$p_option" in
                    '-n')
                        echo -ne "$p_string"
                        echo -ne "[$__TIME_DATE_DISPLAY] $p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        ;;
                    '')
                        echo -e "$p_string"
                        echo -e "[$__TIME_DATE_DISPLAY] $p_string" >> "$__PROJECT_LOG_FILE_PATH" || { echo "$v_errorEcho" >&2; echo >&2; ExitSourced; }
                        ;;
                esac
            fi
            
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

    # Restore timer status variables old values if they were modified because of the redirection to the log file only.
    if [ "$__STAT_LOG_REDIRECT" = "true" ]; then
        if [ "$__STAT_LOG_REDIRECT" = "log" ] && [ "$__STAT_TIME_TXT" -eq 0 ]; then
        
            # Backup the old values to restore them when the log processing will be done, then check if the correct values were reassignated.
            __STAT_TIME_TXT="$__BU_OLD_STAT_TIME_TXT"; CheckSTAT_TIME_TXT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi
}

# -----------------------------------------------

## DIRECTORIES PATHS CHECKING

# 

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ERRORS HANDLING FUNCTIONS

## EXIT HANDLING

# Handling exit command from sourced files, as it's impossible to properly exit the script from these.
function ExitError
{
    # In case the "exit" command didn't worked, the program has to be killed.
    CheckSTAT_EXIT_CODE "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; exit "$__STAT_EXIT_CODE" || kill "$$"
}

# -----------------------------------------------

## SCRIPT'S ERRORS HANDLING

# Handling command outputs.
# Featured functions and files from the "basis" category :
#   - 
function HandleErrors
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
            EchoError "Value(s) that caused this error : $(DechoOrange 'No value') OR $(DechoOrange 'an unknown error')"; Newline >&2
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
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### VARIABLES VALUES CHECKING

## HANDLINGS

# Easy writing text function.
function ConfEcho
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
    echo >&2; echo -n "${__COLOR_CODE_ERROR}$__TXT_TAB$__TXT_TAB In ${__COLOR_CODE_HIGHLIGHT}$p_file${__COLOR_CODE_ERROR}, line ${__COLOR_CODE_HIGHLIGHT}$p_lineno${__COLOR_CODE_ERROR} --> " >&2
    echo "Error : the ${__COLOR_CODE_HIGHLIGHT}$p_varVal${__COLOR_CODE_ERROR} variable's value is incorrect.${__COLOR_CODE_RESET}" >&2

    if [ -z "$p_badVal" ]; then
        echo >&2; echo "${__COLOR_CODE_ERROR}$__TXT_TAB$__TXT_TAB Bad value :$__COL_YELLOW An empty string.${__COLOR_CODE_RESET}" >&2
    else
        echo >&2; echo "${__COLOR_CODE_ERROR}$__TXT_TAB$__TXT_TAB Bad value : ${__COLOR_CODE_HIGHLIGHT}$p_badVal.${__COLOR_CODE_RESET}" >&2
    fi

    echo >&2; echo "${__COLOR_CODE_ERROR}$__TXT_TAB$__TXT_TAB The allowed values are :${__COLOR_CODE_RESET}" >&2

    # Displaying the list of every allowed arguments.
    for val in "${p_array[@]}"; do
        i=$(( i+1 ))

        # If an empty argument is allowed.
        if [ -z "$val" ]; then
            echo -e "${__COLOR_CODE_ERROR}$i/${#p_array[@]}  --> ${__COL_ORANGE}An empty argument.${__COLOR_CODE_RESET}" >&2
        else
            echo -e "${__COLOR_CODE_ERROR}$i/${#p_array[@]}  --> ${__COLOR_CODE_HIGHLIGHT}$val${__COLOR_CODE_RESET}" >&2
        fi
    done

    echo >&2; ExitError 1
}

# -----------------------------------------------

## CHECKINGS

# Checking the "$__STAT_DEBUG" status variable's value.
function CheckSTAT_DEBUG
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_DEBUG" != "true" ] && [ "$__STAT_DEBUG" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_DEBUG" "__STAT_DEBUG" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_ERROR" status variable's value.
function CheckSTAT_ERROR
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("" "fatal")

    #***** Code *****
    if [ -n "$__STAT_ERROR" ] && [ "$__STAT_ERROR" != "fatal" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_ERROR" "__STAT_ERROR" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_EXIT_CODE" status variable's value.
function CheckSTAT_EXIT_CODE
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("")

    #***** Code *****
    if ! IsInt "$__STAT_EXIT_CODE"; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_EXIT" "__STAT_EXIT" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_LOG" status variable's value.
function CheckSTAT_LOG
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_LOG" != "true" ] && [ "$__STAT_LOG" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_LOG" "__STAT_LOG" "${a_array[@]}"
    elif [ "$__STAT_LOG" = "true" ] && [ ! -f "$__PROJECT_LOG_FILE_PATH" ]; then
		if [ ! -d "$__PROJECT_LOG_DIR_PATH" ]; then
			echo "${__BU_COLOR_NEWSTEP}Creating the ${__BU_COLOR_HIGHLIGHT}$__PROJECT_LOG_DIR_PATH${__BU_COLOR_NEWSTEP} folder.${BU_COLOR_RESET}"
			mkdir -pv "$__PROJECT_LOG_DIR_PATH" || { echo "${__BU_COLOR_ERROR}THE PROJECT'S TEMPORARY LOGS FOLDER CREATION FAILED" "" "$__PROJECT_LOG_DIR_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"; }
		fi

		echo "${__BU_COLOR_NEWSTEP}Creating the ${__BU_COLOR_HIGHLIGHT}$__PROJECT_LOG_FILE_PATH${__BU_COLOR_NEWSTEP} file.${BU_COLOR_RESET}"
		touch "$__PROJECT_LOG_FILE_PATH" || { echo "${__BU_COLOR_ERROR}THE PROJECT'S LOG FILE CREATION FAILED" "" "$__PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"; }

		# Redirecting the initializer's log file content into the log file.
		HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT"

		EchoNewstep "Sourced configuration files :"; for val in "${a_config_files_path[@]}"; do EchoMsg "$val"; done; Newline
		EchoNewstep "Sourced library files : "; for val in "${a_lib_files_path[@]}"; do EchoMsg "$val"; done; Newline
		
		EchoMsg "$(cat "$__INIT_LIST_FILE_PATH")" "" "nodate"

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
function CheckSTAT_LOG_REDIRECT
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("" "true" "false")

    #***** Code *****
    if [ -n "$__STAT_LOG_REDIRECT" ] && [ "$__STAT_LOG_REDIRECT" != 'log' ] && [ "$__STAT_LOG_REDIRECT" != 'tee' ]; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_LOG_REDIRECT" "__STAT_LOG_REDIRECT" "${a_array[@]}"
    fi
}

# Checking the "$__STAT_OPERATE_ROOT" status variable's value.
function CheckSTAT_OPERATE_ROOT
{
	#***** Parameters *****
	local p_file=$1
	local p_lineno=$2

	#***** Variables *****
	local a_array=("authorized" "forbidden" "restricted")

	#***** Code *****
	if [ "$__STAT_OPERATE_ROOT" != "authorized" ] && [ "$__STAT_OPERATE_ROOT" != "forbidden" ] && [ "$__STAT_OPERATE_ROOT" != "restricted" ]; then
		ConfEcho "$p_file" "$p_lineno" "$__STAT_OPERATE_ROOT" "__STAT_OPERATE_ROOT" "${a_array[@]}"
	fi
}

# Checking the "$__STAT_TIME_TXT" status variable's value.
function CheckSTAT_TIME_TXT
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local a_array=("${__COL_ORANGE}An integer or a floating number")

    #***** Code *****
    # If the status variable's value is not a float or an integer.
    if ! IsFloatInt "$__STAT_TIME_TXT"; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_TIME_TXT" "__STAT_TIME_TXT" "${a_array[@]}" >&2
    fi
}

# Checking the "$__STAT_TXT_FMT" status variable's value.
function CheckSTAT_TXT_FMT
{
    #***** Parameters *****
    p_file=$1
    p_lineno=$2

    #***** Variables *****
    local a_array=("true" "false")

    #***** Code *****
    if [ "$__STAT_TXT_FMT" != "true" ] && [ "$__STAT_TXT_FMT" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__STAT_TXT_FMT" '__STAT_TXT_FMT' "${a_array[@]}"
    fi
}
# Checking the "$__STAT_USER_OS" status variable's value.
# This function is empty now, as the OS handling is still in work.
function CheckSTAT_USER_OS
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Code *****
    return
}


# Checking all the project's status variables values if multiple values had been modified.
function CheckProjectStatusVars
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

# Checking the project's status variables before switching back to the project's script.
# This function will be executed during the sourcing of this file in the initializer script.
# There's no need to call it in the forementionned script.
# CheckProjectStatusVars "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
#!/usr/bin/env bash

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### DIRECTORIES FUNCTIONS

## PROCESSING FUNCTIONS

# Separate processing steps displays from the rest of the main script with a line.

# Featured functions and files from the "functions" folder :
#   - DrawLine      -> Headers.lib
#   - HandleErrors  -> Headers.lib
function ProcessingDir
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
	CheckArgs_ProcessingDir "$p_function" "$p_parent" "$p_name"
    
	sleep "$PROJECT_STATUS_SLEEP_LINE"
    EchoMsg "$(DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
    EchoNewstep "Processing the $(DechoN "$p_name") folder in the parent folder $(DechoN "$p_parent")."
    Newline
    
    if "$p_function"; then
        EchoSuccess "End of processing the $(DechoS "$p_name/") folder."
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
function OverwriteDir
{
    #***** Parameters *****
    local p_path=$1
	local p_authorization=$2

    #***** Code *****
    # Checking first if the awaited arguments are given
    CheckArgs_OverwriteDir "$p_path" "$p_authorization"
	
    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$p_path"

    EchoNewstep "A non-empty folder with exactly the same name ($(Dechoh "$p_name")) is already in the target folder $(DechoN "$p_parent/")"
	EchoNewstep "Deleting the contents of the $(DechoN "$v_path/") folder"
	Newline

	if [ "$p_authorization" = "true" ]; then
        # TODO : Si la variable n'est pas initialisée.
        if [ -n "${p_path+x}" ]; then
            # WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM WILL OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${v_path/:?}/"*
            HandleErrors "$?" "UNABLE TO DELETE THE CONTENT OF THE $(DechoHighlight "$v_path/") FOLDER." \
                "Please check the permissions of the targeted directory" "$v_path" "$v_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
            EchoSuccess "Deletion of the contents of the folder $(DechoS "$v_path/") performed successfully"
            Newline
        else
            __STAT_ERROR="fatal"; CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            HandleErrors
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
function Makedir
{
	#***** Parameters *****
	local p_parent=$1  # Emplacement of the currently processed directory's parent folder from the root directory.
	local p_name=$2    # Name of the folder to process (into its parent directory).

	#***** Variables *****
	local v_path="$p_parent/$p_name"	# Path of the file to process.

	#***** Code *****
	# Checking first if the awaited arguments are given
    CheckArgs_Makedir "$p_parent" "$p_name"
    
    # Checking second if the script is operating at the root directory.
    TriggerRootDirWarning "$v_path"
	
	# If the folder to create doesn't exists, ths script creates it with the help of the "mkdir" command.
	if [ ! -d "$v_path" ]; then
		EchoNewstep "Creating the $(DechoN "$p_name") folder in the parent folder $(DechoN "$p_parent/")."
		Newline

        mkdir -pv "$v_path"
        HandleErrors "$?" "${FUNCNAME[0]} : THE $(DechoHighlight "$p_name") FOLDER CANNOT BE CREATED IN THE PARENT FOLDER $(DechoHighlight "$p_parent/") !" \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
        EchoSuccess "The $(DechoS "$p_name") folder was successfully created in the $(DechoS "$p_parent/") folder."
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
		EchoSuccess "The $(DechoS "$p_name") folder already exists in the $(DechoS "$p_parent/") folder and is empty."
		Newline

		return 0
    fi
}

# -----------------------------------------------

## PATH PROCESSING

# Getting parent folder's name only (without its full path from the root directory), then printing it.
function GetParentDirectoryName
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    parent="$( cd "$(dirname "$p_path")" >/dev/null 2>&1 \
        || { 
            HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S PATH" "Check if the provided path is correct." "$p_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
        }; pwd -P )"
    dirname="$parent"
    
    shopt -s extglob           # enable +(...) glob syntax
    result=${dirname%%+(/)}    # trim however many trailing slashes exist
    result=${result##*/}       # remove everything before the last / that still remains
    echo "$dirname"
}

# Getting parent folder's path from the root directory, then printing it
function GetParentDirectoryPath
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    parent="$( cd "$(dirname "$p_path")" >/dev/null 2>&1 \
        || {
            HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Check if the provided path is correct." "$p_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
        }; pwd -P )"
    dirname="$parent"

    shopt -s extglob           # enable +(...) glob syntax
    result=${dirname%%+(/)}    # trim however many trailing slashes exist
    echo "$result"
}

# Getting the name of a target directory without its path.
function GetDirectoryName
{
    #***** Parameters *****
    local p_path=$1
    
    #***** Code *****
    if [ -z "$p_path" ]; then
        HandleErrors "1" "NO PATH ARGUMENT PASSED" "The $(DechoHighlight "${FUNCNAME[0]}") function takes a path as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    else
        if [ -d "$p_path" ]; then
            shopt -s extglob            # enable +(...) glob syntax
            result=${p_path%%+(/)}      # trim however many trailing slashes exist
            result=${result##*/}        # remove everything before the last / that still remains
            echo "$dirname"
        else
            HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
                "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-6 ))"
        fi
    fi
}

# Checking if the directory's sub-folders paths passed as argument exists, then print its path.
function GetDirectoryPath
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    if [ -z "$p_path" ]; then
        HandleErrors "1" "NO PATH ARGUMENT PASSED" "The $(DechoHighlight "${FUNCNAME[0]}") function takes a path as argument" \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
    else
        if [ -d "$p_path" ]; then
            echo "$p_path"
        else
            HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
                "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
        fi
    fi
}
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !"
    echo "Use this script only by sourcing it in your project script."; echo

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TEXT WRITING AND DECORATION (FORMATTING)

## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT

# Quick multi commands execution for the below "Decho()" function.
function __Decho { local v_oldColor=$1; tput setaf "$v_oldColor" && IsInt "$v_oldColor" && echo "$v_oldColor" > "$__BASH_UTILS_FILE_COLOR_CODE_PATH" }

# Text's inside decoration/formatting procssing.

# Usage :
#	Decho "${__BU_COLOR_<TO_DISPLAY>}" "$1" '<format code>'

# Featured functions and files from the "functions" folder : none
function Decho
{
    #***** Parameters *****
    local p_string=$1
    local p_newColor=$2
    local p_formatting=$3

    #***** Variables *****
    local v_oldColor
        v_oldColor="$(CheckDecho && cat "$__PROJECT_COLOR_CODE_FILE_PATH")"
        
    local v_commands
        v_commands="$()"

    #***** Code *****
    if [ -n "$p_newColor" ] && [ "$p_newColor" = "$v_oldColor" ]; then
        
        # TODO : Développer un meilleur système de changement de couleur (P-Ê en appelant une fonction à créer, ou en utilisant une formule mathématique). Se renseigner sur la commande "tput setaf".
		p_newColor="$(( p_newColor+2 ))"
		tput setaf "$p_newColor"
	fi

	case "${p_formatting^^}" in
        'B')
            # Formatting : bold.
            echo -e "${__BU_TXT_BOLD}$p_string${__BU_TXT_RESET}"
            ;;
        'BC')
            # Formatting : bold + color.
            echo -e "${__BU_TXT_BOLD}$(tput setaf "$p_newColor")$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'BCI')
            # Formatting : bold + color + italic.
            echo -e "${__BU_TXT_BOLD}$(tput setaf "$p_newColor")${__BU_TXT_ITALIC}$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'BCIU')
            # Formatting : bold + color + italic + underline
            echo -e "${__BU_TXT_BOLD}$(tput setaf "$p_newColor")${__BU_TXT_ITALIC}${__BU_TXT_UNDERLINE}$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'C')
            # Formatting : color.
            echo -e "$(tput setaf "$p_newColor")$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;

        'CI')
            # Formatting : color + italic.
            echo -e "$(tput setaf "$p_newColor")${__BU_TXT_ITALIC}$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'CIU')
            # Formatting : color + italic + underline.
            echo -e "$(tput setaf "$p_newColor")${__BU_TXT_ITALIC}${__BU_TXT_UNDERLINE}$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'CU')
            # Formatting : color + underline.
            echo -e "$(tput setaf "$p_newColor")${__BU_TXT_UNDERLINE}$p_string${__BU_TXT_RESET}" && __Decho "$v_oldColor"
            ;;
        'I')
            # Formatting : italic.
            echo -e "${__BU_TXT_ITALIC}$p_string${__BU_TXT_RESET}"
            ;;
        'IU')
            # Formatting : italic + underline.
            echo -e "${__BU_TXT_ITALIC}${__BU_TXT_UNDERLINE}$p_string${__BU_TXT_RESET}"
            ;;
        'U')
            # Formatting : underline.
            echo -e "${__BU_TXT_UNDERLINE}$p_string${__BU_TXT_RESET}"
            ;;
        *)
            HandleErrors "1" "THE $(DechoHighlight "case condition") TEXT FORMATTING VALUE IS INCORRECT" \
                "Please specify a valid text formatting. The list and the descriptions are available into the aforementionned condition." \
                "$p_formatting" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
            ;;
    esac
}

# Bold formatting.
function DechoBold                  { Decho "$1" "" 'B';    }
function DechoBoldItalic            { Decho "$1" "" 'BI';   }
function DechoBoldItalicUnderline   { Decho "$1" "" 'BIU';  }
function DechoBoldUnderline         { Decho "$1" "" 'BU';   }

# Italic formatting.
function DechoItalic                { Decho "$1" "" 'I';    }
function DechoItalicUnderline       { Decho "$1" "" 'IU';   }

# Underline formatting.
function DechoUnderline             { Decho "$1" "" 'U';    }

# Easy "Decho()" function calls.
function DechoHighlight { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'C'; }
function DechoBlue      { Decho "$1" "$__BU_COLOR_BLUE"         'C'; }
function DechoCyan      { Decho "$1" "$__BU_COLOR_CYAN"         'C'; }
function DechoGray      { Decho "$1" "$__BU_COLOR_GRAY"         'C'; }
function DechoGreen     { Decho "$1" "$__BU_COLOR_GREEN"        'C'; }
function DechoOrange    { Decho "$1" "$__BU_COLOR_ORANGE"       'C'; }
function DechoPink      { Decho "$1" "$__BU_COLOR_PINK"         'C'; }
function DechoPurple    { Decho "$1" "$__BU_COLOR_PURPLE"       'C'; }
function DechoRed       { Decho "$1" "$__BU_COLOR_RED"          'C'; }
function DechoTurquoise { Decho "$1" "$__BU_COLOR_TURQUOISE"    'C'; }
function DechoYellow    { Decho "$1" "$__BU_COLOR_YELLOW"       'C'; }

# Easy "DechoBold()" function calls with colors.
function DechoBoldHighlight     { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'BC'; }
function DechoBoldBlue          { Decho "$1" "$__BU_COLOR_BLUE"         'BC'; }
function DechoBoldCyan          { Decho "$1" "$__BU_COLOR_CYAN"         'BC'; }
function DechoBoldGray          { Decho "$1" "$__BU_COLOR_GRAY"         'BC'; }
function DechoBoldGreen         { Decho "$1" "$__BU_COLOR_GREEN"        'BC'; }
function DechoBoldOrange        { Decho "$1" "$__BU_COLOR_ORANGE"       'BC'; }
function DechoBoldPink          { Decho "$1" "$__BU_COLOR_PINK"         'BC'; }
function DechoBoldPurple        { Decho "$1" "$__BU_COLOR_PURPLE"       'BC'; }
function DechoBoldRed           { Decho "$1" "$__BU_COLOR_RED"          'BC'; }
function DechoBoldTurquoise     { Decho "$1" "$__BU_COLOR_TURQUOISE"    'BC'; }
function DechoBoldYellow        { Decho "$1" "$__BU_COLOR_YELLOW"       'BC'; }

# Easy "DechoBoldItalic()" function calls with colors.
function DechoBoldItalicHighlight   { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'BCI'; }
function DechoBoldItalicBlue        { Decho "$1" "$__BU_COLOR_BLUE"         'BCI'; }
function DechoBoldItalicCyan        { Decho "$1" "$__BU_COLOR_CYAN"         'BCI'; }
function DechoBoldItalicGray        { Decho "$1" "$__BU_COLOR_GRAY"         'BCI'; }
function DechoBoldItalicGreen       { Decho "$1" "$__BU_COLOR_GREEN"        'BCI'; }
function DechoBoldItalicOrange      { Decho "$1" "$__BU_COLOR_ORANGE"       'BCI'; }
function DechoBoldItalicPink        { Decho "$1" "$__BU_COLOR_PINK"         'BCI'; }
function DechoBoldItalicPurple      { Decho "$1" "$__BU_COLOR_PURPLE"       'BCI'; }
function DechoBoldItalicRed         { Decho "$1" "$__BU_COLOR_RED"          'BCI'; }
function DechoBoldItalicTurquoise   { Decho "$1" "$__BU_COLOR_TURQUOISE"    'BCI'; }
function DechoBoldItalicYellow      { Decho "$1" "$__BU_COLOR_YELLOW"       'BCI'; }

# Easy "DechoBoldItalicUnderline()" function calls with color.
function DechoBoldItalicUnderlineHighlight   { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'BCIU'; }
function DechoBoldItalicUnderlineBlue        { Decho "$1" "$__BU_COLOR_BLUE"         'BCIU'; }
function DechoBoldItalicUnderlineCyan        { Decho "$1" "$__BU_COLOR_CYAN"         'BCIU'; }
function DechoBoldItalicUnderlineGray        { Decho "$1" "$__BU_COLOR_GRAY"         'BCIU'; }
function DechoBoldItalicUnderlineGreen       { Decho "$1" "$__BU_COLOR_GREEN"        'BCIU'; }
function DechoBoldItalicUnderlineOrange      { Decho "$1" "$__BU_COLOR_ORANGE"       'BCIU'; }
function DechoBoldItalicUnderlinePink        { Decho "$1" "$__BU_COLOR_PINK"         'BCIU'; }
function DechoBoldItalicUnderlinePurple      { Decho "$1" "$__BU_COLOR_PURPLE"       'BCIU'; }
function DechoBoldItalicUnderlineRed         { Decho "$1" "$__BU_COLOR_RED"          'BCIU'; }
function DechoBoldItalicUnderlineTurquoise   { Decho "$1" "$__BU_COLOR_TURQUOISE"    'BCIU'; }
function DechoBoldItalicUnderlineYellow      { Decho "$1" "$__BU_COLOR_YELLOW"       'BCIU'; }

# Easy "DechoItalic()" function calls with colors.
function DechoItalicHighlight     { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'CI'; }
function DechoItalicBlue          { Decho "$1" "$__BU_COLOR_BLUE"         'CI'; }
function DechoItalicCyan          { Decho "$1" "$__BU_COLOR_CYAN"         'CI'; }
function DechoItalicGray          { Decho "$1" "$__BU_COLOR_GRAY"         'CI'; }
function DechoItalicGreen         { Decho "$1" "$__BU_COLOR_GREEN"        'CI'; }
function DechoItalicOrange        { Decho "$1" "$__BU_COLOR_ORANGE"       'CI'; }
function DechoItalicPink          { Decho "$1" "$__BU_COLOR_PINK"         'CI'; }
function DechoItalicPurple        { Decho "$1" "$__BU_COLOR_PURPLE"       'CI'; }
function DechoItalicRed           { Decho "$1" "$__BU_COLOR_RED"          'CI'; }
function DechoItalicTurquoise     { Decho "$1" "$__BU_COLOR_TURQUOISE"    'CI'; }
function DechoItalicYellow        { Decho "$1" "$__BU_COLOR_YELLOW"       'CI'; }

# Easy "DechoItalicUnderline()" function calls with colors.
function DechoItalicUnderlineHighlight     { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'CIU'; }
function DechoItalicUnderlineBlue          { Decho "$1" "$__BU_COLOR_BLUE"         'CIU'; }
function DechoItalicUnderlineCyan          { Decho "$1" "$__BU_COLOR_CYAN"         'CIU'; }
function DechoItalicUnderlineGray          { Decho "$1" "$__BU_COLOR_GRAY"         'CIU'; }
function DechoItalicUnderlineGreen         { Decho "$1" "$__BU_COLOR_GREEN"        'CIU'; }
function DechoItalicUnderlineOrange        { Decho "$1" "$__BU_COLOR_ORANGE"       'CIU'; }
function DechoItalicUnderlinePink          { Decho "$1" "$__BU_COLOR_PINK"         'CIU'; }
function DechoItalicUnderlinePurple        { Decho "$1" "$__BU_COLOR_PURPLE"       'CIU'; }
function DechoItalicUnderlineRed           { Decho "$1" "$__BU_COLOR_RED"          'CIU'; }
function DechoItalicUnderlineTurquoise     { Decho "$1" "$__BU_COLOR_TURQUOISE"    'CIU'; }
function DechoItalicUnderlineYellow        { Decho "$1" "$__BU_COLOR_YELLOW"       'CIU'; }

# Easy "DechoUnderline()" function calls with colors.
function DechoUnderlineHighlight     { Decho "$1" "$__BU_COLOR_HIGHLIGHT"    'CU'; }
function DechoUnderlineBlue          { Decho "$1" "$__BU_COLOR_BLUE"         'CU'; }
function DechoUnderlineCyan          { Decho "$1" "$__BU_COLOR_CYAN"         'CU'; }
function DechoUnderlineGray          { Decho "$1" "$__BU_COLOR_GRAY"         'CU'; }
function DechoUnderlineGreen         { Decho "$1" "$__BU_COLOR_GREEN"        'CU'; }
function DechoUnderlineOrange        { Decho "$1" "$__BU_COLOR_ORANGE"       'CU'; }
function DechoUnderlinePink          { Decho "$1" "$__BU_COLOR_PINK"         'CU'; }
function DechoUnderlinePurple        { Decho "$1" "$__BU_COLOR_PURPLE"       'CU'; }
function DechoUnderlineRed           { Decho "$1" "$__BU_COLOR_RED"          'CU'; }
function DechoUnderlineTurquoise     { Decho "$1" "$__BU_COLOR_TURQUOISE"    'CU'; }
function DechoUnderlineYellow        { Decho "$1" "$__BU_COLOR_YELLOW"       'CU'; }

# -----------------------------------------------

## DISPLAYING A COLORED MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__STAT_TIME_TXT" status variable.

# Error message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoError
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
    CheckProjectLogStatus "${__BU_COLOR_ERROR}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" >&2

    sleep "$__STAT_TIME_TXT"
}

# Normal message (without any extra color), with redirection checking.

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoMsg
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
function EchoNewstep
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
    CheckProjectLogStatus "${__BU_COLOR_ORANGE}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}"

    sleep "$__STAT_TIME_TXT"
}

# Read input values

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#	- CheckProjectLogStatus		--> Checkings.lib
function EchoRead
{
	#***** Parameters *****
	local p_string=$1
	
	#***** Code *****
	if [ -f "$__PROJECT_LOG_FILE_PATH" ] && [ "$__STAT_LOG" = "true" ] && [ -n "$__STAT_LOG_REDIRECT" ]; then
		echo "$p_string" >> "$__PROJECT_LOG_FILE_PATH"
	fi
}

# Success message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoSuccess
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
    CheckProjectLogStatus "${__BU_COLOR_SUCCESS}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" >&1

    sleep "$__STAT_TIME_TXT"
}

# Warning message

# Usage :
#	EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
function EchoWarning
{
    #***** Parameters *****
    local p_string=$1
    local p_option=$2; shift 2
    local p_arrExtraArgs=("$@")

    #***** Code *****
    CheckProjectLogStatus "${__BU_COLOR_WARNING}$__BU_TXT_PRINT_TAB$__BU_TXT_PRINT_TAB $p_string${__BU_COLOR_RESET}" "$p_option" "${p_arrExtraArgs[@]}" 1>&2

    sleep "$__STAT_TIME_TXT"
}

# -----------------------------------------------

## TEXT FORMATTING

# Keep the same text format between lowercased or uppercased text printed by a formatting text function ("ToLowercase()" OR "ToUppercase()") or a parameter expansion.
function KeepFormatting
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo "$p_string" | tr '[upper]' '[upper]'
}

# Print a lowercased text.

# Usage :
#	ToLowercase "<Text to write>"
function ToLowercase
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo "$p_string" | tr '[:upper:]' '[:lower:]'
}

# Print an uppercased text.

# Usage :
#	ToUppercase "<Text to write>"
function ToUppercase
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo "$p_string" | tr '[:lower:]' '[:upper:]'
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### LINE BREAKS

## LINE BREAKS ACCORDING TO THE "$MAIN_SCRIPT_LOG" VARIABLE VALUE.

# Redirecting the output of the "echo" command

# Featured functions and files from the "functions" folder :
#   - CheckProjectLogStatus     --> Checkings.lib
#	- HandleErrors				--> Checkings.lib
function Newline
{
    #***** Parameters *****
    local number=$1

    #***** Code *****
    if [ -n "$number" ]; then
        if ! IsInt "$number"; then
            HandleErrors "1" "THE NUMBER OF LINE BREAKS MUST BE AN INTEGER" \
                "Check at the mentionned file in the 4th $(DechoE "HandleErrors") function's argument" "$number" \
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
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TEXT FILES PROCESSING FUNCTIONS

# This function only repeats some parts of the following function.
function __ProcessingFile
{
    #***** Parameters *****
    p_output=$1
    p_name=$2
    p_char=$3

    #***** Code *****
    if [ "$p_output" = 'E' ]; then
        EchoError "End of processing the $(DechoE "$p_name") file"
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
function ProcessingFile
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
    EchoNewstep "Processing the $(DechoN "$p_name") file in the $(DechoN "$p_parent") parent directory."
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
function OverwriteFile
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
		EchoNewstep "The $(DechoN "$p_path/") file already exists and is not empty."
		EchoNewstep "Overwriting data from file $(DechoN "$p_path/")"
		Newline

		true > "$p_path"
		HandleErrors "$?" "THE CONTENT OF THE $(DechoE "$p_path/") FILE HAD NOT BEEN OVERWRITTEN" "" "$p_path" \
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
function Makefile
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
        EchoNewstep "Creating the $(DechoN "$p_name") file in the parent folder $(DechoN "$p_parent/")."

		touch "$v_path"
        # Testing if the file has been created by checking the return code of the "touch" command via the "HandleErrors" function.
        # An error may come from the fact that the user did not run the script in superuser mode, a script that tried to create a
        # file in a folder where the user is not allowed to create a file without superuser privileges.
        HandleErrors "$?" "THE $(DechoE "$p_name") FILE CANNOT BE CREATED IN THE $(DechoE "$p_parent/") PARENT FOLDER." \
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
function SourceFile
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    if [ -f "$p_path" ]; then
        # shellcheck disable=SC1090
        if source "$p_path"; then
            EchoSuccess "Sourced file : $(DechoS "$p_path")"
        else
            HandleErrors "1" "UNABLE TO FIND THIS PATH" "" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))"
        fi
    else
        HandleErrors "1" "UNABLE TO FIND THIS PATH" "Verify the path passed as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))"
    fi
}

# -----------------------------------------------

## TEXT FILES PARSING

# Getting a specific line from a text file.
function GetLineFromTextFile
{
    #***** Parameters *****
    local source=$1           # File to parse
    local wanted_line=$2      # Line to get in the file
    
    #***** Variables *****
    local i=0     # Line incrementer
    
    #***** Code *****
	# shellcheck disable=SC2002
    cat "$source" | while read -r line; do
        # Incrementing the line incrementer variable's value...
        i=$(( i+1 ))
        
        # ... until it reaches the wanted line.
        if [ "$i" -eq "$wanted_line" ]; then
            # Creating a variable and storing the wanted line's text.
            FILE_GETTXTLINE="$line"
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
function Compress
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
function Uncompress
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
    HandleErrors "$?" "${FUNCNAME[0]} : LA DÉCOMPRESSION DE L'ARCHIVE $(DechoE "$p_name") A ÉCHOUÉE"
    EchoSuccess "La décompression de l'archive $(DechoS "$p_name") s'est effectuée avec brio."
    Newline
    
    return 0
}
#!/usr/bin/env bash

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !" >&2; echo >&2
    echo "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### FUNCTIONS WITHOUT REDIRECTIONS TOWARDS A LOG FILE

## DÉFINITION DES FONCTIONS DE CRÉATION DE HEADERS

# Fonction de création et d'affichage de lignes selon le nombre de colonnes de la zone de texte du terminal.
function DrawLine
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
	for _ in $(eval echo "{1..$__TXT_COLS}"); do
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
function HeaderBase
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

# Header display function when changing step.
function HeaderStep     { HeaderBase "$__BU_COLOR_CYAN"     "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"   "$1"; }

# Header display function when switching to a new package category during package installation.
function HeaderInstall  { HeaderBase "$__BU_COLOR_YELLOW"   "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"  "$1"; }

# -----------------------------------------------

## UNICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating unicolor headers :
# function Header<col> { HeaderBase "$__BU_COLOR_<COLOR>"" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_<COLOR>" "$1"; }

function HeaderBlue         { HeaderBase "$__BU_COLOR_BLUE"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderCyan         { HeaderBase "$__BU_COLOR_CYAN"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderGray         { HeaderBase "$__BU_COLOR_GRAY"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderGreen        { HeaderBase "$__BU_COLOR_GREEN"        "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderOrange       { HeaderBase "$__BU_COLOR_ORANGE"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderPink         { HeaderBase "$__BU_COLOR_PINK"         "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderPurple       { HeaderBase "$__BU_COLOR_PURPLE"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderRed          { HeaderBase "$__BU_COLOR_RED"          "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderTurquoise    { HeaderBase "$__BU_COLOR_TURQUOISE"    "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderYellow       { HeaderBase "$__BU_COLOR_YELLOW"       "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# -----------------------------------------------

## BICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating multicolor headers :
# function Header<col1><col2> { HeaderBase "$__BU_COLOR_<COLOR>" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_<COLOR>" "$1"; }

# Blue lines, differently colored text.
function HeaderBlueCyan         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderBlueGray         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderBlueGreen        { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderBlueOrange       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderBluePink         { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderBluePurple       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderBlueRed          { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderBlueTurquoise    { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderBlueYellow       { HeaderBase "$__BU_COLOR_BLUE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Cyan lines, differently colored text.
function HeaderCyanBlue         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderCyanGray         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderCyanGreen        { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderCyanOrange       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderCyanPink         { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"       "$1"; }
function HeaderCyanPurple       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderCyanRed          { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderCyanTurquoise    { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderCyanYellow       { HeaderBase "$__BU_COLOR_CYAN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Green lines, differently colored text.
function HeaderGreenBlue        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"	"$1"; }
function HeaderGreenCyan        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN" 	"$1"; }
function HeaderGreenGray        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY" 	"$1"; }
function HeaderGreenOrange      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"	"$1"; }
function HeaderGreenPink        { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK" "$1"; }
function HeaderGreenPurple      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"	"$1"; }
function HeaderGreenRed         { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED" 	"$1"; }
function HeaderGreenTurquoise   { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderGreenYellow      { HeaderBase "$__BU_COLOR_GREEN" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW" 	"$1"; }

# Orange lines, differently colored text.
function HeaderOrangeBlue       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderOrangeCyan       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderOrangeGray       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderOrangeGreen      { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderOrangePink       { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderOrangePurple     { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"       "$1"; }
function HeaderOrangeRed        { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderOrangeTurquoise  { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
function HeaderOrangeYellow     { HeaderBase "$__BU_COLOR_ORANGE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"       "$1"; }

# Pink lines, differently colored text.
function HeaderPinkBlue         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"       "$1"; }
function HeaderPinkCyan         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"       "$1"; }
function HeaderPinkGray         { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"       "$1"; }
function HeaderPinkGreen        { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"      "$1"; }
function HeaderPinkOrange       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"     "$1"; }
function HeaderPinkPurple       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"     "$1"; }
function HeaderPinkRed          { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"        "$1"; }
function HeaderPinkTurquoise    { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"  "$1"; }
function HeaderPinkYellow       { HeaderBase "$__BU_COLOR_PINK" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"     "$1"; }

# Purple lines, differently colored text.
function HeaderPurpleBlue       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderPurpleCyan       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderPurpleGray       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderPurpleGreen      { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderPurpleOrange     { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"       "$1"; }
function HeaderPurplePink       { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderPurpleRed        { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderPurpleTurquoise  { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
function HeaderPurpleYellow     { HeaderBase "$__BU_COLOR_PURPLE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"       "$1"; }

# Red lines, differently colored text.
function HeaderRedBlue      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"        "$1"; }
function HeaderRedCyan      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"        "$1"; }
function HeaderRedGray      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"        "$1"; }
function HeaderRedGreen     { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"       "$1"; }
function HeaderRedOrange    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"      "$1"; }
function HeaderRedPink      { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"        "$1"; }
function HeaderRedPurple    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"      "$1"; }
function HeaderRedTurquoise { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"   "$1"; }
function HeaderRedYellow    { HeaderBase "$__BU_COLOR_RED" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"      "$1"; }

# Turquoise lines, differently colored text.
function HeaderTurquoiseBlue    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"      "$1"; }
function HeaderTurquoiseCyan    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"      "$1"; }
function HeaderTurquoiseGray    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"      "$1"; }
function HeaderTurquoiseGreen   { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"     "$1"; }
function HeaderTurquoiseOrange  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"    "$1"; }
function HeaderTurquoisePink    { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"      "$1"; }
function HeaderTurquoisePurple  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"    "$1"; }
function HeaderTurquoiseRed     { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE" "$1"; }
function HeaderTurquoiseYellow  { HeaderBase "$__BU_COLOR_TURQUOISE" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_YELLOW"    "$1"; }

# Yellow lines, differently colored text.
function HeaderYellowBlue       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_BLUE"         "$1"; }
function HeaderYellowCyan       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_CYAN"         "$1"; }
function HeaderYellowGray       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GRAY"         "$1"; }
function HeaderYellowGreen      { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_GREEN"        "$1"; }
function HeaderYellowOrange     { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_ORANGE"       "$1"; }
function HeaderYellowPink       { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PINK"         "$1"; }
function HeaderYellowPurple     { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_PURPLE"       "$1"; }
function HeaderYellowRed        { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_RED"          "$1"; }
function HeaderYellowTurquoise  { HeaderBase "$__BU_COLOR_YELLOW" "$__BU_TXT_PRINT_HEADER_LINE_CHAR" "$__BU_COLOR_TURQUOISE"    "$1"; }
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
function ChownRec
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

    EchoNewstep "Recursive change of the ownership rights of the new folder $(DechoN "$p_path/") from $(DechoN "$p_currentOwner") to $(DechoN "$p_newOwner")"
	Newline

    # On change les droits du fichier créé par le script.
	# Comme il est exécuté en mode super-utilisateur, tout dossier ou fichier créé appartient à l'utilisateur root.
	# Pour attribuer les droits de lecture, d'écriture et d'exécution (rwx) à l'utilisateur normal, on appelle
	# la commande chown avec pour arguments :
	#		- Le nom de l'utilisateur à qui donner les droits.
	#		- Le chemin du dossier cible.
	if chown -Rv "$p_newOwner" "$p_path"; then
		EchoSuccess "The rights of the $(DechoS "$p_path/") folder have been successfully changed from $(DechoS "$p_currentOwner") to $(DechoS "$p_newOwner")"
		Newline

		return 0
	else
        EchoError "Unable to change the rights of the $(DechoE "$p_path/") folder"
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
function Chown
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
        EchoNewstep "Changing the ownership rights of the  $(DechoN "$p_path/") folder from $(DechoN "$p_currentOwner") to $(DechoN "$p_newOwner")."
        Newline
        
        # Changing ownership recursively.
        case "$p_option" in
            'R')
                if chown -Rv "$p_newOwner" "$p_path"; then
                    EchoSuccess "The rights of the $(DechoS "$p_path") folder have been successfully changed from $(DechoS "$p_currentOwner") to $(DechoS "$p_newOwner")"
                    Newline

                    return 0
                else
                    HandleErrors "1" "Unable to change the rights of the $(DechoE "$p_path/") folder" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-7 ))"
                    Newline

                    return 1
                fi
                ;;
            '')
                # Changing ownership non-recursively.
                if chown -v "$p_newOwner" "$p_path"; then
                    EchoSuccess "The rights of the $(DechoS "$p_path") folder have been successfully changed from $(DechoS "$p_currentOwner") to $(DechoS "$p_newOwner")"
                    Newline

                    return 0

                else
                    HandleErrors "1" "UNABLE TO CHANGE THE RIGHTS OF THE $(DechoE "$p_path/") FOLDER" \
                        "Please run the script with the command $(DechoE "bash -x $PROJECT_NAME") to check what happened" \
                        "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-11 ))"
                    Newline

                    return 1
                fi
                ;;
            *)
                HandleError "1" "THE $(DechoE "${FUNCNAME[0]}")'S FUNCTION $(DechoE "$p_option") OPTION PASSED AS 4TH ARGUMENT IS NOT SUPPORTED" \
                    "The supported options for directory processing are :" "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
                ;;
        esac
        
        
    else
        # Checking first if the path is a filepath. If not, then no correct path is passed as argument.
        if [ -f "$p_path" ]; then
            EchoNewstep "Changing the ownership rights of the  $(DechoN "$p_path/") file from $(DechoN "$p_currentOwner") to $(DechoN "$p_newOwner")."
            Newline

            # Changing ownership
            if chown -v "$p_newOwner" "$p_path"; then
                EchoSuccess "The rights of the $(DechoS "$p_path") file have been successfully changed from $(DechoS "$p_currentOwner") to $(DechoS "$p_newOwner")."
                Newline

                return 0
            else
                HandleErrors "$?" "Unable to change the rights of the $(DechoE "$p_path") file !"
                Newline

                return 1
            fi
        else
            HandleErrors "1" "THE $(DechoE "$p_path") FILE DOESN'T EXISTS" && return 1
        fi
    fi
}

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #
#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

