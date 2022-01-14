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
	#**** Parameters ****
	# $1 --> Color code

	#**** Code ****
	if BU::Main::Status::CheckTextFormat; then
        if command -v tput &> /dev/null; then
            tput setaf "$1" || { echo -ne "\e[38;5;$1m" && return 0; }
                
#            if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then
 #               BU::Main::Errors::HandleSmallErrors 'E' "Unable to create the $(BU::Decho "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") file" 'E' 'CPLS'
  #          fi
            
            echo "$1" > "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH";
            [ "$?" -ne 0 ] && {
                echo -e >&2; echo -e "The $(BU::Main::Checkings::CheckFilePathExists "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") (color.tmp) file doesn't exists" >&2; echo -e >&2;

                exit 1
                
                kill "$$"

#               return 0
                }
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

## COLOR CODES FOR ENCODING (SYSTEM)
__BU_MAIN_COLOR_CODE_BLACK='0'
__BU_MAIN_COLOR_CODE_MAROON='1'
__BU_MAIN_COLOR_CODE_GREEN='2'
__BU_MAIN_COLOR_CODE_OLIVE='3'
__BU_MAIN_COLOR_CODE_NAVY='4'
__BU_MAIN_COLOR_CODE_PURPLE='5'
__BU_MAIN_COLOR_CODE_TEAL='6'
__BU_MAIN_COLOR_CODE_SILVER='7'
__BU_MAIN_COLOR_CODE_GRAY="8"
__BU_MAIN_COLOR_CODE_RED='9'
__BU_MAIN_COLOR_CODE_LIME='10'
__BU_MAIN_COLOR_CODE_YELLOW='11'
__BU_MAIN_COLOR_CODE_BLUE='12'
__BU_MAIN_COLOR_CODE_FUSCHIA='13'
__BU_MAIN_COLOR_CODE_AQUA='14'
__BU_MAIN_COLOR_CODE_WHITE='15'

# -----------------------------------------------

## COLOR CODES FOR ENCODING (OTHERS)
__BU_MAIN_COLOR_CODE_CYAN='51'
__BU_MAIN_COLOR_CODE_ORANGE='166'
__BU_MAIN_COLOR_CODE_PINK='200'
__BU_MAIN_COLOR_CODE_SALMON='209'
__BU_MAIN_COLOR_CODE_TAN='180'
__BU_MAIN_COLOR_CODE_TURQUOISE='51'
__BU_MAIN_COLOR_CODE_VIOLET='177'

# -----------------------------------------------

## COLOR CODES FOR SPECIFIC TEXT DISPLAY, PRINTED AND REDIRECTED WITH THE "CheckTextColor" FUNCTIONS, THEN ENCODED WITH THE "tput" COMMAND

# Error text display color				| Default color : Red
__BU_MAIN_COLOR_CODE_ERROR="$(CheckTextColor "$__BU_MAIN_COLOR_CODE_RED")"

# Highlighted text display color		| Default color : Cyan
__BU_MAIN_COLOR_CODE_HIGHLIGHT="$(CheckTextColor "$__BU_MAIN_COLOR_CODE_CYAN")"

# Newstep text display color            | Default color : Orange
__BU_MAIN_COLOR_NEWSTEP="$(CheckTextColor "$__BU_MAIN_COLOR_CODE_ORANGE")"

# Reset color to terminal's default text color | Always "tput sgr0"
__BU_MAIN_COLOR_CODE_RESET="$(tput sgr0)"

# Success text display color			| Default color : Green
__BU_MAIN_COLOR_CODE_SUCCESS="$(CheckTextColor "$__BU_MAIN_COLOR_CODE_GREEN")"

# Warning text display color			| Default color : Yellow
__BU_MAIN_COLOR_CODE_WARNING="$(CheckTextColor "$__BU_MAIN_COLOR_CODE_YELLOW")"

# -----------------------------------------------

## ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "CheckTextColor" FUNCTIONS

# Encodage des couleurs (codes de la commande "tput setaf") pour mieux lire les étapes de l'exécution du script.
__BU_MAIN_COLOR_AQUA="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_AQUA")"		# Aqua blue
__BU_MAIN_COLOR_BLACK="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_BLACK")"     # Black
__BU_MAIN_COLOR_BLUE="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_BLUE")"      # Deep blue

__BU_MAIN_COLOR_CYAN="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_CYAN")"      # Cyan blue
__BU_MAIN_COLOR_FUSCHIA="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_FUSCHIA")"	# Fuschia
__BU_MAIN_COLOR_GRAY="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_GRAY")"      # Gray

__BU_MAIN_COLOR_GREEN="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_GREEN")"     # Light green
__BU_MAIN_COLOR_LIME="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_LIME")"		# Lime green
__BU_MAIN_COLOR_MARRON="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_MAROON")"	# Brown

__BU_MAIN_COLOR_NAVY="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_NAVY")"		# Navy blue
__BU_MAIN_COLOR_OLIVE="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_OLIVE")"		# Green olive
__BU_MAIN_COLOR_ORANGE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_ORANGE")"   	# Orange

__BU_MAIN_COLOR_PINK="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_PINK")"      # Pink
__BU_MAIN_COLOR_PURPLE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_PURPLE")"	# Purple
__BU_MAIN_COLOR_RED="$(CheckTextColor 		"$__BU_MAIN_COLOR_CODE_RED")"	 	# Light red

__BU_MAIN_COLOR_SALMON="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_SALMON")"	# Salmon
__BU_MAIN_COLOR_SILVER="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_SILVER")"	# Silver
__BU_MAIN_COLOR_TAN="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_TAN")"		# Tan

__BU_MAIN_COLOR_TEAL="$(CheckTextColor		"$__BU_MAIN_COLOR_CODE_TEAL")"		# Teal
__BU_MAIN_COLOR_TURQUOISE="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_TURQUOISE")"	# Turquoise
__BU_MAIN_COLOR_WHITE="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_WHITE")"     # White

__BU_MAIN_COLOR_YELLOW="$(CheckTextColor 	"$__BU_MAIN_COLOR_CODE_YELLOW")"	# Light yellow
__BU_MAIN_COLOR_VIOLET="$(CheckTextColor	"$__BU_MAIN_COLOR_CODE_VIOLET")"	# Violet


# Specific colors encoding.
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
	#**** Parameters ****
	p_function=$1
	p_file=$2
	p_line=$3

	#**** Code ****
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
# in the configurations directory, and to call the "cat" command to display its value.

if [ -f "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH" ]; then
	__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH="$__BU_MODULES_UTILS_LIB_ROOT_DIR_FILE_PATH"

# Including the same file, if it was generated by the "install_and_update.sh" file when executed with root privileges
# (failsafe for the users who cannot execute this file with these privileges, if the same file than the one above exists
# and is (still) owned by the super-user or its group, which means that this file cannot be modified normally, and may not be readable).
elif [ -f "$__BU_MODULES_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH" ]; then
	__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH="$__BU_MODULES_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH"

# The possible absence of this file is managed below.
fi

# Checking if the "Bash-utils-root-val.path" file exists AND if this file contains a string (the wanted string here is the library's root folder path).
if [ -f "$__BU_MAIN_ROOT_DIR_PATH__" ] && [ -s "$__BU_MAIN_ROOT_DIR_PATH__" ]; then
	__BU_MAIN_ROOT_DIR_PATH="$(cat "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH")"

	# Checking if the library's root folder path written in this file is valid.
	if [ ! -d "$__BU_MAIN_ROOT_DIR_PATH" ]; then
		echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2

		echo "The Bash Utils library's root folder's path written in the « $__BU_MODULES_UTILS_LIB_FILE_PATH » file was not found in your hard drive." >&2; echo >&2
		echo "The currently written path is « $__BU_MAIN_ROOT_DIR_PATH »" >&2; echo >&2

		echo "Please check the path recorded in this file for typos if you typed it by yourself, or verify where you've stored this root folder." >&2; echo >&2

		echo "Aborting the library's initialization." >&2; echo >&2

		ModuleInit_AskPrintLog

		exit 1
	fi

# Checking if the "Bash-utils-root-val.path" exists AND if this file is empty (no library's path specified).
elif [ -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ] && [ ! -s "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ]; then
	echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> WARNING !" >&2; echo >&2

	echo "The Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH » exists, but is empty." >&2; echo >&2
	echo "Please write the path of the library's root folder inside this file, manually or with the installer file." >&2; echo >&2

	echo "Aborting the library's initialization." >&2; echo >&2

	ModuleInit_AskPrintLog

	exit 1

# Checking if the current user cannot read the "Bash-utils-root-val.path" (file owned by the "root" user).
elif [ -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ] && [ ! -r "$__BU_MODULES_UTILS_LIB_ROOT_DIR_FILE_PATH" ]; then
    echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2

    echo "You don't have the right to read the Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH »" >&2
    echo "It means that you've created this file with the super-user privileges, by hand or with the installation script (in this case, something may have be wrong)" >&2;  echo >&2

    echo "Please execute this script as root user, or change the ownership of the « $__BU_MAIN_ROOT_DIR_PATH » file, or create a new file, and rename the file to find in the « $__BU_MODULE_UTILS_INITALIZER_PATH » file"
    echo "If you opt for the last solution, please find the line containing the string « __BU_MODULES_UTILS_LIB_ROOT_DIR_FILE_NAME= » in the « DEFINING GLOBAL VARIABLES » subsection"; echo >&2

    echo "Aborting the installation" >&2; echo >&2

	ModuleInit_AskPrintLog

    exit 1

# Handling the absence of the "Bash-utils-root-val.path" file.
elif [ ! -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ]; then
	echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2

	echo "The Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH » doesn't exists" >&2; echo >&2
	echo "Please create this file and write the path of the library's root folder inside this file, manually or with the installer file." >&2; echo >&2

	echo "Aborting the library's initialization." >&2; echo >&2

	ModuleInit_AskPrintLog

	exit 1
fi

# Bash Utils sub-folders paths.
__BU_MAIN_MODULE_BIN_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "bin")"				# Bash Utils binary files folder            |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_CONF_DIR_PATH="$(ModuleInit_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")")"	# Bash Utils configuration files folder		|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH"
__BU_MAIN_MODULE_DOCS_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "docs")"			# Bash Utils documentation folder			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_LIB_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "lib")"				# Bash Utils library root directory	        |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_RES_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_ROOT_DIR_PATH" "res")"				# Bash Utils resources directory            |   Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"

# Bash Utils dev-tools paths.
__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_RES_DIR_PATH" "dev-tools")"			# Bash Utils development tools root directory          	|	Default parent folder --> "$__BU_MAIN_MODULE_RES_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_BIN="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-bin")"				# Bash Utils development tools binary files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_DSK="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-desktop")"			# Bash Utils development tools desktop files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_IMG="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-img")"				# Bash Utils development tools desktop icons folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_SRC="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-src")"				# Bash Utils development tools source files             |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_TRANSL="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-translations")"	# Bash Utils development tools translation files folder |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"

# "lib" folder's content.
__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "functions")"				# Bash Utils functions directory			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_LIB_MOD_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")")"			# Bash Utils library module's directory	|	Default parent folder --> "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH/"
__BU_MAIN_MODULE_LIB_LANG_DIR_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "lang")"						# Bash Utils translations files directory	|   Default parent folder --> "$__BU_MAIN_MODULE_LIB_DIR_PATH/"

# -----------------------------------------------

## BASH UTIILS FILES PATHS

# "config" folder's content.
__BU_MAIN_MODULE_CONF_COLORS_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Colors.conf")"			# Bash Utils color encoding variables configuration file.
__BU_MAIN_MODULE_CONF_INIT_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Project.conf")"			# Project's initialization variables.
__BU_MAIN_MODULE_CONF_LANG_ISO_CODE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "LangISOCode.conf")"	# Project's language code, overriding the language detection.
__BU_MAIN_MODULE_CONF_LANG_CSV_CODE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "LangCSVCode.conf")"	# Project's translation CSV file language row code
__BU_MAIN_MODULE_CONF_STATUS_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Status.conf")"			# Bash Utils status variables configuration file.
__BU_MAIN_MODULE_CONF_TEXT_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Text.conf")"				# Bash Utils text variables configuration file.
__BU_MAIN_MODULE_CONF_TIME_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Time.conf")"				# Bash Utils time variables configuration file.

# Bash Utils initializer path.
__BU_MAIN_MODULE_LIB_FILE_INITIALIZER_FILE_PATH="$(ModuleInit_FindPath "$__BU_MODULE_UTILS_MODULES_DIR" "Initializer.sh")"	# Module's initializer file.

# Bash Utils translations path.
__BU_MAIN_MODULE_TRANSLATION_FILE_PATH="$(ModuleInit_FindPath "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH" "lang.csv")"				# Bash Utils translations file.

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
    local v_cut="${__BU_MAIN_PROJECT_FILE_NAME##*./}"
    local find_path
        find_path="$(ModuleInit_FindPath "$(cd "$(printf "%s" "$__BU_MAIN_PROJECT_FILE_PATH")" ||
        { 
            echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> ERROR : UNABLE TO GET THE " >&2; echo >&2; exit 1;
        }; pwd)" "$v_cut")"

    echo "$find_path"

	exit 1
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

# Project's file path.
__BU_MAIN_PROJECT_FILE_PATH="$(GetProjectFilePath "$__BU_MAIN_PROJECT_FILE_NAME")"; echo "$__BU_MAIN_PROJECT_FILE_PATH"

# Defining the project's log file's path.
__BU_MAIN_PROJECT_LOG_DIR_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH"
__BU_MAIN_PROJECT_LOG_DIR_NAME="logs"												    # Default --> "logs"
__BU_MAIN_PROJECT_LOG_DIR_PATH="$__BU_MAIN_PROJECT_LOG_DIR_PARENT/$__BU_MAIN_PROJECT_LOG_DIR_NAME" # Default --> "$__BU_MAIN_PROJECT_TMP_DIR_PATH/$__BU_MAIN_PROJECT_LOG_DIR_NAME"

__BU_MAIN_PROJECT_LOG_FILE_PARENT="$__BU_MAIN_PROJECT_LOG_DIR_PATH"
__BU_MAIN_PROJECT_LOG_FILE_NAME="$__BU_MAIN_PROJECT_NAME.log"                                     # Default --> "$__BU_MAIN_PROJECT_NAME.log"
__BU_MAIN_PROJECT_LOG_FILE_PATH="$__BU_MAIN_PROJECT_LOG_FILE_PARENT/$__BU_MAIN_PROJECT_LOG_FILE_NAME"  # Default --> "$__BU_MAIN_PROJECT_LOG_DIR_PATH/$__BU_MAIN_PROJECT_LOG_FILE_NAME"

# Defining the project's "BU::Echo<...>()" functions debug output (to have a better view during a "bash - x" debug).
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

# Their values are checked in the "CheckSTAT.lib" file, located in the "Bash-utils/lib/functions/main" directory, with the "CheckSTAT_" functions (CV = Correct Value).


# Project's debug variable

# This variable only accepts "true" or "false" as values.
# Default value : "false"

# shellcheck disable=SC2034
__BU_MAIN_STAT_DEBUG="true"


# "BU::Main::Checkings::CheckProjectLogPath()" and other low level's functions authorization to call a "Decho<...>()" function in case of need.

# This variable only accepts "authorize", "forbid" or "restrict" as values.
# Default value : "forbid" (to avoid bugs during the program's initialization)

# shellcheck disable=SC2034
__BU_MAIN_STAT_DECHO="forbid"


# "BU::Main::Checkings::CheckProjectLogPath()" function's authorization to call an "BU::Echo<...>()" function in case of need.

# This variable only accepts "true" or "false" as values.
# Default value : "true" (to avoid bugs and infinite loops during the initialization processus)

# shellcheck disable=SC2034
__BU_MAIN_STAT_ECHO="true"


# Project's error handling

# This variable only accepts "fatal" or nothing as value.
# Default value : "fatal" (to avoid leaving bugs during the program's initialization)

# shellcheck disable=SC2034
__BU_MAIN_STAT_ERROR="fatal"


# Project's initialization status checker.

# This variable only accepts "true" or "false" as values.
# Default value : "true" (DON'T change thsi value here, since the project MUST be initialized first).

# shellcheck disable=SC2034
__BU_MAIN_STAT_INITIALIZING="true"


# Project's main log file informations

# This variable only accepts "true" or "false" as values.
# Default value : "true"

# shellcheck disable=SC2034
__BU_MAIN_STAT_LOG="true"


# Project's main log file redirections status.

# This variable only accepts "log", "tee" or nothing as value.
# Default value : "" (no value)

# shellcheck disable=SC2034
__BU_MAIN_STAT_LOG_REDIRECT=""


# Project's authorization to operate at the root directory or one of its sub-folders.

# This variable only accepts "authorized", "forbidden" or "restricted" as values.
# Default value : "forbidden" (by security, and since there's no need to change its value during the initialization, you have to change this value manually or in your code with the "BU::Main:Status::ChangeSTAT_OPERATE_ROOT()" function).

# shellcheck disable=SC2034
__BU_MAIN_STAT_OPERATE_ROOT="forbidden"


# Project initialization's messages displaying on terminal.

# This variable only accepts "true" or "false" as values.
# Default value : "false"

# shellcheck disable=SC2034
__BU_MAIN_STAT_PRINT_INIT_LOG="true"


# Project's headers messages display pause time.

# This variable only accepts any integer of floating number.
# Default value : ".6"

# shellcheck disable=SC2034
__BU_MAIN_STAT_TIME_HEADER=".6"


# Project's newlines pause time.

# This variable only accepts any integer of floating number.
# Default value ".2"

__BU_MAIN_STAT_TIME_NEWLINE=".2"


# Project's text messages display pause time.

# This variable only accepts any integer of floating number.
# Default value : ".4"

# shellcheck disable=SC2034
__BU_MAIN_STAT_TIME_TXT=".4"


# Project's text formatting handling (the "BU::Decho<...>()" functions can format the text or not).

# This variable only accepts "true" or "false" as value.
# Default value : "true" (formatting accepted)

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

# Storing a string got from a specific line (with a function like "BU::Main::Files::GetLineFromTextFile()", from "main/Files.lib" source file).
__BU_MAIN_TXT_STORE_LINE=""

__BU_MAIN_TXT_STORE_ERROR_MESSAGES_ARRAY=()

# -----------------------------------------------

## TEXT FORMATTING

# Blink
__BU_MAIN_TXT_FMT_BLINK="$(BU::Main::Status::CheckTextFormat 'blink' '5')"
__BU_MAIN_TXT_FMT_BLINK_RESET="$(BU::Main::Status::CheckTextFormat 'sgr0' '25')"

# Bold
__BU_MAIN_TXT_FMT_BOLD="$(BU::Main::Status::CheckTextFormat 'bold' '1')"
__BU_MAIN_TXT_FMT_BOLD_RESET="$(BU::Main::Status::CheckTextFormat 'rmso' '21')"

# Dim
__BU_MAIN_TXT_FMT_DIM="$(BU::Main::Status::CheckTextFormat 'dim' '2')"
__BU_MAIN_TXT_FMT_DIM_RESET="$(BU::Main::Status::CheckTextFormat '' '22')"

# Hidden (useful for password typing).
__BU_MAIN_TXT_FMT_HIDDEN="$(BU::Main::Status::CheckTextFormat '' '8')"
__BU_MAIN_TXT_FMT_HIDDEN_RESET="$(BU::Main::Status::CheckTextFormat '' '28')"

# Italic
__BU_MAIN_TXT_FMT_ITALIC="$(BU::Main::Status::CheckTextFormat 'sitm' '3')"
__BU_MAIN_TXT_FMT_ITALIC_RESET="$(BU::Main::Status::CheckTextFormat 'ritm' '23')"

# Reset
__BU_MAIN_TXT_FMT_RESET="$(BU::Main::Status::CheckTextFormat 'sgr0' '0')"

# Strikethrough
__BU_MAIN_TXT_FMT_STRIKETHROUGH="$(BU::Main::Status::CheckTextFormat '' '9')"
__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET="$(BU::Main::Status::CheckTextFormat '' '29')"

# Underline
__BU_MAIN_TXT_FMT_UNDERLINE="$(BU::Main::Status::CheckTextFormat 'smul' '4')"
__BU_MAIN_TXT_FMT_UNDERLINE_RESET="$(BU::Main::Status::CheckTextFormat 'rmul' '24')"

# -----------------------------------------------
#!/usr/bin/env bash

# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################## DEFINING VARIABLES #######################################

#### FUNCTIONS DEFINITION

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### 

## GETTING THE DATE

# Saving the current date in YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second)
__BU_MAIN_TIME_DATE="$(date +"%Y-%m-%d %Hh:%Mm:%Ss")"

# -----------------------------------------------

## PRINTING THE DATE

# Displaying the current date YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second) with a colored text (for a better view in the log file).

# Unlike the "$__BU_MODULES_UNIT_DATE_LOG" global variable, this log entry displays colors.

# Declaring the variables which contains the color codes.
v_time_conf_date_display_color_1="78"
v_time_conf_date_display_color_2="111"
v_time_conf_date_display_color_3="78"

__BU_MAIN_TIME_DATE_DISPLAY=$(printf "\e[38;5;%sm[ \e[38;5;%sm%s\e[38;5;%sm ]\e[38;5;0m" \
    "$(tput setaf "$v_time_conf_date_display_color_1")" \
    "$(tput setaf "$v_time_conf_date_display_color_2")" \
    "$__BU_MAIN_TIME_DATE" \
    "$(tput setaf "$v_time_conf_date_display_color_3")")
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : Initializer.sh
# Module        : Main
# Description   : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s)     : Dimitri Obeid
# Version       : 1.0

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!

# shellcheck disable=SC2154

# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in the "Bash-utils-init.sh" file's function "BashUtils_InitModules()"

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################### INITIALIZING THE MAIN MODULE ##################################

#### STEP ONE : DEFINING USEFUL FUNCTIONS

## DEFINING FUNCTIONS

# Add value in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array that stores the initialization log output, according to the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array AND display text to the terminal.
#   "false" --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array WITHOUT displaying any text.
function InitializerAddInitStrArrayVal()
{
    #**** Parameters ****
    p_string=$1             # String to store in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array.
    p_option=$2             # "echo" command's options.

    #**** Code ****
    if [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" = "true" ]; then
        case "$p_option" in
            '-n' | 'n')
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -ne "${p_string#* ] }"    # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
            '' | *)
                __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string"); echo -e "${p_string#* ] }"     # Cutting the log entry's date from a string, before displaying it on the terminal.
                ;;
        esac
    else
        __BU_MAIN_MODULE_STR_ARRAY_LOG_DATE+=("$p_string")
    fi
}

# -----------------------------------------------

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP TWO : SOURCING FILES

## SOURCING LIBRARY FILES FIRST

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# Sourcing each file listed into the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH" variable.

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH[@]}"; do
    source "$f" || ModuleInit_SourcingFailure "$f" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

	InitializerAddInitStrArrayVal "Successfully sourced this library file : $f"
done

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# -----------------------------------------------

## SOURCING CONFIGURATION FILES

# shellcheck disable=SC1090
for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
    source "$f" || ModuleInit_SourcingFailure "$f" "$(ModuleInit_GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f")

	InitializerAddInitStrArrayVal "Successfully sourced this configuration file : $f"
done

# Leaving a newline for a better text display in the log file and the terminal (if the "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable's value is set to "true").
InitializerAddInitStrArrayVal ""

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP THREE : PROCESSING MODULE'S PARAMETERS

# If arguments were given in the same double quotes as the "main" module's value.
if [ "$__BU_MODULE_UTILS_MODULE_ARGS" = "main --*" ]; then

	# Defining a variable that transforms the module's argument string into an array of words.
	__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY=("${__BU_MODULE_UTILS_MODULE_ARGS}")

	# Process each supported arguments in this "for" loop.
	for value in "${__BU_MAIN_INITIALIZER_MODULE_ARGS_ARRAY[@]}"; do

        stat_value_warning="$(echo "${__BU_MAIN_COLOR_WARNING}Warning : the « $value » value is incorrect.${__BU_MAIN_COLOR_RESET}" >&2; echo >&2; echo "Try these accepted values for this global status variable : ")"

        if [[ "${value[i]}" = "--stat-"* ]]; then
            # --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
            # Extracting the "--stat" option's values.
            case "${value[i],,}" in
    
                # "$__BU_MAIN_STAT_DEBUG" global status variable.
            '--stat-debug='*)
                    if      [ "${value[i],,}" = "--stat-debug=false" ]          || [ "${value[i],,}" = "--stat-debug=true" ]; then
                            __BU_MAIN_STAT_DEBUG="${value#*=}";                 ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_DEBUG" "$__BU_MAIN_STAT_DEBUG"
                    else
                        ModuleInit_Msg "$stat_value_warning « --stat-debug=false », « --stat-debug=true »"
                    fi;;

                # "$__BU_MAIN_STAT_DECHO" global status variable.
                '--stat-decho='*)
                    if      [ "${value[i],,}" = '--stat-decho=authorize' ]      || [ "${value[i],,}" = '--stat-decho=forbid' ]  || [ "${value[i],,}" = '--stat-decho=restrict' ]; then
                            __BU_MAIN_STAT_DECHO="${value#*=}";                 ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_DECHO" "$__BU_MAIN_STAT_DECHO"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-decho=authorize », « --stat-decho=forbid », « --stat-decho=restrict »"
                    fi;;

                # "$__BU_MAIN_STAT_ECHO" global status variable.
                '--stat-echo'*)
                    if      [ "${value[i],,}" = '--stat-echo=false' ]           || [ "${value[i],,}" = '--stat-echo=true' ]; then
                            __BU_MAIN_STAT_ECHO="${value#*=}";                  ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ECHO" "$__BU_MAIN_STAT_ECHO"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-echo=false », « stat-echo=true »"
                    fi;;

                # "$__BU_MAIN_STAT_ERROR" global status variable.
                'stat-error='*)
                    if      [ "${value[i],,}" = 'stat-error=fatal' ]; then
                            __BU_MAIN_STAT_ERROR="${value#*=}";                 ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ERROR" "$__BU_MAIN_STAT_ERROR"

                    elif    [ "${value[i],,}" = 'stat-error=void' ]; then
                            __BU_MAIN_STAT_ERROR='';                            ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_ERROR" "$__BU_MAIN_STAT_ERROR"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-error=fatal », « stat-error=void »"
                    fi;;

                # "$__BU_MAIN_STAT_LOG" global status variable.
                '--stat-log='*)
                    if      [ "${value[i],,}" = '--stat-log=false' ]            || [ "${value[i],,}" = '--stat-log=true' ]; then
                            __BU_MAIN_STAT_LOG="${value#*=}";                   ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG" "$__BU_MAIN_STAT_LOG"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-log=false », « stat-log=true »"
                    fi;;

                # "$__BU_MAIN_STAT_LOG_REDIRECT" global status variable.
                'stat-log-r='*)
                    if      [ "${value[i],,}" = 'stat-log-r=log' ]              || [ "${value[i],,}" = '--stat-log-r=tee' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT="${value#*=}";          ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG_REDIRECT" "$__BU_MAIN_STAT_LOG_REDIRECT"

                    elif    [ "${value[i],,}" = '--stat-log-r=void' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT='';                     ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_LOG_REDIRECT" "$__BU_MAIN_STAT_LOG_REDIRECT"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-log-r=log », « stat-log-r=tee », « --stat-log-r=void »"
                    fi;;

                # "$__BU_MAIN_STAT_OPERATE_ROOT" global status variable.
                '--stat-op-root='*)
                    if      [ "${value[i],,}" = '--stat-op-root=authorized' ]   || [ "${value[i],,}" = '--stat-op-root=forbidden' ] || [ "${value[i],,}" = '--stat-op-root=restricted' ]; then
                            __BU_MAIN_STAT_OPERATE_ROOT="${value#*=}";          ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_OPERATE_ROOT" "$__BU_MAIN_STAT_OPERATE_ROOT"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-op-root=authorized », « stat-op-root=forbidden », « --stat-op-root=restricted »"
                    fi;;

                # "$__BU_MAIN_STAT_PRINT_INIT_LOG" global status variable.
                '--stat-print-init-log='*)
                    if      [ "${value[i],,}" = '--stat-print-init-log=false' ] || [ "${value[i],,}" = '--stat-print-init-log=true' ]; then
                            __BU_MAIN_STAT_PRINT_INIT_LOG="${value#*=}";        ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_PRINT_INIT_LOG" "$__BU_MAIN_STAT_PRINT_INIT_LOG"
                    else
                            ModuleInit_Msg "$stat_value_warning --stat-print-init-log=false », « stat-print-init-log=true »"
                    fi;;

                # "$__BU_MAIN_STAT_TIME_HEADER" global status variable.
                '--stat-time-header='*)
                    if      [ "${value[i],,}" = "--stat-time-header=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_HEADER="${value[i]#*=}";        ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_HEADER" "$__BU_MAIN_STAT_TIME_HEADER"
                    else
                            ModuleInit_Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_HIGHLIGHT") »"
                    fi;;

                # "$__BU_MAIN_STAT_TIME_NEWLINE" global status variable.
                '--stat-time-newline='*)
                    if      [ "${value[i],,}" = "--stat-time-newline=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_NEWLINE="${value[i]#*=}";       ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_NEWLINE" "$__BU_MAIN_STAT_TIME_NEWLINE"
                    else
                            ModuleInit_Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_HIGHLIGHT") »"
                    fi;;

                # "$__BU_MAIN_STAT_TIME_TXT" global status variable.
                '--stat-time-txt='*)
                    if      [ "${value[i],,}" = "--stat-time-txt=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_TXT="${value[i]#*=}";           ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TIME_TXT" "$__BU_MAIN_STAT_TIME_TXT"
                    else
                            ModuleInit_Msg "$stat_value_warning « $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_HIGHLIGHT") »"
                    fi;;

                # "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                '--stat-txt-fmt'*)
                    if      [ "${value[i],,}" = '--stat-txt-fmt=false' ]        || [ "${value[i],,}" = '--stat-txt-fmt=true' ]; then
                            __BU_MAIN_STAT_TXT_FMT="${value#*=}";               ModuleInit_DisplayInitGlobalVarsInfos "__BU_MAIN_STAT_TXT_FMT" "$__BU_MAIN_STAT_TXT_FMT"
                    else
                            ModuleInit_Msg "$stat_value_warning « --stat-txt-fmt=false », « --stat-txt-fmt=true »"
                    fi;;
                *)
                            ModuleInit_Msg "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED STATUS ARGUMENT FOR THE $(ModuleInit_GetModuleName "")"
            esac
        else
            BU::Main:Status::ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

            BU::Main:Status::ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            BU::Main:Status::ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
            BU::Main:Status::ChangeSTAT_TIME_TXT     '0'         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

            # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
            BU::Main:Status::ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    done
fi


		# Else, if no "--stat" argument is passed, then the default values are set to each status global variables.
# 		else
# 			## CHANGING THE GLOBAL STATUS VARIABLE'S VALUES AFTER THE MAIN MODULE'S SUCCESSFUL INITIALIZATION.
# 
#             # Note : only some variables are changed, the other variables values are still set to their default value.
# 
# 			# TODO : After adding the status configuration arguments,
# 			if [ -f "$(ModuleInit_FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name/" "ChangeStat.conf")" ]; then
# 				echo "STAT"
# 			else
# 				BU::Main:Status::ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 
# 				BU::Main:Status::ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 				BU::Main:Status::ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 				BU::Main:Status::ChangeSTAT_TIME_TXT     '0'         "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 
#                 # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
# 				BU::Main:Status::ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
# 			fi
# 
# 		# Else, if an unsupported argument is passed.
# 	#	else
# 	#		echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-1 )) --> WARNING : THE « $value » ARGUMENT IS NOT SUPPORTED" >&2
# 		fi
# 	done




# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### STEP FOUR : PROCESSING PROJECT'S RESOURCES

## CALLING NECESSARY FUNCTIONS

# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
BU::Main::Directories::MkTmpDir

# -----------------------------------------------

## PROCESSING SOME DIRECTORIES AND FILES

# Creating the color code file if the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true".
if BU::Main::Status::CheckStatAllowFormatting; then
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then
        BU::Main::Errors::HandleErrors '1' "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") COLOR CODE FILE" "" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"; return 1
    else
        BU::EchoSuccess "The $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") color code file was successfully created in the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT")"; BU::Newline
    fi
fi

# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if BU::Main::Status::CheckStatIsLogging; then
	if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
		BU::Main::Errors::HandleErrors '1' "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") LOG FILE FOR THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"

		return 1
	else
		BU::EchoSuccess "The $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_NAME") log file was successfully created in the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")"; BU::Newline
	fi
fi

# -----------------------------------------------

# -----------------------------------------------

## END OF THE "MAIN" MODULE INITIALIZATION PROCESS


# ---------

## JUNK

# Future functionnality : translating the library.
# BU::Main::Files::SourceFile "$__BU_MAIN_MODULE_LIB_LANG_DIR_PATH/SetLibLang.sh"
# GetLibLang
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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

__BU_MAIN_CASE_INVALID_ANSWER="Please enter a valid answer ($(BU::DechoHighlight 'yes') or ($(BU::DechoHighlight 'no')) !"

__BU_MAIN_CASE_ASK_CONTINUE_EXEC="Do you want to continue the script's execution ? (yes / no)"

__BU_MAIN_CASE_ANSWER_PROMPT="Enter your answer : "

__BU_MAIN_CASE_RESUME_EXEC="Resuming the execution of the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") script."

__BU_MAIN_CASE_CANCEL_EXEC="Aborting the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'s execution."

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### READING CASE STATEMENTS BY FUNCTIONS

## "Checkings.lib" FILE

# "BU::Main::Directories::TriggerRootDirWarning" function.
function BU::Main::Case::Read_Directories::TriggerRootDirWarning()
{
    BU::EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC"

	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_TriggerRootDirWarning
	BU::EchoRead "$__read_TriggerRootDirWarning"
	BU::Newline

	# shellcheck disable=SC2154
	case "${__read_TriggerRootDirWarning,,}" in
		"yes")
            BU::EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC"

			return 0
			;;
		"no")
            BU::EchoError "$__BU_MAIN_CASE_CANCEL_EXEC"

			return 1
			;;
		*)
			BU::EchoError "$__BU_MAIN_CASE_INVALID_ANSWER"
			BU::Main::Case::Read_Directories::TriggerRootDirWarning
			;;
	esac
}

# "BU::Main::Errors::HandleErrors" function, with the "$__BU_MAIN_STAT_ECHO" variable set to "false".
function BU::Main::Case::Read_Errors::HandleErrors()
{
	BU::EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC"

	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_TriggerRootDirWarning
	BU::EchoRead "$__read_TriggerRootDirWarning"
    BU::Newline

	# shellcheck disable=SC2154
	case "${__read_BU::Main::Errors::HandleErrors,,}" in
		"yes")
			BU::EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC"

			return 0
			;;
		"no")
			BU::EchoError "$__BU_MAIN_CASE_CANCEL_EXEC"

			BU::Main::Errors::ExitError '1'
			;;
		*)
			BU::EchoError "$__BU_MAIN_CASE_INVALID_ANSWER"
			BU::Main::Case::Read_Errors::HandleErrors
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
        BU::Main::Errors::HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; return 1
    fi

	return 0
}

# -----------------------------------------------

## PATH CHECKING FUNCTIONS

# -----------------------------------------------

## QUICK MESSAGE PRINTING

# Print a message without the need to write the whole "BU::Main::Errors::HandleErrors()" function's second argument, and according to the test option which failed :
function BU::Main::CheckArgs::PrintBadOption()
{
    #**** Parameters ****
    local p_option=$1   # Test option.
    local p_advice=$2   # "BU::Main::Errors::HandleErrors()"'s advice argument.
    local p_argname=$3  # Name of the parameter that stores the argument.
    local p_value=$4    # "BU::Main::Errors::HandleErrors()"'s value argument.
    local p_funcname=$5 # Name of the function where the test failed.
    local p_lineno=$6   # Line where the test failed.

    #***** Optional parameters *****
    local p_filename="$7"

    #**** Variables ****
	# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value to "true" in case this function is called during a .
	if [ "$__BU_MAIN_STAT_ECHO" = "false" ]; then
		local v_STAT_ECHO_was_false="true"
		
		BU::Main:Status::ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
	fi

	# Since this function can be called from the "Lang.lib" file, and eventually in other library files, it's better to include a support for an appropriated file name.
	if [ -n "$p_filename" ]; then
        local v_filename="$p_filename"
	else
        local v_filename; v_filename="$(basename "${BASH_SOURCE[0]}")"
	fi

    #**** Code ****
	# If no value is passed as argument.
    if [[ "$p_option" = [Z-z] ]]; then
		BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER HAS NO VALUE" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    # Else, if the value passed as argument is not an alphabetic character.
    elif [ "${p_option,,}" = '!alphachar' ]; then
        BU::Main::Errors::HandleErrors '1' "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHABETIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not an alphabetic string.
    elif [ "${p_option,,}" = '!alphastr' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHABETIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not an alphabetic string.
    elif [ "${p_option,,}" = '!alphastrchar' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHABETIC STRING OR CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not an alphanumeric string.
    elif [ "${p_option,,}" = '!alphanumchar' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not an alphanumeric string.
    elif [ "${p_option,,}" = '!alphanumstr' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not an alphanumeric string.
    elif [ "${p_option,,}" = '!alphanumstrchar' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC STRING OR CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    # Else, if the value passed as argument is not an alphanumeric character.
    elif [ "${p_option,,}" = '!charnum' ]; then
        BU::Main::Errors::HandleErrors '1' "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

        return 1

	# Else, if the value passed as argument is not a valid directory path.
    elif [ "${p_option,,}" = '!d' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A VALID DIRECTORY PATH" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a valid file path.
    elif [ "${p_option,,}" = '!f' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A VALID FILE PATH" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a floating number.
    elif [ "${p_option,,}" = '!float' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    # Else, if the value passed as argument is not a negative floating number.
    elif [ "${p_option,,}" = '!floatneg' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A NEGATIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a positive floating number.
    elif [ "${p_option,,}" = '!floatpos' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A POSITIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not an integer.
    elif [ "${p_option,,}" = '!int' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT AN INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

	# Else, if the value passed as argument is not a negative integer.
    elif [ "${p_option,,}" = '!intneg' ]; then

        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A NEGATIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"
		return 1

	# Else, if the value passed as argument is not a positive integer.
    elif [ "${p_option,,}" = '!intpos' ]; then
        BU::Main::Errors::HandleErrors "1" "THE $p_funcname FUNCTION'S $(BU::DechoHighlight "$(BU::Main::Echo::ToLowercase "$(echo -n '$')$p_argname")") PARAMETER'S VALUE IS NOT A POSITIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$p_funcname" "$p_lineno"

		return 1

    fi

	if [ "$v_STAT_ECHO_was_false" = "true" ]; then
		BU::Main:Status::ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
	fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Checkings.lib" FILE'S FUNCTIONS

## "Checkings.lib" FILE'S FUNCTIONS - FILES PATHS CHECKING CATEGORY

# "BU::Main::Checkings::CheckProjectRelatedFile" function.
function BU::Main::CheckArgs__Checkings::CheckProjectRelatedFile()
{
	#**** Parameters ****
	local p_parent=$1
	local p_child=$2
	local p_type=$3

	#**** Code ****
	local lineno="$LINENO"; if [ -z "$p_parent" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "The function $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
			'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
	
	local lineno="$LINENO"; elif [ -z "$p_child" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "The function $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") needs a function passed as second argument to work properly" \
			'p_child' "$p_child" "${FUNCNAME[0]}" "$lineno"

		return 1

	local lineno="$LINENO"; elif [ -z "$p_type" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "The function $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") needs a function passed as third argument to work properly" \
			'p_type' "$p_type" "${FUNCNAME[0]}" "$lineno"

		return 1

	local lineno="$LINENO"; elif [ "$p_type" != 'd' ] && [ "$p_type" != 'f' ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "You need to precise if what you want to create is a directory or a file." 'p_type' "$p_type" "${FUNCNAME[0]}" "$lineno"

		return 1
	fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Directories.lib" FILE'S FUNCTION

## MAIN MODULE'S "Directories.lib" FILE'S FUNCTIONS - DIRECTORIES PROCESSING CATEGORY

# "BU::Main::ProcessingDir" function.
function BU::Main::CheckArgs__Directories::ProcessingDir()
{
    #**** Parameters ****
    local p_function=$1
    local p_parent=$2
    local p_name=$3

    #**** Code ****
    local lineno="$LINENO"; if [ -z "$p_function" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "The function $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") needs a function passed as first argument to work properly" \
            'p_function' "$p_function" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    local lineno="$LINENO"; if [ -z "$p_parent" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass a valid parent directory path as second argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    local lineno="$LINENO"; if [ -z "$p_name" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the name of the folder to process as third argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

		return 1
	fi

	return 0
}

# "BU::Main::Directories::OverwriteDir" function.
function BU::Main::CheckArgs__Directories::OverwriteDir()
{
    #***** Parameters ****
    local p_path=$1         # Path of the directory to overwrite.

    #**** Code ****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the given folder path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "BU::Main::Directories::Make" function.
function BU::Main::CheckArgs__Directories::Make()
{
    #**** Parameters ****
    local p_parent=$1       # Parent folder's path.
    local p_name=$2         # Name of the folder to create.

    #**** Code ****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z  "$p_parent" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_parent" ]; then
         BU::Main::CheckArgs::PrintBadOption '!d' "" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the folder's name is missing (no name is given).
    local lineno="$LINENO"; if [ -z "$p_name" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# -----------------------------------------------

## MAIN MODULE'S "Directories.lib" FILE'S FUNCTIONS - PATH PROCESSING CATEGORY

# "BU::Main::Directories::GetDirectoryName" function.
function BU::Main::CheckArgs__Directories::GetDirectoryName()
{
    #**** Parameters ****
    local p_path=$1         # Path of the directory to process.

    #**** Code ****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "The $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "BU::Main::Directories::GetDirectoryPath" function.
function BU::Main::CheckArgs__Directories::GetDirectoryPath()
{
    #**** Parameters ****
    local p_path=$1         # Path of the directory to process.

    #**** Code ****
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "The $(BU::Main::Text::CutFromCharacter "$(BU::DechoHighlight "${FUNCNAME[0]}")") function takes a path as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "BU::Main::Directories::GetParentDirectoryName" function.
function BU::Main::CheckArgs__Directories::GetParentDirectoryName()
{
    #**** Parameters ****
    local p_path=$1         # Path of the directory to process.

    #**** Code ****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then  BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"; return 1; fi

	return 0
}

# "BU::Main::Directories::GetParentDirectoryPath" function.
function BU::Main::CheckArgs__Directories::GetParentDirectoryPath()
{
    #**** Parameters ****
    local p_path=$1         # Path of the directory to process.

    #**** Code ****
    # If the target folder path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then  BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the path of the directory to overwrite as argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"; return 1; fi

	return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### "Lang.lib" FILE'S FUNCTIONS

## PLEASE CHECK THE "CheckNotTranslated_ParseCSVLang()" FUNCTION IN THE AFOREMENTIONED LIBRARY FILE.

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### MAIN MODULE'S "Files.lib" FILE'S FUNCTIONS

## TEXT FILE PROCESSING CATEGORY

# "BU::Main::Files::ProcessingFile" function.
function BU::Main::CheckArgs__Files::ProcessingFile()
{
    #**** Parameters ****
    local p_function=$1     # 

    #**** Code ****
    local lineno="$LINENO"; if [ -z "$p_function" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "Please pass a valid file processing function as first argument" 'p_function' "$p_function" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	return 0
}

# "BU::Main::Files::OverwriteFile" function.
function BU::Main::CheckArgs__Files::OverwriteFile()
{
    #***** Parameters ****
    local p_path=$1         	# Path of the file to overwrite.
	local p_authorization=$2	# Authorization to overwrite the file.

    #**** Code ****
    # If the target file's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the given file path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_path" ]; then
         BU::Main::CheckArgs::PrintBadOption '!d' "Please pass the correct path of the directory to overwrite as first argument" 'p_path' "$p_path" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

	local lineno="$LINENO"; if [ -z "$p_authorization" ]; then
		 BU::Main::CheckArgs::PrintBadOption 'z' "Please enter a valid value for the overwrite authorization as second argument" 'p_authorization' "$p_authorization" "${FUNCNAME[0]}" "$lineno" 

		return 1
    fi

	return 0
}

# "BU::Main::Files::Make" function's arguments.
function BU::Main::CheckArgs__Files::Make()
{
    #**** Parameters ****
    local p_parent=$1       # File to create's Parent folder path. 
    local p_name=$2         # Name of the file to create.

    #**** Code ****
    # If the parent folder's path is missing (no path is given).
    local lineno="$LINENO"; if [ -z "$p_parent" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the path of the new directory's parent folder as first argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the parent folder's path is incorrect.
    local lineno="$LINENO"; if [ ! -d "$p_parent" ]; then
         BU::Main::CheckArgs::PrintBadOption '!d' "Please pass a valid parent directory path as first argument" 'p_parent' "$p_parent" "${FUNCNAME[0]}" "$lineno"

		return 1
    fi

    # Else, if the file's name is missing (no name is given).
    local lineno="$LINENO"; if [ -z "$p_name" ]; then
         BU::Main::CheckArgs::PrintBadOption 'z' "Please pass the name of the folder to create as second argument" 'p_name' "$p_name" "${FUNCNAME[0]}" "$lineno"

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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::IsFloat()
{
    if [[ "$1" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking negative only floating value.
function BU::IsNegativeFloat()
{
    if BU::IsFloat "$1" && (( 1 < 0 )); then
        return 0
    else
        return 1
    fi
}

# Checking positive only floating value.
function BU::IsPositiveFloat()
{
    if BU::IsFloat "$1" && (( 1 >= 0 )); then
        return 0
    else
        return 1
    fi
}

# Checking integer value.
function BU::IsInt()
{
    if [[ "$1" =~ ^[\-0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Checking negative only integer value.
function BU::IsNegativeInt()
{
	if BU::IsInt "$1" && (( 1 < 0 )); then
		return 0
	else
		return 1
	fi
}

# Checking positive only integer value.
function BU::IsPositiveInt()
{
	if BU::IsInt "$1" && (( 1 >= 0 )); then
		return 0
	else
		return 1
	fi
}

# -----------------------------------------------

## STRING VALUES

# Checking if the value is an alphabetic character (not any number allowed).
function BU::IsAlphaChar()
{
	if [[ "$1" = [a-zA-Z] ]]; then
		return 0
	else
		return 1
	fi
}

# Checking if the value is an alphabetic string (not any number allowed)
function BU::IsAlphaString()
{
    if [[ "$1" = [^a-zA-Z\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if the value is an alphabetic string only (not less than two characters AND not any number allowed).
function BU::IsAlphaStringOnly()
{
	if [ "${#1}" -lt 2 ]; then
    	echo "Not a string"
	else
		if [[ "$1" = [^a-zA-Z\ ] ]]; then
			return 0
		else
    		return 1
		fi
	fi
}

# Checking if the value is a character.
function BU::IsAlphaNumChar()
{
	if [[ "$1" = [a-zA-Z0-9] ]]; then
		return 0
	else
		return 1
	fi
}

# Checking if the value is an alphanumeric string.
function BU::IsAlphaNumString()
{
    if [[ "$1" =~ [^a-zA-Z0-9\ ] ]]; then
        return 0
    else
        return 1
    fi
}

# Checking if the value is an alphabetic string only (not less than two characters).
function BU::IsAlphaNumStringOnly()
{
	if [ "${#1}" -lt 2 ]; then
    	echo "Not a string"
	else
		if [[ "$1" = [^a-zA-Z0-9\ ] ]]; then
			return 0
		else
    		return 1
		fi
	fi
}

# -----------------------------------------------

## OTHER VARIABLES CHECKINGS

# Checking if the variable is an array.
function BU::IsArray()
{
    if [[ -n ${1} ]]; then
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
#   - BU::Main::Errors::HandleErrors      --> From this file.
function BU::Main::Checkings::CheckRootEUID()
{
    if [ "$EUID" -ne 0 ]; then
        BU::Main::Errors::HandleErrors "1" "YOU NEED ROOT USER'S PRIVILEGES TO PERFORM THIS ACTION !" "Please launch your script with super-user privileges." \
            "EUID = 0" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"

        return 1
    fi
}

# -----------------------------------------------

## INITIALIZATION CHECKINGS



# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### PATHS CHECKING

## DIRECTORIES PATHS CHECKING

# Checking for an existent directory path (for the "BU::Main::Errors::HandleErrors()" function mainly).
function BU::Main::Checkings::CheckDirPathExists()
{
    #**** Parameters ****
    p_path=$1               # Path of the (in)existent directory.

    #**** Code ****
    if [ ! -f "$p_path" ]; then
        BU::DechoHighlight "<missing directory path>"   # Since this function should be called into a string, it's better to use a formatting function.
    fi
}

# Checking if a directory was successfully created.
function BU::Main::Checkings::CheckDirPathWasCreated()
{
	#**** Parameters ****
	p_path=$1

	#**** Code ****
	if [ -d "$p_path" ]; then
		return 0
	else
		return 1
	fi
}

# -----------------------------------------------

## FILES PATHS CHECKING

# Checking for an existent file path (for the "BU::Main::Errors::HandleErrors()" function mainly).
function BU::Main::Checkings::CheckFilePathExists()
{
    #**** Parameters ****
    p_path=$1               # Path of the (in)existent file.

    #**** Code ****
    if [ ! -f "$p_path" ]; then
        BU::DechoHighlight "<missing file path>"        # Since this function should be called into a string, it's better to use a formatting function.
    fi
}

# Checking if a file was successfully created.
function BU::Main::Checkings::CheckFilePathWasCreated()
{
	#**** Parameters ****
	p_path=$1

	#**** Code ****
	if [ -f "$p_path" ]; then
		return 0
	else
		return 1
	fi
}

# Checking for "$__BU_MAIN_PROJECT_LOG_FILE_PATH"

# Required functions and files :
function BU::Main::Checkings::CheckProjectLogPath()
{
    # Since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "BU::CheckProjectLogStatus()" function
    # (the only one where the "BU::Main::Checkings::CheckProjectLogPath()" function can be called), it's safe to call an "BU::Echo<...>()" function, the "BU::Main::Errors::HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
    if [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
		BU::EchoWarning "$(BU::DechoHighlight "${FUNCNAME[0]}") --> Warning : no existing log file"
		BU::EchoNewstep "Creating a log file for the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project"

		if ! BU::Main::Files::CreateProjectLogFile; then
			return 1
		else
			return 0
		fi

        # In case the "BU::Main::Errors::ExitError()" function doesn't stops the script's execution because the final user modified its behavior, it's safer to add a return value.
        BU::Main::Errors::ExitError; return 1

    # Remember : since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "BU::CheckProjectLogStatus()" function
    # (the only one where the "BU::Main::Checkings::CheckProjectLogPath()" function can be called), it's safe to call an "BU::Echo<...>()" function, the "BU::Main::Errors::HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
     elif [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
         echo "$__BU_MAIN_PROJECT_LOG_FILE_PATH"
         BU::Main::Errors::HandleErrors "1" "BAD PATH PROVIDED INTO THE $(BU::DechoHighlight "__BU_MAIN_PROJECT_LOG_FILE_PATH") VARIABLE" \
             "Please correct the path passed as argument, or redefine the variable if its value was modified somewhere" \
             "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
 
 			return 1
    else
        return 0
    fi
}

# Checking for project's log file's status, then write the wanted text with 'echo' command's parameters.

# Accepted arguments : 'nodate', '<an empty string>'
function BU::CheckProjectLogStatus()
{
    #**** Parameters ****
    local p_string=$1       # String to display.
    local p_option=$2       # "echo" command options.
    shift 2

    local pa_extraArgs=("$@")    # More processing arguments (like the processing of a whole line-long string).

    #**** Variables ****
	# WARNING : DO NOT call any "BU::Echo<...>()" function from the "main/Echo.lib" file, as they all call the "BU::CheckProjectLogStatus()" function.

	# Also, DO NOT call any "Decho<...>()" function, as they call the "BU::Main::Errors::HandleErrors()" function in case of a bad value passed as array of argument,
	# which also calls this same "BU::CheckProjectLogStatus()" function.

    # If you need to call a function here, please verify if it doesn't calls the "BU::CheckProjectLogStatus()" function,
    # nor any function called by the function you want to add, or else set the "$__BU_MAIN_STAT_ECHO" status variable value to "true" BEFORE calling the wanted function.

    local v_bu_stat_decho_old="$__BU_MAIN_STAT_DECHO"; BU::Main:Status::ChangeSTAT_DECHO "restrict" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    # Setting the "$__BU_MAIN_STAT_ECHO" status variable's value to "true", in case an error occurs during a function call, where the "BU::CheckProjectLogStatus()" function or any other function that calls it might be called.
    local v_bu_stat_echo_old="$__BU_MAIN_STAT_ECHO"; BU::Main:Status::ChangeSTAT_ECHO "true"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

    local v_redirectionError
        v_redirectionError="$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to write into the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file.\nRedirection option --> "

    local v_warning_array_value
        v_warning_array_value="$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Warning : incorrect argument given as extra argument array in $(BU::DechoHighlight "${BASH_SOURCE[0]}"), function $(BU::DechoHighlight "${FUNCNAME[0]}()").\nValue --> $(BU::DechoHighlight "$val")\nLine -->"

    #**** Code *****
    # This checking must be done before the long condition below, since it needs to know if the project's log file is present.
    if [ "$__BU_MAIN_STAT_LOG" = "true" ]; then
        BU::Main::Checkings::CheckProjectLogPath || \
        {
            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is stopped.
            BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is stopped.
			BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

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
        
            # Setting the "$__BU_MAIN_STAT_TIME_HEADER" global status variable's value to 0 seconds, since no text is displayed on the screen.
            local v_stat_time_header="$__BU_MAIN_STAT_TIME_HEADER"; BU::Main:Status::ChangeSTAT_TIME_HEADER "0"

            # Setting the "$__BU_MAIN_STAT_TIME_TXT" global status variable's value to 0 seconds, since no text is displayed on the screen.
            local v_stat_time_txt="$__BU_MAIN_STAT_TIME_TXT"; BU::Main:Status::ChangeSTAT_TIME_TXT "0"

            for val in "${pa_extraArgs[@]}"; do

                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string" 'n'
                            else
                                echo -ne "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }                            
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string"
                            else
                                echo -e "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }                            
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                            else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                            else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                            fi
                            ;;
                    esac
                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "log" option)).
                else
                    case "$p_option" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'

                                # Since the "$__BU_MAIN_STAT_ECHO" status variable's value is set to 'true', this "BU::CheckProjectLogStatus()" function won't be called, only a minimalist substitute function.
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline
							else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							fi; BU::Newline
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							fi
                            ;;
                    esac
                fi

            done

            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
            BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
			BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_TIME_HEADER" global status variable's value to the former timer.
			BU::Main:Status::ChangeSTAT_TIME_HEADER  "$v_stat_time_header"

			# Resetting the "$__BU_MAIN_STAT_TIME_TXT" global status variable's value to the former timer.
			BU::Main:Status::ChangeSTAT_TIME_TXT     "$v_stat_time_txt"
		
			return 0

        # Else, if messages must be redirected in the log file AND to the terminal ("$__BU_MAIN_STAT_LOG_REDIRECT" value is equal to "tee").
        elif [ "$__BU_MAIN_STAT_LOG_REDIRECT" = "tee" ]; then

            for val in "${pa_extraArgs[@]}"; do

                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "$p_option" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string" 'n'
                            else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$p_string"
                            else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                            fi
                            ;;
                    esac

                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "$p_option" in
                    '-n' | 'n')
                        if BU::Main::Status::CheckStatIsInitializing; then
                            InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                        else
                            echo -ne "$p_string"
                            echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                        fi
                        ;;
                    '' | *)
                        if BU::Main::Status::CheckStatIsInitializing; then
                            InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                        else
                            echo -e "$p_string"
                            echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                        fi
                        ;;
                    esac

                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "tee" option)).
                else
                    case "$p_option" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							fi; BU::Newline
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlight "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Errors::ExitError "1"; }
							fi
                            ;;
                    esac
                fi
            done
            
            sleep "$__BU_MAIN_STAT_TIME_TXT"
			
			# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
			BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
			BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
			return 0
        else
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                    else
                        echo -ne "$p_string"
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    else
                        echo -e "$p_string"
                    fi
                    ;;
            esac

        sleep "$__BU_MAIN_STAT_TIME_TXT"

        # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
        BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

		# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
		BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
		return 0

        fi

    # Else, if no log file exists OR if "$__BU_MAIN_STAT_LOG" value is "false" OR if "$__BU_MAIN_STAT_LOG_REDIRECT" has no redirection value. 
    else
        case "$p_option" in
            '-n' | 'n')
                if BU::Main::Status::CheckStatIsInitializing; then
                    InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                else
                    echo -ne "$p_string"
                fi
                ;;
            '' | *)
                if BU::Main::Status::CheckStatIsInitializing; then
                    InitializerAddInitStrArrayVal "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                else
                    echo -e "$p_string"
                fi
                ;;
        esac

        sleep "$__BU_MAIN_STAT_TIME_TXT"

        # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
        BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

		# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
		BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
		
		return 0
	fi

	# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
	BU::Main:Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
	BU::Main:Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	return 0
}

# Check project related file presence, or create this file.
function BU::Main::Checkings::CheckProjectRelatedFile()
{
	#**** Parameters ****
	local p_parent=$1   # Name of the folder to process (into its parent directory).
	local p_child=$2  	# Name of the file or folder to process (into its parent directory).
	local p_type=$3		# Type of data to create (d = directory, f = file).

	#**** Variables ****
    local v_path="$p_parent/$p_child"

	#**** Code ****
	if ! BU::Main::CheckArgs__Checkings::CheckProjectRelatedFile "$p_parent" "$p_child" "$p_type"; then exit 1; fi

	if [ "$p_type" = 'f' ]; then
		if [ -f "$v_path" ]; then
			if [ -s "$v_path" ]; then
				true > "$v_path" || { BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to overwrite this $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(BU::DechoHighlight "$(BU::Main::Checkings::CheckFilePathExists "$v_path")")" 'E'; return 1; }
			fi

			return 0
		else
			if [ ! -d "$p_parent" ]; then
                mkdir -p "$p_parent" || { BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file's parent folder --> $(BU::DechoHighlight "$(BU::Main::Checkings::CheckDirPathExists "$p_parent")")" 'E'; return 1; }

				BU::Main::Checkings::CheckDirPathWasCreated "$p_parent" || return 1
			fi

			touch "$v_path" || { BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(BU::DechoHighlight "$(BU::Main::Checkings::CheckFilePathExists "$v_path")")" 'E'; return 1; }

			BU::Main::Checkings::CheckFilePathWasCreated "$v_path" || return 1; return 0
		fi

    elif [ "$p_type" = 'd' ]; then
		if [ -d "$v_path" ]; then
			return 0
		else
			mkdir -p "$v_path" || { BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's folder --> $(BU::DechoHighlight "$(BU::Main::Checkings::CheckDirPathExists "$v_path")")" 'E'; return 1; }

			BU::Main::Checkings::CheckDirPathWasCreated "$v_path" || return 1; return 0
		fi
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### TEXT CHECKINGS

## FORMATTING CHECKINGS

# Checking if the project's color code file exists or not.

# WARNING ! DO NOT CALL ANY "Decho<...>()" FUNCTION HERE, OR THE SCRIPT WILL LOOP FOREVER !!!
function BU::Main::Checkings::CheckDecho()
{
    #**** Code ****
    # If the , then the "Decho()" function will not decorate the targeted text, but put it between 
    if [ "$__BU_MAIN_STAT_TXT_FMT" = "false" ] || [ "$__BU_MAIN_STAT_DECHO" = 'forbid' ]; then
        return 1
    else
        # Creating the "colors.tmp" file in case it doesn't exists.
        if [ ! -f "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" ]; then
            if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_NAME" "f"; then
                BU::Main::Errors::HandleSmallErrors 'E' "Unable to create the $(BU::Decho "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH") file" 'E' 'CPLS'; return 1
            fi
        fi
        
        if [ -f "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" ] && [ "$(cat "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH")" = '' ]; then
            echo "$__BU_MAIN_COLOR_RESET" > "$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH" || \
            {
                # It's better to call the "BU::EchoMsg()" function, so that its redirection and debug process wil not have to be reprogrammed.
                # It's also better to not call the "BU::Main::Errors::HandleSmallErrors()" function here, so that there won't be any problem when this function calls the "Decho<...>()" functions.
                BU::EchoMsg "${__BU_MAIN_COLOR_HIGHLIGHT}${FUNCNAME[0]}()${__BU_MAIN_COLOR_WARNING}--> Warning : Unable to write any color code into the ${__BU_MAIN_COLOR_HIGHLIGHT}$__BU_MAIN_PROJECT_COLOR_CODE_FILE_PATH${__BU_MAIN_COLOR_WARNING} file." 'R' ''

                return 1
            }

            return 0
        else
            return 0
        fi
	fi
}

# Check if the "$__BU_MAIN_STAT_ECHO" status variable's value is set to "true".
function BU::Main::Status::CheckEcho()
{
    if [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then
        return 0
    else
        return 1
    fi
}

# Checking if the "$__BU_MAIN_STAT_TXT_FMT" status value is set to "true".
function BU::Main::Status::CheckTextFormat()
{
    #**** Parameters ****
    #   $1  -> "tput" command's text formatting option.
    #   $2  -> Corresponding ANSI escape sequence (useful if the "tput" command is not detected or unavailable).

    #**** Code ****
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
        return 0
    fi
}

# -----------------------------------------------
#!/usr/bin/env bash

# ----------------------
# SCRIPT'S INFORMATIONS

# Name          : BU::Decho.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :

# ----------------------
# SHELLCHECK GLOBAL DISABLER :

# Add a coma after each warning code to disable multiple warnings at one go.

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::__Decho { local v_oldColor=$1; tput setaf "$v_oldColor" && BU::IsInt "$v_oldColor" && echo -e "$v_oldColor" > "$__BU_MAIN_FILE_COLOR_CODE_PATH"; }

# Text's inside decoration/formatting procssing.

# Featured functions and files from the "functions" folder :
#   - BU::Main::Checkings::CheckDecho
#   -
function BU::Decho()
{
    #**** Parameters ****
    local p_string=$1
    local p_newColor=$2
    shift 2

    local pa_fmtArgs
        pa_fmtArgs=$("$@")

    #**** Variables ****
    local v_oldColor

    #**** Code ****
    BU::Main::Checkings::CheckDecho

    if test "$?" -ne 0; then
        echo -ne "« $p_string »"

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
                "$(BU::IsInt "${#val}")")
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
                    # WARNING ! >>> DO NOT RESET «< the "$__BU_MAIN_STAT_TXT_FMT" variable's value >>> to "true" «<, or else the program will be stuck in an infinite loop.

                    # The function "HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_TXT_FMT" status variable's value is set to "false", the script will not call the following function indefinitely.

                    # Saving the "true" value from the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if BU::Main::Status::CheckStatAllowFormatting; then
                        local v_bu_main_stat_txt_fmt_old_val="$__BU_MAIN_STAT_TXT_FMT"

                        BU::Main::Status::ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                    fi

                    BU::Main::Errors::HandleErrors "1" "AT LEAST ONE OF THE $(DechoHighlight "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                        "Check if the value is supported in the first value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"

                    BU::Main::Status::ChangeSTAT_TXT_FMT "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                    # Restoration of the "true" value in the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if [ "$v_bu_main_stat_txt_fmt_old_val" ]; then
                        __BU_MAIN_STAT_TXT_FMT="$v_bu_main_stat_txt_fmt_old_val"
                    fi

                    return 1
                    ;;
            esac
        done

        echo -e "$p_string$p_newColor$__BU_MAIN_COLOR_RESET"

        # Resetting every formattings.
        for val in "${pa_fmtArgs[@]}"; do
            case "${val^^}" in
                "$(BU::IsInt "${#val}")")
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
                    # WARNING ! Do not reset the "$__BU_MAIN_STAT_DECHO" variable's value  to "true", or else the program will be stuck in an infinite loop.

                    # The function "BU::Main::Errors::HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_DECHO" status variable's value is set to "false", the script will not call the following function indefinitely.

                    # Saving the "true" value from the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if BU::Main::Status::CheckStatAllowFormatting; then
                        local v_bu_main_stat_txt_fmt_old_val="$__BU_MAIN_STAT_TXT_FMT"

                        BU::Main::Status::ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
                    fi

                    # shellcheck disable=SC2034
                    BU::Main:Status::ChangeSTAT_DECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

                    BU::Main::Errors::HandleErrors "1" "AT LEAST ONE OF THE $(BU::DechoHighlight "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                    "Check if the value is supported in the second value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"

                    # Restoration of the "true" value in the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if [ "$v_bu_main_stat_txt_fmt_old_val" ]; then
                        __BU_MAIN_STAT_TXT_FMT="$v_bu_main_stat_txt_fmt_old_val"
                    fi
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
# echo -e "Lorem ipsum $(BU::Decho_FMT_BlinkBoldDISU "$(BU::DechoOrange "dolor")") sit amet..."
# echo -e "Lorem ipsum $(BU::DechoOrange "$(BU::Decho_FMT_BlinkBoldDISU "dolor")") sit amet..."

# Easy "BU::BU::BU::BU::BU::BU::BU::Decho()" function calls with colors.
function BU::DechoHighlight { BU::Decho "$1" "$__BU_MAIN_COLOR_HIGHLIGHT"   || return 1; return 0; }
function BU::DechoAqua      { BU::Decho "$1" "$__BU_MAIN_COLOR_AQUA"        || return 1; return 0; }
function BU::DechoBlack     { BU::Decho "$1" "$__BU_MAIN_COLOR_BLACK"       || return 1; return 0; }
function BU::DechoBlue      { BU::Decho "$1" "$__BU_MAIN_COLOR_BLUE"        || return 1; return 0; }
function BU::DechoCyan      { BU::Decho "$1" "$__BU_MAIN_COLOR_CYAN"        || return 1; return 0; }
function BU::DechoFuschia   { BU::Decho "$1" "$__BU_MAIN_COLOR_FUSCHIA"     || return 1; return 0; }
function BU::DechoGray      { BU::Decho "$1" "$__BU_MAIN_COLOR_GRAY"        || return 1; return 0; }
function BU::DechoGreen     { BU::Decho "$1" "$__BU_MAIN_COLOR_GREEN"       || return 1; return 0; }
function BU::DechoLime      { BU::Decho "$1" "$__BU_MAIN_COLOR_LIME"        || return 1; return 0; }
function BU::DechoMaroon    { BU::Decho "$1" "$__BU_MAIN_COLOR_MAROON"      || return 1; return 0; }
function BU::DechoOrange    { BU::Decho "$1" "$__BU_MAIN_COLOR_ORANGE"      || return 1; return 0; }
function BU::DechoPink      { BU::Decho "$1" "$__BU_MAIN_COLOR_PINK"        || return 1; return 0; }
function BU::DechoPurple    { BU::Decho "$1" "$__BU_MAIN_COLOR_PURPLE"      || return 1; return 0; }
function BU::DechoRed       { BU::Decho "$1" "$__BU_MAIN_COLOR_RED"         || return 1; return 0; }
function BU::DechoSalmon    { BU::Decho "$1" "$__BU_MAIN_COLOR_SALMON"      || return 1; return 0; }
function BU::DechoSilver    { BU::Decho "$1" "$__BU_MAIN_COLOR_SILVER"      || return 1; return 0; }
function BU::DechoTan       { BU::Decho "$1" "$__BU_MAIN_COLOR_TAN"         || return 1; return 0; }
function BU::DechoTeal      { BU::Decho "$1" "$__BU_MAIN_COLOR_TEAL"        || return 1; return 0; }
function BU::DechoTurquoise { BU::Decho "$1" "$__BU_MAIN_COLOR_TURQUOISE"   || return 1; return 0; }
function BU::DechoViolet    { BU::Decho "$1" "$__BU_MAIN_COLOR_VIOLET"      || return 1; return 0; }
function BU::DechoWhite     { BU::Decho "$1" "$__BU_MAIN_COLOR_WHITE"       || return 1; return 0; }
function BU::DechoYellow    { BU::Decho "$1" "$__BU_MAIN_COLOR_YELLOW"      || return 1; return 0; }

# Tip : you can also pass a second argument when you call the following functions, which is the same than the "Decho" function's second argument
# (one of the color global variables defined in the main module's Colors.conf file, in the "ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "CheckTextColor" FUNCTIONS" sub-section).

# Positionnal parameters :
#   $1  --> String to display
#   $2  --> Color to display

# Blink formatting.
function BU::Decho_FMT_Blink            { BU::Decho "$1" "$2" 'Blink'                           || return 1; return 0; }
function BU::Decho_FMT_BlinkBold        { BU::Decho "$1" "$2" 'Blink' 'Bold'                    || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldD       { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D'                || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDI      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'I'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDIS     { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'I' 'S'        || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDISU    { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'I' 'S' 'U'    || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDIU     { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'I' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDS      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'S'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDSU     { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'S' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDU      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'D' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldI       { BU::Decho "$1" "$2" 'Blink' 'Bold' 'I'                || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldIS      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'I' 'S'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldISU     { BU::Decho "$1" "$2" 'Blink' 'Bold' 'I' 'S' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldIU      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'I' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldS       { BU::Decho "$1" "$2" 'Blink' 'Bold' 'S'                || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldSU      { BU::Decho "$1" "$2" 'Blink' 'Bold' 'S' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldU       { BU::Decho "$1" "$2" 'Blink' 'Bold' 'U'                || return 1; return 0; }
function BU::Decho_FMT_BlinkD           { BU::Decho "$1" "$2" 'Blink' 'D'                       || return 1; return 0; }
function BU::Decho_FMT_BlinkDI          { BU::Decho "$1" "$2" 'Blink' 'D' 'I'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkDIS         { BU::Decho "$1" "$2" 'Blink' 'D' 'I' 'S'               || return 1; return 0; }
function BU::Decho_FMT_BlinkDISU        { BU::Decho "$1" "$2" 'Blink' 'D' 'I' 'S' 'U'           || return 1; return 0; }
function BU::Decho_FMT_BlinkDIU         { BU::Decho "$1" "$2" 'Blink' 'D' 'I' 'U'               || return 1; return 0; }
function BU::Decho_FMT_BlinkDS          { BU::Decho "$1" "$2" 'Blink' 'D' 'S'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkDSU         { BU::Decho "$1" "$2" 'Blink' 'D' 'S' 'U'               || return 1; return 0; }
function BU::Decho_FMT_BlinkDU          { BU::Decho "$1" "$2" 'Blink' 'D' 'U'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkI           { BU::Decho "$1" "$2" 'Blink' 'I'                       || return 1; return 0; }
function BU::Decho_FMT_BlinkIS          { BU::Decho "$1" "$2" 'Blink' 'I' 'S'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkISU         { BU::Decho "$1" "$2" 'Blink' 'I' 'S' 'U'               || return 1; return 0; }
function BU::Decho_FMT_BlinkIU          { BU::Decho "$1" "$2" 'Blink' 'I' 'U'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkS           { BU::Decho "$1" "$2" 'Blink' 'S'                       || return 1; return 0; }
function BU::Decho_FMT_BlinkSU          { BU::Decho "$1" "$2" 'Blink' 'S' 'U'                   || return 1; return 0; }
function BU::Decho_FMT_BlinkU           { BU::Decho "$1" "$2" 'Blink' 'U'                       || return 1; return 0; }

# Bold formatting.
function BU::Decho_FMT_Bold     { BU::Decho "$1" "$2" 'Bold'                    || return 1; return 0; }
function BU::Decho_FMT_BoldD    { BU::Decho "$1" "$2" 'Bold' 'D'                || return 1; return 0; }
function BU::Decho_FMT_BoldDI   { BU::Decho "$1" "$2" 'Bold' 'D' 'I'            || return 1; return 0; }
function BU::Decho_FMT_BoldDIS  { BU::Decho "$1" "$2" 'Bold' 'D' 'I' 'S'        || return 1; return 0; }
function BU::Decho_FMT_BoldDISU { BU::Decho "$1" "$2" 'Bold' 'D' 'I' 'S' 'U'    || return 1; return 0; }
function BU::Decho_FMT_BoldDIU  { BU::Decho "$1" "$2" 'Bold' 'D' 'I' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BoldDS   { BU::Decho "$1" "$2" 'Bold' 'D' 'S'            || return 1; return 0; }
function BU::Decho_FMT_BoldDSU  { BU::Decho "$1" "$2" 'Bold' 'D' 'S' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BoldDU   { BU::Decho "$1" "$2" 'Bold' 'D' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BoldI    { BU::Decho "$1" "$2" 'Bold' 'I'                || return 1; return 0; }
function BU::Decho_FMT_BoldIS   { BU::Decho "$1" "$2" 'Bold' 'I' 'S'            || return 1; return 0; }
function BU::Decho_FMT_BoldISU  { BU::Decho "$1" "$2" 'Bold' 'I' 'S' 'U'        || return 1; return 0; }
function BU::Decho_FMT_BoldIU   { BU::Decho "$1" "$2" 'Bold' 'I' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BoldS    { BU::Decho "$1" "$2" 'Bold' 'S'                || return 1; return 0; }
function BU::Decho_FMT_BoldSU   { BU::Decho "$1" "$2" 'Bold' 'S' 'U'            || return 1; return 0; }
function BU::Decho_FMT_BoldU    { BU::Decho "$1" "$2" 'Bold' 'U'                || return 1; return 0; }

# Dim formatting
function BU::Decho_FMT_D    { BU::Decho "$1" "$2" 'D'               || return 1; return 0; }
function BU::Decho_FMT_DI   { BU::Decho "$1" "$2" 'D' 'I'           || return 1; return 0; }
function BU::Decho_FMT_DIS  { BU::Decho "$1" "$2" 'D' 'I' 'S'       || return 1; return 0; }
function BU::Decho_FMT_DISU { BU::Decho "$1" "$2" 'D' 'I' 'S' 'U'   || return 1; return 0; }
function BU::Decho_FMT_DIU  { BU::Decho "$1" "$2" 'D' 'I' 'U'       || return 1; return 0; }
function BU::Decho_FMT_DS   { BU::Decho "$1" "$2" 'D' 'S'           || return 1; return 0; }
function BU::Decho_FMT_DSU  { BU::Decho "$1" "$2" 'D' 'S' 'U'       || return 1; return 0; }
function BU::Decho_FMT_DU   { BU::Decho "$1" "$2" 'D' 'U'           || return 1; return 0; }

# Italic formatting.
function BU::Decho_FMT_I    { BU::Decho "$1" "$2" 'I'           || return 1; return 0; }
function BU::Decho_FMT_IS   { BU::Decho "$1" "$2" 'I' 'S'       || return 1; return 0; }
function BU::Decho_FMT_ISU  { BU::Decho "$1" "$2" 'I' 'S' 'U'   || return 1; return 0; }
function BU::Decho_FMT_IU   { BU::Decho "$1" "$2" 'I' 'U'       || return 1; return 0; }

# Strikethrough formatting.
function BU::Decho_FMT_S    { BU::Decho "$1" "$2" 'S'       || return 1; return 0; }
function BU::Decho_FMT_SU   { BU::Decho "$1" "$2" 'S' 'U'   || return 1; return 0; }

# Underline formatting.
function BU::Decho_FMT_U    { BU::Decho "$1" "$2" 'U' || return 1; return 0; }
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Directories::ProcessingDir()
{
    #**** Parameters ****
    local p_function=$1
    local p_parent=$2
    local p_name=$3
    
    #**** Variables ****
    local v_char='"'
    local v_path="$p_parent/$p_name"
    
    #**** Code ****
    # Arguments checking.
	BU::Main::CheckArgs__Directories::ProcessingDir "$p_function" "$p_parent" "$p_name"
    
	sleep "$PROJECT_STATUS_SLEEP_LINE"
    BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
    BU::EchoNewstep "Processing the $(BU::DechoHighlight "$p_name") folder in the parent folder $(BU::DechoHighlight "$p_parent")."
    BU::Newline
    
    if "$p_function"; then
        BU::EchoSuccess "End of processing the $(BU::DechoHighlight "$p_name/") folder."
		BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
		sleep "$PROJECT_STATUS_SLEEP_LINE"
		BU::Newline
    else
        BU::EchoError "End of processing the $(BU::DechoHighlight "$p_name/") folder."
		BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
		sleep "$PROJECT_STATUS_SLEEP_LINE"
		BU::Newline
    fi
}

# -----------------------------------------------

## FOLDER CREATION FUNCTIONS

# Overwriting an existing directory's content

# Featured functions and files from the "functions" folder :
#	- BU::EchoError			-> Echo.lib
#	- BU::EchoNewstep		-> Echo.lib
#	- BU::EchoSuccess		-> Echo.lib
#	- BU::Newline			-> Echo.lib
function BU::Main::Directories::OverwriteDir()
{
    #**** Parameters ****
    local p_path=$1
	local p_authorization=$2

    #**** Code ****
    # Checking first if the awaited arguments are given
    if ! BU::Main::CheckArgs__Directories::OverwriteDir "$p_path" "$p_authorization"; then return 1; fi
	
    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$p_path"

    BU::EchoNewstep "A non-empty folder with exactly the same name ($(BU::DechoHighlight "$p_name")) is already in the target folder $(BU::DechoHighlight "$p_parent/")"
	BU::EchoNewstep "Deleting the contents of the $(BU::DechoHighlight "$v_path/") folder"
	BU::Newline

	if [ "$p_authorization" = "true" ]; then
        # TODO : Si la variable n'est pas initialisée.
        if [ -n "${p_path+x}" ]; then
            # WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!

            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${v_path/:?}/"*
            BU::Main::Errors::HandleErrors "$?" "UNABLE TO DELETE THE CONTENT OF THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$v_path/")") FOLDER." \
                "Please check the permissions of the targeted directory" "$v_path" "$v_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

            BU::EchoSuccess "Deletion of the contents of the folder $(BU::DechoHighlight "$v_path/") performed successfully"
            BU::Newline

			return 0
        else
            BU::Main::Errors::HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

			return 1
        fi
	fi

    return 0
}



# Folder creation AND recursively assigning read and write rights to the user.
# When this function is called, if a log file is used in the project, the output of this function must be redirected either to the terminal AND the log file (2>&1 | tee -a "$FILE_LOG_PATH"), or to the log file only (>> "$FILE_LOG_PATH") after passing all the mandatory arguments. Otherwise, leave everything blank after passing the arguments.

# Featured functions and files from the "functions" folder :
#   - BU::Echo.sh       -> BU::EchoErrorTimer
#   - BU::Echo.sh       -> BU::EchoNewstepTimer
#   - BU::Echo.sh       -> BU::EchoSuccessTimer
#   - Headers.sh    -> BU::Main::Headers::DrawLine   
#   - Headers.sh    -> BU::Main::Errors::HandleErrors
function BU::Main::Directories::Make()
{
	#**** Parameters ****
	local p_parent=$1  # Emplacement of the currently processed directory's parent folder from the root directory.
	local p_name=$2    # Name of the folder to process (into its parent directory).

	#**** Variables ****
	local v_path="$p_parent/$p_name"	# Path of the file to process.

	#**** Code ****
	# Checking first if the awaited arguments are given
    if ! BU::Main::CheckArgs__Directories::Make "$p_parent" "$p_name"; then return 1; fi
    
    # Checking second if the script is operating at the root directory.
    if ! BU::Main::Directories::TriggerRootDirWarning "$v_path"; then return 1; fi
	
	# If the folder to create doesn't exists, ths script creates it with the help of the "mkdir" command.
	if [ ! -d "$v_path" ]; then
		BU::EchoNewstep "Creating the $(BU::DechoHighlight "$p_name") folder in the parent folder $(BU::DechoHighlight "$p_parent/")."
		BU::Newline

        mkdir -pv "$v_path"
        BU::Main::Errors::HandleErrors "$?" \
            "THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_name/")") FOLDER CANNOT BE CREATED IN THE PARENT FOLDER $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_parent/")") !" \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
        BU::EchoSuccess "The $(BU::DechoHighlight "$p_name") folder was successfully created in the $(BU::DechoHighlight "$p_parent/") folder."
        BU::Newline
        
        return 0

    # Else, if the folder to create already exists in its parent directory AND this folder already contains AT LEAST one file or folder.
	elif [ -d "$v_path" ] && [ "$(ls -A "$v_path")" ]; then
        BU::Main::Directories::OverwriteDir "$p_parent" "$p_name"
        if test "$?" -eq 0; then
            return 0
		else
            return 1
		fi

	# Else, if the folder to create already exists in its parent directory AND this folder is empty.
	elif [ -d "$v_path" ] && [ ! "$(ls -A "$v_path")" ]; then
		BU::EchoSuccess "The $(BU::DechoHighlight "$p_name/") folder already exists in the $(BU::DechoHighlight "$p_parent/") folder and is empty."
		BU::Newline

		return 0
    fi
}

# The function "CheckSTAT_LOG()" creates the log file and its path when the __BU_MAIN_STAT_LOG variable's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
function BU::Main::Directories::MkTmpDir()
{
    local lineno="$LINENO"; if [ ! -d "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ]; then
        mkdir -p "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ||
		{
			BU::Main:Status::ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
			
			BU::Main::Errors::HandleErrors "1" "THE $(BU::Main::Checkings::CheckDirPathExists "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_TMP_DIR_PATH")") CANNOT BE CREATED !" \
            "Please check at the mentionned line in the mentionned file." "$__BU_MAIN_PROJECT_TMP_DIR_PATH" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"

			BU::Main:Status::ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

			return 1
		}
    
		return 0
	fi

	return 0
}

# -----------------------------------------------

## PATH PROCESSING

# Getting the name of a target directory without its path.
function BU::Main::Directories::GetDirectoryName()
{
    #**** Parameters ****
    local p_path=$1
    
    #**** Code ****
    BU::Main::CheckArgs__Directories::GetDirectoryName "$p_path"
    
    if [ -d "$p_path" ]; then
        shopt -s extglob            # enable +(...) glob syntax

        result=${p_path%%+(/)}      # trim however many trailing slashes exist
        result=${result##*/}        # remove everything before the last / that still remains

        echo -e "$result"

		return 0
    else
        BU::Main::Errors::HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-6 ))"
		
		return 1
    fi
}

# Checking if the directory's sub-folders paths passed as argument exists, then print its path.
function BU::Main::Directories::GetDirectoryPath()
{
    #**** Parameters ****
    local p_path=$1

    #**** Code ****
    BU::Main::CheckArgs__Directories::GetDirectoryPath "$p_path"

    if [ -d "$p_path" ]; then
        echo -e "$p_path"

		return 0
    else
        BU::Main::Errors::HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Please check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"

		return 1
    fi
}

# Getting parent folder's name only (without its full path from the root directory), then printing it.
function BU::Main::Directories::GetParentDirectoryName()
{
    #**** Parameters ****
    local p_path=$1         # Path of the child file or folder.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #**** Code ****
    BU::Main::CheckArgs__Directories::GetParentDirectoryName "$p_path" "$p_iterations"

    if ! BU::IsInt "$p_iterations"; then
        BU::EchoWarning "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1'
    fi

    if [ -z "$p_iterations" ] || [ "$p_iterations" -lt 1 ]; then
        p_iterations='1'
    fi

    for ((i=0; i<p_iterations; i++)); do
        local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
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
function BU::Main::Directories::GetParentDirectoryPath()
{
    #**** Parameters ****
    local p_path=$1         # Path of the child file or folder.
    local p_iterations=$2   # Number of iterations, corresponding to the number of folders to go up in the directory tree.

    #**** Code ****
    BU::Main::CheckArgs__Directories::GetParentDirectoryPath "$p_path" "$p_iterations"

    if [ -z "$p_iterations" ] || [ "$p_iterations" -lt 1 ]; then
        p_iterations='1'
    fi

    if [ -d "$p_path" ]; then
        for ((i=0; i<p_iterations; i++)); do
            local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
                || {
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
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
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; return 1
                }; pwd -P )"
            
            local v_path_cut; v_path_cut="${v_parent##*/}"
            local v_path_str+="$v_path_cut/"

            # Removing the unnecessary folders.
            # WARNING !!!! USE THE "rmdir" COMMAND ONLY !!!!
            # DO NOT USE THE "rm -rf" COMMAND AT ALL, OR FILES AND FOLDERS COULD BE UNINTENTIONNALY ERASED !!!!
            rmdir "$v_current_path"; BU::Main::Errors::HandleErrors "$?" "UNABLE TO ERASE THE $(BU::DechoHighlight "$v_current_path") NEWLY CREATED FOLDER !"
            
            local v_current_path="$v_parent"
        done

        BU::Main::Text::ReverseStringWordsOrder "$v_path_str" '/'
    fi
}

# Check if the script is about to work at the root directory ('/').
function BU::Main::Directories::TriggerRootDirWarning()
{
	#**** Parameters ****
	p_path=$1

	#**** Code ****
	# Checking if the given path points towards the root directory or one of its subfolders
	# TODO : detecting if path points to a root sub-folder (like [ if "$p_path" = "/" ] || [ "$p_path" | cut blablabla ]).
	if [ "$(pwd "$p_path")" = "/" ] || [ "$(BU::Main::Directories::GetParentDirectoryPath "$p_path")" = '/' ]; then
		if [ "$__BU_MAIN_STAT_OPERATE_ROOT" = "forbidden" ]; then
            BU::EchoError "-------------------------------------------------"
			BU::EchoError "WARNING !!!!!! READ THIS MESSAGE CAREFULLY !!!!!!"
			BU::EchoError "-------------------------------------------------"

			BU::EchoError "The script was trying to operate at the root directory (or one of its sub directories) without authorization"
			BU::EchoError "Given path : $(BU::DechoHighlight "$p_path")"
			BU::EchoError "Authorization : $__BU_MAIN_STAT_OPERATE_ROOT"
			BU::Newline

			BU::Main::Errors::ExitError '1'; return 1

		elif [ "$__BU_MAIN_STAT_OPERATE_ROOT" = "restricted" ]; then
            BU::EchoWarning "---------------------------------------------------------------------------"
			BU::EchoWarning "WARNING !!!!!!! DO NOT SKIP THIS MESSAGE BEFORE READING IT CAREFULLY !!!!!!"
            BU::EchoWarning "---------------------------------------------------------------------------"

            BU::EchoWarning "You are about to operate at the root directory or one of its present sub-folders !"
			BU::EchoWarning "Given path : $(BU::DechoHighlight "$p_path")"
			BU::Newline

			# Calling the function that processes the given answer.
			if BU::Main::Case::Read_Directories::TriggerRootDirWarning; then
				return 0
			else
				return 1
			fi
		fi
	fi

	return 0
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function __BU::EchoVoid()
{
printf "
    
    
    
    
    
    
    
    
    
" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || 
    {
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE « $LINENO » --> WARNING --> UNABLE TO WRITE THE « ${FUNCNAME[0]} » IN THE « $__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH »" >&2; echo >&2; exit 1
    }
}

# "BU::Echo<...>()" functions debug output for a better view during a debug process.
# It's better to also execute the project's script with the "bash - x $project_name" command, instead of the "./$project_name" way.
function BU::Main::Echo::__EchoOutput()
{
	#**** Parameters ****
	local p_string=$1		# String to display.
	local p_context=$2		# Begin or end of the debug process.
	local p_type=$3			# Type of message (error 'E', newstep 'N', success 'S' or warning 'W').

	#**** Code ****
	if [ "$__BU_MAIN_STAT_DEBUG" = 'false' ]; then return 0

	elif [ "$__BU_MAIN_STAT_DEBUG" = "true" ]; then
	    # Passing the "$__BU_MAIN_STAT_ECHO" global status variable's value from "false" to "true".
        if ! BU::Main::Status::CheckStatIsBackupEchoing; then
            local v_BU_MAIN_STAT_ECHO_val="$__BU_MAIN_STAT_ECHO"; BU::Main:Status::ChangeSTAT_ECHO "true" "${BASH_SOURCE[0]}" "$LINENO"
        fi

		BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT" "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME" "f" || { BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlight "${FUNCNAME[0]}") --> Unable to create the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME") debug log file" 'E' "CPLS"; exit 1; }

        if [ "${p_context,,}" = "begin" ]; then
            __BU::EchoVoid

            if [ "${p_type^^}" = "E" ]; then
                echo -e "$(BU::HeaderError "BEGIN DEBUGGING TEXT : $p_string")"     > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type,,}" = 'm' ]; then
                echo -e "$(BU::Header "BEGIN DEBUGGING TEXT : $p_string")"          > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                echo -e "$(BU::HeaderNewstep "BEGIN DEBUGGING TEXT : $p_string")"   > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                echo -e "$(BU::HeaderSuccess "BEGIN DEBUGGING TEXT : $p_string")"   > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                echo -e "$(BU::HeaderWarning "BEGIN DEBUGGING TEXT : $p_string")"   > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            fi

            # Reassigning the "$__BU_MAIN_STAT_ECHO" global status variable's former value.
            if [ -n "$v_BU_MAIN_STAT_ECHO_val" ]; then
                __BU_MAIN_STAT_ECHO="$v_BU_MAIN_STAT_ECHO_val"; v_BU_MAIN_STAT_ECHO_val=''
            fi

            return 0

        elif [ "${p_context,,}" = "end" ]; then
            if [ "${p_type^^}" = "E" ]; then
                echo -e "$(BU::HeaderError "END DEBUGGING TEXT : $p_string")"   > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type,,}" = 'm' ]; then
                echo -e "$(BU::Header "END DEBUGGING TEXT : $p_string")"        > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                echo -e "$(BU::HeaderNewstep "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                echo -e "$(BU::HeaderSuccess "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                echo -e "$(BU::HeaderWarning "END DEBUGGING TEXT : $p_string")" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" 	|| { BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}")" 'W' ''; return 1; }
            fi

            # Reassigning the "$__BU_MAIN_STAT_ECHO" global status variable's former value.
            if [ -n "$v_BU_MAIN_STAT_ECHO_val" ]; then
                __BU_MAIN_STAT_ECHO="$v_BU_MAIN_STAT_ECHO_val"; v_BU_MAIN_STAT_ECHO_val=''
            fi

            __BU::EchoVoid; return 0
        fi
    fi
}

# Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
function BU::Main::Echo::__EchoCPLS()
{
    #**** Parameters ****
    p_string=$1
    p_option=$2

    shift 2; pa_extraArgs=("$@")

    #**** Code ****
    for val in "${pa_extraArgs[@]}"; do
        if [ "$val" = 'nodate' ]; then 
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$p_string"
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" || return 1
                    else
                        echo -e "$p_string"
                    fi
                    ;;
            esac
        elif [ -z "$val" ]; then
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" || return 1
                    else
                        echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
            esac
        else
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        InitializerAddInitStrArrayVal "$p_string" 'n' || return 1
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
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

## DISPLAYING A COLORED CONTEXT MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__BU_MAIN_STAT_TIME_TXT" STATUS VARIABLE.

# Error message

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoError()
{
    #**** Parameters ****
    local p_string=$1
    local p_option=$2; shift 2

    local pa_extraArgs=("$@")

    #**** Code ****
    if ! BU::Main::Status::CheckEcho; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'E' || return 1
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'E' || return 1

    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'E' || return 1
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'E' || return 1
    fi

    return 0
}

# Normal message (without any extra color), with redirection checking.

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoMsg()
{
    #**** Parameters ****
    local p_string=$1
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #**** Code ****
    if ! BU::Main::Status::CheckEcho; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'm' || return 1
        BU::CheckProjectLogStatus "$p_string" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'm' || return 1

    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'm' || return 1
        BU::Main::Echo::__EchoCPLS "$p_string" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'm' || return 1
    fi

    return 0
}

# New sub-step message

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoNewstep()
{
    #**** Parameters ****
    local p_string=$1
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #**** Code ****
    if ! BU::Main::Status::CheckEcho; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'N' || return 1
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'N' || return 1

    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'N' || return 1
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'N' || return 1
    fi

    return 0
}

# Read input values

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#	- BU::CheckProjectLogStatus		--> Checkings.lib
function BU::EchoRead()
{
	#**** Parameters ****
	local p_string=$1      # User's keyboard input.
	
	#**** Code ****
	if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ] && [ "$__BU_MAIN_STAT_LOG" = "true" ] && [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ]; then
		echo -e "Keyboard input value : $(BU::DechoHighlight "$p_string")" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Main::Errors::HandleSmallErrors '' "" '' ""; return 1; }
	fi; return 0
}

# Success message

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoSuccess()
{
    #**** Parameters ****
    local p_string=$1
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #**** Code ****
    if ! BU::Main::Status::CheckEcho; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'S' || return 1
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'S' || return 1

    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'S' || return 1
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'S' || return 1
    fi

    return 0
}

# Warning message

# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoWarning()
{
    #**** Parameters ****
    local p_string=$1
    local p_option=$2;
    shift 2

    local pa_extraArgs=("$@")

    #**** Code ****
    if ! BU::Main::Status::CheckEcho; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'W' || return 1
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'W' || return 1

    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'W' || return 1
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'W' || return 1
    fi

    return 0
}

# -----------------------------------------------

## DISPLAYING A COLORED MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__BU_MAIN_STAT_TIME_TXT" STATUS VARIABLE.

# Note : These function call the "BU::EchoMsg()" function in order to avoid rewriting tons of lines that would do the same thing.

# Aqua blue colored message.
function BU::EchoAqua()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_AQUA}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Black colored message.
function BU::EchoBlack()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_BLACK}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Blue colored message.
function BU::EchoBlue()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_BLUE}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Cyan colored message.
function BU::EchoCyan()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_CYAN}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Fuschia colored message.
function BU::EchoFuschia()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_FUSCHIA}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Gray colored message.
function BU::EchoGray()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_GRAY}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Green colored message.
function BU::EchoGreen()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_GREEN}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Lime green colored message.
function BU::EchoLime()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_LIME}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Maroon blue colored message.
function BU::EchoMaroon()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_MAROON}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Orange colored message.
function BU::EchoOrange()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_ORANGE}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Pink colored message.
function BU::EchoPink()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_PINK}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Purple colored message.
function BU::EchoPurple()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_PURPLE}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Red colored message.
function BU::EchoRed()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_RED}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Salmon colored message.
function BU::EchoSalmon()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_SALMON}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Silver colored message.
function BU::EchoSilver()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_SILVER}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Tan colored message.
function BU::EchoTan()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TAN}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Teal colored message.
function BU::EchoTeal()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TEAL}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Turquoise colored message.
function BU::EchoTurquoise()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TURQUOISE}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Violet colored message.
function BU::EchoViolet()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_VIOLET}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# White colored message.
function BU::EchoWhite()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_WHITE}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# Yellow colored message.
function BU::EchoYellow()
{
    #**** Parameters ****
    p_string=$1; p_msg=$2; shift 2; local pa_extraArgs=("$@")

    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_YELLOW}$p_string${__BU_MAIN_COLOR_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1

    return 0
}

# -----------------------------------------------

## TEXT FORMATTING

# Keep the same text format between lowercased or uppercased text printed by a formatting text function ("BU::Main::Echo::ToLowercase()" OR "BU::Main::Echo::ToUppercase()") or a parameter expansion.
# This function is planned to be used between force-uppered/lowered text, to keep the original text formatting of the wanted string excerpt.
function BU::Main::Echo::KeepFormatting()
{
	#**** Parameters ****
	p_string=$1            # String to display.
	p_old_formatting=$2    # Former tectxt formatting.

	#**** Code ****
# 	echo -ne &>/dev/null; echo -ne "$p_string"
# 
# 	if [ "${p_old_formatting,,}" = 'l' ]; then
#         echo -ne "$(BU::Main::Echo::ToLowercase "$p_string")"
# 	elif [ "${p_old_formatting^^}" = 'U' ]; then
#         echo -ne "$(BU::Main::Echo::ToUppercase "$p_string")"
# 	else
#         echo -ne "<<|| No reformatting precised in the $(BU::Main::Echo::ToLowercase "${FUNCNAME[0]}()") function ||>>"
# 	fi

	return 0
}

# Print a lowercased text.

# Usage :
#	BU::Main::Echo::ToLowercase "<Text to write>"
function BU::Main::Echo::ToLowercase()
{
	#**** Parameters ****
	p_string=$1

	#**** Code ****
	echo -e "$p_string" | tr '[:upper:]' '[:lower:]'; return 0
}

# Print an uppercased text.

# Usage :
#	BU::Main::Echo::ToUppercase "<Text to write>"
function BU::Main::Echo::ToUppercase()
{
	#**** Parameters ****
	p_string=$1

	#**** Code ****
	echo -e "$p_string" | tr '[:lower:]' '[:upper:]'; return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### LINE BREAKS

## LINE BREAKS ACCORDING TO THE "$MAIN_SCRIPT_LOG" VARIABLE VALUE

# Redirecting the output of the "echo" command

# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
#	- BU::Main::Errors::HandleErrors				--> Checkings.lib
function BU::Newline()
{
    #**** Parameters ****
    local number=$1

    #**** Code ****

    if [ -n "$number" ]; then
        if ! BU::IsInt "$number"; then
            BU::EchoMsg "" "" "nodate"
            BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Warning : the number of line breaks must be an integer" 'R'
            BU::EchoMsg "" "" "nodate"
        else
            # Doing X line breaks according to the number passed as argument.
            for ((i=0; i<number; i++)); do
                BU::EchoMsg "" "" "nodate"
            done
        fi
    else
        BU::EchoMsg "" "" "nodate"
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::Errors::HandleSmallErrors()
{
    #**** Parameters ****
    local p_type=$1         # Type of message to display ('E' = BU::EchoError; 'W' = BU::EchoWarning)
    local p_string=$2       # String to display.
    local p_return=$3       # Exit or return status ('E' = exit; 'R' = return).
    local p_cpls=$4         # Enable the safe text printing mode.

    #**** Variables ****
    local v_advise="Please don't forget to pass a type of message to display as first argument ('E' = BU::EchoError; 'W' = BU::EchoWarning)"

    if [ "${p_cpls^^}" = 'CPLS' ]; then
        if [ "$__BU_MAIN_STAT_ECHO" = 'false' ]; then
            local v_BU_STAT_ECHO_old="$__BU_MAIN_STAT_ECHO"; BU::Main:Status::ChangeSTAT_ECHO 'true' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi

    #**** Code ****
    BU::Newline >&2;

    if      [ "$p_type" = 'E' ];    then BU::EchoError      "$p_string" '' ''
    elif    [ "$p_type" = 'W' ];    then BU::EchoWarning    "$p_string" '' ''

    # If no type of message to displays is passed as first argument, the script will choose between one of the accepted types.
    else
        if [ "$(( RANDOM%2 ))" = "0" ]; then
            BU::EchoError "$p_string    | ${__BU_MAIN_COLOR_RESET}$v_advise" '' ''
        else
            BU::EchoWarning "$p_string  | ${__BU_MAIN_COLOR_RESET}$v_advise" '' ''
        fi
    fi

    BU::Newline >&2

    # As the "BU::EchoWarning()" function will be called in case of a missing return or exit code (normally passed as second argument),
    # it's better to reset the value of the "$__BU_MAIN_STAT_ECHO" status variable condition per condition.
    if [ "${p_return^^}" = 'R' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi

        return 1

    elif [ "${p_return^^}" = 'E' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi

        BU::Main::Errors::ExitError '1'

    else 
        BU::EchoWarning "${__BU_MAIN_COLOR_HIGHLIGHT}${FUNCNAME[0]}${__BU_MAIN_COLOR_WARNING} --> Warning : bad exit or return code given as second argument !"; BU::Main::Errors::ExitError '1'
    fi

    if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi

}

# -----------------------------------------------

## EXIT HANDLING

# Handling exit command from sourced files, as it's impossible to properly exit the script from these.
function BU::Main::Errors::ExitError()
{
    if [[ "$1" =~ [0-9] ]]; then
        exit "$1"; kill "$$"
    else
        BU::EchoWarning "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Warning : unexpected exit code passed as argument."

        kill "$$"
    fi
}

# -----------------------------------------------

## SCRIPT'S ERRORS HANDLING

# "BU::Main::Errors::HandleErrors()" function --> Handling file name presence.
function BU::Main::Errors::HandleErrors_File()        { if [ -z "$1" ]; then BU::DechoHighlight "<no specified file>"; else BU::DechoHighlight "$1"; fi; }

# "BU::Main::Errors::HandleErrors()" function --> Handling function name presence.
function BU::Main::Errors::HandleErrors_Function()    { if [ -z "$1" ]; then BU::DechoHighlight "<no specified function>"; else BU::DechoHighlight "$1"; fi; }

# "BU::Main::Errors::HandleErrors()" function --> Handling line number presence.
function BU::Main::Errors::HandleErrors_Line()        { if [ -z "$1" ]; then BU::DechoHighlight "<no specified line>"; else BU::DechoHighlight "$1"; fi; }

# Handling command outputs.
# Featured functions and files from the "basis" category :
#   - 
function BU::Main::Errors::HandleErrors()
{
	#**** Parameters ****
	local p_returnCode=$1      # Return code of the last command executed. If you didn't launched any command before calling this function, you can pass any number different of '0' as first argument.
	local p_errorString=$2     # String of the type of error to display.
	local p_adviceString=$3    # String of characters displaying a tip to direct the user to the best solution to apply in case of a problem.
    local p_badValue=$4        # Incorrect value which caused the error.
	local p_file=$5            # The name of the file where the error occured.
	local p_function=$6        # The name of the function where the error occured.
	local p_lineno=$7          # Line on which the error message occured (obtained in a very simple way by calling the POSIX environment variable "$LINENO").

    #**** Variables ****
    if BU::Main::Status::CheckStatIsInitializing && ! BU::Main::Status::CheckStatIsPrintingInit; then
        local v_stat_print_init_log_old='false'; BU::Main:Status::ChangeSTAT_PRINT_INIT_LOG 'true' "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
    fi

    if BU::Main::Status::CheckStatIsTranslated; then
        local v_hdrString;
            v_hdrString="$(echo -ne "$__BU_MAIN_MSG_ERRORS_BU::Main::Errors::HandleErrors_HDR_STRING")"
    else
        local v_hdrString;
            v_hdrString="$(echo -ne "IN $(BU::Main::Errors::HandleErrors_File "$p_file") FILE, FUNCTION $(BU::Main::Errors::HandleErrors_Function "$p_function"), LINE $(BU::Main::Errors::HandleErrors_Line "$p_lineno") -->")"
    fi

	# ***** Code *****
	CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

	if [ "$p_returnCode" -eq 0 ]; then
        return 0
    else
        # -------- PART 1 : MANAGING THE CALL OF THIS "BU::Main::Errors::HandleErrors()" FUNCTION IF THIS "BU::Main::Errors::HandleErrors()" FUNCTION IS CALLED IN A FUNCTION CALLED BY THIS "BU::Main::Errors::HandleErrors()" FUNCTION

        # If the function needs to be called in the "BU::CheckProjectLogStatus()" function, then
        # this status variable's value MUST be set at "true", or else the script will loop forever.

        # WARNING : DO NOT call a text formatting function to format something else than the text color, or else the script will loop forever.

        if [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then

            # Drawing an extra line to differenciate the message below from the rest of the error messages.
            BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_PRINT_HEADER_LINE")" '' 'nodate'

            if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
                if [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ]; then
                    BU::EchoError "A FATAL ERROR OCCURED DURING A TEST IN THE $(BU::DechoHighlight "BU::CheckProjectLogStatus") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !"
                else
                    BU::EchoError "A FATAL ERROR OCCURED DURING THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S PROJECT INITIALIZATION"
                fi
            else
                if [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ]; then
                    BU::EchoError "AN ERROR OCCURED DURING A TEST IN THE $(BU::DechoHighlight "BU::CheckProjectLogStatus") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !"
                else
                    BU::EchoError "AN ERROR OCCURED DURING THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S PROJECT INITIALIZATION"
                fi
            fi
        fi


        # -------- PART 2 : PRINTING THE HEADER

        # Redirecting the log messages to the terminal, to show them to the user. 
        if [ "$__BU_MAIN_STAT_LOG_REDIRECT" = "log" ]; then
            local v_log_old="true"; __BU_MAIN_STAT_LOG_REDIRECT="tee"; BU::Main::Status::CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi

        if [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
            HeaderRed "$v_hdrString FATAL ERROR : $p_errorString" >&2
        else
            HeaderRed "$v_hdrString ERROR : $p_errorString" >&2
        fi


        # -------- PART 3 : GIVING AN ADVICE ABOUT THE ORIGIN OF THE ERROR TO THE USER/DEVELOPPER

        if [ -z "$p_adviceString" ]; then
            BU::EchoError "No advice to give."; BU::Newline >&2
        else
            BU::EchoError "$(BU::DechoHighlight "Advice") : $p_adviceString" >&2
        fi

        if [ -z "$p_badValue" ]; then
            BU::EchoError "Value(s) that caused this error : $(BU::DechoOrange 'no value') OR $(BU::DechoOrange 'an unknown error')"; BU::Newline >&2
        else
            BU::EchoError "Value(s) that caused this error : $(BU::DechoHighlight "$p_badValue")"; BU::Newline >&2
        fi

        if [ "$__BU_MAIN_STAT_ERROR" = "fatal" ]; then
            BU::EchoError "Stopping the execution of $(BU::DechoHighlight "$(basename "$0")")."; BU::Newline >&2
            BU::Main::Errors::ExitError "1"
        else
            # Calling the function that processes the given answer.
            BU::Main::Case::Read_Errors::HandleErrors
        fi

        # -------- PART 4 : WRITING THE ERROR REPORT IN THE PROJECT'S LOG FILE IN CASE THE "$__BU_MAIN_STAT_ECHO" VARIABLE IS SET TO TRUE (SAFE MODE IF THE WRITING FUNCTIONS ARE CALLED FROM THE "BU::CheckProjectLogStatus()" FUNCTION).

        if [ "$__BU_MAIN_STAT_ECHO" = "true" ] && [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
            BU::EchoWarning "" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ||
            {
                BU::Main::Errors::HandleSmallErrors "Unable to write in the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") projectlog file from the $(BU::DechoHighlight "${FUNCNAME[0]}()") function" 'R' 'CPLS'
            }
        fi

        if [ "$v_log_old" = "true" ]; then
            __BU_MAIN_STAT_LOG_REDIRECT="log"; BU::Main::Status::CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
        fi
    fi

    if BU::Main::Status::CheckStatIsInitializing && [ "$v_stat_print_init_log_old" = 'false' ]; then
        __BU_MAIN_STAT_PRINT_INIT_LOG="$v_stat_print_init_log_old"; v_stat_print_init_log_old=''    # Reassigning the "$v_stat_print_init_log_old" variable to an empty value.
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::Files::__ProcessingFile()
{
    #**** Parameters ****
    p_output=$1
    p_name=$2
    p_char=$3

    #**** Code ****
    if [ "$p_output" = 'E' ]; then
        BU::EchoError "End of processing the $(BU::DechoHighlight "$p_name") file"
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
        BU::Newline

        sleep "$__BU_MAIN_STAT_TIME_TXT"

    elif [ "$p_output" = 'S' ]; then
        BU::EchoSuccess "End of processing the $(BU::DechoS "$p_name") file"
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$p_char")" '-n' 'nodate'
        BU::Newline

        sleep "$__BU_MAIN_STAT_TIME_TXT"
    else
        BU::EchoWarning ""
    fi
}

# Separate processing steps displays from the rest of the main script between two horizontal lines.

# Featured functions and files from the "functions" folder :
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Files::ProcessingFile()
{
    #**** Parameters ****
    local p_function=$1; shift
    local p_name=$2
    local arr; arr=$("$@")

    #**** Variables ****
    local v_char="'"

    #**** Code ****
    # Arguments checking.
    BU::Main::CheckArgs__Files::ProcessingFile "$p_function"

	sleep "$__BU_MAIN_STAT_TIME_TXT"
    BU::EchoMsg "$(BU::Main::Headers::DrawLine "$__COL_RESET" "$v_char")" '-n' 'nodate'
    BU::EchoNewstep "Processing the $(BU::DechoHighlight "$p_name") file in the $(BU::DechoHighlight "$p_parent") parent directory."
    BU::Newline

    case "$p_function" in
        'BU::Main::Files::Make')
            if BU::Main::Files::Make "${arr[@]}"; then
                BU::Main::Files::__ProcessingFile 'S' "$p_name" "$p_char"
            else
                BU::Main::Files::__ProcessingFile 'E' "$p_name" "$p_char"
            fi
            ;;
        'OverwriteFile')
            if BU::Main::Files::OverwriteFile "$arr"; then
                BU::Main::Files::__ProcessingFile 'S' "$p_name" "$p_char"
            else
                BU::Main::Files::__ProcessingFile 'E' "$p_name" "$p_char"
            fi
            ;;
    esac
}

## OVERWRITING CONTENT

# Overwrite a file

# Featured functions and files from the "functions" folder :
#	- BU::EchoError			-> Echo.lib
#	- BU::EchoNewstep		-> Echo.lib
#	- BU::EchoSuccess		-> Echo.lib
#	- BU::Newline			-> Echo.lib
function BU::Main::Files::OverwriteFile()
{
    #**** Parameters ****
    local p_path=$1
	local p_authorization=$2

    #**** Code ****
    # Checking first if the awaited arguments are given
    BU::Main::CheckArgs__Files::OverwriteFile

    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$p_path"

    if [ "$p_authorization" = "true" ]; then
		BU::EchoNewstep "The $(BU::DechoHighlight "$p_path/") file already exists and is not empty."
		BU::EchoNewstep "Overwriting data from file $(BU::DechoHighlight "$p_path/")"
		BU::Newline

		true > "$p_path"
		BU::Main::Errors::HandleErrors "$?" "THE CONTENT OF THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_path/")") FILE HAD NOT BEEN OVERWRITTEN" "" "$p_path" \
			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
		BU::EchoSuccess "The content of the $(BU::DechoS "$p_path/") file has been successfully overwritten"
		BU::Newline
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
#   - BU::Main::Headers::DrawLine          -> Headers.lib
#   - BU::EchoError         -> Echo.lib
#   - BU::EchoNewstep       -> Echo.lib
#   - BU::EchoSuccess       -> Echo.lib
#   - BU::Main::Errors::HandleErrors      -> Handles.lib
function BU::Main::Files::Make()
{
	#**** Parameters ****
	local p_parent=$1      # Emplacement of the currently processed file's parent folder from the root directory.
	local p_name=$2        # Name of the file to process (into its parent directory).

	#**** Variables ****
	local v_path="$p_parent/$p_name"	# Path of the file to process.

	#**** Code ****
	# Checking first if the awaited arguments are given
    BU::Main::CheckArgs__Files::Make "$p_parent" "$p_name"

    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$v_path"

	# If the file to create doesn't exists, ths script creates it with the help of the "touch" command.
	if [ ! -f "$v_path" ]; then
        BU::EchoNewstep "Creating the $(BU::DechoHighlight "$p_name") file in the parent folder $(BU::DechoHighlight "$p_parent/")."

		touch "$v_path"; BU::Main::Checkings::CheckFilePathWasCreated "$v_path"

		# Testing if the file has been created by checking the return code of the "BU::Main::Checkings::CheckFilePathWasCreated" function via the "BU::Main::Errors::HandleErrors" function.
        # An error may come from the fact that the user did not run the script in superuser mode, a script that tried to create a file in a folder
		# where the user is not allowed to create a file without superuser privileges.

		BU::Main::Errors::HandleErrors "$?" "THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_name")") FILE CANNOT BE CREATED IN THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_parent/")") PARENT FOLDER." \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))"

		BU::EchoSuccess "The $(BU::DechoS "$p_name") file was successfully created in the $(BU::DechoS "$p_parent") folder."
        BU::Newline

        return 0

	# Else, if the file to be created already exists AND it is NOT empty.
	elif [ -f "$p_path" ] && [ -s "$p_path" ]; then
        if BU::Main::Files::OverwriteFile "$p_path"; then
            return 0
        else
            return 1
        fi

	# Else, if the file to be created already exists AND it is empty.
	elif [ -f "$p_path" ] && [ ! -s "$p_path" ]; then
		BU::EchoSuccess "The $(BU::DechoS "$p_path/") file already exists in the $(BU::DechoS "$p_parent/") folder and is empty."
		BU::Newline

		return 0
	fi
}

# Create a file directly in the computer's memory to redirect the informations that are often updated instead of using the hard drive.
# This method is safer for SSD drives, faster for HDD drives, and no permissions are needed.
function BU::Main::Files::CreateFileInMemory()
{
    #**** Parameters ****
    p_filename=$1

    #**** Code ****


    return 0
}

# Creating the project's log file.
function BU::Main::Files::CreateProjectLogFile()
{
    #**** Variables ****
    local v_terminfo_v; v_terminfo_v="$($(ps -p "$(ps -p "$$" -o ppid=)" o args=) -v)"

    #**** Code ****
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" 'f'; then BU::EchoError "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S LOG FILE"; BU::Main::Errors::ExitError '1'; fi

    BU::EchoSuccess "Successfully created the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file."

	if [ "$__BU_MAIN_STAT_DECHO" = 'true' ]; then	BU::Main:Status::ChangeSTAT_DECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";	fi
    if [ "$__BU_MAIN_STAT_ECHO"  = 'true' ]; then	BU::Main:Status::ChangeSTAT_ECHO  "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";	fi

    # Redirecting the initializer's log file content into the log file.
    BU::HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT"

    BU::EchoNewstep "Sourced configuration files :"; for val in "${__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY[@]}"; do BU::EchoMsg "$val"; done; BU::Newline
    BU::EchoNewstep "Sourced library files : "; for val in "${__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY[@]}"; do BU::EchoMsg "$val"; done; BU::Newline

	if (( "${#__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE[@]}" >= 1 )); then
		BU::EchoNewstep "Initialization log output :"; BU::Newline

        for val in "${__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE[@]}"; do
            BU::CheckProjectLogStatus "$(CutDateFromString "$val")"
        done
    fi

    # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Unix-like operating system.
    BU::HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM"

	# Getting operating system name.
	BU::EchoNewstep "Operating system name : $(awk -F= '/^NAME/{print $2}' /etc/os-release)"
	BU::Newline

    # Getting operating system family.
    BU::EchoNewstep "Operating system family : $(BU::DechoHighlight "$OSTYPE")"
    BU::Newline

    # Gathering OS informations from the "/etc/os-release" file.
    BU::EchoNewstep "Operating system general informations :"
    if [ -f "/etc/os-release" ]; then BU::EchoMsg "$(cat "/etc/os-release")" "" "nodate"; else BU::EchoMsg 'No available informations ("/etc/os-release" file not found)'; fi
    BU::Newline

	# Getting operating system extra informations (Windows Subsystem for Linux, etc...).
	BU::EchoNewstep "Operating system extra informations :"
	if [[ "$(< /proc/sys/kernel/osrelease)" == *[M-m]icrosoft* ]]; then BU::EchoMsg "Distro running on Windows Subsystem for Linux : $(awk -F= '/^NAME/{print $2}' /etc/os-release)"; fi
	BU::Newline

	# Getting Bash language's version.
    BU::EchoNewstep "Bash version : $(BU::DechoHighlight "$BASH_VERSION")"
    BU::Newline

	# Getting terminal emulator's name and version.
	# shellcheck disable=SC2016
    BU::EchoNewstep "Terminal (emulator) version : $(BU::DechoHighlight "$v_terminfo_v")" || BU::EchoWarning "$(BU::DechoHighlight '$v_terminfo_v') : bad command call."
    BU::Newline

    BU::EchoSuccess "Successfully got the user's system's informations."
}

# -----------------------------------------------

## FILE SOURCING

# Sourcing dependencies files.
function BU::Main::Files::SourceFile()
{
    #**** Parameters ****
    local p_path=$1

    #**** Code ****
    if [ -f "$p_path" ]; then
        # shellcheck disable=SC1090
        if source "$p_path"; then
            BU::EchoSuccess "Sourced file : $(BU::DechoHighlight "$p_path")"
        else
            BU::Main::Errors::HandleErrors "1" "UNABLE TO SOURCE THIS FILE ! $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_path")")" "Please verify that the filepath passed as argument exists." "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))"
        fi
    else
        BU::Main::Errors::HandleErrors "1" "UNABLE TO FIND THIS FILE : $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlight "$p_path")")" "Please pass a filepath as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))"
    fi
}

# -----------------------------------------------

## TEXT FILES PARSING

# Getting a specific line from a text file.
function BU::Main::Files::GetLineFromTextFile()
{
    #**** Parameters ****
    local p_source=$1           # File to parse
    local p_wanted_line=$2      # Line to get in the file

    #**** Variables ****
    local i=0                   # Line incrementer

    #**** Code ****
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
function BU::Main::Files::Compress()
{
    #**** Parameters ****
#     local cmd=$1      # Compression command.
#     local opts=$2     # Options of the compression command.
#     local p_path=$3     # Path to the file/folder to archivate.
#     local p_name=$4     # Archive's name (only used into displayed messages).

    #**** Code ****


    return 0
}

# Uncompressing archives according to the used compression method.

# Featured functions and files from the "functions" folder :
#   - BU::Main::Errors::HandleErrors      -> Handles.lib
#   - BU::EchoSuccess       -> Echo.lib
#   - BU::Newline           -> Echo.lib
function BU::Main::Files::Uncompress()
{
#     #***** Paramètres *****
#     local p_cmd=$1      # Compression command.
#     # TODO : Vérifier si cette procédure est bonne
#     local p_opts=$2     # Options of the compression command. (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
#     local p_path=$3     # Path to the l'archive to uncompress.
#     local p_name=$4     # Archive's name (only used into displayed messages).
#
#     #**** Code ****
#     # On exécute la commande de décompression en passant en arguments ses options et le chemin vers l'archive.
#     "$cmd $opts $p_path"
#     BU::Main::Errors::HandleErrors "$?" "${FUNCNAME[0]} : LA DÉCOMPRESSION DE L'ARCHIVE $(BU::DechoHighlight "$p_name") A ÉCHOUÉE"
#     BU::EchoSuccess "La décompression de l'archive $(BU::DechoHighlight "$p_name") s'est effectuée avec brio."
#     BU::Newline

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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::Headers::DrawLine()
{
	#**** Parameters ****
	local p_lineColor=$1	# Deuxième paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction.
	local p_lineChar=$2	# Premier paramètre servant à définir le caractère souhaité lors de l'appel de la fonction.
	
	#**** Code ****
	# Checking if the "$p_lineChar" parameter's value is a string instead of a single character, and getting the first character only.
	if ! BU::IsAlphaNumChar "$p_lineChar"; then
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

# Since this function can be called in the "BU::Main::Echo::__EchoOutput()" function,
# even if the "$__BU_MAIN_STAT_ECHO" status variable's value is set to "true",
# it's better to create a failsafe, to avoid experiencing an infinite loop.
function BU::HeaderBase()
{
	#**** Parameters ****
	local p_lineColor=$1      # Premier paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction "BU::Main::Headers::DrawLine".
	local p_lineChar=$2       # Deuxième paramètre servant à définir le caractère souhaité lors de l'appel de la fonction "BU::Main::Headers::DrawLine".
	local p_stringColor=$3	  # Définition de la couleur de la chaîne de caractères du header.
	local p_stringTxt=$4      # Chaîne de caractères affichée dans chaque header.

	#**** Variables ****
    local v_stat_time_header="$__BU_MAIN_STAT_TIME_HEADER"  # Setting the text display time global status variable to 0 seconds, because the header's pause time is already set.

	#**** Code ****
	__BU_MAIN_STAT_TIME_HEADER="0"

	if [ "$__BU_MAIN_STAT_ECHO" = "false" ]; then
        BU::Newline

        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
        BU::EchoMsg "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_RESET}"
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineColor" "$p_lineChar")" "" "nodate"
        BU::Newline

        sleep "$__BU_MAIN_STAT_TIME_HEADER"; __BU_MAIN_STAT_TIME_HEADER="$v_stat_time_header"

        return 0

    elif [ "$__BU_MAIN_STAT_ECHO" = "true" ]; then
        echo -e

        echo -e "$(BU::Main::Headers::DrawLine "$p_lineColor" "$p_lineChar")"
        echo -e "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_RESET}"
        echo -e "$(BU::Main::Headers::DrawLine "$p_lineColor" "$p_lineChar")"
        echo -e

        sleep "$__BU_MAIN_STAT_TIME_HEADER"; __BU_MAIN_STAT_TIME_HEADER="$v_stat_time_header"

        return 0
    fi
}

# -----------------------------------------------

## UNICOLOR HEADERS

# Header to display without color.
function BU::Header         { BU::HeaderBase "$__BU_MAIN_COLOR_RESET"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RESET"      "$1" || return 1; return 0; } 

# Header to display in case of an error.
function BU::HeaderError    { BU::HeaderBase "$__BU_MAIN_COLOR_ERROR"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ERROR"      "$1" || return 1; return 0; }

# Header to display when switching to a new package category during package installation.
function BU::HeaderInstall  { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW"   "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      "$1" || return 1; return 0; }

# Header to display when changing step.
function BU::HeaderNewstep  { BU::HeaderBase "$__BU_MAIN_COLOR_NEWSTEP"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_NEWSTEP"    "$1" || return 1; return 0; }

# Header to display when changing step.
function BU::HeaderStep     { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN"     "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       "$1" || return 1; return 0; }

# Header to display in case of a successfully done step.
function BU::HeaderSuccess  { BU::HeaderBase "$__BU_MAIN_COLOR_SUCCESS"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SUCCESS"    "$1" || return 1; return 0; }

# Header to display in case of a minor error.
function BU::HeaderWarning  { BU::HeaderBase "$__BU_MAIN_COLOR_WARNING"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE"  "$__BU_MAIN_COLOR_WARNING"   "$1" || return 1; return 0; }

# Copy-paste this function to avoid losing time while creating unicolor headers :
# function BU::Header<col> { BU::HeaderBase "$__BU_MAIN_COLOR_<COLOR>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR>" "$1" || return 1; return 0; }

# Old colors (before 2022 01 07)
function BU::HeaderBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      "$1" || return 1; return 0; }
function BU::HeaderBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       "$1" || return 1; return 0; }
function BU::HeaderCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       "$1" || return 1; return 0; }
function BU::HeaderGray         { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       "$1" || return 1; return 0; }
function BU::HeaderGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      "$1" || return 1; return 0; }
function BU::HeaderOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     "$1" || return 1; return 0; }
function BU::HeaderPink         { BU::HeaderBase "$__BU_MAIN_COLOR_PINK"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"   	"$1" || return 1; return 0; }
function BU::HeaderPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"	    "$1" || return 1; return 0; }
function BU::HeaderRed          { BU::HeaderBase "$__BU_MAIN_COLOR_RED"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function BU::HeaderTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"	"$1" || return 1; return 0; }
function BU::HeaderWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     	"$1" || return 1; return 0; }
function BU::HeaderYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# New colors (Since 2022 01 07)
function BU::HeaderAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"			"$1" || return 1; return 0; }
function BU::HeaderFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"		"$1" || return 1; return 0; }
function BU::HeaderLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"			"$1" || return 1; return 0; }
function BU::HeaderMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"			"$1" || return 1; return 0; }
function BU::HeaderSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_SALMON"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"			"$1" || return 1; return 0; }
function BU::HeaderSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"			"$1" || return 1; return 0; }
function BU::HeaderTan          { BU::HeaderBase "$__BU_MAIN_COLOR_TAN"     "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"			"$1" || return 1; return 0; }
function BU::HeaderTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"			"$1" || return 1; return 0; }
function BU::HeaderViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_VIOLET"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"			"$1" || return 1; return 0; }

# -----------------------------------------------

## BICOLOR HEADERS

# Copy-paste this function to avoid losing time while creating bicolor headers :
# function BU::Header<col1><col2>   { BU::HeaderBase "$__BU_MAIN_COLOR_<COLOR>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR>" "$1" || return 1; return 0; }

# Aqua blue lines, differently colored text.
function BU::HeaderAquaBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"		"$1" || return 1; return 0; }
function BU::HeaderAquaBlue			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"		"$1" || return 1; return 0; }
function BU::HeaderAquaCyan			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"		"$1" || return 1; return 0; }
function BU::HeaderAquaFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"	"$1" || return 1; return 0; }
function BU::HeaderAquaGray			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"		"$1" || return 1; return 0; }
function BU::HeaderAquaGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"		"$1" || return 1; return 0; }
function BU::HeaderAquaLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"		"$1" || return 1; return 0; }
function BU::HeaderAquaMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"    	"$1" || return 1; return 0; }
function BU::HeaderAquaOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"		"$1" || return 1; return 0; }
function BU::HeaderAquaPink			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"		"$1" || return 1; return 0; }
function BU::HeaderAquaPurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"		"$1" || return 1; return 0; }
function BU::HeaderAquaRed			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"		"$1" || return 1; return 0; }
function BU::HeaderAquaSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"		"$1" || return 1; return 0; }
function BU::HeaderAquaSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"		"$1" || return 1; return 0; }
function BU::HeaderAquaTan		    { BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"		"$1" || return 1; return 0; }
function BU::HeaderAquaTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"		"$1" || return 1; return 0; }
function BU::HeaderAquaTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"	"$1" || return 1; return 0; }
function BU::HeaderAquaViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"		"$1" || return 1; return 0; }
function BU::HeaderAquaWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"		"$1" || return 1; return 0; }
function BU::HeaderAquaYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"		"$1" || return 1; return 0; }


# Black lines, differently colored text.
function BU::HeaderBlackAqua        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderBlackBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function BU::HeaderBlackCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function BU::HeaderBlackFuschia     { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     	"$1" || return 1; return 0; }
function BU::HeaderBlackGray        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function BU::HeaderBlackGreen       { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     	"$1" || return 1; return 0; }
function BU::HeaderBlackLime        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderBlackMaroon      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderBlackOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"    	"$1" || return 1; return 0; }
function BU::HeaderBlackPink        { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function BU::HeaderBlackPurple      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"    	"$1" || return 1; return 0; }
function BU::HeaderBlackRed         { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function BU::HeaderBlackSalmon      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderBlackSilver      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderBlackTan         { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderBlackTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"			"$1" || return 1; return 0; }
function BU::HeaderBlackTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function BU::HeaderBlackViolet      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderBlackWhite       { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     	"$1" || return 1; return 0; }
function BU::HeaderBlackYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# Blue lines, differently colored text.
function BU::HeaderBlueAqua         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderBlueBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderBlueCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function BU::HeaderBlueFuschia      { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"   	"$1" || return 1; return 0; }
function BU::HeaderBlueGray         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function BU::HeaderBlueGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderBlueLime         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderBlueMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderBlueOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function BU::HeaderBluePink         { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function BU::HeaderBluePurple       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function BU::HeaderBlueRed          { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function BU::HeaderBlueSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderBlueSilver       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderBlueTan          { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"         	"$1" || return 1; return 0; }
function BU::HeaderBlueTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"			"$1" || return 1; return 0; }
function BU::HeaderBlueTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function BU::HeaderBlueViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderBlueWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderBlueYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Cyan lines, differently colored text.
function BU::HeaderCyanAqua         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderCyanBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderCyanBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function BU::HeaderCyanFuschia      { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"      	"$1" || return 1; return 0; }
function BU::HeaderCyanGray         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function BU::HeaderCyanGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderCyanLime         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderCyanMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderCyanOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function BU::HeaderCyanPink         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"          "$1" || return 1; return 0; }
function BU::HeaderCyanPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"        "$1" || return 1; return 0; }
function BU::HeaderCyanRed          { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"           "$1" || return 1; return 0; }
function BU::HeaderCyanSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"        "$1" || return 1; return 0; }
function BU::HeaderCyanSilver       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"        "$1" || return 1; return 0; }
function BU::HeaderCyanTan          { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"           "$1" || return 1; return 0; }
function BU::HeaderCyanTeal         { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"          "$1" || return 1; return 0; }
function BU::HeaderCyanTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function BU::HeaderCyanViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderCyanWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderCyanYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Fuschia lines, differently colored text.
function BU::HeaderFuschiaAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaBlue		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaCyan		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaGray		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaMaroon	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaOrange	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaPink		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaPurple	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaRed		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaSalmon	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaSilver	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaTan       { BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"	"$1" || return 1; return 0; }
function BU::HeaderFuschiaViolet	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"		"$1" || return 1; return 0; }
function BU::HeaderFuschiaYellow	{ BU::HeaderBase "$__BU_MAIN_COLOR_FUSCHIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"		"$1" || return 1; return 0; }

# Gray lines, differently colored text.
function BU::HeaderGrayAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderGrayBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderGrayBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function BU::HeaderGrayCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function BU::HeaderGrayFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"      	"$1" || return 1; return 0; }
function BU::HeaderGrayGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderGrayLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderGrayMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderGrayOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function BU::HeaderGrayPink         { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"       	"$1" || return 1; return 0; }
function BU::HeaderGrayPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function BU::HeaderGrayRed          { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function BU::HeaderGraySalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderGraySilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderGrayTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"       	"$1" || return 1; return 0; }
function BU::HeaderGrayTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderGrayTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function BU::HeaderGrayViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderGrayWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderGrayYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Light green lines, differently colored text.
function BU::HeaderGreenAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderGreenBlack       { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     	"$1" || return 1; return 0; }
function BU::HeaderGreenBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function BU::HeaderGreenCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN" 	    "$1" || return 1; return 0; }
function BU::HeaderGreenFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"      "$1" || return 1; return 0; }
function BU::HeaderGreenGray        { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY" 	    "$1" || return 1; return 0; }
function BU::HeaderGreenLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderGreenMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderGreenOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"		"$1" || return 1; return 0; }
function BU::HeaderGreenPink        { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function BU::HeaderGreenPurple      { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"		"$1" || return 1; return 0; }
function BU::HeaderGreenRed         { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function BU::HeaderGreenSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderGreenSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderGreenTan         { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderGreenTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderGreenTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function BU::HeaderGreenViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderGreenWhite       { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     	"$1" || return 1; return 0; }
function BU::HeaderGreenYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW" 		"$1" || return 1; return 0; }

# Lime green lines, differently colored text.
function BU::HeaderLimeAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderLimeBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderLimeBlue			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function BU::HeaderLimeCyan			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function BU::HeaderLimeFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"      	"$1" || return 1; return 0; }
function BU::HeaderLimeGray			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function BU::HeaderLimeGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderLimeMarron		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderLimeOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      	"$1" || return 1; return 0; }
function BU::HeaderLimePink			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function BU::HeaderLimePurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      	"$1" || return 1; return 0; }
function BU::HeaderLimeRed			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"  	    	"$1" || return 1; return 0; }
function BU::HeaderLimeSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderLimeSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderLimeTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"       	"$1" || return 1; return 0; }
function BU::HeaderLimeTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderLimeTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"    	"$1" || return 1; return 0; }
function BU::HeaderLimeViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderLimeWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderLimeYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      	"$1" || return 1; return 0; }

# Maroon lines, differently colored text.
function BU::HeaderMaroonAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonBlue		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonCyan		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonFuschia	{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderMaroonGray		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      "$1" || return 1; return 0; }
function BU::HeaderMaroonPink		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonPurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      "$1" || return 1; return 0; }
function BU::HeaderMaroonRed		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"  	    "$1" || return 1; return 0; }
function BU::HeaderMaroonSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      "$1" || return 1; return 0; }
function BU::HeaderMaroonSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      "$1" || return 1; return 0; }
function BU::HeaderMaroonTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"         "$1" || return 1; return 0; }
function BU::HeaderMaroonTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"	"$1" || return 1; return 0; }
function BU::HeaderMaroonViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      "$1" || return 1; return 0; }
function BU::HeaderMaroonWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderMaroonYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      "$1" || return 1; return 0; }

# Orange lines, differently colored text.
function BU::HeaderOrangeAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderOrangeBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       "$1" || return 1; return 0; }
function BU::HeaderOrangeBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        "$1" || return 1; return 0; }
function BU::HeaderOrangeCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        "$1" || return 1; return 0; }
function BU::HeaderOrangeFuschia	{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderOrangeGray       { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        "$1" || return 1; return 0; }
function BU::HeaderOrangeGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       "$1" || return 1; return 0; }
function BU::HeaderOrangeLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderOrangeMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      "$1" || return 1; return 0; }
function BU::HeaderOrangePink       { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        "$1" || return 1; return 0; }
function BU::HeaderOrangePurple     { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      "$1" || return 1; return 0; }
function BU::HeaderOrangeRed        { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"         "$1" || return 1; return 0; }
function BU::HeaderOrangeSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      "$1" || return 1; return 0; }
function BU::HeaderOrangeSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      "$1" || return 1; return 0; }
function BU::HeaderOrangeTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"         "$1" || return 1; return 0; }
function BU::HeaderOrangeTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"     	"$1" || return 1; return 0; }
function BU::HeaderOrangeTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function BU::HeaderOrangeViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      "$1" || return 1; return 0; }
function BU::HeaderOrangeWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       "$1" || return 1; return 0; }
function BU::HeaderOrangeYellow     { BU::HeaderBase "$__BU_MAIN_COLOR_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      "$1" || return 1; return 0; }

# Pink lines, differently colored text.
function BU::HeaderPinkAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"      	"$1" || return 1; return 0; }
function BU::HeaderPinkBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"      	"$1" || return 1; return 0; }
function BU::HeaderPinkBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"       	"$1" || return 1; return 0; }
function BU::HeaderPinkCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"       	"$1" || return 1; return 0; }
function BU::HeaderPinkFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"      	"$1" || return 1; return 0; }
function BU::HeaderPinkGray         { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"       	"$1" || return 1; return 0; }
function BU::HeaderPinkGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"      	"$1" || return 1; return 0; }
function BU::HeaderPinkLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"      	"$1" || return 1; return 0; }
function BU::HeaderPinkMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      	"$1" || return 1; return 0; }
function BU::HeaderPinkOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function BU::HeaderPinkPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function BU::HeaderPinkRed          { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function BU::HeaderPinkSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      	"$1" || return 1; return 0; }
function BU::HeaderPinkSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      	"$1" || return 1; return 0; }
function BU::HeaderPinkTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"       	"$1" || return 1; return 0; }
function BU::HeaderPinkTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"      	"$1" || return 1; return 0; }
function BU::HeaderPinkTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"  	"$1" || return 1; return 0; }
function BU::HeaderPinkViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      	"$1" || return 1; return 0; }
function BU::HeaderPinkWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"      	"$1" || return 1; return 0; }
function BU::HeaderPinkYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }

# Purple lines, differently colored text.
function BU::HeaderPurpleAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"        "$1" || return 1; return 0; }
function BU::HeaderPurpleBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       "$1" || return 1; return 0; }
function BU::HeaderPurpleBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        "$1" || return 1; return 0; }
function BU::HeaderPurpleCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        "$1" || return 1; return 0; }
function BU::HeaderPurpleFuschia    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderPurpleGray       { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        "$1" || return 1; return 0; }
function BU::HeaderPurpleGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       "$1" || return 1; return 0; }
function BU::HeaderPurpleLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"        "$1" || return 1; return 0; }
function BU::HeaderPurpleMaroon	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"     	"$1" || return 1; return 0; }
function BU::HeaderPurpleOrange     { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      "$1" || return 1; return 0; }
function BU::HeaderPurplePink       { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        "$1" || return 1; return 0; }
function BU::HeaderPurpleRed        { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"         "$1" || return 1; return 0; }
function BU::HeaderPurpleSalmon	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      "$1" || return 1; return 0; }
function BU::HeaderPurpleSilver	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      "$1" || return 1; return 0; }
function BU::HeaderPurpleTan        { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"         "$1" || return 1; return 0; }
function BU::HeaderPurpleTeal	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"	   	"$1" || return 1; return 0; }
function BU::HeaderPurpleTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"   "$1" || return 1; return 0; }
function BU::HeaderPurpleViolet	    { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      "$1" || return 1; return 0; }
function BU::HeaderPurpleWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       "$1" || return 1; return 0; }
function BU::HeaderPurpleYellow     { BU::HeaderBase "$__BU_MAIN_COLOR_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      "$1" || return 1; return 0; }

# Red lines, differently colored text.
function BU::HeaderRedAqua          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"           "$1" || return 1; return 0; }
function BU::HeaderRedBlack         { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"          "$1" || return 1; return 0; }
function BU::HeaderRedBlue          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"           "$1" || return 1; return 0; }
function BU::HeaderRedCyan          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"           "$1" || return 1; return 0; }
function BU::HeaderRedFuschia       { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"        "$1" || return 1; return 0; }
function BU::HeaderRedGray          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"           "$1" || return 1; return 0; }
function BU::HeaderRedGreen         { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"          "$1" || return 1; return 0; }
function BU::HeaderRedLime          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"           "$1" || return 1; return 0; }
function BU::HeaderRedMaroon        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"         "$1" || return 1; return 0; }
function BU::HeaderRedOrange        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"         "$1" || return 1; return 0; }
function BU::HeaderRedPink          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"           "$1" || return 1; return 0; }
function BU::HeaderRedPurple        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"         "$1" || return 1; return 0; }
function BU::HeaderRedSalmon        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"         "$1" || return 1; return 0; }
function BU::HeaderRedSilver        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"         "$1" || return 1; return 0; }
function BU::HeaderRedTan           { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"            "$1" || return 1; return 0; }
function BU::HeaderRedTeal          { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"           "$1" || return 1; return 0; }
function BU::HeaderRedTurquoise     { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"      "$1" || return 1; return 0; }
function BU::HeaderRedViolet        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"         "$1" || return 1; return 0; }
function BU::HeaderRedWhite         { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"          "$1" || return 1; return 0; }
function BU::HeaderRedYellow        { BU::HeaderBase "$__BU_MAIN_COLOR_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"         "$1" || return 1; return 0; }

# Salmon lines, differently colored text.
function BU::HeaderSalmonAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"        "$1" || return 1; return 0; }
function BU::HeaderSalmonBlack     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       "$1" || return 1; return 0; }
function BU::HeaderSalmonBlue      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        "$1" || return 1; return 0; }
function BU::HeaderSalmonCyan      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        "$1" || return 1; return 0; }
function BU::HeaderSalmonFuschia	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderSalmonGray      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        "$1" || return 1; return 0; }
function BU::HeaderSalmonGreen     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       "$1" || return 1; return 0; }
function BU::HeaderSalmonLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"        "$1" || return 1; return 0; }
function BU::HeaderSalmonMaroon    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      "$1" || return 1; return 0; }
function BU::HeaderSalmonOrange  	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      "$1" || return 1; return 0; }
function BU::HeaderSalmonPink    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        "$1" || return 1; return 0; }
function BU::HeaderSalmonPurple  	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      "$1" || return 1; return 0; }
function BU::HeaderSalmonRed    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function BU::HeaderSalmonSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"		"$1" || return 1; return 0; }
function BU::HeaderSalmonTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"		"$1" || return 1; return 0; }
function BU::HeaderSalmonTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"   		"$1" || return 1; return 0; }
function BU::HeaderSalmonTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"   "$1" || return 1; return 0; }
function BU::HeaderSalmonViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"		"$1" || return 1; return 0; }
function BU::HeaderSalmonWhite     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       "$1" || return 1; return 0; }
function BU::HeaderSalmonYellow    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      "$1" || return 1; return 0; }

# Silver lines, differently colored text.
function BU::HeaderSilverAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"        "$1" || return 1; return 0; }
function BU::HeaderSilverBlack     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       "$1" || return 1; return 0; }
function BU::HeaderSilverBlue      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        "$1" || return 1; return 0; }
function BU::HeaderSilverCyan      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        "$1" || return 1; return 0; }
function BU::HeaderSilverFuschia	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderSilverGray      	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        "$1" || return 1; return 0; }
function BU::HeaderSilverGreen     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       "$1" || return 1; return 0; }
function BU::HeaderSilverLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"        "$1" || return 1; return 0; }
function BU::HeaderSilverMaroon    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      "$1" || return 1; return 0; }
function BU::HeaderSilverOrange  	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      "$1" || return 1; return 0; }
function BU::HeaderSilverPink    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        "$1" || return 1; return 0; }
function BU::HeaderSilverPurple  	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      "$1" || return 1; return 0; }
function BU::HeaderSilverRed    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"        	"$1" || return 1; return 0; }
function BU::HeaderSilverSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"		"$1" || return 1; return 0; }
function BU::HeaderSilverTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"		"$1" || return 1; return 0; }
function BU::HeaderSilverTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"   		"$1" || return 1; return 0; }
function BU::HeaderSilverTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"   "$1" || return 1; return 0; }
function BU::HeaderSilverViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"		"$1" || return 1; return 0; }
function BU::HeaderSilverWhite     	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       "$1" || return 1; return 0; }
function BU::HeaderSilverYellow    	{ BU::HeaderBase "$__BU_MAIN_COLOR_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"      "$1" || return 1; return 0; }

# Tan lines, differently colored text.
function BU::TanAqua                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"     		"$1" || return 1; return 0; }
function BU::TanBlue                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     		"$1" || return 1; return 0; }
function BU::TanBlack               { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"     		"$1" || return 1; return 0; }
function BU::TanCyan                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"     		"$1" || return 1; return 0; }
function BU::TanFuschia             { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     	"$1" || return 1; return 0; }
function BU::TanGray                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"     		"$1" || return 1; return 0; }
function BU::TanGreen               { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     		"$1" || return 1; return 0; }
function BU::TanLime                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"     		"$1" || return 1; return 0; }
function BU::TanMaroon              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"     	"$1" || return 1; return 0; }
function BU::TanOrange              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"     	"$1" || return 1; return 0; }
function BU::TanPink                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"     		"$1" || return 1; return 0; }
function BU::TanPurple              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"     	"$1" || return 1; return 0; }
function BU::TanRed                 { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"     		"$1" || return 1; return 0; }
function BU::TanSalmon              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"     	"$1" || return 1; return 0; }
function BU::TanSilver              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"     	"$1" || return 1; return 0; }
function BU::TanTeal                { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"     		"$1" || return 1; return 0; }
function BU::TanTurquoise           { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"     	"$1" || return 1; return 0; }
function BU::TanViolet              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"     	"$1" || return 1; return 0; }
function BU::TanWhite               { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"     		"$1" || return 1; return 0; }
function BU::TanYellow              { BU::HeaderBase "$__BU_MAIN_COLOR_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"     	"$1" || return 1; return 0; }


# Teal lines, differently colored text.
function BU::HeaderTealAqua    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"     		"$1" || return 1; return 0; }
function BU::HeaderTealBlack   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"    		"$1" || return 1; return 0; }
function BU::HeaderTealBlue    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE" 	    	"$1" || return 1; return 0; }
function BU::HeaderTealCyan    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"			"$1" || return 1; return 0; }
function BU::HeaderTealFuschia 		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"		"$1" || return 1; return 0; }
function BU::HeaderTealGray		    { BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"	   		"$1" || return 1; return 0; }
function BU::HeaderTealGreen   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"			"$1" || return 1; return 0; }
function BU::HeaderTealLime    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"			"$1" || return 1; return 0; }
function BU::HeaderTealMaroon  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"   		"$1" || return 1; return 0; }
function BU::HeaderTealOrange  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"   		"$1" || return 1; return 0; }
function BU::HeaderTealPink		    { BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"     		"$1" || return 1; return 0; }
function BU::HeaderTealPurple  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"   		"$1" || return 1; return 0; }
function BU::HeaderTealRed     		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"			"$1" || return 1; return 0; }
function BU::HeaderTealSalmon  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"   		"$1" || return 1; return 0; }
function BU::HeaderTealSilver  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"   		"$1" || return 1; return 0; }
function BU::HeaderTealTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"   		"$1" || return 1; return 0; }
function BU::HeaderTealTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"		"$1" || return 1; return 0; }
function BU::HeaderTealViolet  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"   		"$1" || return 1; return 0; }
function BU::HeaderTealWhite   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE" 		"$1" || return 1; return 0; }
function BU::HeaderTealYellow  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"   		"$1" || return 1; return 0; }


# Turquoise lines, differently colored text.
function BU::HeaderTurquoiseAqua    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"     "$1" || return 1; return 0; }
function BU::HeaderTurquoiseBlack   { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"    "$1" || return 1; return 0; }
function BU::HeaderTurquoiseBlue    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"     "$1" || return 1; return 0; }
function BU::HeaderTurquoiseCyan    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"     "$1" || return 1; return 0; }
function BU::HeaderTurquoiseFuschia { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"  "$1" || return 1; return 0; }
function BU::HeaderTurquoiseGray    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"     "$1" || return 1; return 0; }
function BU::HeaderTurquoiseGreen   { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"    "$1" || return 1; return 0; }
function BU::HeaderTurquoiseLime    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"     "$1" || return 1; return 0; }
function BU::HeaderTurquoiseMaroon  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"   "$1" || return 1; return 0; }
function BU::HeaderTurquoiseOrange  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"   "$1" || return 1; return 0; }
function BU::HeaderTurquoisePink    { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"     "$1" || return 1; return 0; }
function BU::HeaderTurquoisePurple  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"   "$1" || return 1; return 0; }
function BU::HeaderTurquoiseRed     { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"		"$1" || return 1; return 0; }
function BU::HeaderTurquoiseSalmon  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"   "$1" || return 1; return 0; }
function BU::HeaderTurquoiseSilver  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"   "$1" || return 1; return 0; }
function BU::HeaderTurquoiseTan     { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"      "$1" || return 1; return 0; }
function BU::HeaderTurquoiseTeal  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"		"$1" || return 1; return 0; }
function BU::HeaderTurquoiseViolet  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"   "$1" || return 1; return 0; }
function BU::HeaderTurquoiseWhite   { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE" 	"$1" || return 1; return 0; }
function BU::HeaderTurquoiseYellow  { BU::HeaderBase "$__BU_MAIN_COLOR_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"   "$1" || return 1; return 0; }

# White lines, differently colored text.
function BU::HeaderWhiteAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteBlack       { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"      	"$1" || return 1; return 0; }
function BU::HeaderWhiteCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"      	"$1" || return 1; return 0; }
function BU::HeaderWhiteFuschia		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteGray        { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"      	"$1" || return 1; return 0; }
function BU::HeaderWhiteGreen       { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"    	"$1" || return 1; return 0; }
function BU::HeaderWhitePink        { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"      	"$1" || return 1; return 0; }
function BU::HeaderWhitePurple      { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"    	"$1" || return 1; return 0; }
function BU::HeaderWhiteRed         { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"       	"$1" || return 1; return 0; }
function BU::HeaderWhiteSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteTan         { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"       	"$1" || return 1; return 0; }
function BU::HeaderWhiteTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"     	"$1" || return 1; return 0; }
function BU::HeaderWhiteTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE" 	"$1" || return 1; return 0; }
function BU::HeaderWhiteYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_YELLOW"    	"$1" || return 1; return 0; }

# Yellow lines, differently colored text.
function BU::HeaderYellowAqua       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_AQUA"        "$1" || return 1; return 0; }
function BU::HeaderYellowBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLACK"       "$1" || return 1; return 0; }
function BU::HeaderYellowBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_BLUE"        "$1" || return 1; return 0; }
function BU::HeaderYellowCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_CYAN"        "$1" || return 1; return 0; }
function BU::HeaderYellowFuschia    { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_FUSCHIA"     "$1" || return 1; return 0; }
function BU::HeaderYellowGray       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GRAY"        "$1" || return 1; return 0; }
function BU::HeaderYellowGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_GREEN"       "$1" || return 1; return 0; }
function BU::HeaderYellowLime       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_LIME"        "$1" || return 1; return 0; }
function BU::HeaderYellowMaroon     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_MAROON"      "$1" || return 1; return 0; }
function BU::HeaderYellowOrange     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_ORANGE"      "$1" || return 1; return 0; }
function BU::HeaderYellowPink       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PINK"        "$1" || return 1; return 0; }
function BU::HeaderYellowPurple     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_PURPLE"      "$1" || return 1; return 0; }
function BU::HeaderYellowRed        { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_RED"         "$1" || return 1; return 0; }
function BU::HeaderYellowSalmon     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SALMON"      "$1" || return 1; return 0; }
function BU::HeaderYellowSilver     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_SILVER"      "$1" || return 1; return 0; }
function BU::HeaderYellowTan        { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TAN"         "$1" || return 1; return 0; }
function BU::HeaderYellowTeal       { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TEAL"        "$1" || return 1; return 0; }
function BU::HeaderYellowTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TURQUOISE"   "$1" || return 1; return 0; }
function BU::HeaderYellowViolet     { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_VIOLET"      "$1" || return 1; return 0; }
function BU::HeaderYellowWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_WHITE"       "$1" || return 1; return 0; }
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
#	- BU::Main::Checkings::CheckRootEUID		-> Checkings.lib
#	- BU::EchoError			-> Echo.lib
#	- BU::EchoNewstep		-> Echo.lib
#	- BU::EchoSuccess		-> Echo.lib
#	- BU::Newline			-> Echo.lib
#	- BU::Main::Errors::HandleErrors		-> Headers.lib
function BU::Main::Permissions::ChownRec()
{
    #***** Paramètres *****
    local p_currentOwner=$1    # This parameter is used in the messages.
    local p_newOwner=$2
    local p_path=$3

    #**** Code ****
    # The "chown" command has to be used with super-user privileges,
    BU::Main::Checkings::CheckRootEUID

    # If the path passed as argument doesn't exists.
    if [ ! -d "$p_path" ]; then
        BU::Main::Errors::HandleErrors "1" "" "" ""
    fi

    BU::EchoNewstep "Recursive change of the ownership rights of the new folder $(BU::DechoHighlight "$p_path/") from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")"
	BU::Newline

    # On change les droits du fichier créé par le script.
	# Comme il est exécuté en mode super-utilisateur, tout dossier ou fichier créé appartient à l'utilisateur root.
	# Pour attribuer les droits de lecture, d'écriture et d'exécution (rwx) à l'utilisateur normal, on appelle
	# la commande chown avec pour arguments :
	#		- Le nom de l'utilisateur à qui donner les droits.
	#		- Le chemin du dossier cible.
	if chown -Rv "$p_newOwner" "$p_path"; then
		BU::EchoSuccess "The rights of the $(BU::DechoHighlight "$p_path/") folder have been successfully changed from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")"
		BU::Newline

		return 0
	else
        BU::EchoError "Unable to change the rights of the $(BU::DechoHighlight "$p_path/") folder"
		BU::Newline

		return 1
    fi
}


# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### NON-RECURSIVE PERMISSION AND OWNERSHIP PROCESSING

## NON-RECURSIVE OWNERSHIP SWAPPING

# Fonctions d'attribution de propriété de fichier à l'utilisateur.

# Required functions and files into the "Bash-Utils/src/functions" folder :
#   - BU::Main::Checkings::CheckRootEUID -> Checkings.lib
#   - BU::EchoError     -> Echo.lib
#   - BU::EchoNewstep   -> Echo.lib
#   - BU::EchoSuccess   -> Echo.lib
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Permissions::Chown()
{
    #**** Parameters ****
    p_currentOwner=$1    # This parameter is used in the translated messages, stored into their own variables.
    p_newOwner=$2
    p_path=$3
    p_option=$4   # Recursive swapping or not.
    
    #**** Code ****
    # The "chown" command has to be used with super-user privileges,
    BU::Main::Checkings::CheckRootEUID

    # If the path passed as argument doesn't exists.
    if [ -d "$p_path" ]; then
        BU::EchoNewstep "Changing the ownership rights of the  $(BU::DechoHighlight "$p_path/") folder from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")."
        BU::Newline
        
        # Changing ownership recursively.
        case "$p_option" in
            'R')
                if chown -Rv "$p_newOwner" "$p_path"; then
                    BU::EchoSuccess "The rights of the $(BU::DechoHighlight "$p_path") folder have been successfully changed from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")"
                    BU::Newline

                    return 0
                else
                    BU::Main::Errors::HandleErrors "1" "Unable to change the rights of the $(BU::DechoHighlight "$p_path/") folder" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-7 ))"
                    BU::Newline

                    return 1
                fi
                ;;
            '')
                # Changing ownership non-recursively.
                if chown -v "$p_newOwner" "$p_path"; then
                    BU::EchoSuccess "The rights of the $(BU::DechoHighlight "$p_path") folder have been successfully changed from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")"
                    BU::Newline

                    return 0

                else
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO CHANGE THE RIGHTS OF THE $(BU::DechoHighlight "$p_path/") FOLDER" \
                        "Please run the script with the command $(BU::DechoHighlight "bash -x $PROJECT_NAME") to check what happened" \
                        "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-11 ))"
                    BU::Newline

                    return 1
                fi
                ;;
            *)
                BU::Main::Errors::HandleErrors "1" "THE $(BU::DechoHighlight "${FUNCNAME[0]}")'S FUNCTION $(BU::DechoHighlight "$p_option") OPTION PASSED AS 4TH ARGUMENT IS NOT SUPPORTED" \
                    "The supported options for directory processing are :" "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))"
                ;;
        esac
        
        
    else
        # Checking first if the path is a filepath. If not, then no correct path is passed as argument.
        if [ -f "$p_path" ]; then
            BU::EchoNewstep "Changing the ownership rights of the  $(BU::DechoHighlight "$p_path/") file from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")."
            BU::Newline

            # Changing ownership
            if chown -v "$p_newOwner" "$p_path"; then
                BU::EchoSuccess "The rights of the $(BU::DechoHighlight "$p_path") file have been successfully changed from $(BU::DechoHighlight "$p_currentOwner") to $(BU::DechoHighlight "$p_newOwner")."
                BU::Newline

                return 0
            else
                BU::Main::Errors::HandleErrors "$?" "Unable to change the rights of the $(BU::DechoHighlight "$p_path") file !"
                BU::Newline

                return 1
            fi
        else
            BU::Main::Errors::HandleErrors "1" "THE $(BU::DechoHighlight "$p_path") FILE DOESN'T EXISTS" && return 1
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::PosixTerm::DisplayCountdown()
{
    return 0
}

# Display a progress bar while a task is ongoing.
function BU::Main::PosixTerm::DisplayProgressBar()
{
    return 0
}

# Display a spinner while a task is ongoing.
function BU::Main::PosixTerm::DisplaySpinner()
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

    BU::EchoMsg "$__BU_MAIN_TXT_TAB $p_string"

    while [ -d "/proc/$p_pid" ]; do
        printf "%s" "\b${sp:i++%${#sp}:1}"
    done

    return 0
}
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::Status::ConfEcho()
{
    #**** Parameters ****
    local p_file=$1;
    local p_lineno=$2;
    local p_bad_value=$3;
    local p_var_name=$4

    # Shifting the same number of time as the former arguments number
    # to avoid including these arguments values in the allowed values array.
    shift 4
    local pa_correctValues=("$@")

    #**** Variables ****
    local i=0

    #**** Code ****
    if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        { BU::Main::Headers::DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"

        echo "AN ERROR OCCURED DURING THIS STATUS VARIABLE CHECKING --> $p_var_name    |    VALUE : $p_bad_value !!!"
        
        BU::Main::Headers::DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"
    } 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH"

    else
        BU::Main::Headers::DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"

        echo "AN ERROR OCCURED DURING A STATUS VARIABLE CHECKING !!!"

        BU::Main::Headers::DrawLine "$__BU_MAIN_COLOR_ERROR" "$__BU_MAIN_TXT_CHAR_HEADER_LINE"
    fi

    echo -ne "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}In ${__BU_MAIN_COLOR_HIGHLIGHT}$p_file${__BU_MAIN_COLOR_ERROR}, line ${__BU_MAIN_COLOR_HIGHLIGHT}$p_lineno${__BU_MAIN_COLOR_ERROR} --> " >&2
    echo -e "Error : the ${__BU_MAIN_COLOR_HIGHLIGHT}$p_var_name${__BU_MAIN_COLOR_ERROR} variable's value is incorrect.${__BU_MAIN_COLOR_RESET}" >&2

    if [ -z "$p_bad_value" ]; then
        echo >&2; echo -e "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}Bad value :${__BU_MAIN_COLOR_YELLOW} An empty string.${__BU_MAIN_COLOR_RESET}" >&2
    else
        echo >&2; echo -e "${__BU_MAIN_COLOR_ERROR}${__BU_MAIN_TXT_TAB}${__BU_MAIN_TXT_TAB}Bad value : ${__BU_MAIN_COLOR_HIGHLIGHT}$p_bad_value.${__BU_MAIN_COLOR_RESET}" >&2
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

    echo >&2; BU::Main::Errors::ExitError 1
}

# -----------------------------------------------

## CHECKINGS

# Checking the "$__BU_MAIN_STAT_DEBUG" status variable's value.
function BU::Main::Status::CheckSTAT_DEBUG()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_DEBUG,,}" != "true" ] && [ "${__BU_MAIN_STAT_DEBUG,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_DEBUG" "__BU_MAIN_STAT_DEBUG" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Check the "$__BU_MAIN_STAT_DECHO" status variable's value.
function BU::Main::Status::CheckSTAT_DECHO()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("authorize" "forbid" "restrict")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_DECHO,,}" != "authorize" ] && [ "${__BU_MAIN_STAT_DECHO,,}" != "forbid" ] && [ "${__BU_MAIN_STAT_DECHO,,}" != "restrict" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_DECHO" "__BU_MAIN_STAT_DECHO" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Check the "$__BU_MAIN_STAT_ECHO" status variable's value.
function BU::Main::Status::CheckSTAT_ECHO()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_ECHO,,}" != "true" ] && [ "${__BU_MAIN_STAT_ECHO,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ECHO" "__BU_MAIN_STAT_ECHO" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_ERROR" status variable's value.
function BU::Main::Status::CheckSTAT_ERROR()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("" "fatal")

    #**** Code ****
    if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "${__BU_MAIN_STAT_ERROR,,}" != "fatal" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ERROR" "__BU_MAIN_STAT_ERROR" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
function BU::Main::Status::CheckSTAT_INITIALIZING()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_INITIALIZING,,}" != "true" ] && [ "${__BU_MAIN_STAT_INITIALIZING,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_INITIALIZING" "__BU_MAIN_STAT_INITIALIZING" "${pa_correctValues[@]}"; return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_LOG" status variable's value.
function BU::Main::Status::CheckSTAT_LOG()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_LOG,,}" != "true" ] && [ "${__BU_MAIN_STAT_LOG,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG" "__BU_MAIN_STAT_LOG" "${pa_correctValues[@]}"; return 1

    elif [ "$__BU_MAIN_STAT_LOG" = "true" ] && [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ] && [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        BU::Main::Files::CreateProjectLogFile || return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function BU::Main::Status::CheckSTAT_LOG_REDIRECT()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("" "log" "tee")

    #**** Code ****
    if [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ] && [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" != 'log' ] && [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" != 'tee' ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG_REDIRECT" "__BU_MAIN_STAT_LOG_REDIRECT" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function BU::Main::Status::CheckSTAT_OPERATE_ROOT()
{
	#**** Parameters ****
	local p_file=$1
	local p_lineno=$2

	#**** Variables ****
	local pa_correctValues=("authorized" "forbidden" "restricted")

	#**** Code ****
	if [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "authorized" ] && [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "forbidden" ] && [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "restricted" ]; then
		BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_OPERATE_ROOT" "__BU_MAIN_STAT_OPERATE_ROOT" "${pa_correctValues[@]}"; return 1
	fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variable's value.
function BU::Main::Status::CheckSTAT_PRINT_INIT_LOG()
{
    #**** Parameters ****
    p_file=$1
    p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_PRINT_INIT_LOG,,}" != "true" ] && [ "${__BU_MAIN_STAT_PRINT_INIT_LOG,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_PRINT_INIT_LOG" '__BU_MAIN_STAT_PRINT_INIT_LOG' "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TIME_HEADER" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_HEADER()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("${__BU_MAIN_COLOR_ORANGE}An integer or a floating number")

    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_HEADER"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_HEADER" "__BU_MAIN_STAT_TIME_HEADER" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TIME_NEWLINE" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_NEWLINE()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("${__BU_MAIN_COLOR_ORANGE}An integer or a floating number")

    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_HEADER"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_NEWLINE" "__BU_MAIN_STAT_TIME_NEWLINE" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_TXT()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("${__BU_MAIN_COLOR_ORANGE}An integer or a floating number")

    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_TXT"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_TXT" "__BU_MAIN_STAT_TIME_TXT" "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function BU::Main::Status::CheckSTAT_TXT_FMT()
{
    #**** Parameters ****
    p_file=$1
    p_lineno=$2

    #**** Variables ****
    local pa_correctValues=("true" "false")

    #**** Code ****
    if [ "${__BU_MAIN_STAT_TXT_FMT,,}" != "true" ] && [ "${__BU_MAIN_STAT_TXT_FMT,,}" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TXT_FMT" '__BU_MAIN_STAT_TXT_FMT' "${pa_correctValues[@]}"; return 1
    fi

    return 0
}

# Checking the "$__BU_MAIN_STAT_USER_OS" status variable's value.
# This function is empty now, as the OS handling is still in work.
function BU::Main::Status::CheckSTAT_USER_OS()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2
    shift 2

    # local pa_supported_os=("$@")    # Array storing the list of the operating systems which support a feature to be deployed.

    #**** Variables ****

    #**** Code ****
    return 0
}


# Checking all the project's status variables values if multiple values had been modified.
function BU::Main::Status::CheckProjectStatusVars()
{
    #**** Parameters ****
    local p_file=$1
    local p_lineno=$2

    #**** Code ****
    # Processing first the "__BU_MAIN_STAT_LOG_REDIRECT" variable, to make sure the following error messages will be correctly displayed if another error happened.
    BU::Main::Status::CheckSTAT_LOG_REDIRECT   "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_DECHO          "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_ECHO           "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_DEBUG          "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_ERROR          "$p_file" "$p_lineno" || return 1
	BU::Main::Status::CheckSTAT_INITIALIZING   "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_LOG            "$p_file" "$p_lineno" || return 1
	BU::Main::Status::CheckSTAT_OPERATE_ROOT   "$p_file" "$p_lineno" || return 1
	BU::Main::Status::CheckSTAT_TIME_HEADER    "$p_file" "$p_lineno" || return 1
	BU::Main::Status::CheckSTAT_TIME_NEWLINE   "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_TIME_TXT       "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_TXT_FMT        "$p_file" "$p_lineno" || return 1
    BU::Main::Status::CheckSTAT_USER_OS        "$p_file" "$p_lineno" || return 1

	return 0
}

# -----------------------------------------------

## CHANGING VALUES MORE EASILY

# Positionnal parameters :
#   $1  --> new value.
#   $2  --> file where the change was made.
#   $3  --> line where the change was made.

# Changing the "$__BU_MAIN_STAT_DEBUG" status variable's value.
function BU::Main:Status::ChangeSTAT_DEBUG           { __BU_MAIN_STAT_DEBUG="$1";            BU::Main::Status::CheckSTAT_DEBUG          "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_DECHO" status variable's value.
function BU::Main:Status::ChangeSTAT_DECHO           { __BU_MAIN_STAT_DECHO="$1";            BU::Main::Status::CheckSTAT_DECHO          "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value.
function BU::Main:Status::ChangeSTAT_ECHO            { __BU_MAIN_STAT_ECHO="$1";             BU::Main::Status::CheckSTAT_ECHO           "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_ERROR" status variable's value.
function BU::Main:Status::ChangeSTAT_ERROR           { __BU_MAIN_STAT_ERROR="$1";           BU::Main::Status::CheckSTAT_ERROR           "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
# WARNING : Do NOT change it's value from 'false' to 'true'. Otherwise, expect bugs.
function BU::Main:Status::ChangeSTAT_INITIALIZING    {
	if [ "$__BU_MAIN_STAT_INITIALIZING" = 'false' ] && [ 'true' = "$1" ]; then
		BU::EchoWarning "WARNING : It's strongly discouraged to change the $(BU::DechoHighlight "$__BU_MAIN_STAT_INITIALIZING") value from $(BU::DechoHighlight 'false') to $(BU::DechoHighlight 'true')"; return 1
	else
		__BU_MAIN_STAT_INITIALIZING="$1";     BU::Main::Status::CheckSTAT_INITIALIZING      "$2" "$3" || return 1
	fi; return 0; }

# Changing the "$__BU_MAIN_STAT_LOG" status variable's value.
function BU::Main:Status::ChangeSTAT_LOG            { __BU_MAIN_STAT_LOG="$1";              BU::Main::Status::CheckSTAT_LOG             "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function BU::Main:Status::ChangeSTAT_LOG_REDIRECT   { __BU_MAIN_STAT_LOG_REDIRECT="$1";     BU::Main::Status::CheckSTAT_LOG_REDIRECT    "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function BU::Main:Status::ChangeSTAT_OPERATE_ROOT   { __BU_MAIN_STAT_OPERATE_ROOT="$1";     BU::Main::Status::CheckSTAT_OPERATE_ROOT    "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variable's value.
function BU::Main:Status::ChangeSTAT_PRINT_INIT_LOG { __BU_MAIN_STAT_PRINT_INIT_LOG="$1";   BU::Main::Status::CheckSTAT_PRINT_INIT_LOG  "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TIME_HEADER" status variable's value.
function BU::Main:Status::ChangeSTAT_TIME_HEADER    { __BU_MAIN_STAT_TIME_HEADER="$1";      BU::Main::Status::CheckSTAT_TIME_HEADER     "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TIME_NEWLINE" status variable's value.
function BU::Main:Status::ChangeSTAT_TIME_NEWLINE   { __BU_MAIN_STAT_TIME_NEWLINE="$1";     BU::Main::Status::CheckSTAT_TIME_NEWLINE    "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function BU::Main:Status::ChangeSTAT_TIME_TXT       { __BU_MAIN_STAT_TIME_TXT="$1";         BU::Main::Status::CheckSTAT_TIME_TXT        "$2" "$3" || return 1; return 0; }

# Changing the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function BU::Main:Status::ChangeSTAT_TXT_FMT        { __BU_MAIN_STAT_TXT_FMT="$1";          BU::Main:Status::CheckSTAT_TXT_FMT          "$2" "$3" || return 1; return 0; }

# -----------------------------------------------

## EASIER CHECKING BOOLEAN VALUES

# Checking if the debug mode is active.
function BU::Main::Status::CheckStatIsDebugging()     { if [ "$__BU_MAIN_STAT_DEBUG"          = 'true' ]; then return 0; else return 1; fi; }

# Checking if the "BU::Echo<...>()" functions can call the "BU::CheckProjectLogStatus()" function without provoking an infinite loop.
function BU::Main::Status::CheckStatIsBackupEchoing() { if [ "$__BU_MAIN_STAT_ECHO"           = 'true' ]; then return 0; else return 1; fi; }

# Checking if the library is into its initialization process ($__BU_MAIN_STAT_INITIALIZING).
function BU::Main::Status::CheckStatIsInitializing()  { if [ "$__BU_MAIN_STAT_INITIALIZING"   = "true" ]; then return 0; else return 1; fi; }

# Checking if the log redirection mode is active.
function BU::Main::Status::CheckStatIsLogging()       { if [ "$__BU_MAIN_STAT_LOG"            = 'true' ]; then return 0; else return 1; fi; }

# Checking if the initialization logs can be printed on the terminal.
function BU::Main::Status::CheckStatIsPrintingInit()  { if [ "$__BU_MAIN_STAT_PRINT_INIT_LOG" = 'true' ]; then return 0; else return 1; fi; }

# Checking if the text formatting is allowed.
function BU::Main::Status::CheckStatAllowFormatting() { if [ "$__BU_MAIN_STAT_TXT_FMT"        = 'true' ]; then return 0; else return 1; fi; }
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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
function BU::Main::Text::CutLogDateFromString()     { BU::Main::Text::CutLastFieldFromDelimiter "$1" '] ';  return 0; }

# Cut the dash written before a command option call (to be improved).
function BU::Main::Text::CutDashFromOption()        { BU::Main::Text::CutLastFieldFromDelimiter "$1" '-';   return 0; }

# Cut every part of a string before and with the delimiter.
function BU::Main::Text::CutFromCharacter()
{
    #**** Parameters ****
    p_target=$1         # String to process.
    # $2                # Delimiter.
    p_iterations=$3     # Iterations.

    #**** Code ****
    if [ -n "$p_iterations" ] && ! BU::IsInt "$p_iterations"; then
        BU::EchoWarning "$(BU::DechoHighlight "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1'
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
function BU::Main::Text::CutLastFieldFromDelimiter()
{
    #**** Parameters ****
    #   $1  --> string to process
    #   $2  --> delimiter

    #**** Code ****
    "$1"="${1##*$2)}"; echo -ne "$1" && return 0
}

# Cut any part of a string after a delimiter.
function BU::Main::Text::CutStringAfterDelim()
{
    #**** Parameters ****
    #   $1  --> string to process
    #   $2  --> delimiter
    #   $3  --> iterations

    #**** Code ****
    return
}

# Getting the size of a string.
function BU::Main::Text::GetStringSize()
{
    #**** Parameters ****
    p_string=$1

    #**** Variables ****
    v_size="${#p_string}"

    #**** Code ****
    echo "$v_size"; return 0
}

# Getting the number of words in a string.
function BU::Main::Text::GetStringWordsNumber()
{
    #**** Parameters ****
    p_string=$1

    #**** Code ****
    echo "$p_string" | wc -w; return 0
}

# Reverse words of a string according to a delimiter.

# Examples with the '|' and '/' delimiter:
# animal | big | car | donut    --> donut | car | big | animal
# /home/user/Documents          --> Documents/user/home
function BU::Main::Text::ReverseStringWordsOrder()
{
    #**** Parameters ****
    #   $1  --> string to process
    #   $2  --> delimiter

    #**** Code ****
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

# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.

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

