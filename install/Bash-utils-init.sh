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
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;

    exit 1;
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
    #**** Variables ****
    local v_ask="Do you want to display the initialization logs (stored in the « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » variable) ? (yes / no)"

	#**** Code ****
	if [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" == '--log-display' ]; then
        echo

        BU::ModuleInit::MsgLine "${#v_ask}"

		echo "$v_ask"; echo

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
    local p_str=$1;     # The string to display.
    local p_option=$2;  # The "echo" command's options.

    #**** Code ****
    # If the '--log-display' argument is passed as a 'module' parameter, then every messages must
    # be printed on the screen and redirected towards the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
    if [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" = '--log-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+=''; echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+="$__BU_MODULE_UTILS_DATE_LOG $p_str";

                    echo -ne "$p_str"; fi;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+='\n'; echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+="$__BU_MODULE_UTILS_DATE_LOG $p_str\n";

                    echo -e "$p_str"; fi;;
        esac

    # Else, if the '--log-shut' argument is passed as a 'module' parameter, then every initialization
    # messages must be redirected towards the "/dev/null" virtual device file, and the array must be emptied.
    elif [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" = '--log-shut' ]; then
        echo "$p_str" > /dev/null; __BU_MODULE_UTILS_MSG_ARRAY='';

    # Else, if the '--log-shut-display' argument is passed as a 'module' parameter, then
    # every initialization messages must be redirected to the screen only, not to the array.
    elif [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" = '--log-shut-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    echo -ne ''

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    echo -ne "$p_str"; fi;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    echo -e "$p_str"; fi;;
        esac

    # Else, if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable stores no value (empty by default), then every
    # initialization messages must be stored in the "$__BU_MODULE_UTILS_MSG_ARRAY" array without being printed on the screen.
    elif [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+='';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+="$__BU_MODULE_UTILS_DATE_LOG $p_str";

                    echo -ne "$p_str"; fi;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+='\n'; echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+="$__BU_MODULE_UTILS_DATE_LOG $p_str\n"; fi;;
        esac

    # Else, if an incorrect value is passed as "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global varaible's value.
    else
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> WARNING : THE « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » GLOBAL VARIABLE'S VALUE « $__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » IS NOT SUPPORTED" >&2;
        echo >&2; echo "Please change its value by '--log-display', '--log-shut', '--log-shut-display' or an empty value where you (re)defined the value." >&2;

        BU::ModuleInit::MsgAbort;
        
        BU::ModuleInit::AskPrintLog;

        exit 1;
    fi

    return 0
}

# Drawing a line with a character, that is the same lenght as a string, in order to separate the messagges from different steps.
# The "number" value must be passed as argument like this : BU::ModuleInit::MsgLine "${#string}".
function BU::ModuleInit::MsgLine() { number=$1; for ((i=0; i<number; i++)); do printf "-"; done; echo; }

# Displaying a text when the script's execution must be stopped.
function BU::ModuleInit::MsgAbort() { echo >&2; echo "Aborting the library's initialization" >&2; echo >&2; }

# Printing the initialization on the screen. Although this function is called if the '--log-display' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.
function BU::ModuleInit::PrintLog()
{
    #**** Variables ****
    local v_init_logs_str="INTIALIZATION LOGS";
    local v_here="Here are the initialization logs";

    #**** Code ****
    echo

    BU::ModuleInit::MsgLine "${#v_here}";
    echo "$v_here";
    echo;

    BU::ModuleInit::MsgLine "${#v_init_logs_str}";
    echo "$v_init_logs_str";
    BU::ModuleInit::MsgLine "${#v_init_logs_str}";

    echo

    for value in "${__BU_MODULE_UTILS_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "$value";
    done

    echo ">>>>> END OF THE INITIALIZATION LOGS"; echo;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array, and it calls this function.
}

# Print an error message in the log storage variable.
function BU::ModuleInit::PrintLogError()
{
    #**** Parameters ****
    local p_desc=$1;    # Description of the error.
    local p_lineno=$2;  # Line where the error happened.

    #**** Variables ****
    local v_string="ERROR : DESC = $p_desc | LINE = $p_lineno";

    #**** Code ****
    BU::ModuleInit::Msg >&2;

    BU::ModuleInit::Msg "$(BU::ModuleInit::MsgLine "${#v_string}")";

    BU::ModuleInit::Msg "$v_string" >&2;
    BU::ModuleInit::Msg >&2;

    return 0
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION

# Checking the currently used Bash language's version.
function BU::ModuleInit::CheckBashMinimalVersion()
{
	if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
		printf "BASH-UTILS MODULES INITIALIZATION ERROR : In \n\t%s,\n\tline $(( LINENO-1 ))\n\n", "$(basename "${BASH_SOURCE[0]}")" >&2;
		echo -e "This Bash library requires at least the Bash language's version 4.0.0" >&2;
		echo >&2;

		echo -e "Your Bash version is : $BASH_VERSION" >&2;
		echo >&2

		echo -e "Please install at least the Bash version 4.0.0 to use this library" >&2;
		echo >&2;

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		exit 1;
	fi
}

# Check if the given path exists (This function is called by the "BU::ModuleInit::SourcingFailure()" function).
function BU::ModuleInit::CheckPath()
{
    #**** Parameters ****
    local p_path=$1;    # Path of the target file or directory.
    local p_target=$2;  # Specify if the target is a directory or a file.

    #**** Code ****
    if [ -z "$p_path" ]; then
        printf "<No file path>" >&2; return 1;

    else
        if [ -z "$p_target" ]; then
            echo  >&2; echo ">>>>> BASH-UTILS ERROR >>>>> IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » >>>>> NO SPECIFICATION ABOUT THE TARGET !!!" >&2; echo >&2;

            echo "Please specify if the target is a file or a folder by passing 'f' or 'd' as second argument when you call the « ${FUNCNAME[0]} » function." >&2; echo >&2; return 1;
        else
            if [[ "$p_target" = [D-d] ]]; then

                if [ -d "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s (bad directory : not found)" "$p_path" >&2; return 1;
                fi

            elif [[ "$p_target" = [F-f] ]]; then

                if [ -f "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s (bad file path : not found)" "$p_path" >&2; return 1;
                fi
            else
                echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> WARNING : THE « p_target » PARAMETER'S CURRENT VALUE IS « $p_target », NOT THE EXPECTED 'D', 'd', 'F' OR 'f'" >&2; echo >&2; return 1;
            fi
        fi
    fi
}

# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function BU::ModuleInit::FindPath()
{
	#	$1	--> Parent directory.
    #	$2	--> Targeted directory or file.
    find "$1" -maxdepth 1 -iname "$2" -print 2>&1 | grep -v "Permission denied" ||
	{
        if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_EXISTS" ]; then
            echo >&2; echo "${FUNCNAME[0]} --> WARNING : UNABLE TO FIND THIS PATH --> $1/$2" >&2; echo >&2;
        else
            BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg "${FUNCNAME[0]} --> WARNING : UNABLE TO FIND THIS PATH --> $1/$2" >&2; BU::ModuleInit::Msg >&2;
        fi

        return 1;
	}; return 0;
}

# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).
function BU::ModuleInit::GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || { echo >&2; echo -e "Unable to get the module's name from the parent directory name" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; }; pwd -P)";

    echo "${v_module##*/}"; return 0;
}

# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
function BU::ModuleInit::ListInstalledModules()
{
    #**** Variables ****
    local v_module_tmp_d="$__BU_MODULE_UTILS_ROOT/tmp";

    local v_module_conf_f="$v_module_tmp_d/BU_modules_config_dir.out";
    local v_module_diff_f="$v_module_tmp_d/BU_modules_init_diff.out";
    local v_module_init_f="$v_module_tmp_d/BU_modules_init_dir.out";

    #**** Code ****
    if [ ! -d "$v_module_tmp_d" ]; then
        mkdir -p "$v_module_tmp_d" ||
		{
            BU::ModuleInit::PrintLogError "Unable to create the logs temporary directory « tmp » in the « $__BU_MODULE_UTILS_ROOT/ » directory" "$LINENO";

			echo "In « ${BASH_SOURCE[0]}, line $(( LINENO-4 )) » Unable to create the logs temporary directory « tmp » in the « $__BU_MODULE_UTILS_ROOT/ » directory" >&2; echo >&2;

			echo "If the problem persists, please create this folder manually" >&2; echo >&2;

			BU::ModuleInit::AskPrintLog; exit 1;
		}
    fi

    if [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ] && [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then

																				# In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -1 "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR"	> "$v_module_conf_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; };
        ls -1 "$__BU_MODULE_UTILS_MODULES_DIR"			> "$v_module_init_f"    || { echo >&2; echo "FUNCTION ${FUNCNAME[0]}, LINE $LINENO >>>>> Warning ! the ls -l command pointed towards an unexistent path" >&2; echo >&2; BU::ModuleInit::AskPrintLog; exit 1; };

        if diff "$v_module_conf_f" "$v_module_init_f" > "$v_module_diff_f"; then
            echo; echo "INSTALLED MODULES LIST :"; echo; sleep ".5";

            cat "$v_module_conf_f"; echo; sleep 1;
        else
            echo >&2; echo "WARNING ! A MODULE OR MORE ARE MISSING IN THE « $__BU_MODULE_UTILS_CONFIG_MODULES_DIR » OR IN THE « $__BU_MODULE_UTILS_MODULES_DIR » FOLDERS" >&2; echo >&2;

            echo "MODULES CONFIGURATION FOLDER LIST :" >&2; echo >&2;

            cat "$v_module_conf_f" >&2; echo >&2;

            echo "MODULES INITIALIZATION FOLDER LIST :" >&2; echo >&2;

            cat "$v_module_init_f"; echo >&2; echo >&2;

			# Getting the differences between the two files.
			echo "THE DIFFERENCES BETWEEN THESE TWO FILES ARE LISTED BELOW" >&2; echo >&2;

			sdiff "$v_module_conf_f" "$v_module_conf_f"; echo >&2;
        fi
    else
        if [ ! -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ] && [ ! -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES CONFIGURATION FOLDER AND THE MODULES INITIALIZATION FOLDER ARE MISSING !" >&2;
        elif [ -d "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES CONFIGURATION FOLDER IS MISSING !" >&2;
        elif [ -d "$__BU_MODULE_UTILS_MODULES_DIR" ]; then
            echo "IN « ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) » --> WARNING ! THE MODULES INITIALIZATION FOLDER IS MISSING !" >&2;
        fi

		echo >&2;
    fi

	BU::ModuleInit::AskPrintLog;

    exit 1
}

# Printing an error message if a file cannot be sourced.
function BU::ModuleInit::SourcingFailure()
{
    #**** Parameters ****
    local p_path=$1;    # Path of the file that cannot be sourced.
    local p_module=$2;  # Name of the module.

    #**** Code ****
    BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg ">>>>> BASH-UTILS ERROR >>>>> UNABLE TO SOURCE THIS « $p_module » MODULE'S FILE --> $(BU::ModuleInit::CheckPath "$p_path" 'f')" >&2; BU::ModuleInit::Msg >&2; BU::ModuleInit::AskPrintLog; exit 1;
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE MODULES PROCESSING

# Add value in the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array that stores the initialization log output, according to the "$__BU_MAIN_STAT_PRINT_INIT_LOG" status variables's value :
#   "true"  --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array AND display text to the terminal.
#   "false" --> store the text into the "$__BU_MAIN_MODULE_STR_ARRAY_LOG_DATE" array WITHOUT displaying any text.

# Processing the "module" value's parameters.
function BU::ModuleInit::ProcessFirstModuleParameters()
{
    #**** Parameters ****
    local p_module=$1;  # Mmodules to include passed as argument, with its own parameters.
    local p_count=$2;   # Counting the times the function was called in the "BashUtils_InitModules" function's main loop.

    #**** Variables ****
    local v_module_name;
        v_module_name="$(echo "$p_module" | cut -d' ' -f1)";

    #**** Code ****

    # -----------------------------------------------

    ## PROCESSING THE 'module' VALUE'S ARGUMENTS VALUES

    # Checking if the "module --" value is passed as first argument, in order to configure immediately the initialization language and the authorization to display the initialization logs on the screen.

    # These numbers stored in the "$p_count" variable refer to the modules indexes.
    if [ "$p_count" -eq 0 ]; then

        # If the "module" value is passed without parameters.
        if [[ "$p_module" == "$v_module_name" ]]; then
            BU::ModuleInit::PrintLogError "« module » value passed without argument(s)" "$LINENO";

            echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE IS PASSED WITHOUT PARAMETERS" >&2;
            echo >&2; echo "Please pass a valid argument between the double quotes where you pass the « module » value" >&2;

            BU::ModuleInit::MsgAbort;

            BU::ModuleInit::AskPrintLog; exit 1;
    
        elif [[ "$p_module" == 'module --'* ]]; then

            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            read -ra module_array <<< "$p_module";

			# Unsetting the "module" value from the newly created array, in order to avoid an "unsupported argument" error.
			unset module_array[0];

            for module_args in "${module_array[@]}"; do
                echo "$module_args";


                # -----------------------------------------------

                ## MODULE : USER'S LANGUAGE PROCESSING

                # If the "module" value's argument is "--lang="
                if [[ "$module_args" == *'--lang=en_US' ]]; then

                    # Temporary solution to avoid crashes while executing this file, before .
                    true;

                # -----------------------------------------------

                ## MODULE : LOG MESSAGES PROCESSING

                # Defining a function to optimize the displaying of errors for the 3 "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable's accepted values.
                function BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionErrorOptimize()
                {
                    #**** Parameters ****
                    local p_value=$1;   # New value to assign to the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable.

                    #**** Code ****
                    # If the current value AND the new value are the same.
                    if [ "$p_value" = "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
                        BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : « module » value's argument « $p_value » passed twice" "$LINENO";

                        echo >&2; echo "In « ${BASH_SOURCE[0]} », line $(( LINENO-3 )) --> Warning : you already passed the « $p_value » as « module » value's argument for the « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » global variable" >&2;

                        echo >&2; return 1;
                    else
                        BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : « module » value's arguments « $p_value » and « $__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » passed together" "$LINENO";

                        echo >&2; echo "In « ${BASH_SOURCE[0]} », line $(( LINENO-3 )) --> Warning : the « module » value's parameters '--log-display', '--log-shut' and / or '--log-shut-display' are incompatible with each other" >&2;
                        echo >&2; echo "Please choose only one of these parameters" >&2; echo >&2;

                        echo >&2;
                        echo "Current value stored in the permission variable : $__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" >&2;
                        echo "New value : $p_value" >&2;

                        echo >&2; return 1;
                    fi
                }

                # Else, if the "module" value's argument is "--log-display", "--log-shut" or '--log-shut-display' (WARNING : these arguments are incompatible with each other).
                elif [[ "$module_args" == *'--log-'* ]]; then

                    if [[ "$module_args" == '--log-display' ]]; then

                        if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then

                            # By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
                            # To print the initialization logs on the screen, you have to pass the '--log-display' argument when you pass the "module" value as first argument
                            __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="--log-display";

                        # Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
                        # by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
                        else
                            BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionErrorOptimize "$module_args"
                        fi

                        if [[ "$module_args" = '--log-shut' ]]; then

                            if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
                                # If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_UTILS_MSG_ARRAY" variable,
                                # the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
                                __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION='--log-shut';

                                # Erasing the content of the "$__BU_MODULE_UTILS_MSG_ARRAY" variable, since it's no more useful.
                                __BU_MODULE_UTILS_MSG_ARRAY=''
                            
                            # Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
                            # by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
                            else
                                BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionErrorOptimize "$module_args"
                            fi
                        
                        elif [[ "$module_args" = '--log-shut-display' ]]; then

                            if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
                                # If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_UTILS_MSG_ARRAY" variable,
                                # but all the log messages will be displayed on the screen.
                                __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION='--log-shut-display';

                            # Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
                            # by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
                            else
                                BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionErrorOptimize "$module_args"
                            fi
                        fi

                    # Else, if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" already contains a value.
                    else

                    fi

                # -----------------------------------------------

                ## MODULE : HANDLING UNSUPPORTED ARGUMENTS

                # Else, if the "module" value's argument is not a supported one.
                else
                    BU::ModuleInit::PrintLogError "Bad module value's argument" "$LINENO";

                    echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE'S PARAMETER « $(printf "%s" "$module_args" | sed "s/^[^ ]* //") » IS NOT SUPPORTED" >&2;
                    echo >&2; echo "Please remove this value, called at the index « $p_count »" >&2;

                    BU::ModuleInit::MsgAbort;

                    BU::ModuleInit::AskPrintLog; exit 1;
                fi
            done

            # Creating a global variable to store a value which proves that the 'module --*' value was passed as first argument, for the condition which checks if the 'main' module is passed as second argument.
            __BU_MODULE_UTILS_MODULE_FIRST_ARG='true';

        fi

    # -----------------------------------------------

    ## MISSING 'main' MODULE AFTER THE 'module' VALUE

    # Else, if the the "module --" value is passed as first argument, but the "main" module is missing.
    elif [ "$p_count" -eq 1 ] && [ -z "$__BU_MODULE_UTILS_MODULE_FIRST_ARG" ] && [[ "$p_module" != 'main' ]] || [[ "$p_module" != "main --"* ]]; then
        BU::ModuleInit::PrintLogError "Main module not passed after the « module » value" "$LINENO"

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « main » MODULE IS NOT PASSED AS SECOND ARGUMENT, AFTER THE FIRST ARGUMENT : module" >&2
        echo >&2; echo "Please do so by setting the « $v_module_name » module's argument (with or without its parameters) in second position when you call the « ${FUNCNAME[0]} » function in your script" >&2

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog; exit 1;


    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE AND THE 'main' MODULE PASSING

    # Else, if the "main" module is passed as second argument, after the "module" value.
    elif [ "$p_count" -eq 1 ] && [[ "$p_module" == 'main' ]] || [[ "$p_module" == "main --"* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;


    # -----------------------------------------------

    ## 'module' VALUE NOT PASSED, BUT 'main' MODULE PASSED AS FIRST ARGUMENT

    # Else, if the "module --*" value is not passed as first argument.

    # Checking if the "main" module is passed as first argument, in order to avoid unexpected bugs during the other modules' initialization process.
    elif [ "$p_count" -eq 0 ] && [[ "$p_module" == 'main' ]] || [[ "$p_module" == "main --"* ]]; then

        # Temporary solution to avoid crashes when executing this file.
        true;

    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE OR THE 'main' MODULE PASSING

    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "$p_count" -ge 1 ]; then

        return 0;

    # -----------------------------------------------

    ## NO 'module' AND 'main' PASSED AS FIRST, THEN SECOND ARGUMENT

    else
        BU::ModuleInit::PrintLogError "No « module » value and no « main » module passed as first, then second arguments" "$LINENO";

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module -- » VALUE WITH IT'S PARAMETERS, AND THE « main » MODULE ARE NOT PASSED AS FIRST ARGUMENT" >&2;
        echo >&2; echo "Please do so by modifying the « main » module's argument position in your script, and optionnaly adding the « module » value with the needed mandatory arguments" >&2;

        BU::ModuleInit::MsgAbort;

        echo >&2; BU::ModuleInit::AskPrintLog; return 1;
    fi

    return 0
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### BEGIN INITIALIZATION PROCESS

## CHECKING IF THE CURRENT SHELL IS BASH

if [ "${SHELL##*/}" != 'bash' ]; then
    echo >&2;
    echo "ERROR : Your current shell interpreter is not Bash, but « ${SHELL##*/} »" >&2;
    echo "ERREUR : Votre interpréteur shell actuel n'est pas le Bash, mais le « ${SHELL##*/} »" >&2;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
    echo >&2; exit 1;
fi

# -----------------------------------------------

## DEFINING GLOBAL VARIABLES

__BU_MODULE_UTILS_ROOT_HOME="$HOME";

if [ -d "$__BU_MODULE_UTILS_ROOT_HOME/.Bash-utils" ]; then
	__BU_MODULE_UTILS_ROOT="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT_HOME" ".Bash-utils")";
	__BU_MODULE_UTILS_INITALIZER_PATH="${BASH_SOURCE[0]}";

    # Configurations directories
	__BU_MODULE_UTILS_CONFIG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "config")";
    __BU_MODULE_UTILS_CONFIG_INIT_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "initializer")";
	__BU_MODULE_UTILS_CONFIG_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "modules")";

    # Modules directories
	__BU_MODULE_UTILS_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "modules")";

	# Files
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME="Bash-utils-root-val.path";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR" "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME")";

	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME="Bash-utils-root-val-ROOT.path";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME")";

	# Misc
	__BU_MODULE_UTILS_DATE_LOG="[ $(date +"%Y-%m-%d %Hh:%Mm:%Ss") ]";
else
	echo >&2; echo "IN ${BASH_SOURCE[0]}, LINE $LINENO --> ERROR !" >&2; echo >&2;

	echo "The Bash Utils configurations root folder « .Bash-utils » doesn't exists in your home directory." >&2; echo >&2;
	echo "Please copy this folder in your home directory. You can install it by executing the « install_and_update.sh » file, or you can find it in the « Bash-utils/install directory »." >&2; echo >&2;

	BU::ModuleInit::MsgAbort;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
	exit 1;
fi

# -----------------------------------------------

## CALLING THE NEEDED FUNCTIONS (DEFINED IN THIS FILE) THAT MUST BE CALLED BEFORE INITIALIZING THE FIRST GLOBAL VARIABLES

# THIS FUNCTION MUST BE THE FIRST FUNCTION TO BE CALLED !!!! --> Setting the whole project's language by getting and sourcing the "gettext.sh" file.
BU::ModuleInit::Get_gettext_sh_File;

# Checking the currently used Bash language's version.
BU::ModuleInit::CheckBashMinimalVersion;

# -----------------------------------------------

## DEFINING NEW GLOBAL VARIABLES TO STORE THE INITIALIZATION LOGS AND DISPLAY THEM OR NO

# NOTE : The redirections are processed by the "BU::ModuleInit::Msg" function.

# This global variable stores the log messages.
declare __BU_MODULE_UTILS_MSG_ARRAY=();

# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.

# By default, it stores no value, so that the messages are redirected to the "$__BU_MODULE_UTILS_MSG_ARRAY" only, without being redirected to the screen too.
declare __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION='';

# This global variables stores a random text. It's enough to determine if the messages can be printed and / or stored in the "$__BU_MODULE_UTILS_MSG_ARRAY" array with the "BU::ModuleInit::Msg" function.
declare __BU_MODULE_UTILS_MSG_ARRAY_EXISTS="$((RANDOM % 255))";

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
		if [[ "${p_modules_list[i]}" = "$v_module_name --"* ]]; then
			__BU_MODULE_UTILS_MODULE_AND_ARGS_STRING="$module"
		fi

		# -----------------------------------------------

		## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)

        BU::ModuleInit::ProcessFirstModuleParameters "$module" "$v_index"

        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU::ModuleInit::ProcessFirstModuleParameters()" function).
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

                BU::ModuleInit::MsgAbort

                return 1
            else
                BU::ModuleInit::Msg "Sourcing the $v_module_name module's initialization file"; BU::ModuleInit::Msg

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_MODULES_DIR/$v_module_name" "Initializer.sh")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_UTILS_MODULES_DIR/$module/Initializer.sh" "$v_module_name"; exit 1; }

                BU::HeaderGreen "END OF THE $(BU::DechoHighlight "$v_module_name") MODULE INITIALIZATION !"
            fi
        fi

        # Incrementing the modules array index variable.
        v_index="$(( v_index+1 ))"
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
