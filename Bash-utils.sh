# /home/dimob/Bash-utils-init.sh
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# This configuration file stores color codes.

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### FUNCTIONS DEFINTION

## COLOR CODES

# Writing the color code into a file, to be processed by any function which needs to know what is the current text color.
function CheckTextColor()
{
	#***** Parameters *****
	# $1 --> Color code

	#***** Code *****
	if CheckTextFormat; then
        if command -v tput &> /dev/null; then
            tput setaf "$1" || { echo -ne "\e[38;5;$1m" && return 0; }

			echo "$1" > "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" || { echo -e; echo -e "The $__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH file doesn't exists"; exit 1; }; return 0
        else
            echo -ne "\e[38;5;$1m"; return 0
        fi
    else
        return 1
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### COLOR ENCODING

## COLOR CODES FOR ENCODING
__BU_MAIN_COLOR_CODE_BLACK='0'
__BU_MAIN_COLOR_CODE_BLUE='4'
__BU_MAIN_COLOR_CODE_CYAN='6'
__BU_MAIN_COLOR_CODE_GRAY="244"
__BU_MAIN_COLOR_CODE_GREEN='82'
__BU_MAIN_COLOR_CODE_ORANGE='166'
__BU_MAIN_COLOR_CODE_PINK='200'
__BU_MAIN_COLOR_CODE_PURPLE='165'
__BU_MAIN_COLOR_CODE_RED='196'
__BU_MAIN_COLOR_CODE_TURQUOISE='51'
__BU_MAIN_COLOR_CODE_WHITE='15'
__BU_MAIN_COLOR_CODE_YELLOW='226'

# -----------------------------------------------

## COLOR CODES FOR SPECIFIC TEXT DISPLAY, PRINTED AND REDIRECTED WITH THE "CheckTextColor" FUNCTIONS, THEN ENCODED WITH THE "tput" COMMAND

# Error text display color				| Default color : "196"	(red)
__BU_MAIN_COLOR_CODE_ERROR="$(CheckTextColor "196")"

# Highlighted text display color		| Default color : "6"	(cyan)
__BU_MAIN_COLOR_CODE_HIGHLIGHT="$(CheckTextColor "6")"

# Newstep text display color            | Default color : "166" (orange)
__BU_MAIN_COLOR_NEWSTEP="$(CheckTextColor "166")"

# Reset color to terminal's default text color | Always "tput sgr0"
__BU_MAIN_COLOR_CODE_RESET="$(tput sgr0)"

# Success text display color			| Default color : "82"	(green)
__BU_MAIN_COLOR_CODE_SUCCESS="$(CheckTextColor "82")"

# Warning text display color			| Default color : "226"	(yellow)
__BU_MAIN_COLOR_CODE_WARNING="$(CheckTextColor "226")"

# -----------------------------------------------

## ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "CheckTextColor" FUNCTIONS

# Encodage des couleurs (codes de la commande "tput setaf") pour mieux lire les étapes de l'exécution du script.
__BU_MAIN_COLOR_BLACK="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_BLACK")"     # Black
__BU_MAIN_COLOR_BLUE="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_BLUE")"      # Deep blue
__BU_MAIN_COLOR_CYAN="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_CYAN")"      # Cyan blue
__BU_MAIN_COLOR_GRAY="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_GRAY")"      # Gray
__BU_MAIN_COLOR_GREEN="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_GREEN")"     # Light green
__BU_MAIN_COLOR_ORANGE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_ORANGE")"   	# Orange
__BU_MAIN_COLOR_PINK="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_PINK")"      # Pink
__BU_MAIN_COLOR_PURPLE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_PURPLE")"	# Purple
__BU_MAIN_COLOR_RED="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_RED")"	 	# Light red
__BU_MAIN_COLOR_TURQUOISE="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_TURQUOISE")"	# Turquoise
__BU_MAIN_COLOR_WHITE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_WHITE")"     # White
__BU_MAIN_COLOR_YELLOW="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_YELLOW")"	# Light yellow

__BU_MAIN_COLOR_ERROR="$__BU_MAIN_COLOR_CODE_ERROR"							# Error text display color
__BU_MAIN_COLOR_HIGHLIGHT="$__BU_MAIN_COLOR_CODE_HIGHLIGHT"					# Highlighted text display color
__BU_MAIN_COLOR_RESET="$__BU_MAIN_COLOR_CODE_RESET"							# Reset color to terminal's default text color
__BU_MAIN_COLOR_SUCCESS="$__BU_MAIN_COLOR_CODE_SUCCESS"						# Success text display color
__BU_MAIN_COLOR_WARNING="$__BU_MAIN_COLOR_CODE_WARNING"						# Warning text display color

# -----------------------------------------------
#!/usr/bin/env bash

# Debug function that displays function and file name.
function debug()
{
	#***** Parameters *****
	p_function=$1
	p_file=$2
	p_line=$3

	#***** Code *****
	if [ "$__BU_MAIN_STAT_DEBUG" = 'true' ]; then
		echo -ne "$__BU_MAIN_COLOR_PINK"

		for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
			echo -ne "+"
		done

		echo -ne "$__BU_MAIN_COLOR_RESET"; echo -e; echo -e

		echo -e "${__BU_MAIN_COLOR_YELLOW}FUNCTION ${__BU_MAIN_COLOR_PINK}$p_function${__BU_MAIN_COLOR_YELLOW} IN ${__BU_MAIN_COLOR_PINK}$p_file${__BU_MAIN_COLOR_YELLOW}, ON ${__BU_MAIN_COLOR_PINK}$p_line${__BU_MAIN_COLOR_RESET}"

		echo -ne "$__BU_MAIN_COLOR_PINK"

		for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
                        echo -ne "+"
		done

		echo -ne "$__BU_MAIN_COLOR_RESET"; echo -e; echo -e
	fi
}
#!/usr/bin/env bash

# These codes correspond to the language's column in the CSV files. The first other ones correspond to :
#	- The variable's name,
#	- It's short description,
#	- The kind of message.
__BU_MAIN_LANG_CSV_CODE_EN=4
__BU_MAIN_LANG_CSV_CODE_FR=5

# -----------------------------------------------
fr_FR.UTF-8
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BASH-UTILS VARIABLES

## BASH-UTILS DIRECTORIES PATHS

# Bash Utils root directory.

# For a better environment integration, it is highly advised to store the path in a file
# in the user's home directory, and to call the "cat" command to display its value.

__BU_MAIN_ROOT_DIR_PATH="$(cat "$__BU_MODULE_UTILS_ROOT/Bash-utils-root-val.path")"

# Bash Utils sub-folders paths.
__BU_MAIN_MODULE_BIN_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "bin")"				# Bash Utils binary files folder            |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_CONF_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")")"	# Bash Utils configuration files folder		|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH"
__BU_MAIN_MODULE_DOCS_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "docs")"			# Bash Utils documentation folder			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_LIB_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "lib")"				# Bash Utils library root directory	        |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_RES_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "res")"				# Bash Utils resources directory            |   Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"

# Bash Utils dev-tools paths.
__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_RES_DIR_PATH" "dev-tools")"			# Bash Utils development tools root directory          |	Default parent folder --> "$__BU_MAIN_MODULE_RES_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_BIN="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-bin")"				# Bash Utils development tools binary files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_DSK="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-desktop")"			# Bash Utils development tools desktop files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_IMG="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-img")"				# Bash Utils development tools desktop icons folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_SRC="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-src")"				# Bash Utils development tools source files             |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_TRANSL="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-translations")"	# Bash Utils development tools translation files folder |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"

# "lib" folder's content.
__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "functions")"				# Bash Utils functions directory			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_LIB_MOD_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")")"			# Bash Utils library module's directory	|	Default parent folder --> "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH/"
__BU_MAIN_MODULE_LIB_LANG_DIR_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "lang")"						# Bash Utils translations files directory	|   Default parent folder --> "$__BU_MAIN_MODULE_LIB_DIR_PATH/"

# -----------------------------------------------

## BASH UTIILS FILES PATHS

# "config" folder's content.
__BU_MAIN_MODULE_CONF_COLORS_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Colors.conf")"			# Bash Utils color encoding variables configuration file.
__BU_MAIN_MODULE_CONF_INIT_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Project.conf")"			# Project's initialization variables.
__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "LangISOCode.conf")"		# Project's language code, overriding the language detection.
__BU_MAIN_MODULE_CONF_LANG_CSV_CODE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "LangCSVCode.conf")"		# Project's translation CSV file language row code
__BU_MAIN_MODULE_CONF_STATUS_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Status.conf")"			# Bash Utils status variables configuration file.
__BU_MAIN_MODULE_CONF_TEXT_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Text.conf")"				# Bash Utils text variables configuration file.
__BU_MAIN_MODULE_CONF_TIME_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Time.conf")"				# Bash Utils time variables configuration file.

# Bash Utils initializer path.
__BU_MAIN_MODULE_LIB_FILE_INITIALIZER_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MODULE_UTILS_MODULES_DIR" "Initializer.sh")"	# Module's initializer file.

# Bash Utils translations path.
__BU_MAIN_MODULE_TRANSLATION_FILE_PATH="$(ModuleInitializer_FindPath "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH" "lang.csv")"				# Bash Utils translations file.

# "functions" folder's sub-folders content.
__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH=("$__BU_MAIN_MODULE_LIB_MOD_DIR_PATH/"*.lib)

# -----------------------------------------------


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### INITALIZATION VARIABLES

## INITIALIZATION VARIABLES DECLARATIONS

# Array of strings, to display in the log file with the date.
__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE=()
__BU_MAIN_MODULE_STR_ARRAY_LOG_NODATE="$(for val in "${__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE[@]}"; do v_cutstr="${val##*] }" && echo "$v_cutstr"; done)"

# -----------------------------------------------

## LIBRARY INITALIZATION VARIABLES DECLARATIONS

# Defining an associative array to store each sourced library file's path.
__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY=()

# -----------------------------------------------

## CONFIGURATION FILES INITALIZATION VARIABLES DECLARATIONS

# Defining an associative array to store each sourced configuration file's path.
__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY=()

# Storing the configuration files path variable values into an array to source, print and add easier into the "a_config_files_path" associative array.
# Those files are, respectly, the :
#   - Project's and initialization process global variable
#   - Project's status variable
#   - Text color
#   - Text decoration, formatting and printing variable
#   - Time variable

# The "ProjectInit.conf" file MUST be sourced first, then the "ProjectStatus.conf" file MUST be sourced in the second.
# Unless otherwise stated, the other configuration files may be sourced in any order.

__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY=("$__BU_MAIN_MODULE_CONF_INIT_FILE_PATH" \
    "$__BU_MAIN_MODULE_CONF_STATUS_FILE_PATH" \
    "$__BU_MAIN_MODULE_CONF_COLORS_FILE_PATH" \
    "$__BU_MAIN_MODULE_CONF_TEXT_FILE_PATH" \
    "$__BU_MAIN_MODULE_CONF_TIME_FILE_PATH")

# -----------------------------------------------

## END OF Bash-utils GLOBAL VARIABLES DEFINITION
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PROJECT'S VARIABLES

## PROJECT'S PATH VARIABLES

# Script file's informations
__BU_MAIN_PROJECT_FILE_NAME=$(basename "$0")                     # Project file's name.
__BU_MAIN_PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.')        # Name of the project (project file's name without its file extension).

function GetProjectFilePath()
{
    local v_project_file="$0"
    local v_cut="${v_project_file##*./}"
    local find_path; find_path="$(find "$(cd ..; pwd)" -name "$v_cut")"

    echo "$find_path"
}

__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME="tmp"
__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH="$__BU_MAIN_ROOT_DIR_PATH/$__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME"

if [ ! -d "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH" ]; then
    mkdir -p "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH" || { echo >&2; echo "UNABLE TO CREATE THE PROJECT'S TEMPORARY FOLDER'S PARENT DIRECTORY !" >&2; echo >&2; exit 1; }
fi

# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.

# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    __BU_MAIN_PROJECT_TMP_DIR_PATH="$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME - ROOT" # Default --> "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME - ROOT"
else
    __BU_MAIN_PROJECT_TMP_DIR_PATH="$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME"        # Default --> "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME"
fi

# 
__BU_MAIN_PROJECT_FILE_PATH="$(GetProjectFilePath)"

# Defining the project's log file's path.
__BU_MAIN_PROJECT_LOG_DIR_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH"
__BU_MAIN_PROJECT_LOG_DIR_NAME="logs"												    # Default --> "logs"
__BU_MAIN_PROJECT_LOG_DIR_PATH="$__BU_MAIN_PROJECT_LOG_DIR_PARENT/$__BU_MAIN_PROJECT_LOG_DIR_NAME" # Default --> "$__BU_MAIN_PROJECT_TMP_DIR_PATH/$__BU_MAIN_PROJECT_LOG_DIR_NAME"

__BU_MAIN_PROJECT_LOG_FILE_PARENT="$__BU_MAIN_PROJECT_LOG_DIR_PATH"
__BU_MAIN_PROJECT_LOG_FILE_NAME="$__BU_MAIN_PROJECT_NAME.log"                                     # Default --> "$__BU_MAIN_PROJECT_NAME.log"
__BU_MAIN_PROJECT_LOG_FILE_PATH="$__BU_MAIN_PROJECT_LOG_FILE_PARENT/$__BU_MAIN_PROJECT_LOG_FILE_NAME"  # Default --> "$__BU_MAIN_PROJECT_LOG_DIR_PATH/$__BU_MAIN_PROJECT_LOG_FILE_NAME"

# Defining the project's "Echo<...>()" functions debug output (to have a better view during a "bash - x" debug).
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT="$__BU_MAIN_PROJECT_LOG_DIR_PATH"
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME="echo_output.log"
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH="$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT/$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME"

# Defining the project's text formatting building's output file.
__BU_MAIN_PROJECT_TR_FILE_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH"
__BU_MAIN_PROJECT_TR_FILE_NAME="tr.tmp"                                                  # Default --> "tr.tmp"
__BU_MAIN_PROJECT_TR_FILE_PATH="$__BU_MAIN_PROJECT_TR_FILE_PARENT/$__BU_MAIN_PROJECT_TR_FILE_NAME" # Default --> "$__BU_MAIN_PROJECT_TMP_DIR_PATH/$__BU_MAIN_PROJECT_TR_FILE_NAME"

# Defining the project's color code storage file.
__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH"
__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME="colors.tmp"
__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH="$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT/$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME"

# -----------------------------------------------
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# These status variable can be changed anywhere in the main script, except for the following variables :
#   - __BU_MAIN_STAT_DEBUG      -> This variable is used as (...).


# Project's debug variable

# This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__BU_MAIN_STAT_DEBUG="true"


# "CheckProjectLogPath()" and other low level's functions authorization to call a "Decho<...>()" function in case of need.

# This variable only accepts "authorize", "forbid" or "restrict" as values.
# Default value : "forbid"
# shellcheck disable=SC2034
__BU_MAIN_STAT_DECHO="forbid"


# "CheckProjectLogPath()" function's authorization to call an "Echo<...>()" function in case of need.

# This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__BU_MAIN_STAT_ECHO="false"


# Project's error handling

# This variable only accepts "fatal" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__BU_MAIN_STAT_ERROR=""


# Project's initialization status checker.

# This variable only accepts "true" or "false" as values.
# Default value : "true" (since the project is initialized first).
# shellcheck disable=SC2034
__BU_MAIN_STAT_INITIALIZING="true"


# Project's main log file informations

# This variable only accepts "true" or "false" as values.
# Default value : "true"
# shellcheck disable=SC2034
__BU_MAIN_STAT_LOG="true"


# Project's main log file redirections status

# This variable only accepts "log", "tee" or nothing as value.
# Default value : "" (no value)
# shellcheck disable=SC2034
__BU_MAIN_STAT_LOG_REDIRECT=""


# Project's authorization to operate at the root directory or one of its sub-folders

# This variable only accepts "authorized", "forbidden" or "restricted" as values.
# Default value : "forbidden" (by security).
# shellcheck disable=SC2034
__BU_MAIN_STAT_OPERATE_ROOT="forbidden"


# Project initialization's messages displaying.

# This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__BU_MAIN_STAT_PRINT_INIT_LOG="true"


# Project's messages display time

# This variable only accepts any integer of floating number.
# Default value : ".5"
# shellcheck disable=SC2034
__BU_MAIN_STAT_TIME_TXT=".5"


# Project's translation checker.

# This variable only accepts "true" or "false" as value.
# Default value : "false" (since the whole project's texts are not yet translated)
# shellcheck disable=SC2034
__BU_MAIN_STAT_TRANSLATED="false"


# Project's handling text formatting

# This variable only accepts "true" or "false" as value.
# Default value : "true"
# shellcheck disable=SC2034
__BU_MAIN_STAT_TXT_FMT="true"


# User's operating system (getting user's OS is important for OS-dependent processings, like package management)

# This variable will be completed with the "CheckSupportedOSType" function.
# Default value : "" (no value)
# shellcheck disable=SC2034
__BU_MAIN_STAT_USER_OS=""
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### TEXT PROCESSING

## COLUMNS AND LINES

# Get the columns number on the terminal according to its window's length.
__BU_MAIN_TXT_COLS="$(tput cols || stty size | cut -d " " -f2)"

# Get the lines number on the terminal according to its window's height.
__BU_MAIN_TXT_LINES="$(tput lines || stty size | cut -d " " -f1)"

# -----------------------------------------------

## PRINTING CHARACTERS

# Caractère utilisé pour dessiner les lignes des headers. Si vous souhaitez mettre un autre caractère à la place d'un tiret, changez le caractère entre les double guillemets.
# Ne mettez pas plus d'un caractère si vous ne souhaitez pas voir le texte de chaque header apparaître entre plusieurs lignes (une ligne de chaque caractère).
__BU_MAIN_TXT_CHAR_HEADER_LINE="-"		# Caractère à afficher en boucle pour créer une ligne des headers de changement d'étapes.


# Affichage de chevrons avant une chaîne de caractères (par exemple).
__BU_MAIN_TXT_PRINT_TAB=">>>>"

# -----------------------------------------------

## STORING TEXT

# Storing a string got from a specific line (with a function like "GetLineFromTextFile()", from "main/Files.lib" source file).
__BU_MAIN_TXT_STORE_LINE=""

__BU_MAIN_TXT_STORE_ERROR_MESSAGES_ARRAY=()

# -----------------------------------------------

## TEXT FORMATTING

# Blink
__BU_MAIN_TXT_FMT_BLINK="$(CheckTextFormat 'blink' '5')"
__BU_MAIN_TXT_FMT_BLINK_RESET="$(CheckTextFormat 'sgr0' '25')"

# Bold
__BU_MAIN_TXT_FMT_BOLD="$(CheckTextFormat 'bold' '1')"
__BU_MAIN_TXT_FMT_BOLD_RESET="$(CheckTextFormat 'rmso' '21')"

# Dim
__BU_MAIN_TXT_FMT_DIM="$(CheckTextFormat 'dim' '2')"
__BU_MAIN_TXT_FMT_DIM_RESET="$(CheckTextFormat '' '22')"

# Hidden (useful for password typing).
__BU_MAIN_TXT_FMT_HIDDEN="$(CheckTextFormat '' '8')"
__BU_MAIN_TXT_FMT_HIDDEN_RESET="$(CheckTextFormat '' '28')"

# Italic
__BU_MAIN_TXT_FMT_ITALIC="$(CheckTextFormat 'sitm' '3')"
__BU_MAIN_TXT_FMT_ITALIC_RESET="$(CheckTextFormat 'ritm' '23')"

# Reset
__BU_MAIN_TXT_FMT_RESET="$(CheckTextFormat 'sgr0' '0')"

# Strikethrough
__BU_MAIN_TXT_FMT_STRIKETHROUGH="$(CheckTextFormat '' '9')"
__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET="$(CheckTextFormat '' '29')"

# Underline
__BU_MAIN_TXT_FMT_UNDERLINE="$(CheckTextFormat 'smul' '4')"
__BU_MAIN_TXT_FMT_UNDERLINE_RESET="$(CheckTextFormat 'rmul' '24')"

# -----------------------------------------------
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### DATE

## GETTING THE DATE
# Saving the current date in YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second)
__BU_MAIN_TIME_DATE="$(date +"%Y-%m-%d %Hh-%Mm-%Ss")"

# -----------------------------------------------

## PRINTING THE DATE
# Displaying the current date YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second) with a colored text (for a better view in the log file).
__BU_MAIN_TIME_DATE_DISPLAY=$(printf "%s [ %s%s%s ]%s" "$(tput setaf 78)" "$(tput setaf 111)" "$__BU_MAIN_TIME_DATE" "$(tput setaf 78)" "$(tput sgr0)")
#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Initializer.sh
# Description : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s) : Dimitri Obeid
# Version : 1.0

# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This script is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FIRST STEP : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Add value in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array that stores the initialization log output, according to the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array AND display text to the terminal.
#   "false" --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array WITHOUT displaying any text.
function InitializerAddInitStrArrayVal()
{
    #***** Parameters *****
    p_string=$1             # String to store in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array.
    p_option=$2             # "echo" command's options.

    #***** Code *****
    if [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" = "true" ]; then
        case "$p_option" in
            '-n' | 'n')
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -ne "${p_string##*] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
            '' | *)
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -e "${p_string##*] }"     # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
        esac
    else
        __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string")
    fi
}

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SECOND STEP : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Sourcing each file listed into the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH" variable.

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInitializer_SourcingFailure "$f" "$(ModuleInitializer_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")
done

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### THIRD STEP : PROCESSING PROJECT'S RESOURCES

## MODIFYING STATUS VARIABLES FOR THE INITIALIZATION PROCESS AND CREATING THE PROJECT'S TEMPORARY FOLDER

ChangeSTAT_ERROR        "fatal"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TIME_TXT     "0"         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
ChangeSTAT_TXT_FMT      "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then return 1; fi
if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then return 1; fi

# Future functionnality : translating the library.
SourceFile "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/SetLibLang.sh"
GetLibLang

# -----------------------------------------------

## END OF THE MODULE INITIALIZATION PROCESS
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Case.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### LIBRARY RESOURCES

## VARIABLES

__BU_MAIN_CASE_INVALID_ANSWER="Please enter a valid answer ($(DechoHighlight 'yes') or ($(DechoHighlight 'no')) !"

__BU_MAIN_CASE_ASK_CONTINUE_EXEC="Do you want to continue the script's execution ? (yes / no)"

__BU_MAIN_CASE_ANSWER_PROMPT="Enter your answer : "

__BU_MAIN_CASE_RESUME_EXEC="Resuming the execution of the $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") script."

__BU_MAIN_CASE_CANCEL_EXEC="Aborting the $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")'s execution."

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### READING CASE STATEMENTS BY FUNCTIONS

## "Checkings.lib" FILE

# "TriggerRootDirWarning" function.
function CaseRead_TriggerRootDirWarning()
{
    EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC"
	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_TriggerRootDirWarning
	EchoRead "$__read_TriggerRootDirWarning"
	Newline

	# shellcheck disable=SC2154
	case "${__read_TriggerRootDirWarning,,}" in
		"yes")
            EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC"

			return 0
			;;
		"no")
            EchoError "$__BU_MAIN_CASE_CANCEL_EXEC"

			return 1
			;;
		*)
			EchoError "$__BU_MAIN_CASE_INVALID_ANSWER"
			CaseRead_TriggerRootDirWarning
			;;
	esac
}

# "HandleErrors" function, with the "$__BU_MAIN_STAT_ECHO" variable set to "false".
function CaseRead_HandleErrors()
{
	EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC"
	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_TriggerRootDirWarning
	EchoRead "$__read_TriggerRootDirWarning"
    Newline

	# shellcheck disable=SC2154
	case "${__read_HandleErrors,,}" in
		"yes")
			EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC"

			return 0
			;;
		"no")
			EchoError "$__BU_MAIN_CASE_CANCEL_EXEC"

			ExitError '1'
			;;
		*)
			EchoError "$__BU_MAIN_CASE_INVALID_ANSWER"
			CaseRead_HandleErrors
			;;
	esac
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : CheckArgsMain.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154,SC2116

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### ARGUMENT VALUES CHECKING : UTILITES FUNCTIONS

## ARGUMENT PRESENCE CHECKING

# Checking if an argument is provided (like in the "Is..." functions (check the below "VARIABLES VALUES CHECKING" section for more informations)).
function CheckArgsMain_IsBadArgc0()
{
    if [ "$#" -eq 0 ]; then
        HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; return 1
    fi

	return 0
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
		if [ "$__BU_MAIN_STAT_OPERATE_ROOT" = "forbidden" ]; then
			EchoError "WARNING !!!!!! READ THIS MESSAGE CAREFULLY !!!!!!"
			EchoError "The script was trying to operate at the root directory (or one of its sub directories) without authorization"
			EchoError "Given path : $(DechoHighlight "$p_path")"
			Newline

			ExitError
		elif [ "$__BU_MAIN_STAT_OPERATE_ROOT" = "restricted" ]; then
			EchoWarning "WARNING !!!!!!! DO NOT SKIP THIS MESSAGE BEFORE READING IT CAREFULLY !!!!!!"
			EchoWarning "You are about to operate at the root directory or one of its present sub-folders !"
			EchoWarning "Given path : $(DechoHighlight "$p_path")"
			Newline

			# Calling the function that processes the given answer.
			if CaseRead_TriggerRootDirWarning; then
				return 0
			else
				return 1
			fi
		fi
	fi

	return 0
}

# -----------------------------------------------

## QUICK MESSAGE PRINTING

# Print a message without the need to write the whole "HandleErrors()" function's second argument, and according to the test option which failed :
function __CheckArgsMain_PrintBadOption()
{
    #***** Parameters *****
    local p_option=$1   # Test option.
    local p_advice=$2   # "HandleErrors()"'s advice argument.
    local p_argname=$3  # Name of the parameter that stores the argument.
    local p_value=$4    # "HandleErrors()"'s value argument.
    local p_funcname=$5 # Name of the function where the test failed.
    local p_lineno=$6   # Line where the test failed.

    #***** Optional parameters *****
    local p_filename="$7"

    #***** Variables *****
	# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value to "true" in case this function is called during a .
	if [ "$__BU_MAIN_STAT_ECHO" = "false" ]; then
		local v_STAT_ECHO_was_false="true"
		
		ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
	fi

	# Since this function can be called from the "Lang.lib" file, and eventually in other library files, it's better to include a support for an appropriated file name.
	if [ -n "$p_filename" ]; then
        local v_filename="$p_filename"
	else
        local v_filename; v_filename="$(basename "${BASH_SOURCE[0]}")"
	fi

    #***** Code *****
	# If no value is passed as argument.
    if [ "$p_option" = 'z' ]; then
		HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER HAS NO VALUE" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not an alphabetic string.
    elif [ "$p_option" = '!alpha' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHABETIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not an alphanumeric string.
    elif [ "$p_option" = '!alphanum' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    # Else, if the value passed as argument is not an alphabetic character.
    elif [ "$p_option" = '!char' ]; then
        HandleErrors '1' "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHABETIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

    # Else, if the value passed as argument is not an alphanumeric character.
    elif [ "$p_option" = '!charnum' ]; then
        HandleErrors '1' "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not a valid directory path.
    elif [ "$p_option" = '!d' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A VALID DIRECTORY PATH" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a valid file path.
    elif [ "$p_option" = '!f' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A VALID FILE PATH" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a floating number.
    elif [ "$p_option" = '!float' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    # Else, if the value passed as argument is not a negative floating number.
    elif [ "$p_option" = '!floatneg' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A NEGATIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a positive floating number.
    elif [ "$p_option" = '!floatpos' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A POSITIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not an integer.
    elif [ "$p_option" = '!int' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a negative integer.
    elif [ "$p_option" = '!intneg' ]; then

        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A NEGATIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"
		return 1

	# Else, if the value passed as argument is not a positive integer.
    elif [ "$p_option" = '!intpos' ]; then
        HandleErrors "1" "THE $p_funcname FUNCTION'S $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A POSITIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    fi

	if [ "$v_STAT_ECHO_was_false" = "true" ]; then
		ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
	fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Checkings.lib" FILE'S FUNCTIONS

## "Checkings.lib" FILE'S FUNCTIONS - FILES PATHS CHECKING CATEGORY

# "CheckProjectRelatedFile" function.
function CheckArgsMain_CheckProjectRelatedFile()
{
	#***** Parameters *****
	local p_parent=$1
	local p_child=$2
	local p_type=$3

	#***** Code *****
	local lineno="$LINENO"; if [ -z "$p_parent" ]; then
		__CheckArgsMain_PrintBadOption 'z' "The function $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
			'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
	
	local lineno="$LINENO"; elif [ -z "$p_child" ]; then
		__CheckArgsMain_PrintBadOption 'z' "The function $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") needs a function passed as second argument to work properly" \
			'p_child' "$p_child" "${FUNCNAME[0]}" "$lineno"

		return 1

	local lineno="$LINENO"; elif [ -z "$p_type" ]; then
		__CheckArgsMain_PrintBadOption 'z' "The function $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") needs a function passed as third argument to work properly" \
			'p_type' "$p_type" "${FUNCNAME[0]}" "$lineno"

		return 1

	local lineno="$LINENO"; elif [ "$p_type" != 'd' ] && [ "$p_type" != 'f' ]; then
		__CheckArgsMain_PrintBadOption 'z' "You need to precise if what you want to create is a directory or a file." 'p_type' "$p_type" "${FUNCNAME[0]}" "$lineno"

		return 1
	fi

	return 0
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
        __CheckArgsMain_PrintBadOption 'z' "The function $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
            'p_function' "$p_function" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    local lineno="$LINENO"; if [ -z "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass a valid parent directory path as second argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    local lineno="$LINENO"; if [ -z "$p_name" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the name of the folder to process as third argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

		return 1
	fi

	return 0
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

		return 1
    fi

    # Else, if the given folder path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_path" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
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

		return 1
    fi

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption '!d' "" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the folder's name is missing (no name is given).
    local lineno="$LINENO"; if [ -z "$p_name" ]; then
		__CheckArgsMain_PrintBadOption 'z' "" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
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
        __CheckArgsMain_PrintBadOption 'z' "The $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "GetDirectoryPath" function.
function CheckArgsMain_GetDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        __CheckArgsMain_PrintBadOption 'z' "The $(CutFromCharacter "$(DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "GetParentDirectoryName" function.
function CheckArgsMain_GetParentDirectoryName()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"; return 1; fi

	return 0
}

# "GetParentDirectoryPath" function.
function CheckArgsMain_GetParentDirectoryPath()
{
    #***** Parameters *****
    local p_path=$1         # Path of the directory to process.

    #***** Code *****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"; return 1; fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Lang.lib" FILE'S FUNCTIONS

## PLEASE CHECK THE "CheckNotTranslated_ParseCSVLang()" FUNCTION IN THE AFOREMENTIONED LIBRARY FILE.

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

		return 1
    fi

	return 0
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

		return 1
    fi

    # Else, if the given file path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_path" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	local lineno="$LINENO"; if [ -z "$p_authorization" ]; then
		__CheckArgsMain_PrintBadOption 'z' "Please enter a valid value for the overwrite authorization as second argument" 'p_authorization' "$p_authorization" "${FUNCNAME[0]}" "$lineno" 

		return 1
    fi

	return 0
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

		return 1
    fi

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_parent" ]; then
        __CheckArgsMain_PrintBadOption '!d' "Please pass a valid parent directory path as first argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the file's name is missing (no name is given).
    local lineno="$LINENO"; if [ -z "$p_name" ]; then
        __CheckArgsMain_PrintBadOption 'z' "Please pass the name of the folder to create as second argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Checkings.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### VARIABLES VALUES CHECKING

## NUMBER VALUES

# Checking floating value.
function IsFloat()
{
    if [[ "$1" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking negative only floating value.
function IsNegativeFloat()
{
    if IsFloat "$1" && (( 1 < 0 )); then
        return 0
    else
        return 1
    fi
}

# Checking positive only floating value.
function IsPositiveFloat()
{
    if IsFloat "$1" && (( 1 >= 0 )); then
        return 0
    else
        return 1
    fi
}

# Checking integer value.
function IsInt()
{
    if [[ "$1" =~ ^[\-0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking negative only integer value.
function IsNegativeInt()
{
	if IsInt "$1" && (( 1 < 0 )); then
		return 0
	else
		return 1
	fi
}

# Checking positive only integer value.
function IsPositiveInt()
{
	if IsInt "$1" && (( 1 >= 0 )); then
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
    if [[ "$1" =~  [^a-zA-Z\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if value is an alphanumeric string.
function IsAlphaNum()
{
    if [[ "$1" =~ [^a-zA-Z0-9\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if the value is a character.
function IsChar()
{
	if [[ "$1" = [a-zA-Z0-9] ]]; then
		return 0
	else
		return 1
	fi
}

# Checking if the value is an alphabetic character (not any number allowed).
function IsAlphaChar()
{
	if [[ "$1" = [a-zA-Z] ]]; then
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

        return 1
    fi
}

# -----------------------------------------------

## INITIALIZATION CHECKINGS

# Checking if the library is into its initialization process.
function CheckIsInitializing()
{
    if [ "$__BU_MAIN_STAT_INITIALIZING" = "true" ]; then
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
        DechoHighlight "<missing directory path>"   # Since this function should be called into a string, it's better to use a formatting function.
    fi
}

# Checking if a directory was successfully created.
function CheckDirPathWasCreated()
{
	#***** Parameters *****
	p_path=$1

	#***** Code *****
	if [ -d "$p_path" ]; then
		return 0
	else
		return 1
	fi
}

# -----------------------------------------------

## FILES PATHS CHECKING

# Checking for an existent file path (for the "HandleErrors()" function mainly).
function CheckFilePathExists()
{
    #***** Parameters *****
    p_path=$1               # Path of the (in)existent file.

    #***** Code *****
    if [ ! -f "$p_path" ]; then
        DechoHighlight "<missing file path>"        # Since this function should be called into a string, it's better to use a formatting function.
    fi
}

# Checking if a file was successfully created.
function CheckFilePathWasCreated()
{
	#***** Parameters *****
	p_path=$1

	#***** Code *****
	if [ -f "$p_path" ]; then
		return 0
	else
		return 1
	fi
}

# Checking for "$__BU_MAIN_PROJECT_LOG_FILE_PATH"

# Required functions and files :
function CheckProjectLogPath()
{
    # Since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "CheckProjectLogStatus()" function
    # (the only one where the "CheckProjectLogPath()" function can be called), it's safe to call an "Echo<...>()" function, the "HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
    if [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
		EchoWarning "$(DechoHighlight "${FUNCNAME[0]}") --> Warning : no existing log file"
		EchoNewstep "Creating a log file for the $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") project"

		if ! CreateProjectLogFile; then
			return 1
		else
			return 0
		fi

        # In case the "ExitError()" function doesn't stops the script's execution because the final user modified its behavior, it's safer to add a return value.
        ExitError; return 1

    # Remember : since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "CheckProjectLogStatus()" function
    # (the only one where the "CheckProjectLogPath()" function can be called), it's safe to call an "Echo<...>()" function, the "HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
#     elif [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
#         echo "$__BU_MAIN_PROJECT_LOG_FILE_PATH"
#         HandleErrors "1" "BAD PATH PROVIDED INTO THE $(DechoHighlight "__BU_MAIN_PROJECT_LOG_FILE_PATH") VARIABLE" \
#             "Please correct the path passed as argument, or redefine the variable if its value was modified somewhere" \
#             "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
# 
# 			return 1
    else
        return 0
    fi
}

# Checking for project's log file's status, then write the wanted text with 'echo' command's parameters.

# Accepted arguments : 'nodate', '<an empty string>'
function CheckProjectLogStatus()
{
    #***** Parameters *****
    local p_string=$1       # String to display.
    local p_option=$2       # "echo" command options.
    shift 2

    local pa_extraArgs=("$@")    # More processing arguments (like the processing of a whole line-long string).

    #***** Variables *****
	# WARNING : DO NOT call any "Echo<...>()" function from the "main/Echo.lib" file, as they all call the "CheckProjectLogStatus()" function.

	# Also, DO NOT call any "Decho<...>()" function, as they call the "HandleErrors()" function in case of a bad value passed as array of argument,
	# which also calls this same ""CheckProjectLogStatus() function.

    # If you need to call a function here, please verify if it doesn't calls the "CheckProjectLogStatus()" function,
    # nor any function called by the function you want to add, or else set the "$__BU_MAIN_STAT_ECHO" status variable value to "true" BEFORE calling the wanted function.

    local v_bu_stat_decho_old="$__BU_MAIN_STAT_DECHO"; ChangeSTAT_DECHO "restrict" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    # Setting the "$__BU_MAIN_STAT_ECHO" status variable's value to "true", in case an error occurs during a function call, where the "CheckProjectLogStatus()" function or any other function that calls it might be called.
    local v_bu_stat_echo_old="$__BU_MAIN_STAT_ECHO"; ChangeSTAT_ECHO "true"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
        local v_redirectionError
            v_redirectionError="$(DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to write into the $(DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file.\nRedirection option --> "
    else
        local v_redirectionError
            v_redirectionError=""
    fi

    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
        local v_warning_array_value
            v_warning_array_value="$(DechoHighlight "${FUNCNAME[0]}()") --> Warning : incorrect argument given as extra argument array in $(DechoHighlight "${BASH_SOURCE[0]}"), function $(DechoHighlight "${FUNCNAME[0]}()").\nValue --> $(DechoHighlight "$val")\nLine -->"
    else
        local v_warning_array_value
            v_warning_array_value=""
    fi

    #**** Code *****
    # This checking must be done before the long condition below, since it needs to know if the project's log file is present.
    if [ "$__BU_MAIN_STAT_LOG" = "true" ]; then
        CheckProjectLogPath || \
        {
            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "CheckProjectLogStatus()" function's execution is stopped.
            ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is stopped.
			ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

            return 1
        }
    fi

    CheckSTAT_LOG           "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_LOG_REDIRECT  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    CheckSTAT_TIME_TXT      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    # If a log file exists AND if "$__BU_MAIN_STAT_LOG" value is "false" AND if "$__BU_MAIN_STAT_LOG_REDIRECT" has a redirection value.
    if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ] && [ "$__BU_MAIN_STAT_LOG" = "true" ]; then

        # If messages must be redirected in the log file only ("$__BU_MAIN_STAT_LOG_REDIRECT" value is equal to "log").
        if [ "$__BU_MAIN_STAT_LOG_REDIRECT" = "log" ]; then

            for val in "${pa_extraArgs[@]}"; do

                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string" 'n'
                            else
                                echo -ne "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }                            
                            fi
                            ;;
                        '' | *)
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string"
                            else
                                echo -e "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }                            
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                            else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                            fi
                            ;;
                        '' | *)
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                            else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                            fi
                            ;;
                    esac
                # Else, if an unsupported option is passed (note for myself : the extra args checking.
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "log" option)).
                else
                    case "$p_option" in
                        '-n' | 'n')
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline
							else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							fi; Newline
                            ;;
                        '' | *)
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "log")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							fi
                            ;;
                    esac
                fi

            done

            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "CheckProjectLogStatus()" function's execution is over.
            ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
			ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
			return 0

        # Else, if messages must be redirected in the log file AND to the terminal ("$__BU_MAIN_STAT_LOG_REDIRECT" value is equal to "tee").
        elif [ "$__BU_MAIN_STAT_LOG_REDIRECT" = "tee" ]; then

            for val in "${pa_extraArgs[@]}"; do

                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string" 'n'
                            else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                            fi
                            ;;
                        '' | *)
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                            else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "$p_option" in
                    '-n' | 'n')
                        if CheckIsInitializing; then
                            InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                        else
                            echo -ne "$p_string"
                            echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                        fi
                        ;;
                    '' | *)
                        if CheckIsInitializing; then
                            InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                        else
                            echo -e "$p_string"
                            echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                        fi
                        ;;
                    esac

                # Else, if an unsupported option is passed (note for myself : the extra args checking.
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "tee" option)).
                else
                    case "$p_option" in
                        '-n' | 'n')
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							fi; Newline
                            ;;
                        '' | *)
                            if CheckIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
                                EchoWarning "$v_warning_array_value $(DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { Newline >&2; EchoError "$v_redirectionError $(DechoHighlight "tee")\nLine --> $(DechoHighlight "$LINENO")" "$p_option" 'nodate'; Newline >&2; ExitError "1"; }
							fi
                            ;;
                    esac
                fi
            done
            
            sleep "$__BU_MAIN_STAT_TIME_TXT"
			
			# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "CheckProjectLogStatus()" function's execution is over.
			ChangeSTAT_DECHO "$v_bu_stat_decho_old"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
			ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
			return 0
        else
            case "$p_option" in
                '-n' | 'n')
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                    else
                        echo -ne "$p_string"
                    fi
                    ;;
                '' | *)
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    else
                        echo -e "$p_string"
                    fi
                    ;;
            esac

        sleep "$__BU_MAIN_STAT_TIME_TXT"

        # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "CheckProjectLogStatus()" function's execution is over.
        ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

		# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
		ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
		return 0

        fi

    # Else, if no log file exists OR if "$__BU_MAIN_STAT_LOG" value is "false" OR if "$__BU_MAIN_STAT_LOG_REDIRECT" has no redirection value. 
    else
        case "$p_option" in
            '-n' | 'n')
                if CheckIsInitializing; then
                    InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                else
                    echo -ne "$p_string"
                fi
                ;;
            '' | *)
                if CheckIsInitializing; then
                    InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                else
                    echo -e "$p_string"
                fi
                ;;
        esac

        sleep "$__BU_MAIN_STAT_TIME_TXT"

        # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "CheckProjectLogStatus()" function's execution is over.
        ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

		# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
		ChangeSTAT_ECHO "$v_bu_stat_echo_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
		return 0
	fi

	# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
	ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "CheckProjectLogStatus()" function's execution is over.
	ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	return 0
}

# Check project related file presence, or create this file.
function CheckProjectRelatedFile()
{
	#***** Parameters *****
	local p_parent=$1   # Name of the folder to process (into its parent directory).
	local p_child=$2  	# Name of the file or folder to process (into its parent directory).
	local p_type=$3		# Type of data to create (d = directory, f = file).

	#***** Variables *****
    local v_path="$p_parent/$p_child"

	#***** Code *****
	if ! CheckArgsMain_CheckProjectRelatedFile "$p_parent" "$p_child" "$p_type"; then return 1; fi

	if [ "$p_type" = 'f' ]; then
		if [ -f "$v_path" ]; then
			if [ -s "$v_path" ]; then
				true > "$v_path" || { HandleSmallErrors 'E' "$(DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to overwrite this $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(DechoHighlight "$(CheckFilePathExists "$v_path")")" 'E'; return 1; }
			fi

			return 0
		else
			if [ ! -d "$p_parent" ]; then
                mkdir -p "$p_parent" || { HandleSmallErrors 'E' "$(DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file's parent folder --> $(DechoHighlight "$(CheckDirPathExists "$p_parent")")" 'E'; return 1; }

				CheckDirPathWasCreated "$p_parent" || return 1
			fi

			touch "$v_path" || { HandleSmallErrors 'E' "$(DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(DechoHighlight "$(CheckFilePathExists "$v_path")")" 'E'; return 1; }

			CheckFilePathWasCreated "$v_path" || return 1; return 0
		fi

    elif [ "$p_type" = 'd' ]; then
		if [ -d "$v_path" ]; then
			return 0
		else
			mkdir -p "$v_path" || { HandleSmallErrors 'E' "$(DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's folder --> $(DechoHighlight "$(CheckDirPathExists "$v_path")")" 'E'; return 1; }

			CheckDirPathWasCreated "$v_path" || return 1; return 0
		fi
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### TEXT CHECKINGS

## FORMATTING CHECKINGS

# Checking if the project's color code file exists or not.

# WARNING ! DO NOT CALL ANY "Decho<...>()" FUNCTION HERE, OR THE SCRIPT WILL LOOP FOREVER !!!
function CheckDecho()
{
    #***** Code *****
    if [ "$__BU_MAIN_STAT_TXT_FMT" = "false" ] || [ ! -f "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" ] || [ "$__BU_MAIN_STAT_DECHO" = 'forbid' ]; then
        return 1
	fi
	
    if [ -f "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" ] && [ "$(cat "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH")" = '' ]; then
        echo "$__BU_MAIN_COLOR_RESET" > "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" || \
        {
			# It's better to call the "EchoMsg()" function, so that its redirection and debug process wil not have to be reprogrammed.
			# It's also better to not call the "HandleSmallErrors()" function here, so that there won't be any problem when this function calls the "Decho<...>()" functions.
            EchoMsg "${__BU_MAIN_COLOR_HIGHLIGHT}${FUNCNAME[0]}()${__BU_MAIN_COLOR_WARNING}--> Warning : Unable to write any color code into the ${__BU_MAIN_COLOR_HIGHLIGHT}$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH${__BU_MAIN_COLOR_WARNING} file." 'R' ''

            return 1
        }

        return 0
    else
        return 0
	fi
}

# Check if the "$__BU_MAIN_STAT_ECHO" status variable's value is set to "true".
function CheckEcho()
{
    if [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then
        return 0
    else
        return 1
    fi
}

# Checking if the "$__BU_MAIN_STAT_TXT_FMT" status value is set to "true".
function CheckTextFormat()
{
    #***** Parameters *****
    #   $1  -> "tput" command's text formatting option.
    #   $2  -> Corresponding ANSI escape sequence (useful if the "tput" command is not detected or unavailable).

    #***** Code *****
    if [ "$__BU_MAIN_STAT_TXT_FMT" = "true" ]; then
        if [ -n "$1" ]; then
			if command -v "tput" &> /dev/null; then
				# Formatting text with the tput command or directly with the backslash escapes.
				tput "$1" || echo -ne "\e[$2m"

				return 0
			else
				echo -ne "\e[$2m"; return 0
			fi

        # In case there's no value passed as first argument (like if the wanted tput option is unknown), the script only echoes its ANSI escape sequence.
        else
            echo -ne "\e[$2m"

            return 0
        fi

    else
        return 1
    fi
}

# -----------------------------------------------
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : CheckSTAT.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### VARIABLES VALUES FUNCTIONS

## CHECKING VALUES

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
    local pa_correctValues=("$@")

    #***** Variables *****
    local i=0

    #***** Code *****
    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
        if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then { DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; echo "AN ERROR OCCURED DURING A STATUS VARIABLE CHECKING !!!"; DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; } 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH"
        else DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; echo "AN ERROR OCCURED DURING A STATUS VARIABLE CHECKING !!!"; DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; fi

        echo -ne "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}In ${__BU_MAIN_COLOR_HIGHLIGHT}$p_file${__BU_MAIN_COLOR_ERROR}, line ${__BU_MAIN_COLOR_HIGHLIGHT}$p_lineno${__BU_MAIN_COLOR_ERROR} --> " >&2
        echo -e "Error : the ${__BU_MAIN_COLOR_HIGHLIGHT}$p_varVal${__BU_MAIN_COLOR_ERROR} variable's value is incorrect.${__BU_MAIN_COLOR_RESET}" >&2

        if [ -z "$p_badVal" ]; then
            echo >&2; echo -e "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}Bad value :${__BU_MAIN_COLOR_YELLOW} An empty string.${__BU_MAIN_COLOR_RESET}" >&2
        else
            echo >&2; echo -e "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}Bad value : ${__BU_MAIN_COLOR_HIGHLIGHT}$p_badVal.${__BU_MAIN_COLOR_RESET}" >&2
        fi

        echo >&2; echo -e "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}The allowed values are :${__BU_MAIN_COLOR_RESET}" >&2

        # Displaying the list of every allowed arguments.
        for val in "${pa_correctValues[@]}"; do
            i=$(( i+1 ))

            # If an empty argument is allowed.
            if [ -z "$val" ]; then
                echo -e "${__BU_MAIN_COLOR_ERROR}$i/${#pa_correctValues[@]}  --> ${__BU_MAIN_COLOR_ORANGE}An empty argument.${__BU_MAIN_COLOR_RESET}" >&2
            else
                echo -e "${__BU_MAIN_COLOR_ERROR}$i/${#pa_correctValues[@]}  --> ${__BU_MAIN_COLOR_HIGHLIGHT}$val${__BU_MAIN_COLOR_RESET}" >&2
            fi
        done
    else
        if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
            DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_HEADER_ERROR" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH"
        else
            DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"; echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_HEADER_ERROR"
        fi

        echo -ne "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_ERROR_HAPPENED" >&2
        echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_ERROR_HAPPENED_TYPE" >&2

        if [ -z "$p_badVal" ]; then
            echo >&2; echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_BAD_VALUE_EMPTY" >&2
        else
            echo >&2; echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_BAD_VALUE" >&2
        fi

        echo >&2; echo -e "$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_ALLOWED_VALS_LIST_MSG" >&2

        # Displaying the list of every allowed arguments.
        for val in "${pa_correctValues[@]}"; do
            i=$(( i+1 ))

            # If an empty argument is allowed.
            if [ -z "$val" ]; then
                echo -e "" >&2
            else
                echo -e "${__BU_MAIN_COLOR_ERROR}$i/${#pa_correctValues[@]}  --> ${__BU_MAIN_COLOR_HIGHLIGHT}$val${__BU_MAIN_COLOR_RESET}" >&2
            fi
        done
    fi

    echo >&2; ExitError 1
}

# -----------------------------------------------

## CHECKINGS

# Checking the "$__BU_MAIN_STAT_DEBUG" status variable's value.
function CheckSTAT_DEBUG()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_DEBUG" != "true" ] && [ "$__BU_MAIN_STAT_DEBUG" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_DEBUG" "__BU_MAIN_STAT_DEBUG" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Check the "$__BU_MAIN_STAT_DECHO" status variable's value.
function CheckSTAT_DECHO()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("authorize" "forbid" "restrict")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_DECHO" != "authorize" ] && [ "$__BU_MAIN_STAT_DECHO" != "forbid" ] && [ "$__BU_MAIN_STAT_DECHO" != "restrict" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_DECHO" "__BU_MAIN_STAT_DECHO" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Check the "$__BU_MAIN_STAT_ECHO" status variable's value.
function CheckSTAT_ECHO()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_ECHO" != "true" ] && [ "$__BU_MAIN_STAT_ECHO" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ECHO" "__BU_MAIN_STAT_ECHO" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_ERROR" status variable's value.
function CheckSTAT_ERROR()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("" "fatal")

    #***** Code *****
    if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "$__BU_MAIN_STAT_ERROR" != "fatal" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ERROR" "__BU_MAIN_STAT_ERROR" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
function CheckSTAT_INITIALIZING()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_INITIALIZING" != "true" ] && [ "$__BU_MAIN_STAT_INITIALIZING" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_INITIALIZING" "__BU_MAIN_STAT_INITIALIZING" "${pa_correctValues[@]}"; return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_LOG" status variable's value.
function CheckSTAT_LOG()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_LOG" != "true" ] && [ "$__BU_MAIN_STAT_LOG" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG" "__BU_MAIN_STAT_LOG" "${pa_correctValues[@]}"; return 1

    elif [ "$__BU_MAIN_STAT_LOG" = "true" ] && [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ] && [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        CreateProjectLogFile || return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function CheckSTAT_LOG_REDIRECT()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("" "log" "tee")

    #***** Code *****
    if [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ] && [ "$__BU_MAIN_STAT_LOG_REDIRECT" != 'log' ] && [ "$__BU_MAIN_STAT_LOG_REDIRECT" != 'tee' ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG_REDIRECT" "__BU_MAIN_STAT_LOG_REDIRECT" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function CheckSTAT_OPERATE_ROOT()
{
	#***** Parameters *****
	local p_file=$1
	local p_lineno=$2

	#***** Variables *****
	local pa_correctValues=("authorized" "forbidden" "restricted")

	#***** Code *****
	if [ "$__BU_MAIN_STAT_OPERATE_ROOT" != "authorized" ] && [ "$__BU_MAIN_STAT_OPERATE_ROOT" != "forbidden" ] && [ "$__BU_MAIN_STAT_OPERATE_ROOT" != "restricted" ]; then
		ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_OPERATE_ROOT" "__BU_MAIN_STAT_OPERATE_ROOT" "${pa_correctValues[@]}"; return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variable's value.
function CheckSTAT_PRINT_INIT_LOG()
{
    #***** Parameters *****
    p_file=$1
    p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" != "true" ] && [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_PRINT_INIT_LOG" '__BU_MAIN_STAT_PRINT_INIT_LOG' "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function CheckSTAT_TIME_TXT()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Variables *****
    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
        local pa_correctValues=("${__BU_MAIN_COLOR_ORANGE}An integer or a floating number")
    else
        local pa_correctValues=("$__BU_MAIN_MSG_CHECKSTAT_ConfEcho_ALLOWED_VAL_FLOAT_INT")
    fi

    #***** Code *****
    # If the status variable's value is not a float or an integer.
    if ! IsFloat "$__BU_MAIN_STAT_TIME_TXT"; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_TXT" "__BU_MAIN_STAT_TIME_TXT" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TRANSLATED" status variable's value.
function CheckSTAT_TRANSLATED()
{
    #***** Parameters *****
    p_file=$1
    p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_TRANSLATED" != "true" ] && [ "$__BU_MAIN_STAT_TRANSLATED" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TRANSLATED" '__BU_MAIN_STAT_TRANSLATED' "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function CheckSTAT_TXT_FMT()
{
    #***** Parameters *****
    p_file=$1
    p_lineno=$2

    #***** Variables *****
    local pa_correctValues=("true" "false")

    #***** Code *****
    if [ "$__BU_MAIN_STAT_TXT_FMT" != "true" ] && [ "$__BU_MAIN_STAT_TXT_FMT" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TXT_FMT" '__BU_MAIN_STAT_TXT_FMT' "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_USER_OS" status variable's value.
# This function is empty now, as the OS handling is still in work.
function CheckSTAT_USER_OS()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2
    shift 2

    # local pa_supported_os=("$@")    # Array storing the list of the operating systems which support a feature to be deployed.

    #***** Variables *****
    
    #***** Code *****
    return 0
}


# Checking all the project's status variables values if multiple values had been modified.
function CheckProjectStatusVars()
{
    #***** Parameters *****
    local p_file=$1
    local p_lineno=$2

    #***** Code *****
    # Processing first the "__BU_MAIN_STAT_LOG_REDIRECT" variable, to make sure the following error messages will be correctly displayed if another error happened.
    CheckSTAT_LOG_REDIRECT  "$p_file" "$p_lineno" || return 1
    CheckSTAT_DECHO         "$p_file" "$p_lineno" || return 1
    CheckSTAT_ECHO          "$p_file" "$p_lineno" || return 1
    CheckSTAT_DEBUG         "$p_file" "$p_lineno" || return 1
    CheckSTAT_ERROR         "$p_file" "$p_lineno" || return 1
	ChangeSTAT_INITIALIZING	"$p_file" "$p_lineno" || return 1
    CheckSTAT_LOG           "$p_file" "$p_lineno" || return 1
	CheckSTAT_OPERATE_ROOT  "$p_file" "$p_lineno" || return 1
    CheckSTAT_TIME_TXT      "$p_file" "$p_lineno" || return 1
    CheckSTAT_TRANSLATED    "$p_file" "$p_lineno" || return 1
    CheckSTAT_TXT_FMT       "$p_file" "$p_lineno" || return 1
    CheckSTAT_USER_OS       "$p_file" "$p_lineno" || return 1

	return 0
}

# -----------------------------------------------

## CHANGING VALUES 

# Parameters :
#   $1  --> new value.
#   $2  --> file where the change was made.
#   $3  --> line where the change was made.

# Changing the "$__BU_MAIN_STAT_DEBUG" status variable's value.
function ChangeSTAT_DEBUG           { __BU_MAIN_STAT_DEBUG="$1";            CheckSTAT_DEBUG             "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_DECHO" status variable's value.
function ChangeSTAT_DECHO           { __BU_MAIN_STAT_DECHO="$1";            CheckSTAT_DECHO             "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value.
function ChangeSTAT_ECHO            { __BU_MAIN_STAT_ECHO="$1";             CheckSTAT_ECHO              "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_ERROR" status variable's value.
function ChangeSTAT_ERROR           { __BU_MAIN_STAT_ERROR="$1";            CheckSTAT_ERROR             "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
function ChangeSTAT_INITIALIZING    { __BU_MAIN_STAT_INITIALIZING="$1";     CheckSTAT_INITIALIZING      "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_LOG" status variable's value.
function ChangeSTAT_LOG             { __BU_MAIN_STAT_LOG="$1";              CheckSTAT_LOG               "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function ChangeSTAT_LOG_REDIRECT    { __BU_MAIN_STAT_LOG_REDIRECT="$1";     CheckSTAT_LOG_REDIRECT      "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function ChangeSTAT_OPERATE_ROOT    { __BU_MAIN_STAT_OPERATE_ROOT="$1";     CheckSTAT_OPERATE_ROOT      "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function ChangeSTAT_TIME_TXT        { __BU_MAIN_STAT_TIME_TXT="$1";         CheckSTAT_TIME_TXT          "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TRANSLATED" status variable's value.
function ChangeSTAT_TRANSLATED      { __BU_MAIN_STAT_TRANSLATED="$1";       CheckSTAT_TRANSLATED        "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function ChangeSTAT_TXT_FMT         { __BU_MAIN_STAT_TXT_FMT="$1";          CheckSTAT_TXT_FMT           "$2" "$3" || return 1; return 0; }
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Decho.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TEXT WRITING AND DECORATION (FORMATTING)

## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT - BASIS

# Quick multi commands execution for the below "Decho()" function.
function __Decho { local v_oldColor=$1; tput setaf "$v_oldColor" && IsInt "$v_oldColor" && echo -e "$v_oldColor" > "$__BU_MAIN_FILE_COLOR_CODE_PATH"; }

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

    local pa_fmtArgs
        pa_fmtArgs=$("$@")

    #***** Variables *****
    local v_oldColor

    #***** Code *****
    CheckDecho

    if test "$?" -ne 0; then
        echo -ne "<< $p_string >>"
        
        return 1
    else
        local v_oldColor
            v_oldColor="$(cat "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH")"
    fi

    if [ "$p_newColor" = "$v_oldColor" ]; then

        # TODO : Développer un meilleur système de changement de couleur (P-Ê en appelant une fonction à créer, ou en utilisant une formule mathématique). Se renseigner sur la commande "tput setaf".
		p_newColor="$(( p_newColor+38 ))"
		tput setaf "$p_newColor"
	fi

	if [ "$__BU_MAIN_STAT_DECHO" = 'restrict' ]; then # || [ -z "${pa_fmtArgs[@]}" ]; then
        echo -e "$p_string$p_newColor$__BU_MAIN_COLOR_RESET"; return 0
    else
        # Setting every formattings.
        for val in "${pa_fmtArgs[@]}"; do
            case "${val^^}" in
                "$(IsInt "${#val}")")
                    return
                    ;;
                'BLINK')
                    echo -ne "${__BU_MAIN_TXT_FMT_BLINK}"
                    ;;
                'BOLD')
                    echo -ne "${__BU_MAIN_TXT_FMT_BOLD}"
                    ;;
                'D')
                    echo -ne "${__BU_MAIN_TXT_FMT_DIM}"
                    ;;
                'I')
                    echo -ne "${__BU_MAIN_TXT_FMT_ITALIC}"
                    ;;
                'S')
                    echo -ne "${__BU_MAIN_TXT_FMT_STRIKETHROUGH}"
                    ;;
                'U')
                    echo -ne "${__BU_MAIN_TXT_FMT_UNDERLINE}"
                    ;;
                *)
                    # WARNING ! >>> DO NOT RESET <<< the "$__BU_MAIN_STAT_TXT_FMT" variable's value >>> to "true" <<<, or else the program will be stuck in an infinite loop.

                    # The function "HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_TXT_FMT" status variable's value is set to "false", the script will not call the following function indefinitely.

                    ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                    HandleErrors "1" "AT LEAST ONE OF THE $(DechoHighlight "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                        "Check if the value is supported in the first value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"

                    ChangeSTAT_TXT_FMT "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                    return 1
                    ;; 
            esac
        done

        echo -e "$p_string$p_newColor$__BU_MAIN_COLOR_RESET"

        # Resetting every formattings.
        for val in "${pa_fmtArgs[@]}"; do
            case "${val^^}" in
                "$(IsInt "${#val}")")
                    return
                    ;;
                'BLINK')
                    echo -ne "${__BU_MAIN_TXT_FMT_BLINK_RESET}"
                    ;;
                'BOLD')
                    echo -ne "${__BU_MAIN_TXT_FMT_BOLD_RESET}"
                    ;;
                'D')
                    echo -ne "${__BU_MAIN_TXT_FMT_DIM_RESET}"
                    ;;
                'I')
                    echo -ne "${__BU_MAIN_TXT_FMT_ITALIC_RESET}"
                    ;;
                'S')
                    echo -ne "${__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET}"
                    ;;
                'U')
                    echo -ne "${__BU_MAIN_TXT_FMT_UNDERLINE_RESET}"
                    ;;
                *)
                    # WARNING ! Do not reset the "$__BU_MAIN_STAT_TXT_FMT" variable's value  to "true", or else the program will be stuck in an infinite loop.

                    # The function "HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_TXT_FMT" status variable's value is set to "false", the script will not call the following function indefinitely.

                    # shellcheck disable=SC2034
                    ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                    
                    HandleErrors "1" "AT LEAST ONE OF THE $(DechoHighlight "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                    "Check if the value is supported in the second value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"

                    ChangeSTAT_TXT_FMT "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                    ;;
            esac
        done
    fi

    return 0
}

# -----------------------------------------------

## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT - LIST

# Tip : to avoid defining a function for each color and formatting (which would take a monstruous amount of time, especially if new colors or formattings are added),
# it's easier to call the wanted text formatting function, then the wanted coloring text function, or vice-versa.

# Examples :
# echo -e "Lorem ipsum $(Decho_FMT_BlinkBoldDISU "$(DechoOrange "dolor")") sit amet..."
# echo -e "Lorem ipsum $(DechoOrange "$(Decho_FMT_BlinkBoldDISU "dolor")") sit amet..."

# Easy "Decho()" function calls with colors.
function DechoHighlight { Decho "$1" "$__BU_MAIN_COLOR_HIGHLIGHT"   || return 1; return 0; }
function DechoBlack     { Decho "$1" "$__BU_MAIN_COLOR_BLACK"       || return 1; return 0; }
function DechoBlue      { Decho "$1" "$__BU_MAIN_COLOR_BLUE"        || return 1; return 0; }
function DechoCyan      { Decho "$1" "$__BU_MAIN_COLOR_CYAN"        || return 1; return 0; }
function DechoGray      { Decho "$1" "$__BU_MAIN_COLOR_GRAY"        || return 1; return 0; }
function DechoGreen     { Decho "$1" "$__BU_MAIN_COLOR_GREEN"       || return 1; return 0; }
function DechoOrange    { Decho "$1" "$__BU_MAIN_COLOR_ORANGE"      || return 1; return 0; }
function DechoPink      { Decho "$1" "$__BU_MAIN_COLOR_PINK"        || return 1; return 0; }
function DechoPurple    { Decho "$1" "$__BU_MAIN_COLOR_PURPLE"      || return 1; return 0; }
function DechoRed       { Decho "$1" "$__BU_MAIN_COLOR_RED"         || return 1; return 0; }
function DechoTurquoise { Decho "$1" "$__BU_MAIN_COLOR_TURQUOISE"   || return 1; return 0; }
function DechoWhite     { Decho "$1" "$__BU_MAIN_COLOR_WHITE"       || return 1; return 0; }
function DechoYellow    { Decho "$1" "$__BU_MAIN_COLOR_YELLOW"      || return 1; return 0; }

# Blink formatting.
function Decho_FMT_Blink            { Decho "$1" "" 'Blink'                         || return 1; return 0; }
function Decho_FMT_BlinkBold        { Decho "$1" "" 'Blink' 'Bold'                  || return 1; return 0; }
function Decho_FMT_BlinkBoldD       { Decho "$1" "" 'Blink' 'Bold' 'D'              || return 1; return 0; }
function Decho_FMT_BlinkBoldDI      { Decho "$1" "" 'Blink' 'Bold' 'D' 'I'          || return 1; return 0; }
function Decho_FMT_BlinkBoldDIS     { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'S'      || return 1; return 0; }
function Decho_FMT_BlinkBoldDISU    { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'S' 'U'  || return 1; return 0; }
function Decho_FMT_BlinkBoldDIU     { Decho "$1" "" 'Blink' 'Bold' 'D' 'I' 'U'      || return 1; return 0; }
function Decho_FMT_BlinkBoldDS      { Decho "$1" "" 'Blink' 'Bold' 'D' 'S'          || return 1; return 0; }
function Decho_FMT_BlinkBoldDSU     { Decho "$1" "" 'Blink' 'Bold' 'D' 'S' 'U'      || return 1; return 0; }
function Decho_FMT_BlinkBoldDU      { Decho "$1" "" 'Blink' 'Bold' 'D' 'U'          || return 1; return 0; }
function Decho_FMT_BlinkBoldI       { Decho "$1" "" 'Blink' 'Bold' 'I'              || return 1; return 0; }
function Decho_FMT_BlinkBoldIS      { Decho "$1" "" 'Blink' 'Bold' 'I' 'S'          || return 1; return 0; }
function Decho_FMT_BlinkBoldISU     { Decho "$1" "" 'Blink' 'Bold' 'I' 'S' 'U'      || return 1; return 0; }
function Decho_FMT_BlinkBoldIU      { Decho "$1" "" 'Blink' 'Bold' 'I' 'U'          || return 1; return 0; }
function Decho_FMT_BlinkBoldS       { Decho "$1" "" 'Blink' 'Bold' 'S'              || return 1; return 0; }
function Decho_FMT_BlinkBoldSU      { Decho "$1" "" 'Blink' 'Bold' 'S' 'U'          || return 1; return 0; }
function Decho_FMT_BlinkBoldU       { Decho "$1" "" 'Blink' 'Bold' 'U'              || return 1; return 0; }
function Decho_FMT_BlinkD           { Decho "$1" "" 'Blink' 'D'                     || return 1; return 0; }
function Decho_FMT_BlinkDI          { Decho "$1" "" 'Blink' 'D' 'I'                 || return 1; return 0; }
function Decho_FMT_BlinkDIS         { Decho "$1" "" 'Blink' 'D' 'I' 'S'             || return 1; return 0; }
function Decho_FMT_BlinkDISU        { Decho "$1" "" 'Blink' 'D' 'I' 'S' 'U'         || return 1; return 0; }
function Decho_FMT_BlinkDIU         { Decho "$1" "" 'Blink' 'D' 'I' 'U'             || return 1; return 0; }
function Decho_FMT_BlinkDS          { Decho "$1" "" 'Blink' 'D' 'S'                 || return 1; return 0; }
function Decho_FMT_BlinkDSU         { Decho "$1" "" 'Blink' 'D' 'S' 'U'             || return 1; return 0; }
function Decho_FMT_BlinkDU          { Decho "$1" "" 'Blink' 'D' 'U'                 || return 1; return 0; }
function Decho_FMT_BlinkI           { Decho "$1" "" 'Blink' 'I'                     || return 1; return 0; }
function Decho_FMT_BlinkIS          { Decho "$1" "" 'Blink' 'I' 'S'                 || return 1; return 0; }
function Decho_FMT_BlinkISU         { Decho "$1" "" 'Blink' 'I' 'S' 'U'             || return 1; return 0; }
function Decho_FMT_BlinkIU          { Decho "$1" "" 'Blink' 'I' 'U'                 || return 1; return 0; }
function Decho_FMT_BlinkS           { Decho "$1" "" 'Blink' 'S'                     || return 1; return 0; }
function Decho_FMT_BlinkSU          { Decho "$1" "" 'Blink' 'S' 'U'                 || return 1; return 0; }
function Decho_FMT_BlinkU           { Decho "$1" "" 'Blink' 'U'                     || return 1; return 0; }

# Bold formatting.
function Decho_FMT_Bold     { Decho "$1" "" 'Bold'                  || return 1; return 0; }
function Decho_FMT_BoldD    { Decho "$1" "" 'Bold' 'D'              || return 1; return 0; }
function Decho_FMT_BoldDI   { Decho "$1" "" 'Bold' 'D' 'I'          || return 1; return 0; }
function Decho_FMT_BoldDIS  { Decho "$1" "" 'Bold' 'D' 'I' 'S'      || return 1; return 0; }
function Decho_FMT_BoldDISU { Decho "$1" "" 'Bold' 'D' 'I' 'S' 'U'  || return 1; return 0; }
function Decho_FMT_BoldDIU  { Decho "$1" "" 'Bold' 'D' 'I' 'U'      || return 1; return 0; }
function Decho_FMT_BoldDS   { Decho "$1" "" 'Bold' 'D' 'S'          || return 1; return 0; }
function Decho_FMT_BoldDSU  { Decho "$1" "" 'Bold' 'D' 'S' 'U'      || return 1; return 0; }
function Decho_FMT_BoldDU   { Decho "$1" "" 'Bold' 'D' 'U'          || return 1; return 0; }
function Decho_FMT_BoldI    { Decho "$1" "" 'Bold' 'I'              || return 1; return 0; }
function Decho_FMT_BoldIS   { Decho "$1" "" 'Bold' 'I' 'S'          || return 1; return 0; }
function Decho_FMT_BoldISU  { Decho "$1" "" 'Bold' 'I' 'S' 'U'      || return 1; return 0; }
function Decho_FMT_BoldIU   { Decho "$1" "" 'Bold' 'I' 'U'          || return 1; return 0; }
function Decho_FMT_BoldS    { Decho "$1" "" 'Bold' 'S'              || return 1; return 0; }
function Decho_FMT_BoldSU   { Decho "$1" "" 'Bold' 'S' 'U'          || return 1; return 0; }
function Decho_FMT_BoldU    { Decho "$1" "" 'Bold' 'U'              || return 1; return 0; }

# Dim formatting
function Decho_FMT_D    { Decho "$1" "" 'D'             || return 1; return 0; }
function Decho_FMT_DI   { Decho "$1" "" 'D' 'I'         || return 1; return 0; }
function Decho_FMT_DIS  { Decho "$1" "" 'D' 'I' 'S'     || return 1; return 0; }
function Decho_FMT_DISU { Decho "$1" "" 'D' 'I' 'S' 'U' || return 1; return 0; }
function Decho_FMT_DIU  { Decho "$1" "" 'D' 'I' 'U'     || return 1; return 0; }
function Decho_FMT_DS   { Decho "$1" "" 'D' 'S'         || return 1; return 0; }
function Decho_FMT_DSU  { Decho "$1" "" 'D' 'S' 'U'     || return 1; return 0; }
function Decho_FMT_DU   { Decho "$1" "" 'D' 'U'         || return 1; return 0; }

# Italic formatting.
function Decho_FMT_I    { Decho "$1" "" 'I'         || return 1; return 0; }
function Decho_FMT_IS   { Decho "$1" "" 'I' 'S'     || return 1; return 0; }
function Decho_FMT_ISU  { Decho "$1" "" 'I' 'S' 'U' || return 1; return 0; }
function Decho_FMT_IU   { Decho "$1" "" 'I' 'U'     || return 1; return 0; }

# Strikethrough formatting.
function Decho_FMT_S    { Decho "$1" "" 'S'     || return 1; return 0; }
function Decho_FMT_SU   { Decho "$1" "" 'S' 'U' || return 1; return 0; }

# Underline formatting.
function Decho_FMT_U    { Decho "$1" "" 'U' || return 1; return 0; }
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Directories.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

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
    if ! CheckArgsMain_OverwriteDir "$p_path" "$p_authorization"; then return 1; fi
	
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
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${v_path/:?}/"*
            HandleErrors "$?" "UNABLE TO DELETE THE CONTENT OF THE $(KeepFormatting "$(DechoHighlight "$v_path/")") FOLDER." \
                "Please check the permissions of the targeted directory" "$v_path" "$v_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

            EchoSuccess "Deletion of the contents of the folder $(DechoHighlight "$v_path/") performed successfully"
            Newline

			return 0
        else
            HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

			return 1
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
    if ! CheckArgsMain_Makedir "$p_parent" "$p_name"; then return 1; fi
    
    # Checking second if the script is operating at the root directory.
    if ! TriggerRootDirWarning "$v_path"; then return 1; fi
	
	# If the folder to create doesn't exists, ths script creates it with the help of the "mkdir" command.
	if [ ! -d "$v_path" ]; then
		EchoNewstep "Creating the $(DechoHighlight "$p_name") folder in the parent folder $(DechoHighlight "$p_parent/")."
		Newline

        mkdir -pv "$v_path"
        HandleErrors "$?" \
            "THE $(KeepFormatting "$(DechoHighlight "$p_name/")") FOLDER CANNOT BE CREATED IN THE PARENT FOLDER $(KeepFormatting "$(DechoHighlight "$p_parent/")") !" \
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

# The function "CheckSTAT_LOG()" creates the log file and its path when the __BU_MAIN_STAT_LOG variable's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
function MkTmpDir()
{
    local lineno="$LINENO"; if [ ! -d "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ]; then
        mkdir -p "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ||
		{
			ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
			
			HandleErrors "1" "THE $(CheckDirPathExists "$(DechoHighlight "$__BU_MAIN_PROJECT_TMP_DIR_PATH")") CANNOT BE CREATED !" \
            "Please check at the mentionned line in the mentionned file." "$__BU_MAIN_PROJECT_TMP_DIR_PATH" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

			ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			return 1
		}
    
		return 0
	fi

	return 0
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

        echo -e "$result"

		return 0
    else
        HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-6 ))"
		
		return 1
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

		return 0
    else
        HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Please check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"

		return 1
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

    if ! IsInt "$p_iterations"; then
        EchoWarning "$(DechoHighlight "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1'
    fi

    if [ -z "$p_iterations" ] || [ "$p_iterations" -lt 1 ]; then
        p_iterations='1'
    fi

    for ((i=0; i<p_iterations; i++)); do
        local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; return 1
            }; pwd -P )"

        p_path="$v_parent"
    done

    shopt -s extglob            # enable +(...) glob syntax.
    result=${p_path%%+(/)}      # trim however many trailing slashes exist.
    result=${result##*/}        # remove everything before the last / that still remains.

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

    if [ -z "$p_iterations" ] || [ "$p_iterations" -lt 1 ]; then
        p_iterations='1'
    fi

    if [ -d "$p_path" ]; then
        for ((i=0; i<p_iterations; i++)); do
            local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
                || {
                    HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; return 1
                }; pwd -P )"

            p_path="$v_parent"
        done
        
        shopt -s extglob            # enable +(...) glob syntax.
        result=${p_path%%+(/)}      # trim however many trailing slashes exist.

        echo -e "$result"
    else
        local v_path_str=""
        local v_current_path="$p_path"

        for ((i=0; i<p_iterations; i++)); do
            local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
                || {
                    HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; return 1
                }; pwd -P )"
            
            local v_path_cut; v_path_cut="${v_parent##*/}"
            local v_path_str+="$v_path_cut/"

            # Removing the unnecessary folders.
            # WARNING !!!! USE THE "rmdir" COMMAND ONLY !!!!
            # DO NOT USE THE "rm -rf" COMMAND AT ALL, OR FILES AND FOLDERS COULD BE UNINTENTIONNALY ERASED !!!!
            rmdir "$v_current_path"; HandleErrors "$?" "UNABLE TO ERASE THE $(DechoHighlight "$v_current_path") NEWLY CREATED FOLDER !"
            
            local v_current_path="$v_parent"
        done

        ReverseStringWordsOrder "$v_path_str" '/'
    fi
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Echo.lib
# Module        : Main
# Description   : (Colored) text display functions.
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### PRINTING FORMATTED STRINGS

## DEBUGGING AND HANDLING TEXT DISPLAY ERRORS

# Print void lines before and after calling a header.
function __EchoVoid()
{
    printf "
    
    
    
    
    
    
    
    
    
    " > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"
}

# "Echo<...>()" functions debug output for a better view during a debug process.
# It's better to also execute the project's script with the "bash - x $project_name" command, instead of the "./$project_name" way.
function __EchoOutput()
{
	#***** Parameters *****
	local p_string=$1		# String to display.
	local p_context=$2		# Begin or end of the debug process.
	local p_type=$3			# Type of message (error 'E', newstep 'N', success 'S' or warning 'W').

	#***** Code *****
	if [ "$__BU_MAIN_STAT_DEBUG" = "true" ]; then
		CheckProjectRelatedFile "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT" "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME" "f" || { HandleSmallErrors 'E' "$(DechoHighlight "${FUNCNAME[0]}") --> Unable to create the $(DechoHighlight "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME") debug log file" 'E' "CPLS"; exit 1; }

        if [ "$p_context" = "begin" ]; then
            __EchoVoid

            if [ "${p_type^^}" = "E" ]; then
                echo -e "$(HeaderError "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'm' ]; then
                echo -e "$(Header "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 		|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                echo -e "$(HeaderNewstep "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                echo -e "$(HeaderSuccess "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                echo -e "$(HeaderWarning "BEGIN DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            fi

            return 0

        elif [ "$p_context" = "end" ]; then
            if [ "${p_type^^}" = "E" ]; then
                echo -e "$(HeaderError "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 		|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'm' ]; then
                echo -e "$(Header "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 			|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                echo -e "$(HeaderNewstep "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                echo -e "$(HeaderSuccess "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                echo -e "$(HeaderWarning "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            fi

            __EchoVoid; return 0
        fi
    fi
}

# Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
function __EchoCPLS()
{
    #***** Parameters *****
    p_string=$1
    p_option=$2

    shift 2; pa_extraArgs=("$@")

    #***** Code *****
    for val in "${pa_extraArgs[@]}"; do
        if [ "$val" = 'nodate' ]; then 
            case "$p_option" in
                '-n' | 'n')
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$p_string"
                    fi
                    ;;
                '' | *)
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" || return 1
                    else
                        echo -e "$p_string"
                    fi
                    ;;
            esac
        elif [ -z "$val" ]; then
            case "$p_option" in
                '-n' | 'n')
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
                '' | *)
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" || return 1
                    else
                        echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
            esac
        else
            case "$p_option" in
                '-n' | 'n')
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
                '' | *)
                    if CheckIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" || return 1
                    else
                        echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
            esac
        fi

        sleep "$__BU_MAIN_STAT_TIME_TXT"
    done

    return 0
}

# --------------------------------------------

## DISPLAYING A COLORED MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__BU_MAIN_STAT_TIME_TXT" status variable.

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

    local pa_extraArgs=("$@")

    #***** Code *****
    if ! CheckEcho; then
        __EchoOutput "$p_string" 'begin' 'E' || return 1
        CheckProjectLogStatus "${__BU_MAIN_COLOR_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'E' || return 1

    # Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
    else
        __EchoOutput "$p_string" 'begin' 'E' || return 1
        __EchoCPLS "${__BU_MAIN_COLOR_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'E' || return 1
    fi

    sleep "$__BU_MAIN_STAT_TIME_TXT"; return 0
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
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #***** Code *****
    if ! CheckEcho; then
        __EchoOutput "$p_string" 'begin' 'm' || return 1
        CheckProjectLogStatus "$p_string" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'm' || return 1

    # Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
    else
        __EchoOutput "$p_string" 'begin' 'm' || return 1
        __EchoCPLS "$p_string" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'm' || return 1
    fi

    sleep "$__BU_MAIN_STAT_TIME_TXT"; return 0
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
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #***** Code *****
    if ! CheckEcho; then
        __EchoOutput "$p_string" 'begin' 'N' || return 1
        CheckProjectLogStatus "${__BU_MAIN_COLOR_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'N' || return 1

    # Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
    else
        __EchoOutput "$p_string" 'begin' 'N' || return 1
        __EchoCPLS "${__BU_MAIN_COLOR_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'N' || return 1
    fi

    sleep "$__BU_MAIN_STAT_TIME_TXT"; return 0
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
	if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ] && [ "$__BU_MAIN_STAT_LOG" = "true" ] && [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ]; then
		echo -e "Keyboard input value : $(DechoHighlight "$p_string")" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { HandleSmallErrors '' "" '' ""; return 1; }
	fi; return 0
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
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #***** Code *****
    if ! CheckEcho; then
        __EchoOutput "$p_string" 'begin' 'S' || return 1
        CheckProjectLogStatus "${__BU_MAIN_COLOR_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'S' || return 1

    # Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
    else
        __EchoOutput "$p_string" 'begin' 'S' || return 1
        __EchoCPLS "${__BU_MAIN_COLOR_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'S' || return 1
    fi

    sleep "$__BU_MAIN_STAT_TIME_TXT"; return 0
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
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #***** Code *****
    if ! CheckEcho; then
        __EchoOutput "$p_string" 'begin' 'W' || return 1
        CheckProjectLogStatus "${__BU_MAIN_COLOR_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'W' || return 1

    # Failsafe if any "Echo<...>()" function has to be called in the "CheckProjectLogStatus()" function.
    else
        __EchoOutput "$p_string" 'begin' 'W' || return 1
        __EchoCPLS "${__BU_MAIN_COLOR_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        __EchoOutput "$p_string" 'end' 'W' || return 1
    fi

    sleep "$__BU_MAIN_STAT_TIME_TXT"; return 0
}

# -----------------------------------------------

## TEXT FORMATTING

# Keep the same text format between lowercased or uppercased text printed by a formatting text function ("ToLowercase()" OR "ToUppercase()") or a parameter expansion.
# This function is planned to be used between force-uppered/lowered text, to keep the original text formatting of the wanted string excerpt.
function KeepFormatting()
{
	#***** Parameters *****
	p_string=$1            # String to display.
	p_old_formatting=$2    # Former tectxt formatting.

	#***** Code *****
# 	echo -ne &>/dev/null; echo -ne "$p_string"
# 
# 	if [ "${p_old_formatting,,}" = 'l' ]; then
#         echo -ne "$(ToLowercase "$p_string")"
# 	elif [ "${p_old_formatting^^}" = 'U' ]; then
#         echo -ne "$(ToUppercase "$p_string")"
# 	else
#         echo -ne "<<|| No reformatting precised in the $(ToLowercase "${FUNCNAME[0]}()") function ||>>"
# 	fi

	return 0
}

# Print a lowercased text.

# Usage :
#	ToLowercase "<Text to write>"
function ToLowercase()
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[:upper:]' '[:lower:]'; return 0
}

# Print an uppercased text.

# Usage :
#	ToUppercase "<Text to write>"
function ToUppercase()
{
	#***** Parameters *****
	p_string=$1

	#***** Code *****
	echo -e "$p_string" | tr '[:lower:]' '[:upper:]'; return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### LINE BREAKS

## LINE BREAKS ACCORDING TO THE "$MAIN_SCRIPT_LOG" VARIABLE VALUE

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
            EchoMsg "" "" "nodate"
            HandleSmallErrors 'W' "$(DechoHighlight "${FUNCNAME[0]}()") --> Warning : the number of line breaks must be an integer" 'R'
            EchoMsg "" "" "nodate"
        else
            # Doing X line breaks according to the number passed as argument.
            for ((i=0; i<number; i++)); do
                EchoMsg "" "" "nodate"
            done
        fi
    else
        EchoMsg "" "" "nodate"
    fi

    return 0
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Errors.lib
# Module        : Main
# Description   : Errors handling functions.
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### ERRORS HANDLING FUNCTIONS

## CLASSIC ERRORS HANDLING

# Saving time when displaying a newline, an error message and an exit or a return value.

# WARNING ! DO NOT CALL ANY FUNCTION THAT CALL THIS FUNCTION DIRECTLY OR INDIRECTLY HERE,
# OR THE SCRIPT WILL LOOP FOREVER IN CASE OF AN ERROR DURING THIS FUNCTION CALL !!!
function HandleSmallErrors()
{
    #***** Parameters *****
    local p_type=$1         # Type of message to display ('E' = EchoError; 'W' = EchoWarning)
    local p_string=$2       # String to display.
    local p_return=$3       # Exit or return status ('E' = exit; 'R' = return).
    local p_cpls=$4         # Enable the safe text printing mode.

    #***** Variables *****
    v_advise="Please don't forget to pass a type of message to display as first argument ('E' = EchoError; 'W' = EchoWarning)"

    if [ "${p_cpls^^}" = 'CPLS' ]; then
        if [ "$__BU_MAIN_STAT_ECHO" = 'false' ]; then
            local v_BU_STAT_ECHO_old="$__BU_MAIN_STAT_ECHO"; ChangeSTAT_ECHO 'true' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi

    #***** Code *****
    Newline >&2;

    if [ "$p_type" = 'E' ]; then EchoError "$p_string" '' ''
    elif [ "$p_type" = 'W' ]; then EchoWarning "$p_string" '' ''

    # If no type of message to displays is passed as first argument, the script will choose between one of the accepted types.
    else
        if [ "$(( RANDOM%2 ))" = "0" ]; then
            EchoError "$p_string    | ${__BU_MAIN_COLOR_RESET}$v_advise" '' ''
        else
            EchoWarning "$p_string  | ${__BU_MAIN_COLOR_RESET}$v_advise" '' ''
        fi
    fi

    Newline >&2

    # As the "EchoWarning()" function will be called in case of a missing return or exit code (normally passed as second argument),
    # it's better to reset the value of the "$__BU_MAIN_STAT_ECHO" status variable condition per condition.
    if [ "${p_return^^}" = 'R' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi

        return 1

    elif [ "${p_return^^}" = 'E' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi

        ExitError '1'

    else 
        EchoWarning "${__BU_MAIN_COLOR_HIGHLIGHT}${FUNCNAME[0]}${__BU_MAIN_COLOR_WARNING} --> Warning : bad exit or return code given as second argument !"; ExitError '1'

        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi
    fi
}

# -----------------------------------------------

## EXIT HANDLING

# Handling exit command from sourced files, as it's impossible to properly exit the script from these.
function ExitError()
{
    if [[ "$1" =~ [0-9] ]]; then
        exit "$1"; kill "$$"
    else
        EchoWarning "$(DechoHighlight "${FUNCNAME[0]}()") --> Warning : unexpected exit code passed as argument."

        kill "$$"
    fi
}

# -----------------------------------------------

## SCRIPT'S ERRORS HANDLING

# "HandleErrors()" function --> Handling file name presence.
function HandleErrors_File()        { if [ -z "$1" ]; then if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then DechoHighlight "<no specified file>"; else DechoHighlight "$__BU_MAIN_MSG_ERRORS_HandleErrors_File_NO_FILE"; fi; else DechoHighlight "$1"; fi; }

# "HandleErrors()" function --> Handling function name presence.
function HandleErrors_Function()    { if [ -z "$1" ]; then if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then DechoHighlight "<no specified function>"; else DechoHighlight "$__BU_MAIN_MSG_ERRORS_HandleErrors_Function_NO_FUNCTION"; fi; else DechoHighlight "$1"; fi; }

# "HandleErrors()" function --> Handling line number presence.
function HandleErrors_Line()        { if [ -z "$1" ]; then if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then DechoHighlight "<no specified line>"; else DechoHighlight "$__BU_MAIN_MSG_ERRORS_HandleErrors_Line_NO_LINE"; fi; else DechoHighlight "$1"; fi; }

# Handling command outputs.
# Featured functions and files from the "basis" category :
#   - 
function HandleErrors()
{
	#***** Parameters *****
	local p_returnCode=$1      # Return code of the last command executed. If you didn't launched any command before calling this function, you can pass any number different of '0' as first argument.
	local p_errorString=$2     # String of the type of error to display.
	local p_adviceString=$3    # String of characters displaying a tip to direct the user to the best solution to apply in case of a problem.
    local p_badValue=$4        # Incorrect value which caused the error.
	local p_file=$5            # The name of the file where the error occured.
	local p_function=$6        # The name of the function where the error occured.
	local p_lineno=$7          # Line on which the error message occured (obtained in a very simple way by calling the POSIX environment variable "$LINENO").

    #***** Variables *****
    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
        local v_hdrString;
            v_hdrString="$(echo -ne "IN $(HandleErrors_File "$p_file") FILE, FUNCTION $(HandleErrors_Function "$p_function"), LINE $(HandleErrors_Line "$p_lineno") -->")"
    else
        local v_hdrString;
            v_hdrString="$(echo -ne "$__BU_MAIN_MSG_ERRORS_HandleErrors_HDR_STRING")"
    fi

	# ***** Code *****
	CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	if [ "$p_returnCode" -eq 0 ]; then
        return 0
    else
        # -------- PART 1 : MANAGING THE CALL OF THIS "HandleErrors()" FUNCTION IF THIS "HandleErrors()" FUNCTION IS CALLED IN A FUNCTION CALLED BY THIS "HandleErrors()" FUNCTION

        # If the function needs to be called in the "CheckProjectLogStatus()" function,
        # this status variable's value MUST be set at "true", or else the script will loop forever.

        # WARNING : DO NOT call a text formatting function to format something else than the text color, or else the script will loop forever.

        if [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then

            # Drawing an extra line to differenciate the message below from the rest of the error messages.
            EchoMsg "$(DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_PRINT_HEADER_LINE")" '' 'nodate'

            if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
                if [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ]; then
                    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "A FATAL ERROR OCCURED DURING A TEST IN THE $(DechoHighlight "CheckProjectLogStatus") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !"
                    else EchoError ""; fi
                else
                    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "A FATAL ERROR OCCURED DURING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S PROJECT INITIALIZATION"
                    else EchoError ""; fi
                fi
            else
                if [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ]; then
                    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "AN ERROR OCCURED DURING A TEST IN THE $(DechoHighlight "CheckProjectLogStatus") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !"
                    else EchoError ""; fi
                else
                    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "AN ERROR OCCURED DURING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S PROJECT INITIALIZATION"
                    else EchoError ""; fi
                fi
            fi
        fi


        # -------- PART 2 : PRINTING THE HEADER

        # Redirecting the log messages to the terminal, to show them to the user. 
        if [ "$__BU_MAIN_STAT_LOG_REDIRECT" = "log" ]; then
            local v_log_old="true"; __BU_MAIN_STAT_LOG_REDIRECT="tee"; CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi

        if [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
            if CheckIsInitializing; then
                if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then InitializerAddInitStrArrayVal "$(HeaderRed "$v_hdrString FATAL ERROR : $p_errorString")" >&2
                else InitializerAddInitStrArrayVal "$(HeaderRed "$v_hdrString $__BU_MAIN_MSG_ERRORS_HandleErrors_ : $p_errorString")" >&2; fi
            else
                if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then HeaderRed "$v_hdrString FATAL ERROR : $p_errorString" >&2
                else HeaderRed "$v_hdrString $__BU_MAIN_MSG_ERRORS_HandleErrors_ : $p_errorString" >&2; fi
            fi
        else
            if CheckIsInitializing; then
                if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then InitializerAddInitStrArrayVal "$(HeaderRed "$v_hdrString ERROR : $p_errorString")" >&2
                else InitializerAddInitStrArrayVal "$(HeaderRed "$v_hdrString $__BU_MAIN_MSG_ERRORS_HandleErrors_ : $p_errorString")" >&2; fi
            else
                if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then HeaderRed "$v_hdrString ERROR : $p_errorString" >&2
                else HeaderRed "$v_hdrString $__BU_MAIN_MSG_ERRORS_HandleErrors_ : $p_errorString" >&2; fi
            fi
        fi
        
        Newline >&2


        # -------- PART 3 : GIVING AN ADVICE ABOUT THE ORIGIN OF THE ERROR TO THE USER/DEVELOPPER

        if [ -z "$p_adviceString" ]; then
            if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "No advice to give."; Newline >&2; else EchoError "$__BU_MAIN_MSG_ERRORS_HandleErrors_"; fi
        else
            if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "$(DechoHighlight "Advice") : $p_adviceString" >&2; Newline >&2; else EchoError ""; fi
        fi

        if [ -z "$p_badValue" ]; then
            if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "Value(s) that caused this error : $(DechoOrange 'no value') OR $(DechoOrange 'an unknown error')"; Newline >&2
            else EchoError "$__BU_MAIN_MSG_ERRORS_HandleErrors_"; fi
        else
            if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "Value(s) that caused this error : $(DechoHighlight "$p_badValue")"; Newline >&2; else EchoError "$__BU_MAIN_MSG_ERRORS_HandleErrors_"; fi
        fi

        if [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
            if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then EchoError "Stopping the execution of $(DechoHighlight "$(basename "$0")")."; Newline >&2; else EchoError "$__BU_MAIN_MSG_ERRORS_HandleErrors_"; fi
            ExitError "1"
        else
            # Calling the function that processes the given answer.
            CaseRead_HandleErrors
        fi

        if [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then
            if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
                EchoWarning "" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ||
                {
                    if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
                        HandleSmallErrors "Unable to write in the $(DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") projectlog file from the $(DechoHighlight "${FUNCNAME[0]}()") function" 'R' 'CPLS'
                    else
                        HandleSmallErrors "$__BU_MAIN_MSG_ERRORS_HandleErrors_" 'R' 'CPLS'
                    fi
                }
            fi
        fi

        if [ "$v_log_old" = "true" ]; then
            __BU_MAIN_STAT_LOG_REDIRECT="log"; CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi

    return 1
}

# -----------------------------------------------
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Files.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

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
            
        sleep "$__BU_MAIN_STAT_TIME_TXT"

    elif [ "$p_output" = 'S' ]; then
        EchoSuccess "End of processing the $(DechoS "$p_name") file"
        EchoMsg "$(DrawLine "$__COL_RESET" "$p_char")" '-n' 'nodate'
        Newline
        
        sleep "$__BU_MAIN_STAT_TIME_TXT"
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
    
	sleep "$__BU_MAIN_STAT_TIME_TXT"
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

		touch "$v_path"; CheckFilePathWasCreated "$v_path"

		# Testing if the file has been created by checking the return code of the "CheckFilePathWasCreated" function via the "HandleErrors" function.
        # An error may come from the fact that the user did not run the script in superuser mode, a script that tried to create a file in a folder
		# where the user is not allowed to create a file without superuser privileges.

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

# Creating the project's log file.
function CreateProjectLogFile()
{
    #***** Variables *****
    local v_terminfo_v; v_terminfo_v="$($(ps -p "$(ps -p "$$" -o ppid=)" o args=) -v)"

    #***** Code *****
    if ! CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" 'f'; then EchoError "UNABLE TO CREATE THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S LOG FILE"; ExitError '1'; fi

    EchoSuccess "Successfully created the $(DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file."

    ChangeSTAT_TXT_FMT 'true' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	if [ "$__BU_MAIN_STAT_DECHO" = 'true' ]; then	ChangeSTAT_DECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";	fi
    if [ "$__BU_MAIN_STAT_ECHO" = 'true' ]; then	ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";	fi

    # Redirecting the initializer's log file content into the log file.
    HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT"

    EchoNewstep "Sourced configuration files :"; for val in "${__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY[@]}"; do EchoMsg "$val"; done; Newline
    EchoNewstep "Sourced library files : "; for val in "${__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY[@]}"; do EchoMsg "$val"; done; Newline

	if (( "${#__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE[@]}" >= 1 )); then
		EchoNewstep "Initialization log output :"; Newline

        for val in "${__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE[@]}"; do
            CheckProjectLogStatus "$(CutDateFromString "$val")"
        done
    fi

    # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Unix-like operating system.
    HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

	# Getting operating system name.
	EchoNewstep "Operating system name : $(awk -F= '/^NAME/{print $2}' /etc/os-release)"
	Newline

    # Getting operating system family.
    EchoNewstep "Operating system family : $(DechoHighlight "$OSTYPE")"
    Newline

    # Gathering OS informations from the "/etc/os-release" file.
    EchoNewstep "Operating system general informations :"
    if [ -f "/etc/os-release" ]; then EchoMsg "$(cat "/etc/os-release")" "" "nodate"; else EchoMsg 'No available informations ("/etc/os-release" file not found)'; fi
    Newline

	# Getting operating system extra informations (Windows Subsystem for Linux, etc...).
	EchoNewstep "Operating system extra informations :"
	if [[ "$(< /proc/sys/kernel/osrelease)" == *[M-m]icrosoft* ]]; then EchoMsg "Distro running on Windows Subsystem for Linux : $(awk -F= '/^NAME/{print $2}' /etc/os-release)"; fi
	Newline

	# Getting Bash language's version.
    EchoNewstep "Bash version : $(DechoHighlight "$BASH_VERSION")"
    Newline

	# Getting terminal emulator's name and version.
	# shellcheck disable=SC2016
    EchoNewstep "Terminal (emulator) version : $(DechoHighlight "$v_terminfo_v")" || EchoWarning "$(DechoHighlight '$v_terminfo_v') : bad command call."
    Newline

    EchoSuccess "Successfully got the user's system's informations."
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
            EchoSuccess "Sourced file : $(DechoHighlight "$p_path")"
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
			# shellcheck disable=SC2034
            __BU_MAIN_TXT_STORE_LINE="$line"
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
#     local cmd=$1      # Compression command.
#     local opts=$2     # Options of the compression command.
#     local p_path=$3     # Path to the file/folder to archivate.
#     local p_name=$4     # Archive's name (only used into displayed messages).
    
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
#     #***** Paramètres *****
#     local p_cmd=$1      # Compression command.
#     # TODO : Vérifier si cette procédure est bonne
#     local p_opts=$2     # Options of the compression command. (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
#     local p_path=$3     # Path to the l'archive to uncompress.
#     local p_name=$4     # Archive's name (only used into displayed messages).
# 
#     #***** Code *****
#     # On exécute la commande de décompression en passant en arguments ses options et le chemin vers l'archive.
#     "$cmd $opts $p_path"
#     HandleErrors "$?" "${FUNCNAME[0]} : LA DÉCOMPRESSION DE L'ARCHIVE $(DechoHighlight "$p_name") A ÉCHOUÉE"
#     EchoSuccess "La décompression de l'archive $(DechoHighlight "$p_name") s'est effectuée avec brio."
#     Newline
    
    return 0
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Headers.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### FUNCTIONS DEFINITION

## HEADERS BASIS CREATION FUNCTIONS

# Fonction de création et d'affichage de lignes selon le nombre de colonnes de la zone de texte du terminal.
function DrawLine()
{
	#***** Parameters *****
	local p_lineColor=$1	# Deuxième paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction.
	local p_lineChar=$2	# Premier paramètre servant à définir le caractère souhaité lors de l'appel de la fonction.
	
	#***** Code *****
	# Checking if the "$p_lineChar" parameter's value is a string instead of a single character, and getting the first character only.
	if ! IsChar "$p_lineChar"; then
        p_lineChar="${p_lineChar:0:1}"
	fi
	
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
	for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
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
        echo -ne "$__BU_MAIN_COLOR_RESET"
	fi

	# Étant donné que l'on a utilisé l'option '-n' de la commande "echo", on effectue un saut de ligne pour éviter d'avoir à le répéter après chaque appel de la commande pour laisser un espace vide entre la ligne et le prochain caractère.
	echo

	return 0
}

# Fonction de création de base d'un header (Couleur et caractère de ligne, couleur et chaîne de caractères).

# Since this function can be called in the "__EchoOutput()" function,
# even if the "$__BU_MAIN_STAT_ECHO" status variable's value is set to "true",
# it's better to create a failsafe, to avoid experiencing an infinite loop.
function HeaderBase()
{
	#***** Parameters *****
	local p_lineColor=$1      # Premier paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction "DrawLine".
	local p_lineChar=$2       # Deuxième paramètre servant à définir le caractère souhaité lors de l'appel de la fonction "DrawLine".
	local p_stringColor=$3	  # Définition de la couleur de la chaîne de caractères du header.
	local p_stringTxt=$4      # Chaîne de caractères affichée dans chaque header.

	#***** Variables *****	
# 	HEADERBASE_COLOR_LINE="$p_lineColor"
# 	HEADERBASE_COLOR_TEXT="$p_stringColor"

	#***** Code *****
	if [ "$__BU_MAIN_STAT_ECHO" = "false" ]; then
        Newline

        EchoMsg "$(DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
        EchoMsg "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_RESET}"
        EchoMsg "$(DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
        Newline

        return 0

    elif [ "$__BU_MAIN_STAT_ECHO" = "true" ] || [ "$__BU_MAIN_STAT_TRANSLATED" = "false" ]; then
        echo -e

        echo -e "$(DrawLine "$p_lineColor" "$p_lineChar")"
        echo -e "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_RESET}"
        echo -e "$(DrawLine "$p_lineColor" "$p_lineChar")"
        echo -e

        return 0
    fi
}

# -----------------------------------------------

## UNICOLOR HEADERS

# Header to display without color.
function Header         { HeaderBase "$__BU_MAIN_COLOR_RESET"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RESET"      "$1" || return 1; return 0; } 

# Header to display in case of an error.
function HeaderError    { HeaderBase "$__BU_MAIN_COLOR_ERROR"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ERROR"      "$1" || return 1; return 0; }

# Header to display when switching to a new package category during package installation.
function HeaderInstall  { HeaderBase "$__BU_MAIN_COLOR_YELLOW"   "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      "$1" || return 1; return 0; }

# Header to display when changing step.
function HeaderNewstep  { HeaderBase "$__BU_MAIN_COLOR_NEWSTEP"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_NEWSTEP"    "$1" || return 1; return 0; }

# Header to display when changing step.
function HeaderStep     { HeaderBase "$__BU_MAIN_COLOR_CYAN"     "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       "$1" || return 1; return 0; }

# Header to display in case of a successfully done step.
function HeaderSuccess  { HeaderBase "$__BU_MAIN_COLOR_SUCCESS"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SUCCESS"    "$1" || return 1; return 0; }

# Header to display in case of a minor error.
function HeaderWarning  { HeaderBase "$__BU_MAIN_COLOR_WARNING"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE"  "$__BU_MAIN_COLOR_WARNING"   "$1" || return 1; return 0; }

# Copy-paste this function to avoid losing time while creating unicolor headers :
# function Header<col> { HeaderBase "$__BU_MAIN_COLOR_<COLOR>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR>" "$1" || return 1; return 0; }

function HeaderBlack        { HeaderBase "$__BU_MAIN_COLOR_BLACK"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function HeaderBlue         { HeaderBase "$__BU_MAIN_COLOR_BLUE"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function HeaderCyan         { HeaderBase "$__BU_MAIN_COLOR_CYAN"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function HeaderGray         { HeaderBase "$__BU_MAIN_COLOR_GRAY"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function HeaderGreen        { HeaderBase "$__BU_MAIN_COLOR_GREEN"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function HeaderOrange       { HeaderBase "$__BU_MAIN_COLOR_ORANGE"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function HeaderPink         { HeaderBase "$__BU_MAIN_COLOR_PINK"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function HeaderPurple       { HeaderBase "$__BU_MAIN_COLOR_PURPLE"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function HeaderRed          { HeaderBase "$__BU_MAIN_COLOR_RED"          "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function HeaderTurquoise    { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderWhite        { HeaderBase "$__BU_MAIN_COLOR_WHITE"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function HeaderYellow       { HeaderBase "$__BU_MAIN_COLOR_YELLOW"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# -----------------------------------------------

## BICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating bicolor headers :
# function Header<col1><col2>   { HeaderBase "$__BU_MAIN_COLOR_<COLOR>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR>" "$1" || return 1; return 0; }

# Black line, differently colored text.
function HeaderBlackBlue        { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function HeaderBlackCyan        { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function HeaderBlackGray        { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function HeaderBlackGreen       { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     	"$1" || return 1; return 0; }
function HeaderBlackOrange      { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"    	"$1" || return 1; return 0; }
function HeaderBlackPink        { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function HeaderBlackPurple      { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"    	"$1" || return 1; return 0; }
function HeaderBlackRed         { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function HeaderBlackTurquoise   { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function HeaderBlackWhite       { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     	"$1" || return 1; return 0; }
function HeaderBlackYellow      { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# Blue lines, differently colored text.
function HeaderBlueBlack        { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function HeaderBlueCyan         { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function HeaderBlueGray         { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function HeaderBlueGreen        { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function HeaderBlueOrange       { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function HeaderBluePink         { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function HeaderBluePurple       { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function HeaderBlueRed          { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function HeaderBlueTurquoise    { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderBlueWhite        { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function HeaderBlueYellow       { HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Cyan lines, differently colored text.
function HeaderCyanBlack        { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function HeaderCyanBlue         { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function HeaderCyanGray         { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function HeaderCyanGreen        { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function HeaderCyanOrange       { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function HeaderCyanPink         { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function HeaderCyanPurple       { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function HeaderCyanRed          { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function HeaderCyanTurquoise    { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderCyanWhite        { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function HeaderCyanYellow       { HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Gray lines, differently colored text.
function HeaderGrayBlack        { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function HeaderGrayBlue         { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function HeaderGrayCyan         { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function HeaderGrayGreen        { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function HeaderGrayOrange       { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function HeaderGrayPink         { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function HeaderGrayPurple       { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function HeaderGrayRed          { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function HeaderGrayTurquoise    { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderGrayWhite        { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function HeaderGrayYellow       { HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Green lines, differently colored text.
function HeaderGreenBlack       { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     	"$1" || return 1; return 0; }
function HeaderGreenBlue        { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function HeaderGreenCyan        { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN" 	    "$1" || return 1; return 0; }
function HeaderGreenGray        { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY" 	    "$1" || return 1; return 0; }
function HeaderGreenOrange      { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"		"$1" || return 1; return 0; }
function HeaderGreenPink        { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function HeaderGreenPurple      { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"		"$1" || return 1; return 0; }
function HeaderGreenRed         { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function HeaderGreenTurquoise   { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function HeaderGreenWhite       { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     	"$1" || return 1; return 0; }
function HeaderGreenYellow      { HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW" 	"$1" || return 1; return 0; }

# Orange lines, differently colored text.
function HeaderOrangeBlack      { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"        	"$1" || return 1; return 0; }
function HeaderOrangeBlue       { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"         	"$1" || return 1; return 0; }
function HeaderOrangeCyan       { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"         	"$1" || return 1; return 0; }
function HeaderOrangeGray       { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"         	"$1" || return 1; return 0; }
function HeaderOrangeGreen      { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"        	"$1" || return 1; return 0; }
function HeaderOrangePink       { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"         	"$1" || return 1; return 0; }
function HeaderOrangePurple     { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"       	"$1" || return 1; return 0; }
function HeaderOrangeRed        { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"          	"$1" || return 1; return 0; }
function HeaderOrangeTurquoise  { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderOrangeWhite      { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"        	"$1" || return 1; return 0; }
function HeaderOrangeYellow     { HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"       	"$1" || return 1; return 0; }

# Pink lines, differently colored text.
function HeaderPinkBlack        { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function HeaderPinkBlue         { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function HeaderPinkCyan         { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function HeaderPinkGray         { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function HeaderPinkGreen        { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function HeaderPinkOrange       { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function HeaderPinkPurple       { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function HeaderPinkRed          { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function HeaderPinkTurquoise    { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function HeaderPinkWhite        { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function HeaderPinkYellow       { HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Purple lines, differently colored text.
function HeaderPurpleBlack      { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"        	"$1" || return 1; return 0; }
function HeaderPurpleBlue       { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"         	"$1" || return 1; return 0; }
function HeaderPurpleCyan       { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"         	"$1" || return 1; return 0; }
function HeaderPurpleGray       { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"         	"$1" || return 1; return 0; }
function HeaderPurpleGreen      { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"        	"$1" || return 1; return 0; }
function HeaderPurpleOrange     { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"       	"$1" || return 1; return 0; }
function HeaderPurplePink       { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"         	"$1" || return 1; return 0; }
function HeaderPurpleRed        { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"          	"$1" || return 1; return 0; }
function HeaderPurpleTurquoise  { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"    	"$1" || return 1; return 0; }
function HeaderPurpleWhite      { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"        	"$1" || return 1; return 0; }
function HeaderPurpleYellow     { HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"       	"$1" || return 1; return 0; }

# Red lines, differently colored text.
function HeaderRedBlack     { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       	"$1" || return 1; return 0; }
function HeaderRedBlue      { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        	"$1" || return 1; return 0; }
function HeaderRedCyan      { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        	"$1" || return 1; return 0; }
function HeaderRedGray      { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        	"$1" || return 1; return 0; }
function HeaderRedGreen     { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       	"$1" || return 1; return 0; }
function HeaderRedOrange    { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      	"$1" || return 1; return 0; }
function HeaderRedPink      { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        	"$1" || return 1; return 0; }
function HeaderRedPurple    { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      	"$1" || return 1; return 0; }
function HeaderRedTurquoise { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"   	"$1" || return 1; return 0; }
function HeaderRedWhite     { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       	"$1" || return 1; return 0; }
function HeaderRedYellow    { HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      	"$1" || return 1; return 0; }

# Turquoise lines, differently colored text.
function HeaderTurquoiseBlack   { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     	"$1" || return 1; return 0; }
function HeaderTurquoiseBlue    { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function HeaderTurquoiseCyan    { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function HeaderTurquoiseGray    { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function HeaderTurquoiseGreen   { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     	"$1" || return 1; return 0; }
function HeaderTurquoiseOrange  { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"    	"$1" || return 1; return 0; }
function HeaderTurquoisePink    { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function HeaderTurquoisePurple  { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"    	"$1" || return 1; return 0; }
function HeaderTurquoiseRed     { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function HeaderTurquoiseWhite   { HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE" 			"$1" || return 1; return 0; }
function HeaderTurquoiseYellow  { HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# White lines, differently colored text.
function HeaderWhiteBlack       { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     	"$1" || return 1; return 0; }
function HeaderWhiteBlue        { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function HeaderWhiteCyan        { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function HeaderWhiteGray        { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function HeaderWhiteGreen       { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     	"$1" || return 1; return 0; }
function HeaderWhiteOrange      { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"    	"$1" || return 1; return 0; }
function HeaderWhitePink        { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function HeaderWhitePurple      { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"    	"$1" || return 1; return 0; }
function HeaderWhiteRed         { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function HeaderWhiteTurquoise   { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function HeaderWhiteYellow      { HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# Yellow lines, differently colored text.
function HeaderYellowBlack      { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"        	"$1" || return 1; return 0; }
function HeaderYellowBlue       { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"         	"$1" || return 1; return 0; }
function HeaderYellowCyan       { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"         	"$1" || return 1; return 0; }
function HeaderYellowGray       { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"         	"$1" || return 1; return 0; }
function HeaderYellowGreen      { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"        	"$1" || return 1; return 0; }
function HeaderYellowOrange     { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"       	"$1" || return 1; return 0; }
function HeaderYellowPink       { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"         	"$1" || return 1; return 0; }
function HeaderYellowPurple     { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"       	"$1" || return 1; return 0; }
function HeaderYellowRed        { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"          	"$1" || return 1; return 0; }
function HeaderYellowWhite      { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"        	"$1" || return 1; return 0; }
function HeaderYellowTurquoise  { HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"    	"$1" || return 1; return 0; }
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Lang.lib
# Module        : Main
# Description   : This file provides the needed functions to parse a translations CSV file.
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TRANSLATIONS PROCESSING FUNCTIONS

## CHECKING FUNCTIONS

# Rewriting the "CheckArgsMain.lib" file's "__CheckArgsMain_PrintBadOption()" function for the initialization process, since
function CheckNotTranslated_ParseCSVLang_PrintBadOption()
{
    #***** Parameters *****
    local p_option=$1   # Test option.
    local p_advice=$2   # "HandleErrors()"'s advice argument.
    local p_argname=$3  # Name of the parameter that stores the argument.
    local p_value=$4    # "HandleErrors()"'s value argument.
    local p_funcname=$5 # Name of the function where the test failed.
    local p_lineno=$6   # Line where the test failed.

    #***** Code *****
    # If no value is passed as argument.
    if [ "$p_option" = 'z' ]; then
        ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

		HandleErrors "1" "THE $p_funcname's $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER HAS NO VALUE" \
            "$p_advice" "$p_value" "$(basename "${BASH_SOURCE[0]}")" "$p_funcname" "$p_lineno"

		return 1

    elif [ "$p_option" = '!f' ]; then
        ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

        HandleErrors "1" "THE $p_funcname's $(DechoHighlight "$(ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A VALID FILE PATH" \
            "$p_advice" "$p_value" "$(basename "${BASH_SOURCE[0]}")" "$p_funcname" "$p_lineno"

		return 1
    fi

    return 0
}

# Parsing a CSV file containing translations, when the library is not translated yet.
function CheckNotTranslated_ParseCSVLang()
{
    #***** Parameters *****
    local p_path=$1               # Path of the translations CSV file to parse.
    local p_lang=$2               # Language to fetch.
    local p_success_msg=$3        # Success message to display in the targeted language.
    local p_error_msg=$4          # Error message to display in the targeted language.

    #***** Code *****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
        if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
            __CheckArgsMain_PrintBadOption 'z' "Please pass the path of the translations CVS file to parse as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno" "$(basename "${BASH_SOURCE[0]}")" || return 1
        else
            CheckNotTranslated_ParseCSVLang_PrintBadOption 'z' "$__BU_MAIN_MSG_LANG_CheckNotTranslated_ParseCSVLang_NO_PATH" 'p_path' "$_path" "${FUNCNAME[0]}" "$lineno" || return 1
        fi
    fi

    local lineno="$LINENO"; if [ ! -f "$p_path" ]; then
        if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
            __CheckArgsMain_PrintBadOption '!f' "Please pass the valid path of the translations CVS file to parse as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno" "$(basename "${BASH_SOURCE[0]}")" || return 1
        else
            CheckNotTranslated_ParseCSVLang_PrintBadOption '!f' "$__BU_MAIN_MSG_LANG_CheckNotTranslated_ParseCSVLang_BAD_PATH" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno" || return 1
        fi
    fi

    local lineno="$LINENO"; if [ -z "$p_lang" ]; then
        if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
            __CheckArgsMain_PrintBadOption 'z' "Please pass the ISO 639-1 language's code to fetch as second argument" 'p_lang' "$p_lang" "${FUNCNAME[0]}" "$lineno" "$(basename "${BASH_SOURCE[0]}")" || return 1
        else
            CheckNotTranslated_ParseCSVLang_PrintBadOption 'z' "$__BU_MAIN_MSG_LANG_CheckNotTranslated_ParseCSVLang_NO_LANG" 'p_lang' "$p_lang" "${FUNCNAME[0]}" "$lineno" || return 1
        fi
    fi

    local lineno="$LINENO"; if [ -z "$p_success_msg" ]; then
        if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
            __CheckArgsMain_PrintBadOption 'z' "Please pass the success message of your language as third argument" 'p_success_msg' "$p_success_msg" "${FUNCNAME[0]}" "$lineno" "$(basename "${BASH_SOURCE[0]}")" || return 1
        else
            CheckNotTranslated_ParseCSVLang_PrintBadOption 'z' "$__BU_MAIN_MSG_LANG_CheckNotTranslated_ParseCSVLang_NO_SUCC_MSG" 'p_success_msg' "$p_success_msg" "${FUNCNAME[0]}" "$lineno" || return 1
        fi
    fi

    local lineno="$LINENO"; if [ -z "$p_error_msg" ]; then
        if [ "$__BU_MAIN_STAT_TRANSLATED" = 'false' ]; then
            __CheckArgsMain_PrintBadOption 'z' "Please pass the error message of your language as fourth argument" 'p_error_msg' "$p_error_msg" "${FUNCNAME[0]}" "$lineno" "$(basename "${BASH_SOURCE[0]}")" || return 1
        else
            CheckNotTranslated_ParseCSVLang_PrintBadOption 'z' "$__BU_MAIN_MSG_LANG_CheckNotTranslated_ParseCSVLang_NO_ERR_MSG" 'p_error_msg' "$p_error_msg" "${FUNCNAME[0]}" "$lineno" || return 1
        fi
    fi

    return 0
}

# -----------------------------------------------

## PARSING FUNCTIONS

# Parsing a translations CSV file.
function ParseCSVLibLang()
{
    #***** Parameters *****
    p_path=$1               # Path of the translations CSV file to parse.
    p_lang=$2               # Language to fetch.
    p_success_msg=$3        # Success message to display in the targeted language.
    p_error_msg=$4          # Error message to display in the targeted language.

    #***** Variables *****
    v_num_row=0             # Row incrementer.
    v_num_col=0             # Column incrementer.

    #***** Code *****
    # If the library is already translated and a project's translation file needs to be called,
    # then it's not recommended to call a function that prints translated text, even if it only happens because of an error.
    if [ "$__BU_MAIN_STAT_TRANSLATED" = "false" ]; then
        CheckNotTranslated_ParseCSVLang "$p_path" "$p_lang" "$p_error_msg" "$p_success_msg" || return 1

    # Else, if the library is already translated and a project's translation file needs to be called,
    # Then it's OK to call a function that prints translated text.
    else
        CheckArgsMain_ParseCSVLang "$p_path" "$p_lang" "$p_error_msg" "$p_success_msg"

        HeaderCyan "PARSING THE $(DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S $(DechoHighlight "$p_path") TRANSLATIONS CSV FILE"

        EchoNewstep "Finding the variables list"
        Newline

        # First, getting the header informations.
        while read -r line; do
            if [ "$line" = "VARIABLE" ]; then
                echo "VAR"; exit 0
            else
                ChangeSTAT_ERROR "fatal" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                HandleErrors '1' "UNABLE TO FIND THE \"VARIABLE\" OF THE $(DechoHighlight "$p_path") FILE'S FIRST COLUMN'S ROW" \
                    "Check if the \"VARIABLE\" row is located in the $(DechoHighlight "$p_path") file's first column's row, preferably in the first row."
            fi
        done < "$p_path"


        # Then, getting the CSV file's values.
#         while read line; do
            # if "$line" = '/'; then
            #   $((v_num_col++))
            # else
            # fi
#         done

#         for col_index in "${!col_values[@]}"; do
#             col_index_2=${col_values[$col_index]}
#             
#             if [ "$col_index" -eq 1 ]; then
#                 for row_index in "${!row_values[@]}"; do
#                     language_val=${row_values[$row_index]}
#                     echo "$language_val"
#                        
#                     if [ "$language_val" = "$LANG" ]; then
#                         echo "Row $row_index, LANGUE : $LANG"
#                        fi
#                 done
#             fi
#         done
    fi

    return 0
}


# Parsing the created translation file to add the arguments values of the function where the translated message's variable is called.
function _tr()
{
    #***** Parameters *****
    p_translated=$1; shift

    p_variables_array=("$@")

    #***** Code *****
    if [ ! -f "$__BU_MAIN_PROJECT_TR_FILE_NAME" ]; then
        echo -e "UNABLE TO FIND THE CREATED TRANSLATIONS FILE"; exit 1
    else
        # ALGORITHME :
        # Lire le fichier jusqu'à trouver le nom de la variable passée en argument.
        #   Si la variable n'est pas trouvée, alors retourner 1
        #   Sinon, lire chaque argument passé.
    
        return 0
    fi
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Permissions.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

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
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Terminal.lib
# Module        : Main
# Description   : Functions specially made for terminal interaction.
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### TERMINAL INTERACTION FUNCTIONS

## DISPLAYING TEXT AND MORE WHILE A TASK IS ONGOING

# Display a countdown while a task is ongoing.
function DisplayCountdown()
{
    return 0
}

# Display a progress bar while a task is ongoing.
function  DisplayProgressBar()
{
    return 0
}

# Display a spinner while a task is ongoing.
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

    EchoMsg "$__BU_MAIN_TXT_TAB $p_string"

    while [ -d "/proc/$p_pid" ]; do
        printf "%s" "\b${sp:i++%${#sp}:1}"
    done

    return 0
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Text.lib
# Module        : Main
# Description   : Functions specially made for text processing (cutting fields / characters, ).
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#### 

## 

# Cut the date displayed before a string.
function CutLogDateFromString()     { CutLastFieldFromDelimiter "$1" '] ';  return 0; }

# Cut the dash written before a command option call (to be improved).
function CutDashFromOption()        { CutLastFieldFromDelimiter "$1" '-';   return 0; }

# Cut every part of a string before and with the delimiter.
function CutFromCharacter()
{
    #***** Parameters *****
    p_target=$1         # String to process.
    # $2                # Delimiter.
    p_iterations=$3     # Iterations.

    #***** Code *****
    if [ -n "$p_iterations" ] && ! IsInt "$p_iterations"; then
        EchoWarning "$(DechoHighlight "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1'
    fi

    if [ -z "$p_iterations" ] || [ "$p_iterations" -lt 1 ]; then
        p_iterations='1'
    fi

    for ((i=0; i<p_iterations; i++)); do
        #shellcheck disable=SC2001
        p_target="$(sed "s/^[^$2]*$2//" <<< "$p_target")"
        p_target="$p_target"
    done

    echo -ne "$p_target"; return 0
}

# Cut the last field of a string.
function CutLastFieldFromDelimiter()
{
    #***** Parameters *****
    #   $1  --> string to process
    #   $2  --> delimiter

    #***** Code *****
    "$1"="${1##*$2)}"; echo -ne "$1" && return 0
}

# Cut any part of a string after a delimiter.
function CutStringAfterDelim()
{
    #***** Parameters *****
    #   $1  --> string to process
    #   $2  --> delimiter
    #   $3  --> iterations

    #***** Code *****
    return
}

# Reverse words of a string according to a delimiter.

# Examples with the '|' and '/' delimiter:
# animal | big | car | donut    --> donut | car | big | animal
# /home/user/Documents          --> Documents/user/home
function ReverseStringWordsOrder()
{
    #***** Parameters *****
    #   $1  --> string to process
    #   $2  --> delimiter

    #***** Code *****
    echo -ne "$1" | tr "$2" '\n' | tac | tr '\n' "$2" && return 0
}
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Time.lib
# Module        : Main
# Description   : 
# Author(s)     : Dimitri Obeid
# Version       : 

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

#################################### DEFINING LIBRARY FUNCTIONS ###################################

#!/usr/bin/env bash

# Detecting user's language with the "$LANG" environment variable.
function SetLibLang
{
    case "$LANG" in
        en_*)
            # English (en_*)

            # Setting the appropriate CSV file's translation's column number (from the ".Bash-utils/config/module/main/LangCSVCode.conf" file).
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_EN"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" \

                "$(ChangeSTAT_ERROR 'fatal'; HandleErrors '1' "ERROR : CANNOT FIND THE $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv") FILE" \
                "Please make sure that the file path passed as $(DechoHighlight "${FUNCNAME[0]}") function's first argument is valid" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"

                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        fr_*)
            # French | Français (fr_*)

            # Définition du numéro de colonne approprié pour la traduction du fichier CSV (depuis le fichier ".Bash-utils/config/module/main/LangCSVCode.conf").
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_FR"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$LANG" \
                "$(ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; HandleErrors '1' "ERREUR : IMPOSSIBLE DE TROUVER LE FICHIER $(DechoHighlight "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv")" \
                "Assurez-vous que le chemin du fichier passé en premier argument de la fonction $(DechoHighlight "${FUNCNAME[0]}") soit valide" "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")" \

                "Fichier de traduction trouvé : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"
            ;;
        *)
            # Else, if the detected language is not (yet) supported, the default language will be set as English.

            # Setting the appropriate CSV file's translation's column number (from the ".Bash-utils/config/module/main/LangCSVCode.conf" file).
            __BU_MAIN_LANG_CSV_CODE="$__BU_MAIN_LANG_CSV_CODE_EN"


            # As it's an important information, the "echo" command's output has to be redirected to the
            # terminal too, no matter if it was configured to be redirected only to the log project's file.

            # Backup the "$__BU_MAIN_STAT_LOG_REIDRECT" status variable's value.
            if [ "$__BU_MAIN_STAT_LOG_REIDRECT" = 'log' ]; then
                local __BU_MAIN_STAT_LOG_REIDRECT_OLD='log'
                ChangeSTAT_LOG_REDIRECT "tee" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            fi

            EchoMsg "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" "1"
            EchoMsg "The $__BU_MAIN_PROJECT_NAME library language will be set in English" "1"

            # Changing the "$LANG" environment variable's value for the mandatory arguments call.
            LANG="en_US.UTF-8"

            ParseCSVLibLang "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" \
                "$LANG" "$(ChangeSTAT_ERROR 'fatal' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"; HandleErrors '1' "ERROR : CANNOT FIND THE $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv FILE" "Please make sure that the file path passed as ${FUNCNAME[0]} function's first argument is valid" \
                "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO")"
                "Translation file found : $__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/lang.csv"

            # Setting the backupped value to the "$__BU_MAIN_STAT_LOG_REIDRECT" function.
            if [ -n "$__BU_MAIN_STAT_LOG_REIDRECT_OLD" ] && [ "$__BU_MAIN_STAT_LOG_REIDRECT_OLD" = 'log' ]; then
                __BU_MAIN_STAT_LOG_REIDRECT="$__BU_MAIN_STAT_LOG_REIDRECT_OLD"
            fi
            ;;
    esac
}

# Getting the language code to parse the , then calling the "SetLibLang", or call this function directly if this file is empty or missing.
function GetLibLang()
{
    # In case an user would like to use another language instead of the current used language in the system,
    # he can create a file named "lang.conf" in the "Bash-Utils/config" folder and write its language's
    if [ -f "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH" ] && [ -s "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH" ]; then
        LANG="$(cat "$__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH")"
        SetLibLang
    else
        SetLibLang
    fi
}
