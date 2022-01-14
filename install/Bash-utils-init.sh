#!/usr/bin/env bash

# ----------------------
## SCRIPT'S INFORMATIONS

# Name : Bash-utils-init.sh
# Description : Library initializer file, initializing all the modules you need for your scripts.
# Author(s) : Dimitri Obeid
# Version : 3.0

# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your script file

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2

    exit 1
fi

# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### INITIALIZER RESOURCES - FUNCTIONS

## USEFUL FUNCTIONS

# Use this function to have a better view about a bug location during a "bash -x" debug.
function DbgMsg()
{
    #**** Parameters ****
    p_code=$1               # Exit code.
    p_sleep=$2              # Pause time in seconds.

    #**** Code ****
printf "

-------------------------------------------------
                      DEBUG
-------------------------------------------------

"

    if [ "$p_code" -eq 0 ]; then
        sleep "$p_sleep"

        return
    else
        exit 1		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
    fi
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE INITIALIZATION PROCESS TRANSLATIONS

# Rewriting the library's languages messages.
function Moduleinitializer_PrintModInitDefaultLanguage()
{
    #**** Parameters ****
    p_missing=$1            # Which file is missing (the one found in the "$PATH" global variable, or the one provided with the library).
    p_filepath=$2           # File which retrieval or sourcing failed.

    #**** Code ****
    if [ -z "$p_missing" ]; then
        echo >&2;
        echo "en | Warning : no given information about the « gettext.sh » file ('PATH', 'config-missing' or 'config-source' in first argument)" >&2
        echo "fr | Attention : aucune information donnée à propos du fichier « gettext.sh » ('PATH', 'config-missing' ou 'config-source' en premier argument)" >&2

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		echo >&2; exit 1

	elif [ -z "$p_filepath" ]; then
		echo >&2;
		echo "en | Warning : no file path has been passed as second argument" >&2
		echo "fr | Attention : aucun chemin de fichier n'a été passé en second argument" >&2

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		echo >&2; exit 1
    fi

    if [ "${p_missing^^}" = 'PATH' ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO SOURCE THE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2
        echo "FR | ATTENTION --> IMPOSSIBLE DE SOURCER LE FICHIER « $p_filepath » POUR LA TRADUCTION DES FICHIER « .po >>" >&2; echo >&2

    elif [ "${p_missing,,}" = "config-missing" ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO GET THE SPARE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2
        echo "FR | ATTENTION --> IMPOSSIBLE DE TROUVER LE FICHIER DE SECOURS « $p_filepath » POUR LA TRADUCTION DES FICHIERS « .po >>" >&2; echo >&2

    elif [ "${p_missing,,}" = 'config-source' ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO SOURCE THE SPARE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2
        echo "FR | ATTENTION --> IMPOSSIBLE DE SOURCER LE FICHIER DE SECOURS « $p_filepath » POUR LA TRADUCTION DES FICHIERS « .po >>" >&2; echo >&2
    fi

    echo >&2;
    echo "en | The rest of the library will use english as default language" >&2
    echo "fr | Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2

    echo >&2
}


function __bu_export_textdomain()
{
	#**** Variables ****
	export TEXTDOMAINDIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_INIT_DIR/" "po/")"

	#**** Code ****
    return 0
}

# Getting and sourcing the "gettext.sh" file.
function BU::ModuleInit::Get_gettext_sh_File()
{
    #**** Variables ****
    local v_path_file_path  # Getting the "gettext.sh" file from a path registered in the "$PATH" global variable.
        v_path_file_path="$(command -v "gettext.sh")"

    local v_spare_file_path # Defining a variable to store the spare gettext.sh file if its path have to move in the future.
        v_spare_file_path="$__BU_MODULE_UTILS_CONFIG_INIT_DIR/gettext.sh"

    #**** Code ****
    # Checking if the "gettext.sh" file exists in the "$PATH" global variable listed paths.
    if [ -f "$v_path_file_path" ]; then
        # shellcheck disable=SC1090
        source "$v_path_file_path" || Moduleinitializer_PrintModInitDefaultLanguage 'PATH' "$v_path_file_path"


    # Else, if the file is not found, the spare "gettext.sh" file which came with the library "install" folder is called
    else
        if [ -f "$v_spare_file_path" ]; then
            # shellcheck disable=SC1090
            source "$v_spare_file_path" || Moduleinitializer_PrintModInitDefaultLanguage 'config-source' "$v_spare_file_path"

        # Else, if the spare "gettext.sh" file is also missing.
        else
            Moduleinitializer_PrintModInitDefaultLanguage 'config-missing'
        fi
    fi
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES

# Asking to the user if (s)he wants to display the initialization logs on the screen (preferably before stopping the script's execution after a fatal error).
function BU::ModuleInit::AskPrintLog()
{
	#**** Code ****
	if [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" != '--print-init' ]; then
		echo "Do you want to display the initialization logs (stored in the « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » variable) ? (yes / no)"; echo

		read -rp "Enter your answer : " read_ask_print_log

		if [ "${read_ask_print_log,,}" = 'yes' ]; then
			BU::ModuleInit::PrintLog
		else
			echo; echo "The logs will not be displayed on your screen"; echo
		fi
	fi

	return 0
}

# Displaying the information on the initialized global variables
function BU::ModuleInit::DisplayInitGlobalVarsInfos()
{
    #**** Parameters ****
    local p_var_name=$1       # Name of the variable.
    local p_var_val=$2        # Value stored in the variable.
    local p_var_desc=$3       # Description of the variable.

    #**** Code ****
    BU::ModuleInit::Msg "Declared global variable : $p_var_name"

    BU::ModuleInit::Msg "Description : $p_var_desc"

    # If a variable is stored in the processed variable
    if [ -n "$p_var_val" ]; then
        BU::ModuleInit::Msg "Value --> $p_var_val"
    else
        BU::ModuleInit::Msg "No value stored in this variable"
    fi

    BU::ModuleInit::Msg
}

# Handling the initializer's messages. In case of an error, there's no need to call this function, as the error messages MUST be displayed.
function BU::ModuleInit::Msg()
{
    #**** Parameters ****
    local p_str=$1            # The string to display.
    local p_status=$2         # The "--print-init" parameter of the "BashUtils_SourcingModules" function.

    #**** Code ****
    # If no value is stored in the string parameter, it must be interpreted as a newline.
    if [ -z "$p_str" ]; then
        __BU_MODULE_UTILS_MSG_ARRAY+='\n'
    else
        __BU_MODULE_UTILS_MSG_ARRAY+="$__BU_MODULE_UTILS_DATE_LOG $p_str\n"
    fi

    # If the "--print-init" argument is passed at the "module" value
    if [ "$p_status" = '--print-init' ]; then
        if [ -z "$p_str" ]; then printf '\n'

        else printf "%s\n" "$p_str"; fi
    fi

    return 0
}

# Printing the initialization on the screen. Although this function is called if the '--print-init' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.
function BU::ModuleInit::PrintLog()
{
    #**** Code ****
    echo

    echo "Here are the initialization logs"
    echo

    echo "------------------"
    echo "INTIALIZATION LOGS"
    echo "------------------"

    echo

    for value in "${__BU_MODULE_UTILS_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "$value"
    done

    echo ">>>>> END OF THE INITIALIZATION LOGS"; echo

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array, and it calls this function.
}

# Print an error message in the log storage variable.
function BU::ModuleInit::PrintLogError()
{
    #**** Parameters ****
    local p_desc=$1           # Description of the error.
    local p_lineno=$2         # Line where the error happened.

    #**** Code ****
    BU::ModuleInit::Msg >&2

    BU::ModuleInit::Msg "ERROR : DESC = $p_desc | LINE = $p_lineno" >&2
    BU::ModuleInit::Msg >&2

    return 0
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION

function BU::ModuleInit::AbortMsg() { echo >&2; echo "Aborting the library's initialization" >&2; echo >&2; }

# Checking the currently used Bash language's version.
function BU::ModuleInit::CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2
		echo >&2

		echo -e "Your Bash version is : $BASH_VERSION" >&2
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library" >&2
		echo >&2

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		exit 1
	fi
}

# Check if the given path exists (This function is called by the "BU::ModuleInit::SourcingFailure()" function).
function BU::ModuleInit::CheckPath()
{
    #**** Parameters ****
    local p_path=$1         # Path of the target file or directory.
    local p_target=$2       # Specify if the target is a directory or a file.

    #**** Code ****
    if [ -z "$p_path" ]; then
        printf "<No file path>" >&2; return 1

    else
        if [ -z "$p_target" ]; then
            echo  >&2; echo ">>>>> BASH-UTILS ERROR >>>>> IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » >>>>> NO SPECIFICATION ABOUT THE TARGET !!!" >&2; echo >&2

            echo "Please specify if the target is a file or a folder by passing 'f' or 'd' as second argument when you call the « ${FUNCNAME[0]} » function." >&2; echo >&2; return 1
        else
            if [[ "$p_target" = [D-d] ]]; then
                if [ -d "$p_path" ]; then
                    printf "%s" "$p_path"; return 0
                else
                    printf "%s (bad directory : not found)" "$p_path" >&2; return 1
                fi
            elif [[ "$p_target" = [F-f] ]]; then
                if [ -f "$p_path" ]; then
                    printf "%s" "$p_path"; return 0
                else
                    printf "%s (bad file path : not found)" "$p_path" >&2; return 1
                fi
            else
                echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> WARNING : THE « p_target » PARAMETER'S VALUE IS « $p_target », NOT 'D', 'd', 'F' OR 'f'" >&2; echo >&2; return 1
            fi
        fi
    fi
}

# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function BU::ModuleInit::FindPath()
{
	#	$1	--> Parent directory.
    #	$2	--> Targeted directory or file.
    find "$1" -maxdepth 1 -iname "$2"  -print 2>&1 | grep -v "Permission denied" ||
	{
		echo >&2; echo "${FUNCNAME[0]} --> WARNING : UNABLE TO FIND THIS PATH --> $1/$2" >&2; echo >&2

		return 1
	}; return 0
}

# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).
function BU::ModuleInit::GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || { echo >&2; echo -e "Unable to get the module's name from the parent directory name" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; }; pwd -P)"

    echo "${v_module##*/}"; return 0
}

# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
function BU::ModuleInit::ListInstalledModules()
{
    #**** Variables ****
    local v_module_tmp_d="$__BU_MODULE_UTILS_ROOT/tmp"

    local v_module_conf_f="$v_module_tmp_d/BU_modules_config_dir.out"
    local v_module_diff_f="$v_module_tmp_d/BU_modules_init_diff.out"
    local v_module_init_f="$v_module_tmp_d/BU_modules_init_dir.out"

    #**** Code ****
    if [ ! -d "$v_module_tmp_d" ]; then
        mkdir -p "$v_module_tmp_d" ||
		{
			echo "In « ${BASH_SOURCE[0]}, line $(( LINENO-2 )) » Unable to create the logs temporary directory « tmp » in the « $__BU_MODULE_UTILS_ROOT/ » directory" >&2; echo >&2

			echo "If the problem persists, please create this folder manually" >&2; echo >&2

			BU::ModuleInit::AskPrintLog; exit 1
		}
    fi

    if [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ] && [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then

																				# In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -1 "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR"	> "$v_module_conf_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; }
        ls -1 "$__BU_MODULE_UTILS_MODULES_DIR"			> "$v_module_init_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; }

        if diff "$v_module_conf_f" "$v_module_init_f" > "$v_module_diff_f"; then
            echo; echo "INSTALLED MODULES LIST :"; echo; sleep ".5"

            cat "$v_module_conf_f"; echo; sleep 1
        else
            echo >&2; echo "WARNING ! A MODULE OR MORE ARE MISSING IN THE « $__BU_MODULE_UTILS_CONFIG_MODULES_DIR » OR IN THE « $__BU_MODULE_UTILS_MODULES_DIR » FOLDERS" >&2; echo >&2

            echo "MODULES CONFIGURATION FOLDER LIST :" >&2; echo >&2

            cat "$v_module_conf_f" >&2; echo >&2

            echo "MODULES INITIALIZATION FOLDER LIST :" >&2; echo >&2

            cat "$v_module_init_f"; echo >&2; echo >&2

			# Getting the differences between the two files.
			echo "THE DIFFERENCES BETWEEN THESE TWO FILES ARE LISTED BELOW" >&2; echo >&2

			sdiff "$v_module_conf_f" "$v_module_conf_f"; echo >&2
        fi
    else
        if [ ! -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ] && [ ! -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES CONFIGURATION FOLDER AND THE MODULES INITIALIZATION FOLDER ARE MISSING !" >&2
        elif [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES CONFIGURATION FOLDER IS MISSING !" >&2
        elif [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES INITIALIZATION FOLDER IS MISSING !" >&2
        fi

		echo >&2
    fi

	BU::ModuleInit::AskPrintLog

    exit 1
}

# Printing an error message if a file cannot be sourced.
function BU::ModuleInit::SourcingFailure()
{
    #**** Parameters ****
    local p_path=$1         # Path of the file that cannot be sourced.
    local p_module=$2       # Name of the module.

    #**** Code ****
    BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg ">>>>> BASH-UTILS ERROR >>>>> UNABLE TO SOURCE THIS « $p_module » MODULE'S FILE --> $(BU::ModuleInit::CheckPath "$p_path" 'f')" >&2; BU::ModuleInit::Msg >&2; BU::ModuleInit::AskPrintLog; exit 1
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES PROCESSING

function BU::ModuleInit::ProcessFirstModuleArguments()
{
    #**** Parameters ****
    local p_module=$1   # Mmodules to include passed as argument, with its own parameters.
    local p_count=$2    # Counting the times the function was called in the "BashUtils_InitModules" function's main loop.

    #**** Variables ****
    local v_module_name
        v_module_name="$(echo "$p_module" | cut -d' ' -f1)"

    #**** Code ****
    # Checking if the "module --" value is passed as first argument, in order to configure immediately the initialization language and the authorization to display the initialization logs on the screen.

    # These numbers stored in the "$p_count" variable refer to the modules indexes.
    if [ "$p_count" -eq 0 ]; then

        # If the "module" value is passed without parameters.
        if [[ "$p_module" == "$v_module_name" ]]; then
            BU::ModuleInit::PrintLogError "« module » value passed without argument(s)" "$LINENO"

            echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE IS PASSED WITHOUT PARAMETERS" >&2
            echo >&2; echo "Please pass a valid argument between the double quotes where you pass the « module » value" >&2

            BU::ModuleInit::AbortMsg

            BU::ModuleInit::AskPrintLog; exit 1
    
        elif [[ "$p_module" == 'module --'* ]]; then

            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            IFS='' read -ra module_array <<< "$p_module"

            for module_args in "${module_array[@]}"; do

                # If the "module" value's argument is "--lang="
                if [[ "$module_args" == *'--lang=en_US' ]]; then

                    # Temporary solution to avoid crashes when executing this file.
                    true

                # Else, if the "module" value's argument is "--print-init" or "--nolog" (WARNING : these arguments are incompatible with each other).
                elif [[ "$module_args" == *'--print-init' ]] || [[ "$module_args" = *'--nolog' ]]; then

                    if [[ "$module_args" == *'--print-init' ]]; then

                        # By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
                        # To print the initialization logs on the screen, you have to pass the 'print-init' argument when you pass the "module" value as first argument
                        __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="--print-init"

                        # Calling the function that prints the former log entries on the terminal.
                        # BU::ModuleInit::PrintLog

                    elif [[ "$module_args" = *'--nolog' ]]; then

                        # If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_UTILS_MSG_ARRAY" variable,
                        # the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
                        true
                    fi

                # Else, if the "module" value's argument is not a supported one.
                else
                    BU::ModuleInit::PrintLogError "Bad module value's argument" "$LINENO"

                    echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE'S PARAMETER « $module_args » IS NOT SUPPORTED" >&2;
                    echo >&2; echo "Please remove this value, called at the index « $p_count »" >&2

                    BU::ModuleInit::AbortMsg

                    BU::ModuleInit::AskPrintLog; exit 1
                fi
            done
        fi

    # Else, if the the "module --" value is passed as first argument, but the "main" module is missing.
    elif [ "$p_count" -eq 1 ] && [[ "$p_module" != 'main' ]] || [[ "$p_module" != "main --"* ]]; then
        BU::ModuleInit::PrintLogError "Main module not passed after the « module » value" "$LINENO"

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « main » MODULE IS NOT PASSED AS SECOND ARGUMENT, AFTER THE FIRST ARGUMENT : module" >&2
        echo >&2; echo "Please do so by setting the « $p_module » module's argument in second position when you call the « ${FUNCNAME[0]} » function in your script" >&2

        BU::ModuleInit::AbortMsg

        BU::ModuleInit::AskPrintLog; exit 1

    # Else, if the "main" module is passed as second argument, after the "module" value.
    elif [ "$p_count" -eq 1 ] && [[ "$p_module" == 'main' ]] || [[ "$p_module" == "main --"* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0

    # Else, if the "module --*" value is not passed as first argument.

    # Checking if the "main" module is passed as first argument, in order to avoid unexpected bugs during the other modules' initialization process.
    elif [ "$p_count" -eq 0 ] && [[ "$p_module" == 'main' ]] || [[ "$p_module" == "main --"* ]]; then

        # Temporary solution to avoid crashes when executing this file.
        true

    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "$p_count" -ge 1 ]; then
        return 0

    else
        BU::ModuleInit::PrintLogError "No « module » value and no « main » module passed as first and second arguments" "$LINENO"

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module -- » VALUE WITH IT'S PARAMETERS, AND THE « main » MODULE ARE NOT PASSED AS FIRST ARGUMENT" >&2
        echo >&2; echo "Please do so by modifying the « main » module's argument position in your script, and optionnaly adding the « module » value with the needed mandatory arguments" >&2

        BU::ModuleInit::AbortMsg

        echo >&2; BU::ModuleInit::AskPrintLog; return 1
    fi

    return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGIN INITIALIZATION PROCESS

## CHECKING IF THE CURRENT SHELL IS BASH

if [ "${SHELL##*/}" != 'bash' ]; then
    echo >&2;
    echo "ERROR : Your current shell interpreter is not Bash, but « ${SHELL##*/} »" >&2
    echo "ERREUR : Votre interpréteur shell actuel n'est pas le Bash, mais le « ${SHELL##*/} »" >&2

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
    echo >&2; exit 1
fi

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_UTILS_ROOT_HOME="$HOME"

if [ -d "$__BU_MODULE_UTILS_ROOT_HOME/.Bash-utils" ]; then
	__BU_MODULE_UTILS_ROOT="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT_HOME" ".Bash-utils")"
	__BU_MODULE_UTILS_INITALIZER_PATH="${BASH_SOURCE[0]}"

    # Configurations directories
	__BU_MODULE_UTILS_CONFIG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "config")"
    __BU_MODULE_UTILS_CONFIG_INIT_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "initializer")"
	__BU_MODULE_UTILS_CONFIG_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "modules")"

    # Modules directories
	__BU_MODULE_UTILS_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "modules")"

	# Files
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME="Bash-utils-root-val.path"
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT"
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR" "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME")"

	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME="Bash-utils-root-val-ROOT.path"
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT"
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME")"

	# Misc
	__BU_MODULE_UTILS_DATE_LOG="[ $(date +"%Y-%m-%d %Hh:%Mm:%Ss") ]"
else
	echo >&2; echo "IN ${BASH_SOURCE[0]}, LINE $LINENO --> ERROR !" >&2; echo >&2

	echo "The Bash Utils configurations root folder « .Bash-utils » doesn't exists in your home directory." >&2; echo >&2
	echo "Please copy this folder in your home directory. You can install it by executing the « install_and_update.sh » file, or you can find it in the « Bash-utils/install directory »." >&2; echo >&2

	BU::ModuleInit::AbortMsg

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
	exit 1
fi

# -----------------------------------------------

## CALLING THE NEEDED FUNCTIONS (DEFINED IN THIS FILE) THAT MUST BE CALLED BEFORE INITIALIZING THE FIRST GLOBAL VARIABLES

# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!! --> Setting the whole project's language by getting and sourcing the "gettext.sh" file.
BU::ModuleInit::Get_gettext_sh_File

# Checking the currently used Bash language's version.
BU::ModuleInit::CheckBashMinimalVersion

## DEFINING NEW GLOBAL VARIABLES TO STORE THE INITIALIZATION LOGS AND DISPLAY THEM OR NO

# This global variable stores the log messages.
declare __BU_MODULE_UTILS_MSG_ARRAY=()

# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.

# By default, it stores no value, and should stay like this.
declare __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION=''

# -----------------------------------------------

## CALLING THE OTHER FUNCTIONS FOR INITIALIZATION

BU::ModuleInit::Msg "INITIALIZING THE MODULES"
BU::ModuleInit::Msg

BU::ModuleInit::Msg "INITIALIZING THE GLOBAL VARIABLES"
BU::ModuleInit::Msg

BU::ModuleInit::Msg "Initializing the modules manager's root directory variables";       BU::ModuleInit::Msg
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_ROOT_HOME"             	"$__BU_MODULE_UTILS_ROOT_HOME"     "This global variable stores the path to the parent directory of each module configuration directories"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_ROOT"                  	"$__BU_MODULE_UTILS_ROOT"          "This global variable stores the path to the configuration directory of each module"
BU::ModuleInit::Msg

BU::ModuleInit::Msg "Initializing the configuration directories paths";                  BU::ModuleInit::Msg
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_DIR"            	"$__BU_MODULE_UTILS_CONFIG_DIR"            "This global variable stores the path to the configuration directory of each module"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_INIT_DIR"       	"$__BU_MODULE_UTILS_CONFIG_INIT_DIR"       "This global variable stores the path of the configuration folder used by the module initialization file"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_MODULES_DIR"    	"$__BU_MODULE_UTILS_CONFIG_MODULES_DIR"    "This global variable stores the configuration folder of the current module"
BU::ModuleInit::Msg

BU::ModuleInit::Msg "Initializing the modules initializers files directory";             BU::ModuleInit::Msg
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_MODULES_DIR"           	"$__BU_MODULE_UTILS_MODULES_DIR"           "This global variable stores the path to the initialization files of the current module."
BU::ModuleInit::Msg

BU::ModuleInit::Msg "Initializing the variables of the file which contains the library's root folder's path"; BU::ModuleInit::Msg
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME"               "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME"        "Name of the file containing the path to the root folder of the library"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR"         "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR"  "Name of the parent folder of the file containing the path to the root folder of the library"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH"               "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH"        "Path of the file containing the library's root folder's path"
BU::ModuleInit::Msg

BU::ModuleInit::Msg "Initializing the variables of the file which contains the library's root folder's path (installed with the root privileges with the installer file)"; BU::ModuleInit::Msg
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME"          "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME"       "Name of the file containing the path to the root folder of the library (if this file is owned by the super-user)"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR"    "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "Name of the parent folder of the file containing the path to the root folder of the library (if this file is owned by the super-user)"
BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH"          "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH"       "Path of the file containing the library's root folder's path (if this file is owned by the super-user)"
BU::ModuleInit::Msg

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SOURCING THE MODULES

## LIBRARY SOURCING'S FUNCTION

# Please call immediately this function once this file is sourced, and pass it each module you need as arguments, and their supported options.
function BashUtils_InitModules()
{
	#**** Parameters ****
	local p_modules_list=("$@")	# List of all the modules to include passed as arguments

	#**** Variables ****
    local v_index=0     # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!

	#**** Code ****
	## Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then
		printf "WARNING !!! YOU MUST PASS A MODULE NAME WHEN YOU CALL THE « %s » MODULE INITIALIZATION FUNCTION\n\n" "${FUNCNAME[0]}" >&2; return 1
	fi

    # Writing the list of the 
	BU::ModuleInit::Msg "INTIALIZING THESE MODULES :"

	for module_args in "${p_modules_list[@]}"; do
        if [[ "$module_args" == 'module --'* ]]; then
            BU::ModuleInit::Msg "Arguments passed to configure the initialization process : $module_args"; BU::ModuleInit::Msg
        else
            i="$(( i+1 ))" # Module's array index incrementer.

            # Name and arguments of the module stored as the nth index of the module list array.
            BU::ModuleInit::Msg "Module $i : $module_args"
        fi
	done

	BU::ModuleInit::Msg

	# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
	for module in "${p_modules_list[@]}"; do

		## DEFINING VARIABLES FOR EACH MODULE TO BE INITIALIZED

		# Defining variables for each iteration.
		local v_module_name
            v_module_name="$(echo "$module" | cut -d' ' -f1)"

		# Defining a global variable which stores the module's name with it's arguments, in order to transform it in an array of strings to be processed in this loop (for each module, in their "initializer.sh" file).
		if [[ "${p_modules_list[i]}" = "$v_module_name --*" ]]; then
			__BU_MODULE_UTILS_MODULE_ARGS="$module"
		fi

		# -----------------------------------------------

		## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)

        BU::ModuleInit::ProcessFirstModuleArguments "$module" "$v_index"

        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU::ModuleInit::ProcessFirstModuleArguments()" function).
        if [[ "$module" != 'module --'* ]]; then

            # -----------------------------------------------

            # MODULES' CONFIGURATION FILES SOURCING

            # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name"; then
                BU::ModuleInit::PrintLogError "The $v_module_name module's configurations directory does not exists" "$LINENO"

                printf '\n' >&2;

                printf "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-5 )) --> WARNING : THE « %s » module is not installed, doesn't exists, or the « ls » command had pointed elsewhere, towards an unexistent directory !!!\n\n" "$v_module_name" >&2;

                printf "Please check if the module's configuration files exist in this folder --> %s\n\n" "$__BU_MODULE_UTILS_CONFIG_DIR/$v_module_name" >&2

                # Listing all the installed modules in the user's hard drive.
                BU::ModuleInit::ListInstalledModules

                # No need to call the function "BU::ModuleInit::AskPrintLog" function, it's already called in the previous function "BU::ModuleInit::ListInstalledModules".

                return 1
            else
                BU::ModuleInit::Msg "Sourcing the $v_module_name module's main configuration file"; BU::ModuleInit::Msg

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name" "module.conf")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR/$v_module_name/module.conf" "$v_module_name"; exit 1; }
            fi

            # -----------------------------------------------

            # MODULES' INITIALIZATION FILES SOURCING

            # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name"; then
                BU::ModuleInit::PrintLogError "The $v_module_name module's initialization files directory does not exists" "$LINENO"

                printf '\n' >&2;

                printf "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-5 )) --> WARNING : THE « %s » module is not installed, doesn't exists, or the « ls » command had pointed elsewhere, towards an unexistent directory !!!\n\n" "$v_module_name" >&2

                printf "Install this module, or check its name in this folder --> %s\n\n" "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name" >&2

                BU::ModuleInit::AbortMsg

                return 1
            else
                BU::ModuleInit::Msg "Sourcing the $v_module_name module's initialization file"; BU::ModuleInit::Msg

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name" "Initializer.sh")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" "$v_module_name"; exit 1; }

                BU::HeaderGreen "END OF THE $(BU::DechoHighlight "$v_module_name") MODULE INITIALIZATION !"
            fi

            # Incrementing the 
            v_index="$(( v_index+1 ))"
        fi
	done

	# /////////////////////////////////////////////////////////////////////////////////////////////// #

	#### ENDING THE WHOLE INITIALIZATION PROCESS

	BU::HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(BU::DechoGreen "$__BU_MAIN_PROJECT_FILE_PATH") !"

	# This is the ONLY line where the "$__BU_MAIN_STAT_INITIALIZING" global status variable's value can be modified.
	# DO NOT set it anymore to "true", or else your script can be prone to bugs.
    if  BU::Main::Status::CheckStatIsInitializing; then
        BU::Main:Status::ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO"
	fi

	# Note : the "$__BU_MODULE_UTILS_MSG_ARRAY" variable is purged from the logged messages after writing its content in the project's log file.

	return 0
}
