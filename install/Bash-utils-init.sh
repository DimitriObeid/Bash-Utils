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
    local p_code=$1		# Exit code.
    local p_sleep=$2	# Pause time in seconds.

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
    local p_missing=$1;		# Which file is missing (the one found in the "$PATH" global variable, or the one provided with the library).
    local p_filepath=$2;	# File which retrieval or sourcing failed.

    #**** Code ****
    if [ -z "$p_missing" ]; then
        echo >&2;
        echo "en | Warning : no given information about the « gettext.sh » file ('PATH', 'config-missing' or 'config-source' in first argument)" >&2;
        echo "fr | Attention : aucune information donnée à propos du fichier « gettext.sh » ('PATH', 'config-missing' ou 'config-source' en premier argument)" >&2;

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		echo >&2; exit 1;

	elif [ -z "$p_filepath" ]; then
		echo >&2;
		echo "en | Warning : no file path has been passed as second argument" >&2;
		echo "fr | Attention : aucun chemin de fichier n'a été passé en second argument" >&2;

		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array.
		echo >&2; exit 1;
    fi

    if [ "${p_missing^^}" = 'PATH' ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO SOURCE THE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2;
        echo "FR | ATTENTION --> IMPOSSIBLE DE SOURCER LE FICHIER « $p_filepath » POUR LA TRADUCTION DES FICHIER « .po »" >&2; echo >&2;

    elif [ "${p_missing,,}" = "config-missing" ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO GET THE SPARE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2;
        echo "FR | ATTENTION --> IMPOSSIBLE DE TROUVER LE FICHIER DE SECOURS « $p_filepath » POUR LA TRADUCTION DES FICHIERS « .po »" >&2; echo >&2;

    elif [ "${p_missing,,}" = 'config-source' ]; then
        echo >&2;
        echo "EN | WARNING --> UNABLE TO SOURCE THE SPARE « $p_filepath » FILE FOR THE « .po » FILES TRANSLATION" >&2;
        echo "FR | ATTENTION --> IMPOSSIBLE DE SOURCER LE FICHIER DE SECOURS « $p_filepath » POUR LA TRADUCTION DES FICHIERS « .po »" >&2; echo >&2;
    fi

    echo >&2;
    echo "en | The rest of the library will use english as default language" >&2;
    echo "fr | Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2;

    echo >&2;
}


function __bu_export_textdomain()
{
	#**** Variables ****
	export TEXTDOMAINDIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_INIT_DIR/" "po/")";

	#**** Code ****
    return 0;
}

# Getting and sourcing the "gettext.sh" file.
function BU::ModuleInit::Get_gettext_sh_File()
{
    #**** Variables ****
    local v_path_file_path;		# Getting the "gettext.sh" file from a path registered in the "$PATH" global variable.
        v_path_file_path="$(command -v "gettext.sh")";

    local v_spare_file_path;	# Defining a variable to store the spare gettext.sh file if its path have to move in the future.
        v_spare_file_path="$__BU_MODULE_UTILS_CONFIG_INIT_DIR/gettext.sh";

    #**** Code ****
    # Checking if the "gettext.sh" file exists in the "$PATH" global variable listed paths.
    if [ -f "$v_path_file_path" ]; then
        # shellcheck disable=SC1090
        source "$v_path_file_path" || Moduleinitializer_PrintModInitDefaultLanguage 'PATH' "$v_path_file_path";


    # Else, if the file is not found, the spare "gettext.sh" file which came with the library "install" folder is called
    else
        if [ -f "$v_spare_file_path" ]; then
            # shellcheck disable=SC1090
            source "$v_spare_file_path" || Moduleinitializer_PrintModInitDefaultLanguage 'config-source' "$v_spare_file_path";

        # Else, if the spare "gettext.sh" file is also missing.
        else
            Moduleinitializer_PrintModInitDefaultLanguage 'config-missing';
        fi
    fi
}

# -----------------------------------------------

## FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES

# Asking to the user if (s)he wants to display the initialization logs on the screen (preferably before stopping the script's execution after a fatal error).
function BU::ModuleInit::AskPrintLog()
{
	#**** Code ****
	if [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" == '--log-display' ]; then
        echo;

		BU::ModuleInit::MsgLine "Do you want to display the initialization logs (stored in the « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » variable) ? (yes / no)" '#' 'echo';

		echo; read -rp "Enter your answer : " read_ask_print_log;

		if [ "${read_ask_print_log,,}" = 'yes' ] || [ "${read_ask_print_log^^}" = 'Y' ]; then
			BU::ModuleInit::PrintLog; return 0;
		else
			echo; echo "The logs will not be displayed on your screen"; echo; return 0;
		fi
	else
		return 0;
	fi
}

# Printing and / or logging the global variables already defined.
function BU::ModuleInit::DisplayInitializedGlobalVarsInfos()
{
    BU::ModuleInit::MsgLine "INITIALIZING THE GLOBAL VARIABLES" '#' 'msg';
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "Initializing the modules manager's root directory variables" '+' 'msg';       BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_ROOT_HOME"             	"$__BU_MODULE_UTILS_ROOT_HOME"	'Dirpath'		"This global variable stores the path to the parent directory of each module configuration directories" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_ROOT"                  	"$__BU_MODULE_UTILS_ROOT"		'Dirpath'		"This global variable stores the path to the configuration directory of each module" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "Initializing the configuration directories paths" '+' 'msg';                  BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_DIR"            	"$__BU_MODULE_UTILS_CONFIG_DIR"			'Dirpath'		"This global variable stores the path to the configuration directory of each module" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_INIT_DIR"       	"$__BU_MODULE_UTILS_CONFIG_INIT_DIR"	'Dirpath'		"This global variable stores the path of the configuration folder used by the module initialization file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_CONFIG_MODULES_DIR"    	"$__BU_MODULE_UTILS_CONFIG_MODULES_DIR"	'Dirpath'		"This global variable stores the configuration folder of the current module" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "Initializing the modules initializers files directory" '+' 'msg';             BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_MODULES_DIR"           	"$__BU_MODULE_UTILS_MODULES_DIR"		'Dirpath'		"This global variable stores the path to the initialization files of the current module." "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "Initializing the variables of the file which contains the library's root folder's path" '+' 'msg'; BU::ModuleInit::Msg
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME"               "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME"        'File'		"Name of the file containing the path to the root folder of the library" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR"         "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR"  'Dirpath'	"Name of the parent folder of the file containing the path to the root folder of the library" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH"               "$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH"        'Filepath'	"Path of the file containing the library's root folder's path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::Msg;

    BU::ModuleInit::MsgLine "Initializing the variables of the file which contains the library's root folder's path (installed with the root privileges with the installer file)" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME"          "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME"		'File'		"Name of the file containing the path to the root folder of the library (if this file is owned by the super-user)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR"    "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" 	'Dirpath'		"Name of the parent folder of the file containing the path to the root folder of the library (if this file is owned by the super-user)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH"          "$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH"		'Filepath'		"Path of the file containing the library's root folder's path (if this file is owned by the super-user)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    BU::ModuleInit::Msg;

    return 0;
}

# Displaying the information on the initialized global variables
function BU::ModuleInit::DisplayInitGlobalVarsInfos()
{
    if [ "$__BU_MODULE_UTILS_MSG_ARRAY_MODE" = '--mode-log-full' ]; then

        #**** Parameters ****
        local p_var_name=$1;	# Name of the variable.
        local p_var_val=$2;		# Value stored in the variable.
		local p_var_type=$3;	# Type of variable (array, int (integer), float, path, string).
        local p_var_desc=$4;	# Description of the variable.
        local p_file=$5;        # File where the variable was declared.
        local p_func=$6;        # Function where the variable was declared.
        local p_line=$7;        # Line where the variable was declared.

        # If the variable type is an array, then the values must be passed as an array,
        # or else only the first index's value will be displayed.
        shift 7
        local pa_var_val_array=("$@")

        #**** Variables ****
        local v_file; v_file="$([[ -n "$p_file" ]] && echo "File : $p_file" || echo "File : none")";
        local v_func; v_func="$([[ -f "$p_func" ]] && echo "Func : $p_func" || echo "Func : none")";
        local v_line; v_line="$([[ -n "$p_line" ]] && echo "Line : $p_line" || echo "Line : unknown")";

        #**** Code ****
		# Checking if the "$p_var_type" argument value matches an awaited pattern.
		# - array	: this variable is an array.
		# - code	: this variable stores code in order to perform an action (either a function, a command or a condition)
		# - dir		: this variable stores the name of a directory.
		# - file	: this variable stores the name of a file.
		# - float	: this variable stores a floating number.
		# - int		: this variable stores an integer.
		# - path:	: this variable stores a path.
		# - string	: this variable stores a string (other than the name of a directory or a file, or a path).
		if [ "${p_var_type,,}" != 'array' ]	\
			&& [ "${p_var_type,,}" != 'cmd' ] \
			&& [ "${p_var_type,,}" != 'dir' ] \
			&& [ "${p_var_type,,}" != 'file' ] \
			&& [ "${p_var_type,,}" != 'float' ]	\
			&& [ "${p_var_type,,}" != 'dirpath' ] \
			&& [ "${p_var_type,,}" != "filepath" ] \
			&& [ "${p_var_type,,}" != 'int' ] \
			&& [ "${p_var_type,,}" != 'path' ] \
			&& [ "${p_var_type,,}" != 'string' ]
			then
				p_var_type="unknown type";
		fi

        BU::ModuleInit::Msg;

		# Checking if the variable is an array.
		if [ "$p_var_type" = 'array' ]; then
            BU::ModuleInit::MsgLine "Declared global array : $p_var_name" '-' 'msg';

		# Checking if the variable is not an array.
		else
            BU::ModuleInit::MsgLine "Declared global variable : $p_var_name" '-' 'msg';
		fi

		BU::ModuleInit::Msg;

		BU::ModuleInit::Msg "Description : $p_var_desc";
		BU::ModuleInit::Msg;

		BU::ModuleInit::Msg "$v_file";
		BU::ModuleInit::Msg "$v_func";
		BU::ModuleInit::Msg "$v_line";

		if [ "${p_var_type,,}" = 'array' ]; then
            BU::ModuleInit::Msg "Type : array";
            BU::ModuleInit::Msg;

    		# If a value or more are stored in the processed array.
			if [ -n "${pa_var_val_array[*]}" ]; then

                local v_index=0;

                for _ in "${pa_var_val_array[@]}"; do
                    BU::ModuleInit::Msg "Value [$v_index] : $_";

                    # Line break every five lines, in order to keep the values list readable for a human.
                    local v_value_line=$(( v_index + 1 ));

                    if [ $(( v_value_line % 5 )) -eq 0 ]; then
                        BU::ModuleInit::Msg;
                    fi

                    v_index=$(( v_index+1 ));
                done;

                BU::ModuleInit::Msg;

                local v_index=0;

			else
				BU::ModuleInit::Msg "The array is empty" '-' 'msg';
                BU::ModuleInit::Msg;
			fi
		else
            BU::ModuleInit::Msg "Type : $p_var_type";
            BU::ModuleInit::Msg;

			# If a variable is stored in the processed variable.
			if [ -n "$p_var_val" ]; then
			
				if [ "${p_var_type,,}" = 'cmd' ]; then
					BU::ModuleInit::Msg "Value : The « $p_var_name » global variable's value is a command substition";
				else
					BU::ModuleInit::Msg "Value --> $p_var_val";
				fi

			else
				BU::ModuleInit::Msg "No value stored in this variable" '-' 'msg';
            fi

			BU::ModuleInit::Msg;

			return 0;
		fi
	else
		return 0;
    fi
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
                    __BU_MODULE_UTILS_MSG_ARRAY+=("$__BU_MODULE_UTILS_DATE_LOG $p_str");

                    echo -ne "${p_str##* ] }"; fi;

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+=('\n'); echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+=("$__BU_MODULE_UTILS_DATE_LOG $p_str\n");

                    echo -e "${p_str##* ] }"; fi;

					return 0;;
        esac

    # Else, if the '--log-shut' argument is passed as a 'module' parameter, then every initialization
    # messages must be redirected towards the "/dev/null" virtual device file, and the array must be emptied.
    elif [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" = '--log-shut' ]; then
        return 0;

    # Else, if the '--log-shut-display' argument is passed as a 'module' parameter, then
    # every initialization messages must be redirected to the screen only, not to the array.
    elif [ "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" = '--log-shut-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    echo -ne '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    echo -ne "$p_str"; fi

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    echo -e "$p_str"; fi

					return 0;;
        esac

    # Else, if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable stores no value (empty by default), then every
    # initialization messages must be stored in the "$__BU_MODULE_UTILS_MSG_ARRAY" array without being printed on the screen.
    elif [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+=('');

                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+=("$__BU_MODULE_UTILS_DATE_LOG $p_str");

                    echo -ne "${p_str##* ] }"; fi;

					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_UTILS_MSG_ARRAY+=('\n'); echo -e '';

                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns. 
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_UTILS_MSG_ARRAY+=("$__BU_MODULE_UTILS_DATE_LOG $p_str\n"); fi

					return 0;;
        esac

    # Else, if an incorrect value is passed as "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable's value.
    else
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> WARNING : THE « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » GLOBAL VARIABLE'S VALUE « $__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » IS NOT SUPPORTED" >&2;
        echo >&2; echo "Please change its value by '--log-display', '--log-shut', '--log-shut-display' or an empty value where you (re)defined the value." >&2;

        BU::ModuleInit::MsgAbort;
        
        BU::ModuleInit::AskPrintLog;

        exit 1;
    fi

    return 0;
}

# Writing a text under a line with the same size.
function BU::ModuleInit::MsgLine()
{
    #**** Parameters ****
    local p_str=$1;     # String to display.
    local p_line=$2;    # Line character.
    local p_context=$3; # Context of the function's call (should it be processed by the "BU::ModuleInit::Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" = 'echo' ]; then
        BU::ModuleInit::MsgLineCount "${#p_str}" "$p_line" 'echo';
        echo "$p_str";

    elif    [ "${p_context,,}" = 'msg' ]; then
        BU::ModuleInit::MsgLineCount "${#p_str}" "$p_line" 'msg';
        BU::ModuleInit::Msg "$p_str";

    else
        echo >&2; echo "TEST-MSGLINE" >&2; echo >&2; exit 1;
    fi

    return 0;
}

# Drawing a line with a character, that is the same lenght as a string, in order to separate the messagges from different steps.
function BU::ModuleInit::MsgLineCount()
{
    #**** Parameters ****
    local p_number=$1;  # Number of times the character has to be display.
    local p_line=$2;    # Line character.
    local p_context=$3; # Context of the function's call (should it be processed by the "BU::ModuleInit::Msg" function or with a simple "echo" command ?).

    #**** Code ****
    if      [ "${p_context,,}" = 'echo' ]; then
        for ((i=0; i<p_number; i++)); do echo -n "$p_line"; done; echo;

    elif    [ "${p_context,,}" = 'msg' ]; then
        for ((i=0; i<p_number; i++)); do BU::ModuleInit::Msg "$p_line" '-n'; done; BU::ModuleInit::Msg;

    else
        echo >&2; echo "TEST-MSGLINECOUNT" >&2; echo >&2; exit 1;
    fi

    return 0;
}

# Displaying a text when the script's execution must be stopped.
function BU::ModuleInit::MsgAbort() { echo >&2; echo "Aborting the library's initialization" >&2; echo >&2; return 0; }

# Pressing any key on the keyboard to do an action.
function BU::ModuleInit::PressAnyKey() { echo; read -n 1 -s -r -p "Press any key to $1"; echo; return 0; }

# Printing the initialization on the screen. Although this function is called if the '--log-display' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.
function BU::ModuleInit::PrintLog()
{
    #**** Variables ****
    local v_init_logs_str="INITIALIZATION LOGS";
    local v_tmp_file;
        v_tmp_file_original="$(echo "$RANDOM" | md5sum).tmp";

    shopt -s extglob;

    local v_tmp_file;
         v_tmp_file="${v_tmp_file_original%%+( - )}";   # Removing the extra whitespace with the dash.
    shopt -u extglob;

    #**** Code ****
    echo;

    BU::ModuleInit::MsgLine "Here are the initialization logs" '#' 'echo'; echo

    if [ "$__BU_MODULE_UTILS_MSG_ARRAY_MODE" = '--mode-log-partial' ]; then
        echo "Logging mode : partial"; echo;
    elif [ "$__BU_MODULE_UTILS_MSG_ARRAY_MODE" = '--mode-log-full' ]; then
        echo "Logging mode : full"; echo;
    fi

    BU::ModuleInit::MsgLine "$v_init_logs_str" '-' 'echo';
    BU::ModuleInit::MsgLineCount "${#v_init_logs_str}" '-' 'echo';
    BU::ModuleInit::Msg;

    BU::ModuleInit::Msg "DISPLAYING THE LOGS WITH THE « less » COMMAND";
    BU::ModuleInit::Msg;

    BU::ModuleInit::PressAnyKey 'display the logs with the « less » command';
    BU::ModuleInit::Msg;

    touch "$v_tmp_file" || { echo >&2; echo "Unable to create the temporary file to store the logs" >&2; echo >&2; return 1; };

    echo "DISPLAYING THE INITIALIZATION LOGS WITH THE « less » COMMAND" >> "$v_tmp_file";
    echo >> "$v_tmp_file";
    
    echo "Don't press the « Q » button, or else you will close this  and you will have to execute again the script" >> "$v_tmp_file"
    echo >> "$v_tmp_file";
    echo >> "$v_tmp_file";

    for value in "${__BU_MODULE_UTILS_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "${value##* ] }" >> "$v_tmp_file";
    done

    less "$v_tmp_file";

    rm "$v_tmp_file";

    echo; echo ">>>>> END OF THE INITIALIZATION LOGS"; echo;

	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, it's defined before the "$__BU_MODULE_UTILS_MSG_ARRAY" array, and it calls this function.

	return 0;
}

# Print an error message in the log storage variable.
function BU::ModuleInit::PrintLogError()
{
    #**** Parameters ****
    local p_desc=$1;    # Description of the error.
    local p_lineno=$2;  # Line where the error happened.

    #**** Code ****
    BU::ModuleInit::Msg >&2;

    BU::ModuleInit::MsgLine "ERROR : DESC = $p_desc | LINE = $p_lineno" '-' 'msg' >&2;

    BU::ModuleInit::Msg >&2;

    return 0;
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
        printf "<No file path>" >&2; return 0;

    else
        if [ -z "$p_target" ]; then
            echo  >&2; echo ">>>>> BASH-UTILS ERROR >>>>> IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » >>>>> NO SPECIFICATION ABOUT THE TARGET !!!" >&2; echo >&2;

            echo "Please specify if the target is a file or a folder by passing 'f' or 'd' as second argument when you call the « ${FUNCNAME[0]} » function." >&2; echo >&2; return 1;
        else
            if [[ "$p_target" = [D-d] ]]; then

                if [ -d "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s (bad directory : not found)" "$p_path" >&2; return 0;
                fi

            elif [[ "$p_target" = [F-f] ]]; then

                if [ -f "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;

                else
                    printf "%s (bad file path : not found)" "$p_path" >&2; return 0;
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

    exit 1;
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

# Usage function
function BU::ModuleInit::Usage()
{
	echo >&2; echo "The supported values are :" >&2;
	echo "WARNING : the three following parameters are incompatible with each other, they will overwrite each other";
	echo >&2;

	echo "--log-display         : display the initialization messages on the screen as they are logged in the « __BU_MODULE_UTILS_MSG_ARRAY » array" >&2;
	echo "--log-shut            : don't display the initialization messages on the screen OR log them is the « __BU_MODULE_UTILS_MSG_ARRAY » array" >&2;
	echo "--log-shut-display    : display the initialization messages on the screen without logging them in the « __BU_MODULE_UTILS_MSG_ARRAY » array" >&2;
	echo >&2;

	echo "WARNING : the two following parameters are incompatible with each other, they will overwrite each other";
	echo "--mode-log-full       : display all informations about the initialization process" >&2;
	echo "--mode-log-partial    : display only the essential informations" >&2;

	return 0;
}

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
            BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : « module » value passed without argument(s)" "$LINENO";

            echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE IS PASSED WITHOUT PARAMETERS" >&2;
            echo >&2; echo "Please pass a valid argument between the double quotes where you pass the « module » value" >&2;

            BU::ModuleInit::MsgAbort;

            BU::ModuleInit::AskPrintLog; exit 1;
    
        elif [[ "$p_module" == 'module --'* ]]; then

            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            read -ra module_array <<< "$p_module";

			# Unsetting the "module" value from the newly created array, in order to avoid an "unsupported argument" error.
			unset "module_array[0]";

            # -----------------------------------------------

            ## MODULE : DEFINING RESOURCES FOR THE « module » ARGUMENTS PROCESSING

            # Defining a function to optimize the displaying of errors for the 3 "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable's accepted values.
            function BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize()
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

                    echo >&2; echo "In « ${BASH_SOURCE[0]} », line $(( LINENO-3 )) --> Warning : the « module » value's parameters '--log-display', '--log-shut' and / or '--log-shut-display' are incompatible with each other" >&2; echo >&2;
                    echo "Please choose only one of these parameters." >&2; echo >&2

                    echo "The new value will be assignated to the « __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION » global variable." >&2;

                    echo >&2;
                    echo "Current value stored in the permission variable : $__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" >&2;
                    echo "New value : $p_value" >&2;

                    echo >&2; return 1;
                fi
            }

            for module_args in "${module_array[@]}"; do

                # -----------------------------------------------

                ## MODULE : USER'S LANGUAGE PROCESSING

                # If the "module" value's argument is "--lang="
                if [[ "$module_args" == *'--lang=en_US' ]]; then

                    # Temporary solution to avoid crashes while executing this file, before .
                    true;

                # -----------------------------------------------

                ## MODULE : LOG MESSAGES PROCESSING

                # Else, if the "module" value's argument is a log redirection parameter : "--log-display", "--log-shut" or '--log-shut-display'

				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" == *'--log-'* ]]; then

					case "${module_args,,}" in

						# Log value : --log-display (printing the initialization messages on the screen while they are appened to the "$__BU_MODULE_UTILS_MSG_ARRAY" array).
						'--log-display')
							if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then

								# By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
								# To print the initialization logs on the screen, you have to pass the '--log-display' argument when you pass the "module" value as first argument
								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args";

							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";
								
								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args";
							fi;;

						# Log value : --log-shut (don't print the initialization messages on the screen, nor append them into the "$__BU_MODULE_UTILS_MSG_ARRAY" array).
						'--log-shut')
							if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then

								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_UTILS_MSG_ARRAY" variable,
								# the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args";

								# Erasing the content of the "$__BU_MODULE_UTILS_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_UTILS_MSG_ARRAY;
								
							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";

								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args";

								# Erasing the content of the "$__BU_MODULE_UTILS_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_UTILS_MSG_ARRAY;
							fi;;

						# Log value : --log-shut-display (print the initialization messages on the screen without appening them into the "$__BU_MODULE_UTILS_MSG_ARRAY" array).
						'--log-shut-display')
							if [ -z "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" ]; then
								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_UTILS_MSG_ARRAY" variable,
								# but all the log messages will be displayed on the screen.
								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args"

							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";

								__BU_MODULE_UTILS_MSG_ARRAY_PERMISSION="$module_args";
							fi;;

						# An unsupported log argument is passed.
						*)
							BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Bad module value's log permission argument : $module_args" "$LINENO";

							echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE'S LOG PERMISSION PARAMETER « $(printf "%s" "$module_args" | sed "s/^[^ ]* //") » IS NOT SUPPORTED" >&2;
							echo >&2; echo "Please remove this value, called at the index « $p_count »" >&2;

							BU::ModuleInit::Usage;

							BU::ModuleInit::MsgAbort;

							BU::ModuleInit::AskPrintLog; exit 1;;
					esac

                # -----------------------------------------------

                ## MODULE : MODES PROCESSING

				# Else, if the 

                elif [[ "${module_args,,}" = '--mode-'* ]]; then

					case "${module_args,,}" in

						# Setting the "$__BU_MODULE_UTILS_MSG_ARRAY_MODE" global variable to '--mode-log-full', in order to print every initialization messages, and not only the essential initialization messages.
						'--mode-log-full')
							__BU_MODULE_UTILS_MSG_ARRAY_MODE="$module_args";

							# Displaying the initialization messages already appened in the "$__BU_MODULE_UTILS_MSG_ARRAY" global variable.
							BU::ModuleInit::DisplayInitializedGlobalVarsInfos;;

						# Setting the "$__BU_MODULE_UTILS_MSG_ARRAY_MODE" global variable to '--mode-log-partial', in order to print the essential initialization messages only (already set by default).
						'--mode-log-partial')
							__BU_MODULE_UTILS_MSG_ARRAY_MODE="$module_args";;

						# An unsupported mode argument is passed.
						*)
							BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Bad module value's mode argument : $module_args" "$LINENO";

							echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE'S MODE PARAMETER « $(printf "%s" "$module_args" | sed "s/^[^ ]* //") » IS NOT SUPPORTED" >&2;
							echo >&2; echo "Please remove this value, called at the index « $p_count »" >&2;

							BU::ModuleInit::Usage;

							BU::ModuleInit::MsgAbort;

							BU::ModuleInit::AskPrintLog; exit 1;;
					esac

                # -----------------------------------------------

                ## MODULE : HANDLING UNSUPPORTED ARGUMENTS

                # Else, if the "module" value's argument is not a supported one.
                else
                    BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Bad module value's argument" "$LINENO";

                    echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module » VALUE'S PARAMETER « $(printf "%s" "$module_args" | sed "s/^[^ ]* //") » IS NOT SUPPORTED" >&2;
                    echo >&2; echo "Please remove this value, called at the index « $p_count »" >&2;

					BU::ModuleInit::Usage;

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

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 1 ] && [ -z "$__BU_MODULE_UTILS_MODULE_FIRST_ARG" ] && [[ "${p_module,,}" != 'main' ]] || [[ "${p_module,,}" != [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then
        BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Main module not passed after the « module » value" "$LINENO";

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « main » MODULE IS NOT PASSED AS SECOND ARGUMENT, AFTER THE FIRST ARGUMENT : module" >&2;
        echo >&2; echo "Please do so by setting the « $v_module_name » module's argument (with or without its parameters) in second position when you call the « ${FUNCNAME[0]} » function in your script" >&2;

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog; exit 1;


    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE AND THE 'main' MODULE PASSING

    # Else, if the "main" module is passed as second argument, after the "module" value.

    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 1 ] && [[ "${p_module,,}" == 'main' ]] || [[ "$p_module" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

    # -----------------------------------------------

    ## 'module' VALUE NOT PASSED, BUT 'main' MODULE PASSED AS FIRST ARGUMENT

    # Else, if the "module --*" value is not passed as first argument.

    # Checking if the "main" module is passed as first argument, in order to avoid unexpected bugs during the other modules' initialization process.
    
    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 0 ] && [[ "${p_module,,}" == 'main' ]] || [[ "$p_module" == [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then

        # Since the arguments processings are made in the "main" module's initializer, the function can be exited.
        return 0;

	# -----------------------------------------------

    ## 'Main' MODULE PASSED AS FIRST ARGUMENT, BUT BEFORE THE 'module' VALUE
	
	# Else, if the "main" module is passed as first argument, BUT before the "module --*" value.
	
	elif [ "$p_count" -ge 1 ] && [[ "${p_module,,}" == "module --"* ]]; then
		BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : « main » module passed as first argument, but before the « module -- » value";

		echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « main » MODULE IS PASSED AS FIRST ARGUMENT, BUT BEFORE THE « module -- » VALUE" >&2;
		echo >&2; echo "Please reverse this order, call the « module » with its arguments BEFORE the « main » module" >&2;

        BU::ModuleInit::MsgAbort;

        BU::ModuleInit::AskPrintLog; exit 1;

    # -----------------------------------------------

    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE OR THE 'main' MODULE PASSING

    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "$p_count" -ge 1 ]; then

        return 0;

    # -----------------------------------------------

    ## NO 'module' AND 'main' PASSED AS FIRST, THEN AS SECOND ARGUMENTS

    else
        BU::ModuleInit::PrintLogError "No « module » value and no « main » module passed as first, then second arguments" "$LINENO";

        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-3 )) --> WARNING : THE « module -- » VALUE WITH IT'S PARAMETERS, AND THE « main » MODULE ARE NOT PASSED AS FIRST ARGUMENT" >&2;
        echo >&2; echo "Please do so by modifying the « main » module's argument position in your script, and optionnaly adding the « module » value with the needed mandatory arguments" >&2;

        BU::ModuleInit::MsgAbort;

        echo >&2; BU::ModuleInit::AskPrintLog; return 1;
    fi

    return 0;
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

	# shellcheck disable=SC2034
	__BU_MODULE_UTILS_INITALIZER_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT_HOME" "$(basename "${BASH_SOURCE[0]}")")";

    # Configurations directories
	__BU_MODULE_UTILS_CONFIG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "config")";
    __BU_MODULE_UTILS_CONFIG_INIT_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "initializer")";
	__BU_MODULE_UTILS_CONFIG_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_DIR" "modules")";

    # Modules directories
	__BU_MODULE_UTILS_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_ROOT" "modules")";

	# Files
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME="Bash-utils-root-val.path";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PATH="$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_PARENT_DIR/$__BU_MODULE_UTILS_LIB_ROOT_DIR_FILE_NAME";

	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME="Bash-utils-root-val-ROOT.path";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="$__BU_MODULE_UTILS_ROOT";
	__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH="$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR/$__BU_MODULE_UTILS_LIB_ROOT_DIR_ROOT_FILE_NAME";

	# Misc
	__BU_MODULE_UTILS_DATE_LOG="[ $(date +"%Y-%m-%d %Hh:%Mm:%Ss") ]";
else
	echo >&2; echo "IN ${BASH_SOURCE[0]}, LINE $(( LINENO-1 )) --> ERROR !" >&2; echo >&2;

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

# This global variables stores a random text. It's enough to determine if the messages can be printed and / or stored in the "$__BU_MODULE_UTILS_MSG_ARRAY" array with the "BU::ModuleInit::Msg" function.
declare __BU_MODULE_UTILS_MSG_ARRAY_EXISTS="$((RANDOM % 255))";

# This global variable stores the processing mode (partial or full).

# By default, it stores the '--mode-log-partial' value, in order to avoid the initialization process being too much verbose.
declare __BU_MODULE_UTILS_MSG_ARRAY_MODE='--mode-log-partial'

# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.

# By default, it stores no value, so that the messages are redirected to the "$__BU_MODULE_UTILS_MSG_ARRAY" only,
# without being redirected to the screen too (these instructions are processed in the "BU::ModuleInit::Msg" function).
declare __BU_MODULE_UTILS_MSG_ARRAY_PERMISSION='';

# -----------------------------------------------

## CALLING THE OTHER FUNCTIONS FOR INITIALIZATION

# Writing the initialization content into the messages array. It will be displayed later on the screen if the « --log-init-display » argument is passed with the « module » argument.
__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg "INITIALIZING THE MODULES")");
__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### SOURCING THE MODULES

## LIBRARY SOURCING'S FUNCTION

# Please call immediately this function once this file is sourced, and pass it each module you need as arguments, and their supported options.
function BashUtils_InitModules()
{
	#**** Parameters ****
	local p_modules_list=("$@")	# List of all the modules to include passed as arguments

	#**** Variables (global) ****

	#**** Variables (local) ****
    local v_index=0     # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!

	#**** Code ****
	## Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then
		printf "WARNING !!! YOU MUST PASS A MODULE NAME WHEN YOU CALL THE « %s » MODULE INITIALIZATION FUNCTION\n\n" "${FUNCNAME[0]}" >&2; return 1
	fi

    # Writing the list of the 
	__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg "INTIALIZING THESE MODULES :")");
	__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

	for module_args in "${p_modules_list[@]}"; do
        i=0; # Module's array index incrementer.

        if [[ "${module_args,,}" == 'module --'* ]]; then
            __BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg "Module $i : $module_args       <-- Arguments passed to configure the initialization process")");
        else
            i="$(( i+1 ))" # Incrementing the module's array index

            # Name and arguments of the module stored as the nth index of the module list array.
            __BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg "Module $i : $module_args")");
        fi
	done

	__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
	__BU_MODULE_UTILS_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");

	# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
	for module in "${p_modules_list[@]}"; do

		# -----------------------------------------------

		## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)

		# Calling the function which processes the « module » argument and its parameters, along with the « main » module.
        BU::ModuleInit::ProcessFirstModuleParameters "$module" "$v_index";

		# -----------------------------------------------

		## DEFINING LOCAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

		# Defining variables for each iteration.
		local v_module_name;
            v_module_name="$(echo "$module" | cut -d' ' -f1)";

		# -----------------------------------------------

		## DEFINING GLOBAL VARIABLES FOR EACH MODULE TO BE INITIALIZED

		# Getting the current module's configurations directory AND its initialization directory (the "module --"* value is NOT a module).
		if [[ "$module" != 'module --'* ]]; then

            # Getting the current module's configurations directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CONFIG_MODULES_DIR" "$v_module_name")";
            
            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH' "$__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH" 'Dirpath' \
                "This global variable stores the path of the currently processed module's configurations directory (current : $v_module_name | path : $__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH)" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";


            # Getting the current module's initialization directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_MODULES_DIR" "$v_module_name")";

            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH' "$__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH" 'Dirpath' \
                "This global variable stores the path of the currently processed module's initialization directory (current : $v_module_name | path : $__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH)" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
        fi

		# Storing the module's name with it's arguments, in order to transform it in an array of strings to be processed in this loop (for each module, in their "initializer.sh" file).
		if [[ "${p_modules_list[i]}" == "$v_module_name --"* ]]; then

            # shellcheck disable=SC2034
			__BU_MODULE_UTILS_MODULE_AND_ARGS_STRING="$module";

			BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_UTILS_MODULE_AND_ARGS_STRING' "$__BU_MODULE_UTILS_MODULE_AND_ARGS_STRING" 'String' \
				"This global variable stores the current value passed as argument when calling the « ${FUNCNAME[0]} » function (current index : ${#p_modules_list} | value : $module)" \
				"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
		fi

        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU::ModuleInit::ProcessFirstModuleParameters()" function).
        if [[ "$module" != 'module --'* ]]; then

            # -----------------------------------------------

            # MODULES' CONFIGURATION FILES SOURCING

            # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH"; then
                BU::ModuleInit::PrintLogError "The « $v_module_name module's » configurations directory does not exists" "$LINENO";

                printf '\n' >&2;

                printf "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-5 )) --> WARNING : THE « %s » module is not installed, doesn't exists, or the « ls » command had pointed elsewhere, towards an unexistent « config » directory !!!\n\n" "$v_module_name" >&2;

                echo -e "Please check if the module's configuration files exist in this folder --> " >&2; BU::ModuleInit::CheckPath "$__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH" 'f' >&2;
                printf '\n\n'

                # Listing all the installed modules in the user's hard drive.
                # No need to call the function "BU::ModuleInit::AskPrintLog" function, it's already called in the function "BU::ModuleInit::ListInstalledModules".
                BU::ModuleInit::ListInstalledModules;

                return 1;
            else
                BU::ModuleInit::Msg;
                BU::ModuleInit::MsgLine "Sourcing the $v_module_name module's main configuration file" '#' 'msg'; BU::ModuleInit::Msg;

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH" "module.conf")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_UTILS_CURRENT_MODULE_CONF_PATH/module.conf" "$v_module_name"; exit 1; }
            fi

            # -----------------------------------------------

            # MODULES' INITIALIZATION FILES SOURCING

            # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH"; then
                BU::ModuleInit::PrintLogError "The « $v_module_name » module's initialization files directory does not exists" "$LINENO";

                printf '\n' >&2;

                printf "IN « ${BASH_SOURCE[0]} », LINE $(( LINENO-5 )) --> WARNING : THE « %s » module is not installed, doesn't exists, or the « ls » command had pointed elsewhere, towards an unexistent « install » directory !!!\n\n" "$v_module_name" >&2;

                printf "Install this module, or check its name in this folder --> "; BU::ModuleInit::CheckPath "$__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH" 'f' >&2;
                printf '\n\n' >&2;

                BU::ModuleInit::MsgAbort;

                return 1;
            else
                BU::ModuleInit::MsgLine "Sourcing the $v_module_name module's initialization file" '-' 'msg';

                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH" "Initializer.sh")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_UTILS_CURRENT_MODULE_INIT_PATH/Initializer.sh" "$v_module_name"; exit 1; }

                BU::HeaderGreen "END OF THE $(BU::DechoHighlight "$v_module_name") MODULE INITIALIZATION !";
            fi
        fi

        # Incrementing the modules array index variable.
        v_index="$(( v_index+1 ))";

	done || { echo "ERROR"; exit 1; }; 

	# /////////////////////////////////////////////////////////////////////////////////////////////// #

	#### ENDING THE WHOLE INITIALIZATION PROCESS

	BU::HeaderGreen "END OF THE LIBRARY INITIALIZATION PROCESS ! BEGINNING PROCESSING THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") PROJECT'S SCRIPT $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_FILE_PATH" "$__BU_MAIN_COLOR_TXT_PATH") !";

	# This is the ONLY line where the "$__BU_MAIN_STAT_INITIALIZING" global status variable's value can be modified.
	# DO NOT set it anymore to "true", or else your script can be prone to bugs.
    if  BU::Main::Status::CheckStatIsInitializing; then
        BU::Main:Status::ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
	fi

	# Note : the "$__BU_MODULE_UTILS_MSG_ARRAY" variable is purged from the logged messages after writing its content in the project's log file.

	return 0;
}
