# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/BASHXCAT.CONF
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/BASHXFILES.CONF
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/BASHXFNCT.CONF
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/BASHXSUBCAT.CONF
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/STATUS.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# Project's debug variable
# This variable only accepts "true" or "false" as values.
# Default value : "false"
# shellcheck disable=SC2034
__BU_MODULE_INIT_STAT_DEBUG="false"
# Advanced project's debug variable
# This variable accepts "file", "category", "sub-category" "subcategory" (both last values do the same thing) or nothing as values,
# if the value of the "$__BU_MODULE_INIT_STAT_DEBUG" status global variable is equal to 'true'.
# Default value : "file"
if [ "$__BU_MODULE_INIT_STAT_DEBUG" = 'false' ]; then
    # shellcheck disable=SC2034
    __BU_MODULE_INIT_STAT_DEBUG_BASHX="";
elif [ "$__BU_MODULE_INIT_STAT_DEBUG" = 'true' ]; then
    # shellcheck disable=SC2034
    __BU_MODULE_INIT_STAT_DEBUG_BASHX="file";
    # Add or remove any supported values inside these arrays.
    # ------------------------------
    # __BU_MODULE_INIT_STAT_DEBUG_BASHX_CAT
    # Each accepted value is written under each category name, in each library file.
    # The "All" value can be used as index 0, in order to allow printing the name of every functions from every categores.
    # Every values are case-insensitive.
    BashXCatConf="BashXCat.conf";
    # If the "" file exists in the SAME directory than this script AND is not empty, then it's content is read, and each line is stored as a single value in each index.
    if [ -f "$BashXCatConf" ] && [ -n "$BashXCatConf" ]; then
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_CAT=();
        cat "$BashXCatConf" | while read -r line; do __BU_MODULE_INIT_STAT_DEBUG_BASHX_CAT+=("$line"); done
    # Else, you can fill the following array with values.
    else
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_CAT=();
    fi
    # ---------------------------------------
    # __BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY
    # The accepted values are the name of every ".lib" files from the Bash-utils/lib/functions/main/ directory.
    # The "All" value can be used as index 0, in order to allow printing the name of every functions from every files.
    # Every values are case-insensitive.
    BashXFilesConf="BashXFiles.conf";
    # If the "BashXFiles.conf" file exists in the SAME directory than this script AND is not empty, then it's content is read, and each line is stored as a single value in each index.
    if [ -f "$BashXFilesConf" ] && [ -n "$BashXFilesConf" ]; then
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY=();
        cat "$BashXFilesConf" | while read -r line; do __BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY+=("$line"); done
    # Else, you can fill the following array with values.
    else
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY=("Args" "Decho" "Files" "Directories" "Status");
    fi
    # ------------------------------
    # __BU_MODULE_INIT_STAT_DEBUG_BASHX_FUNCTIONS_ARRAY
    # The accepted values are the name of each function you want to debug.
    # The "All" value can be used as index 0, in order to allow printing the name of every functions from every files.
    # Every values are case-insensitive.
    BashXFNCTConf="BashXFNCT.conf";
    # If the "BashXFNCT.conf" file exists in the SAME directory than this script AND is not empty, then it's content is read, and each line is stored as a single value in each index.
    if [ -f "$BashXFNCTConf" ] && [ -n "$BashXFNCTConf" ]; then
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY=();
        cat "$BashXFNCTConf" | while read -r line; do __BU_MODULE_INIT_STAT_DEBUG_BASHX_FUNCTIONS_ARRAY+=("$line"); done
    # Else, you can fill the following array with values.
    else
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_FUNCTIONS_ARRAY=("Args" "Decho");
    fi
    # ----------------------------------
    # __BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CAT
    # Each accepted value is written under each sub-category name, in each library file, and named according to their parent category.
    # The "All" value can be used as index 0, in order to allow printing the name of every functions from every sub-categories.
    # Every values are case-insensitive.
    BashXSubCatConf="BashXSubCat.conf";
    # If the "BashXSubCat.conf" file exists in the SAME directory than this script AND is not empty, then it's content is read, and each line is stored as a single value in each index.
    if [ -f "$BashXSubCatConf" ] && [ -n "$BashXSubCatConf" ]; then
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CAT=();
        cat "$BashXSubCatConf" | while read -r line; do __BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CAT+=("$line"); done
    else
        __BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CAT=();
    fi
fi
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/LOCALE/DE.LOCALE
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/LOCALE/EN.LOCALE
#!/usr/bin/env bash
# ----------------------
## SCRIPT'S INFORMATIONS
# Name          : en.locale
# Description   : English translation messages of the module initialization script.
# Author(s)     : Dimitri Obeid
# Version       : 1.0
# ----------------------------
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### DEFINING USEFUL VARIABLES
## REPEATED MESSAGES
# Writing the file, function and the line number where an error occured.
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING="IN « %s », FUNCTION « %s », LINE « %s » --> BASH-UTILS WARNING";
# Writing the file, function and the line number where a fatal error occured.
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_ERROR="IN « %s », FUNCTION « %s », LINE « %s » --> BASH-UTILS ERROR";
# Writing the beginning of the text of any text that must be printed with the "BU::ModuleInit::PrintLogError" function.
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE="%s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### OUT OF FUNCTION MESSAGES
## MISSING BASH UTILS CONFIGURATIONS ROOT FOLDER
if [ ! -d "$__BU_MODULE_INIT__ROOT_HOME/.Bash-utils" ]; then
    __BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER="The Bash Utils configurations root folder « .Bash-utils » doesn't exists in your home directory";
    __BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER__ADVICE="Please copy this folder in your home directory. You can install it by executing the « install_and_update.sh » file, or you can find it in the « Bash-utils/install » directory";
fi
# -----------------------------------------------
## SUB-SECTION : CALLING THE OTHER FUNCTIONS FOR INITIALIZATION
__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MSG_INITIALIZING_THE_MODULES="INITIALIZING THE MODULES";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SUB-SECTION : FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES
## FUNCTION : "BU::ModuleInit::AskPrintLog"
__BU_MODULE_INIT_MSG__ASKPRINTLOG__ASK_DISPLAY="Do you want to display the initialization logs (stored in the « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » array) ? (yes / no)";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_ENGLISH="To display the content of the « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » array, please type « yes » ou « Y » (no case sensibility)";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__ENTER_ANS="Enter your answer : ";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_DISPLAY="The initializer script's log file's content will not be displayed on your screen";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::DisplayInitializedGlobalVarsInfos"
# Initialization message.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS="INITIALIZING THE GLOBAL VARIABLES";
# Processus ID.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO="Initializing the script's informations";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID="This global variable stores the PID of the current program";
# Modules manager's paths.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_ROOT_DIR_VARS="Initializing the modules manager's root directory variables";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME="This global variable stores the path to the parent directory of each module configuration and initialization directories";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT="This global variable stores the path to the configuration and initialization directories of each module";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH="This global variable stores the path of the modules initializer script";
# Configuration directories paths.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_CONF_DIRS="Initializing the configuration directories paths";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR="This global variable stores the path to the configuration directory of each module";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR="This global variable stores the path of the configuration folder used by the modules initialization script";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR="This global variable stores the path of the configuration folder of the currently processed module";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR="This global variable stores the path of the folder containing the translation files, used by the modules initialization script";
# Initializer script's configuration files.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__CONFIGURATION_FILES="Initializing the Initializer script's configuration files path";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__STATUS="This global variable stores the path of the global status variables configuration file";
# Module initializer script's paths.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MODULE_INIT_DIR="Initializing the modules initializers files directory";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR="This global variable stores the path to the initialization files of the current module";
# Library's root directory path.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_FILE_PATH="Initializing the variables of the file which contains the library's root folder's path";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME="This global variable stores the name of the file containing the path to the root folder of the library";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="This global variable stores the name of the parent folder of the file containing the path to the root folder of the library";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH="This global variable stores the path of the file containing the library's root folder's path";
# Library's root directory path (with root privileges).
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_ROOT_FILE="Initializing the variables of the file which contains the library's root folder's path (installed with the super-user's privileges with the installer file)";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME="This global variable stores the name of the file containing the path to the root folder of the library (if this file is owned by the super-user)";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="This global variable stores the name of the parent folder of the file containing the path to the root folder of the library (if this file is owned by the super-user)";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH="This global variable stores the path of the file containing the library's root folder's path (if this file is owned by the super-user)";
# Miscellaneous variables.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MISC_VARS="Initializing the miscellaneous variables";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM="This global variable stores the character that is used as the delimiter for the main module CSV translation file.";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG="This global variable stores the current date, in order to display it before each log messages";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG="This global variable stores the user's language by keeping only it's ISO 639-1 code";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::DisplayInitGlobalVarsInfos"
# List of different messages, used to better measure the space between the text and the colon.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1="File  : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2="Func  : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3="Line  : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4="File  : unknown";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5="Func  : none";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6="Line  : unknown";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7="Declared global array : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8="Declared global variable : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9="Description :";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A="Type  : array";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B="Type  : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C="Value : The « %s » global variable's value is a command substition";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D="Value : %s";
# Known files, functions and line numbers.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3";
# Unknown files, functions and line numbers.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6";
# Array checkings.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_ARRAY="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_NOT_ARRAY="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8";
# Description.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DESCRIPTION="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9";
# Array processer.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_TYPE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_VALUE="Value";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_EMPTY="The array is empty";
# Other value processer (not arrays).
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_TYPE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_CMD="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_NOT_CMD="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_EMPTY="No value is stored in this global variable";
# Deletion of the values stored in the variables constituting the list of the various messages, used to better measure the space between the text and the colon, in order to free up memory.
unset __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::Msg"
__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_1="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » GLOBAL VARIABLE'S VALUE « %s » IS NOT SUPPORTED\n";
__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_2="Please change its value by « --log-display », « --log-shut », « --log-shut-display » or an empty value where you (re)defined the value.";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::MsgAbort"
__BU_MODULE_INIT_MSG__MSG_ABORT__ABORT="Aborting the module initialization script's execution";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::MsgAbort"
__BU_MODULE_INIT_MSG__PRESS_ANY_KEY__PRESS="Press any key to";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::PrintLog"
# Title.
__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS="INITIALIZATION LOGS";
# Display initialization log informations.
__BU_MODULE_INIT_MSG__PRINTLOG__HERE="Here are the initialization logs";
__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE="Logging mode : full (parameter « --mode-log-full » passed during the call of the module 0 « module »)";
__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE="Logging mode : partial (parameter « --mode-log-partial » passed during the call of the module 0 « module »)";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE="DISPLAYING THE INITIALIZATION LOGS WITH THE « less » COMMAND";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_ADVICE_IF_NO_LOGS_ARE_DISPLAYED="If nothing is displayed on the screen after a few seconds, please stop the script's execution by pressing CTRL + C";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CALL_PRESS_ANY_KEY_FNCT="display the initialization logs with the « less » command";
__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q="Don't press the « Q » button, or else you will close this file and you will have to execute again the script";
# Cannot create the temporary file.
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CANNOT_CREATE_TMP_FILE="Unable to create the temporary file to store the logs";
# Post-display instructions.
__BU_MODULE_INIT_MSG__PRINTLOG__POST_DISPLAY_TEXT="END OF THE INITIALIZATION LOG DISPLAY";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::PrintLogError"
__BU_MODULE_INIT_MSG__PRINTLOG_ERROR__PRINT_ERROR="[ ERROR ] DESCRIPTION : %s | LINE : %s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SUB-SECTION : FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION
## FUNCTION : "BU::ModuleInit::CheckPath"
# Missing file path.
__BU_MODULE_INIT_MSG__CHECKPATH__NO_FILE_PATH="No file path";
# No target specified.
__BU_MODULE_INIT_MSG__CHECKPATH__NO_TARGET_SPECIFICATION="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : NO SPECIFICATION GIVEN ABOUT THE TARGET !!!";
__BU_MODULE_INIT_MSG__CHECKPATH__PLEASE_SPECIFY_TARGET_SPECIFICATION="Please specify if the target is a file or a folder by passing the 'f' (file) or the 'd' (directory) value as second argument when you call the « %s » function.";
# Target specified, but not found.
__BU_MODULE_INIT_MSG__CHECKPATH__DIR_NOT_FOUND="(bad directory path : not found)";
__BU_MODULE_INIT_MSG__CHECKPATH__FILE_NOT_FOUND="(bad file path : not found)";
# Target specified, but the type is unknown.
__BU_MODULE_INIT_MSG__CHECKPATH__UNKNOWN_TARGET="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « p_target » PARAMETER'S CURRENT VALUE IS « %s », NOT THE EXPECTED 'D', 'd', 'F' OR 'f'";
# -----------------------------------------------
## "BU::ModuleInit::FindPath" FUNCTION
__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : WARNING : UNABLE TO FIND THIS PATH";
# -----------------------------------------------
## "BU::ModuleInit::GetModuleName" FUNCTION
__BU_MODULE_INIT_MSG__GET_MODULE_NAME__UNABLE_TO_GET="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : Unable to get the module's name from the parent directory name";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::ListInstalledModules"
# Unable to create the temporary directory.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE Unable to create the initialization logs temporary directory « tmp » in the « %s/ » directory";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : Unable to create the initialization logs temporary directory « tmp » in the « %s/ » directory";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__ADVICE="If the problem persists, please create this folder manually";
# Listing the installed modules.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INSTALLED_MODULES_LIST="INSTALLED MODULES LIST";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__ONE_OR_MORE_MODULES_MISSING="WARNING ! A MODULE OR MORE ARE MISSING IN THE « %s » OR IN THE « %s » FOLDERS";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_CONFIGURATION_FOLDER_LIST="INSTALLED MODULES CONFIGURATION FOLDERS LIST";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_INITIALIZATION_FOLDER_LIST="INSTALLED MODULES INITIALIZATION FOLDERS LIST";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__LISTED_MODULES_DIFFERENCES_BELOW="THE DIFFERENCES BETWEEN THESE TWO FILES ARE LISTED BELOW";
# Missing modules or modules not found.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : The « ls -l » command pointed towards an unexistent path";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__BOTH_CONF_AND_INIT_FOLDER_ARE_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE MODULES CONFIGURATION FOLDER AND THE MODULES INITIALIZATION FOLDER ARE MISSING !";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__CONF_FOLDER_IS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE MODULES CONFIGURATION FOLDER IS MISSING !";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INIT_FOLDER_IS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE MODULES INITIALIZATION FOLDER IS MISSING !";
# -----------------------------------------------
## "BU::ModuleInit::SourcingFailure" FUNCTION
__BU_MODULE_INIT_MSG__SOURCING_FAILURE__UNABLE_TO_SOURCE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : UNABLE TO SOURCE THIS « %s » MODULE'S FILE --> %s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SUB-SECTION : FUNCTIONS NEEDED FOR THE MODULES PROCESSING
## FUNCTION : "BU::ModuleInit::Usage"
# List of different messages, used to better measure the space between the text and the colon.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1="--log-display             : display the initialization messages on the screen as they are logged in the « __BU_MODULE_INIT_MSG_ARRAY » array";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2="--log-shut                : don't display the initialization messages on the screen OR log them is the « __BU_MODULE_INIT_MSG_ARRAY » array";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3="--log-shut-display        : display the initialization messages on the screen without logging them in the « __BU_MODULE_INIT_MSG_ARRAY » array";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1="--mode-log-full      : display on the screen and / or log in the « __BU_MODULE_INIT_MSG_ARRAY » array EVERY informations about the initialization process";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2="--mode-log-partial   : display on the screen and / or log in the « __BU_MODULE_INIT_MSG_ARRAY » array the essential informations only";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG="--stat-debug=false             OR --stat-debug=true";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX=" --stat-debug-bashx=category   OR--stat-debug-bashx=file   OR --stat-debug-bashx=function  OR --stat-debug-bashx=sub-category";
# Display of the values supported by the "module" option.
__BU_MODULE_INIT_MSG__USAGE__SUPVALS="The supported values are :";
# Display of the supported values for the log redirection parameter.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG="WARNING : the three following parameters are incompatible with each other, they will overwrite each other :";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_DISPLAY="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT_DISPLAY="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3";
# Display of the supported values for the logging parameter.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG="WARNING : the two following parameters are incompatible with each other, they will overwrite each other :";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_FULL="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_PARTIAL="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2";
# Global status variables.
__BU_MODULE_INIT_MSG__USAGE__DEBUG_VALUES_LIST="GLOBAL STATUS VARIABLES - DEBUG VALUES :";
__BU_MODULE_INIT_MSG__USAGE__DEBUG="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG";
__BU_MODULE_INIT_MSG__USAGE__DEBUG_BASHX="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX";
# Deletion of the values stored in the variables constituting the list of the various messages, used to better measure the space between the text and the colon, in order to free up memory.
unset __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize"
# Same value for the "--log-*" option was passed twice or more as argument when calling the "BashUtils_InitModules" function.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : « module » value's argument « %s » passed twice when calling the « BashUtils_InitModules » function";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : you already passed the « %s » value as « module » value's argument for the « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » global variable when calling the « BashUtils_InitModules » function"
# Different values for the "--log-*" option were simultaneously passed as arguments when calling the "BashUtils_InitModules" function.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : « module » value's arguments « %s » and « %s » passed together when calling the « BashUtils_InitModules » function";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_1="the « module » value's parameters '--log-display', '--log-shut' and / or '--log-shut-display' are incompatible with each other";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_2="Please choose only one of these parameter values";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_EXTRA_INFO="The new value will be assignated to the « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » global variable";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_CURRENT_VAL="Current value stored in the permission variable : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_NEW_VAL="New value : %s";
# -----------------------------------------------
## FUNCTION : "BU::ModuleInit::ProcessFirstModuleParameters"
# No arguments were given to the "module" value if this value was called as argument 1 during the call of the "BashUtils_InitModules" function.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : THE « module » VALUE WAS PASSED WITHOUT ARGUMENT(S)";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « module » VALUE WAS PASSED WITHOUT ARGUMENT(S)";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__ADVICE="Please pass at least a valid argument between the double quotes where you pass the « module » value";
# One or more arguments were given to the "BashUtils_InitModules" function as "module" parameter's value(s) : unsupported "--log-*" option passed.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Bad « module » parameter's log permission option : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « module » VALUE'S LOG PERMISSION OPTION « %s » IS NOT SUPPORTED";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__ADVICE="Please modify or remove this value, called at the index « %s » of the « module » parameter";
# One or more arguments were given to the "BashUtils_InitModules" function as "module" parameter's value(s) : unsupported "--mode-log-*" option passed.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Bad « module » parameter's mode option : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « module » PARAMETER'S LOG MODE MODE OPTION « %s » IS NOT SUPPORTED";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__ADVICE="Please modify or remove this value, called at the index « %s » of the « module » parameter";
# One or more arguments were given to the "BashUtils_InitModules" function as "module" parameter's value(s) : unsupported general option passed.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Bad « module » parameter's general option";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « module » PARAMETER'S GENERAL OPTION « %s » IS NOT SUPPORTED";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__ADVICE="Please modify or remove this value, called at the index « %s » of the « module » parameter";
# "module" parameter passed in argument, during the call of the « BashUtils_InitModules » function, but the main module is missing.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : The main module was not passed after the « module » parameter during the call of the « BashUtils_InitModules » function";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE MAIN MODULE WAS NOT PASSED AFTER THE « MODULE » PARAMETER DURING THE CALL OF THE « BashUtils_InitModules » FUNCTION";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__ADVICE="Please do so by setting the « %s » module's argument (with or without its parameters) in second position when you call the « %s » function in your script";
# "module" parameter passed in argument AFTER the call of the main module, during the call of the « BashUtils_InitModules » function.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : The main module was passed as first argument, but before the « module -- » parameter during the call of the « BashUtils_InitModules » function";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE MAIN MODULE WAS PASSED AS FIRST ARGUMENT, BUT BEFORE THE « module -- » PARAMETER DURING THE CALL OF THE « BashUtils_InitModules » FUNCTION";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__ADVICE="Please reverse this order, call the « module » with its arguments BEFORE the main module";
# No "module" parameter passed in argument, nor main module, during the call of the « BashUtils_InitModules » function.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : No « module » parameter and no « main » module passed as first, then second arguments during the call of the « BashUtils_InitModules » function";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : NO « MODULE » PARAMETER AND NO « MAIN » MODULE PASSED AS FIRST, THEN SECOND ARGUMENTS DURING THE CALL OF THE « BashUtils_InitModules » FUNCTION";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__ADVICE="Please do so by modifying the main module's argument position in your script, and optionally adding the « module » parameter with the needed mandatory arguments";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SUB-SECTION : INCLUSION OF LIBRARY FILES ACCORDING TO THE INCLUDED MODULE
## FUNCTION : "BashUtils_InitModules"
# First checkings.
__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED="You have already called the %s function in your script";
__BU_MODULE_INIT_MSG__BU_IM__MUST_PASS_A_MODULE_NAME="WARNING !!! YOU MUST PASS A MODULE NAME WHEN YOU CALL THE « %s » MODULE INITIALIZATION FUNCTION";
# Listing the included modules.
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG="INTIALIZING THESE MODULES :";
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_MODULE_PARAM="Module %s : %s       <-- Arguments passed to configure the initialization process";
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_NOT_MODULE_PARAM="Module %s : %s";
# -----------------------------
# The main loop is running now.
# Definition of the information about the global variables that are defined in the "BashUtils_InitModules" function.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__CONF_PATH__DIGVI="This global variable stores the path of the currently processed module's configurations directory (current : %s | path : %s)";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INIT_PATH__DIGVI="This global variable stores the path of the currently processed module's initialization directory (current : %s | path : %s";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__NAME_WITH_ARGS="This global variable stores the current value passed as argument when calling the « %s » function (current index : %s | value : %s)";
# Inclusion of the configuration files of the module being processed : configuration directory not found.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : The « %s » module's configurations files directory does not exists";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « %s » MODULE IS NOT INSTALLED, DOESN'T EXISTS, OR THE « ls » COMMAND HAD POINTED ELSEWHERE, TOWARDS AN UNEXISTENT « config » DIRECTORY !!!";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__ADVICE="Install this module, or check if the module's configuration files exist in this folder --> ";
# Inclusion of the configuration files of the module being processed : configuration directory found.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__SOURCE="Sourcing the « %s » module's main configuration file";
# Inclusion of the initialization files of the module being processed : initialization directory not found.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : The « %s » module's initialization files directory does not exists";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : THE « %s » MODULE IS NOT INSTALLED, DOESN'T EXISTS, OR THE « ls » COMMAND HAD POINTED ELSEWHERE, TOWARDS AN UNEXISTENT « modules » DIRECTORY !!!";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__ADVICE="Install this module, or check if the module's initialization files exist in this folder --> ";
# Inclusion of the initialization files of the module being processed : initialization directory found.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__SOURCE="Sourcing the « %s » module's main initialization file";
# End of the current module's initialization.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__END_OF_MODULE_INIT="END OF THE %s MODULE INITIALIZATION !";
# ---------------------------------
# End of the main loop's execution.
# End of the framework's initialization process.
__BU_MODULE_INIT_MSG__BU_IM__END_OF_FRAMEWORK_INIT="END OF THE FRAMEWORK INITIALIZATION PROCESS ! BEGINNING PROCESSING THE %s PROJECT'S MAIN SCRIPT %s !";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### INITIALIZING THE MAIN MODULE
## STEP ONE : DEFINING THE NEEDED RESOURCES
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY="Successfully sourced this library file : %s";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG="Successfully sourced this configuration file : %s":
# -----------------------------------------------
## STEP TWO : MINIMAL INCLUSION OF FILES IN ORDER TO USE THEIR RESOURCES DURING THE TRANSLATION PART
# No text to display in this section for now.
# -----------------------------------------------
## STEP THREE : PROCESSING THE MAIN MODULE'S PARAMETERS
# List of accepted values.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE__SUPPORTED_ARGS="The supported arguments for the main module are :":
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______DECHO="--stat-decho=authorize         OR --stat-decho=forbid          OR --stat-decho=resctrict";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE________ECHO="--stat-echo=false              OR --stat-echo=true";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______ERROR="--stat-error=fatal             OR --stat-error=void			OR --stat-error=warning";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_________LOG="--stat-log=false               OR --stat-log=true";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______LOG_R="--stat-log-r=log               OR --stat-log-r=tee             OR --stat-log-r=void";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____OP_ROOT="--stat-op-root=authorized      OR --stat-op-root=forbidden     OR --stat-op-root=restricted";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_H="--stat-time-header=float,      where « float » is a floating point number";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_N="--stat-time-newline=float,     where « float » is a floating point number";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_T="--stat-time-txt=float,         where « float » is a floating point number";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____TXT_FMT="--stat-txt-fmt=false           OR --stat-txt-fmt=true";
# An incorrect value was given to the "--stat-*" option.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : the '--stat-*' option's « %s » value is incorrect.";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN__ADVICE="Try only one of these accepted values for this global status variable : ";
# Processing each status global variable's value description : writing redundant sentences.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL="This status global variable stores a boolean value, which is used to";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT="This status global variable stores a floatig number, which is used to";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING="This status global variable stores a string, which is used to";
# Processing each status global variable's value description.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL enable debugging features";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG_BASHX_FNCT_="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING enable advanced debugging features for functions during a debugging procedure with the « bash -x » command";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DECHO="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING determine the level of text decoration";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ECHO="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL avoid causing an infinite loop while calling a text writing function in case these functions must be called to provide the same features than usual";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING determine if the script's execution must be stopped in case of an error";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL determine if any text must be redirected towards a log file or not";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_R="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING determine if the text must be redirected to the log file only, to the screen only, or both at the same time";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_OP_ROOT="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING determine if the script can edit files or folders located directly in the system's root folder, or in one of it's direct sub-folders";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_H="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT determine the script's pause time after displaying a header";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_N="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT determine the script's pause time after displaying a line break";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_T="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT determine the script's pause time after displaying any text";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TXT_FMT="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL determine if the script has the permisiion to display any text decoration";
# Unsetting the redundant sentences.
unset __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL \
    __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT \
    __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING
# -----------------------------------------------
## STEP FOUR : INCLUSION OF THE REST OF THE LIBRARY AND CONFIGURATION FILES
# -----------------------------------------------
## STEP FIVE : PROCESSING PROJECT'S RESOURCES
# Creation of the text color code file.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__ERROR="UNABLE TO CREATE THE %s TEXT COLOR CODE FILE IN THE %s DIRECTORY";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__SUCCESS="The %s text color code file was successfully created in the %s directory";
# Creation of the background color code file.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__ERROR="Unable to create the %s background color file in the %s directory";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__SUCCESS="The %s background color code file was successfully created in the %s directory";
# Creation of the project's log file.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__ERROR="UNABLE TO CREATE THE %s LOG FILE FOR THE %s PROJECT";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_LOG_FILE__SUCCESS="The %s log file was successfully created in the %s directory";
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/LOCALE/ES.LOCALE
# /USR/LOCAL/LIB/BASH-UTILS/INSTALL/.BASH-UTILS/CONFIG/INITIALIZER/LOCALE/FR.LOCALE
#!/usr/bin/env bash
# ----------------------
## SCRIPT'S INFORMATIONS
# Name          : fr.locale
# Description   : Messages de traduction en français du script d'initialisation des modules.
# Author(s)     : Dimitri Obeid
# Version       : 1.0
# ----------------------------
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### DEFINING USEFUL VARIABLES
## REPEATED MESSAGES
# Écriture du fichier, de la fonction et du numéro de ligne où une erreur s'est produite.
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING="DANS LE FICHIER « %s », À LA FONCTION « %s », À LA LIGNE « %s » --> AVERTISSEMENT DE BASH-UTILS";
# Écriture du fichier, de la fonction et du numéro de ligne où une erreur fatale s'est produite.
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_ERROR="DANS LE FICHIER « %s », À LA FONCTION « %s », À LA LIGNE « %s » --> ERREUR FATALE DE BASH-UTILS";
# Écriture du début du texte de tout texte qui doit être imprimé avec la fonction "BU::ModuleInit::PrintLogError".
__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE="%s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MESSAGES HORS FONCTION
## DOSSIER RACINE DES CONFIGURATIONS DE BASH UTILS MANQUANT
if [ ! -d "$__BU_MODULE_INIT__ROOT_HOME/.Bash-utils" ]; then
    __BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER="Le dossier racine des configurations Bash Utils « .Bash-utils » n'existe pas dans votre répertoire personnel";
    __BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER__ADVICE="Veuillez copier ce dossier dans votre répertoire personnel. Vous pouvez l'installer en exécutant le fichier « install_and_update.sh », ou vous pouvez le trouver dans le dossier « Bash-utils/install ».";
fi
# -----------------------------------------------
## SOUS-SECTION : CALLING THE OTHER FUNCTIONS FOR INITIALIZATION - APPEL DES AUTRES FONCTIONS POUR L'INITIALISATION
__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MSG_INITIALIZING_THE_MODULES="INITIALISATION DES MODULES";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SOUS-SECTION : FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES - FONCTIONS NÉCESSAIRES POUR L'AFFICHAGE DES MESSAGES D'INITIALISATION
## FONCTION "BU::ModuleInit::AskPrintLog"
__BU_MODULE_INIT_MSG__ASKPRINTLOG__ASK_DISPLAY="Souhaitez-vous afficher à l'écran les entrées d'initialisation (enregistrées dans le tableau « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » ) ?";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_ENGLISH="Pour afficher à l'écran le contenu du tableau « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION », veuillez entrer « yes » ou « Y » (aucune sensibilité à la casse)";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__ENTER_ANS="Entrez votre réponse : ";
__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_DISPLAY="Le contenu du fichier de logs du script d'initialisation ne sera pas affiché sur votre écran";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::DisplayInitializedGlobalVarsInfos"
# Message d'initialisation.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS="INITIALISATION DES VARIABLES GLOBALES";
# Identifiant du processus (PID).
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO="Initialisation des informations du script";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID="Cette variable globale enregistre l'identifiant de processus (PID) du programme actuel";
# Chemins du gestionnaire de modules.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_ROOT_DIR_VARS="Initialisation des variables du dossier racine du gestionnaire de modules";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME="Cette variable globale enregistre le chemin d'accès au répertoire parent des répertoires de configuration et d'initialisation de chaque module";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT="Cette variable globale enregistre le chemin vers les répertoires de configuration et d'initialisation de chaque module";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH="Cette variable globale enregistre le chemin vers le script d'initialisation des modules";
# Chemins des dossiers de configuration.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_CONF_DIRS="Initialisation des chemins des répertoires de configuration";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR="Cette variable globale enregistre le chemin du dossier de configuration de chaque module.";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR="Cette variable globale enregistre le chemin du dossier de configuration utilisé par le script d'initialisation des modules.";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR="Cette variable globale enregistre le chemin du dossier de configurations du module actuellement traité";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR="Cette variable globale enregistre le chemin du dossier contenant les fichiers de traductions, utilisés par le script d'initialisation des modules";
# Fichiers de configuration du script d'initialisation.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__CONFIGURATION_FILES="Initialisation des chemins des fichiers de configuration du script d'initialisation";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__STATUS="Cette variable globale enregistre le chemin du fichier de configuration des variables globales de statut";
# Chemins des scripts d'initialisation de chaque module.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MODULE_INIT_DIR="Initialisation du répertoire des fichiers d'initialisation des modules";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR="Cette variable globale enregistre le chemin des fichiers d'initialisation du module actuel";
# Chemin du répertoire racine de la librairie.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_FILE_PATH="Initialisation des variables du fichier qui contient le chemin du dossier racine de la librairie";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME="Cette variable globale enregistre le nom du fichier contenant le chemin d'accès au dossier racine de la librairie";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="Cette variable globale enregistre le nom du dossier parent du fichier contenant le chemin d'accès au dossier racine de la librairie";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH="Cette variable globale enregistre le chemin du fichier contenant le chemin du dossier racine de la librairie";
# Chemin du répertoire racine de la librairie (avec les privilèges du super-utilisateur).
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_ROOT_FILE="Initialisation des variables du fichier qui contient le chemin du dossier racine de la librairie (installée avec les privilèges du super-utilisateur avec le fichier d'installation).";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME="Cette variable globale enregistre le nom du fichier contenant le chemin d'accès au dossier racine de la librairie (si ce fichier est détenu par le super-utilisateur)";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR="Cette variable globale enregistre le nom du dossier parent du fichier contenant le chemin d'accès au dossier racine de la librairie (si ce fichier est détenu par le super-utilisateur)";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH="Cette variable globale enregistre le chemin du fichier contenant le chemin du dossier racine de la librairie (si ce fichier est détenu par le super-utilisateur)";
# Variables diverses.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MISC_VARS="Initialisation des variables diverses";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM="Cette variable globale enregistre le caractère qui est utilisé comme délimiteur du fichier de traduction CSV du module principal.";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG="Cette variable globale enregistre la date actuelle, afin de l'afficher avant les messages du journal";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG="Cette variable globale enregistre la langue de l'utilisateur en ne conservant que son code ISO 639-1";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::DisplayInitGlobalVarsInfos"
# Liste des différents messages, servant à mieux mesurer l'espace entre le texte et le double point.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1="Fichier     : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2="Fonction    : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3="Ligne       : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4="Fichier     : Inconnu";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5="Fonction    : Aucune";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6="Ligne       : Inconnue";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7="Tableau global déclarée : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8="Variable globale déclarée : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9="Description :";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A="Type        : tableau";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B="Type        : %s";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C="Valeur      : La valeur de la variable globale « %s » est une substition de commande";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D="Valeur      : %s";
# Fichiers, fonctions et numéros de ligne connus.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3";
# Fichiers, fonctions et numéros de ligne inconnus.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE_NULL="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6";
# Vérification des tableaux.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_ARRAY="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_NOT_ARRAY="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8";
# Description.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DESCRIPTION="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9";
# Traitement des tableaux.
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_TYPE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_VALUE="Valeur";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_EMPTY="Le tableau est vide";
# Traitement des autres valeurs (pas de tableaux).
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_TYPE="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_CMD="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_NOT_CMD="$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D";
__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_EMPTY="Aucune valeur n'est enregistrée dans cette variable globale";
# Effacement des valeurs enregistrées dans les variables constituant la liste des différents messages, servant à mieux mesurer l'espace entre le texte et le double point, afin de libérer de la mémoire.
unset __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__1 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__2 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__3 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__4 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__5 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__6 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__7 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__8 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__9 \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__A \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__B \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__C \
    __BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__D
# -----------------------------------------------
## FONCTION "BU::ModuleInit::Msg"
__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_1="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LA VALEUR DE LA VARIABLE GLOBALE « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION » « %s » N'EST PAS SUPPORTÉE\n";
__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_2="Veuillez changer sa valeur par « --log-display », « --log-shut », « --log-shut-display » ou une valeur vide où vous avez (re)défini la valeur.";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::MsgAbort"
__BU_MODULE_INIT_MSG__MSG_ABORT__ABORT="Interruption de l'exécution du script d'initialisation du module";
## -----------------------------------------------
# FONCTION "BU::ModuleInit::MsgAbort"
__BU_MODULE_INIT_MSG__PRESS_ANY_KEY__PRESS="Appuyez sur n'importe quelle touche pour";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::PrintLog"
# Titre.
__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS="ENTRÉE DU JOURNAL D'INITIALISATION";
# Informations sur l'afichage des journaux d'initialisation.
__BU_MODULE_INIT_MSG__PRINTLOG__HERE="Here are the initialization logs";
__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE="Mode de journalisation : totale (paramètre « --mode-log-full » passé lors de l'appel du module 0 « module »)";
__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE="Mode de journalisation : partielle (paramètre « --mode-log-partial » passé lors de l'appel du module 0 « module »)";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE="AFFICHAGE DES JOURNAUX D'INITIALISATION AVEC LA COMMANDE « less »";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_ADVICE_IF_NO_LOGS_ARE_DISPLAYED="Si rien ne s'affiche à l'écran après quelques secondes, veuillez arrêter l'exécution du script en appuyant sur CTRL + C.";
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CALL_PRESS_ANY_KEY_FNCT="afficher les journaux d'initialisation avec la commande « less »";
__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q="N'appuyez pas sur le bouton « Q », sinon vous fermerez ce fichier et vous devrez exécuter à nouveau le script.";
# Impossibilité de créer le fichier temporaire.
__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CANNOT_CREATE_TMP_FILE="Impossible de créer le fichier temporaire pour stocker les entrées du journal d'initialisation";
# Instructions post-affichage.
__BU_MODULE_INIT_MSG__PRINTLOG__POST_DISPLAY_TEXT="FIN DE L'AFFICHAGE DES JOURNAUX D'INITIALISATION";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::PrintLogError"
__BU_MODULE_INIT_MSG__PRINTLOG_ERROR__PRINT_ERROR="# ERREUR # DESCRIPTION : %s | LIGNE : %s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SOUS-SECTION : FUNCTIONS NEEDED FOR THE MODULES INITIALIZATION - FONCTIONS NÉCESSAIRES POUR L'INITIALISATION DES MODULES
## FONCTION "BU::ModuleInit::CheckPath"
# Chemin de fichier manquant.
__BU_MODULE_INIT_MSG__CHECKPATH__NO_FILE_PATH="Aucun chemin de fichier";
# Aucune cible spécifiée.
__BU_MODULE_INIT_MSG__CHECKPATH__NO_TARGET_SPECIFICATION="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : AUCUNE SPÉCIFICATION DONNÉE SUR LA CIBLE !!!";
__BU_MODULE_INIT_MSG__CHECKPATH__PLEASE_SPECIFY_TARGET_SPECIFICATION="Veuillez spécifier si la cible est un fichier ou un dossier en passant la valeur 'f' (fichier) ou 'd' (dossier) en tant que second argument lors de l'appel de la fonction « %s »";
# Cible spécifiée, main non-trouvée.
__BU_MODULE_INIT_MSG__CHECKPATH__DIR_NOT_FOUND="(mauvais chemin de dossier : non trouvé)";
__BU_MODULE_INIT_MSG__CHECKPATH__FILE_NOT_FOUND="(mauvais chemin de fichier : non trouvé)";
# Cible spécifiée, mais le type est inconnu.
__BU_MODULE_INIT_MSG__CHECKPATH__UNKNOWN_TARGET="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LA VALEUR ACTUELLE DU PARAMÈTRE « p_target » EST « %s », ET PAS L'UNE DES VALEURS ATTENDUES : 'D', 'd', 'F' OR 'f'";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::FindPath"
__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : IMPOSSIBLE DE TROUVER CE CHEMIN";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::GetModuleName"
__BU_MODULE_INIT_MSG__GET_MODULE_NAME__UNABLE_TO_GET="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : Impossible d'obtenir le nom du module depuis le nom de son dossier parent";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::ListInstalledModules"
# Impossible de créer le dossier temporaire.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Impossible de créer le dossier temporaire « tmp » de stockage des journaux d'initialisation dans le dossier « %s/ »";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : Impossible de créer le dossier temporaire « tmp » de stockage des journaux d'initialisation dans le dossier « %s/ »";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__ADVICE="Si le problème persite, veuillez créer ce dossier manuellement";
# Liste des modules installés.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INSTALLED_MODULES_LIST="LISTE DES MODULES INSTALLÉS";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__ONE_OR_MORE_MODULES_MISSING="ATTENTION ! UN OU PLUSIEURS MODULES SONT MANQUANTS DANS LES DOSSIERS « %s » OU « %s »";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_CONFIGURATION_FOLDER_LIST="LISTE DES DOSSIERS DE CONFIGURATION DES MODULES INSTALLÉS";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_INITIALIZATION_FOLDER_LIST="LISTE DES DOSSIERS D'INITIALISATION DES MODULES";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__LISTED_MODULES_DIFFERENCES_BELOW="LA DIFFÉRENCE ENTRE LES DEUX FICHIERS EST LISTÉE EN DESSOUS";
# Modules manquants ou non-trouvés.
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : La commande « ls -l » a pointé vers un chemin inexistant";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__BOTH_CONF_AND_INIT_FOLDER_ARE_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE DOSSIER DE CONFIGURATION DES MODULES ET LE DOSSIER D'INITIALISATION DES MODULES SONT MANQUANTS !";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__CONF_FOLDER_IS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE DOSSIER DE CONFIGURATION DES MODULES EST MANQUANT !";
__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INIT_FOLDER_IS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE DOSSIER D'INITIALISATION DES MODULES EST MANQUANT !";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::SourcingFailure"
__BU_MODULE_INIT_MSG__SOURCING_FAILURE__UNABLE_TO_SOURCE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : IMPOSSIBLE DE SOURCER CE FICHIER DU MODULE « %s » --> %s";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SOUS-SECTION : FUNCTIONS NEEDED FOR THE MODULES PROCESSING - FONCTIONS NÉCESSAIRES AU TRAITEMENT DES MODULES
## FONCTION "BU::ModuleInit::Usage"
# Liste des différents messages, servant à mieux mesurer l'espace entre le texte et le double point.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1="--log-display         : afficher les messages d'initialisation sur l'écran pendant leur enregistrement dans le tableau « __BU_MODULE_INIT_MSG_ARRAY »";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2="--log-shut            : ne pas afficher les messages d'initialisation à l'écran OU les enregistrer dans le tableau « __BU_MODULE_INIT_MSG_ARRAY »";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3="--log-shut-display    : afficher les messages d'initialisation à l'écran sans les enregistrer dans le tableau « __BU_MODULE_INIT_MSG_ARRAY »";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1="--mode-log-full       : afficher à l'écran et / ou enregistrer dans le tableau « __BU_MODULE_INIT_MSG_ARRAY » TOUTES les informations sur le processus d'initialisation";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2="--mode-log-partial    : afficher à l'écran et / ou enregistrer dans le tableau « __BU_MODULE_INIT_MSG_ARRAY » les informations essentielles uniquement";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG="--stat-debug=false             OU --stat-debug=true";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX="--stat-debug-bashx=category    OU --stat-debug-bashx=file   OU --stat-debug-bashx=function OU --stat-debug-bashx=sub-category";
# Affichage des valeurs supportées par l'option "module".
__BU_MODULE_INIT_MSG__USAGE__SUPVALS="Les valeurs supportées sont :";
# Affichage des valeurs supportées pour le paramètre de redirection du journal.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG="ATENTION : Les trois paramètres suivants sont incompatibles entre eux, leurs valeurs s'écrasent entre elles :";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_DISPLAY="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT_DISPLAY="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3";
# Affichage des valeurs supportées pour le paramètre de journalisation.
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG="ATTENTION : les deux paramètres suivants sont incompatibles entre eux, leurs valeurs s'écrasent entre elles :";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_FULL="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1";
__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_PARTIAL="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2";
# Variables globales de statut.
__BU_MODULE_INIT_MSG__USAGE__DEBUG_VALUES_LIST="VARIABLES GLOBALES DE STATUT - VALEURS DE DÉBOGUAGE :";
__BU_MODULE_INIT_MSG__USAGE__DEBUG="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG";
__BU_MODULE_INIT_MSG__USAGE__DEBUG_BASHX="$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX";
# Effacement des valeurs enregistrées dans les variables constituant la liste des différents messages, servant à mieux mesurer l'espace entre le texte et le double point, afin de libérer de la mémoire.
unset __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_1 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_2 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_3 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_1 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_2 \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS________DEBUG \
    __BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS__DEBUG_BASHX
# -----------------------------------------------
## FONCTION "BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize"
# La même valeur pour l'option "--log-*" a été passée deux fois ou plus comme argument lors de l'appel de la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : la valeur « %s » de l'option « module » a été repassé en argument lors de l'appel de la fonction « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : vous avez déjà passé la valeur « %s » comme argument de la valeur « module » pour la variable globale « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION »"
# Des valeurs différentes pour l'option "--log-*" ont été simultanément passées en argument lors de l'appel de la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : les valeurs de l'option « module » « %s » et « %s » ont été passées en argument ensemble";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_1="les valeurs acceptées du paramètre « module », qui sont '--log-display', '--log-shut' et '--log-shut-display' sont incompatible entre elles";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_2="Veuillez ne choisir qu'une seule d'entre elles";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_EXTRA_INFO="La nouvelle valeur sera assignée à la variable globale « __BU_MODULE_INIT_MSG_ARRAY_PERMISSION »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_CURRENT_VAL="Valeur actuellement enregistrée dans la variable de permission : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_NEW_VAL="Nouvelle valeur : %s";
# -----------------------------------------------
## FONCTION "BU::ModuleInit::ProcessFirstModuleParameters"
# Aucun argument n'a été passé en tant que valeur(s) du paramètre "module", dans le cas où ce paramètre a été invoqué en tant que premier argument lors de l'appel de la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : LE PARAMÈTRE « module » A ÉTÉ PASSÉE SANS VALEUR(S)";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE PARAMÈTRE « module » A ÉTÉ PASSÉE SANS VALEUR(S)";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__ADVICE="Veuillez passer au moins un argument valide entre les guillemets où vous passez la valeur « module »";
# Un ou plusieurs arguments ont été passés en tant que valeur(s) paramètre "module" lors de l'appel de la fonction "BashUtils_InitModules" : option "--log-*" non supportée passée.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Mauvaise option d'autorisation de journalisation de la valeur du module : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : L'OPTION DE PERMISSION DE JOURNALISATION « %s » DU PARAMÈTRE « module » N'EST PAS SUPPORTÉE";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__ADVICE="Veuillez modifier ou supprimer cette valeur, appelée à l'index « %s » du paramètre « module »";
# Un ou plusieurs arguments ont été passés en tant que valeur(s) paramètre "module" lors de l'appel de la fonction "BashUtils_InitModules" : option "--mode-log-*" non supportée passée.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Mauvaise option de mode de la valeur du module : %s";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : L'OPTION DE JOURNALISATION « %s » DU PARAMÈTRE « module » N'EST PAS SUPPORTÉ";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__ADVICE="Veuillez modifier ou supprimer cette valeur, appelée à l'index « %s » du paramètre « module »";
# Un ou plusieurs arguments ont été passés en tant que valeur(s) paramètre "module" lors de l'appel de la fonction "BashUtils_InitModules" : option générale non supportée passée.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Mauvaise option générale du paramètre « module »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : L'OPTION GÉNÉRALE « %s » DU PARAMÈTRE « module » N'EST PAS SUPPORTÉE";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__ADVICE="Veuillez modifier ou supprimer cette valeur, appelée à l'index « %s » du paramètre « module »";
# Le paramètre "Module" a été passé en argument lors de l'appel de la fonction "BashUtils_InitModules", mais le module principal est manquant.
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Le module principal a été est passé après le paramètre « module » lors de l'appel de la fonction « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE MODULE PRINCIPAL A ÉTÉ EST PASSÉ APRÈS LE PARAMÈTRE « MODULE » LORS DE L'APPEL DE LA FONCTION « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__ADVICE="Veuillez placer l'argument du module « %s » (avec ou sans ses paramètres) en deuxième position lorsque vous appelez la fonction « %s » dans votre script.";
# Le paramètre "module" a été passé en argument APRÈS l'appel du module principal, lors de l'appel de la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Le module principal a été passé en premier argument, mais avant le paramètre « module -- » lors de l'appel de la fonction « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE MODULE PRINCIPAL A ÉTÉ PASSÉ EN PREMIER ARGUMENT, MAIS AVANT LE PARAMÈTRE « MODULE -- » LORS DE L'APPEL DE LA FONCTION « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__ADVICE="Veuillez inverser cet ordre, appelez le paramètre « module » avec ses arguments AVANT le module principal";
# Pas de paramètre "module" passé en argument, ni de module principal, lors de l'appel de la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Le paramètre « module » et le module principal n'ont pas été passés en premier, puis en deuxième argument lors de l'appel de la fonction « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE PARAMÈTRE « MODULE » ET LE MODULE PRINCIPAL N'ONT PAS ÉTÉ PASSÉS EN PREMIER, PUIS EN DEUXIÈME ARGUMENT LORS DE L'APPEL DE LA FONCTION « BashUtils_InitModules »";
__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__ADVICE="Veuillez le faire en modifiant la position des arguments du module principal dans votre script, et en ajoutant éventuellement le paramètre « module » avec les arguments obligatoires nécessaires.";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SOUS-SECTION : INCLUSION OF LIBRARY FILES ACCORDING TO THE INCLUDED MODULE - INCLUSION DES FICHIERS DE LA LIBRAIRIE SELON LE MODULE INCLUS
## FONCTION : "BashUtils_InitModules"
# Premières vérifications.
__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED="Vous avez déjà appelé la fonction %s dans votre script";
__BU_MODULE_INIT_MSG__BU_IM__MUST_PASS_A_MODULE_NAME="ATTENTION !!! VOUS DEVEZ PASSER UN NOM DE MODULE LORSQUE VOUS APPELEZ LA FONCTION D'INITIALISATION DE MODULE « %s »";
# Liste des modules inclus.
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG="INITIALISATION DE CES MODULES :";
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_MODULE_PARAM="Module %s : %s       <-- Arguments passés pour configurer le processus d'initialisation";
__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_NOT_MODULE_PARAM="Module %s : %s";
# ----------------------------------------------
# La boucle principale est en cours d'exécution.
# Définition des informations sur les variables globales qui sont définies dans la fonction "BashUtils_InitModules".
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__CONF_PATH__DIGVI="Cette variable globale enregistre le chemin du répertoire des configurations du module actuellement traité (actuel : %s | chemin : %s)";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INIT_PATH__DIGVI="Cette variable globale enregistre le chemin du répertoire d'initialisation du module actuellement traité (actuel : %s | chemin : %s)";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__NAME_WITH_ARGS="Cette variable globale enregistre la valeur courante passée en argument lors de l'appel de la fonction « %s » (current index : %s | value : %s)";
# Inclusion des fichiers de configuration du module en cours de traitement : dossier des configurations non trouvé.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Le répertoire des fichiers de configuration du module « %s » n'existe pas.";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE MODULE « %s » N'EST PAS INSTALLÉ, N'EXISTE PAS, OU LA COMMANDE « ls » A POINTÉ AILLEURS, VERS UN RÉPERTOIRE « config » INEXISTANT !!!";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__ADVICE="Installez ce module, ou vérifiez si les fichiers de configuration du module existent dans ce dossier --> ";
# Inclusion des fichiers de configuration du module en cours de traitement : dossier des configurations trouvé.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__SOURCE="Inclusion du fichier de configurations principal du module « %s »";
# Inclusion des fichiers d'initialisation du module en cours de traitement : dossier des fichiers d'initialisation non trouvé.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__CALL_PLE="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__PLE : Le répertoire des fichiers d'initialisation du module « %s » n'existe pas.";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : LE MODULE « %s » N'EST PAS INSTALLÉ, N'EXISTE PAS, OU LA COMMANDE « ls » A POINTÉ AILLEURS, VERS UN RÉPERTOIRE « config » INEXISTANT !!!";
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__ADVICE="Installez ce module, ou vérifiez si les fichiers d'initialisation du module existent dans ce dossier --> ";
# Inclusion des fichiers d'initialisation du module en cours de traitement : dossier des fichiers d'initialisation trouvé.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__SOURCE="Inclusion du fichier d'initialisation principal du module « %s »";
# End of the current module's initialization.
__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__END_OF_MODULE_INIT="FIN DE LA PROCÉDURE D'INITIALISATION DU MODULE %s!";
# -------------------------------------------
# Fin de l'exécution de la boucle principale.
# Fin du processus d'initialisation du framework.
__BU_MODULE_INIT_MSG__BU_IM__END_OF_FRAMEWORK_INIT="FIN DU PROCESSUS D'INITIALISATION DU FRAMEWORK ! DÉBUT DU TRAITEMENT DU PROJET %s VIA LE SCRIPT PRINCIPAL %s !";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### INITIALISATION DU MODULE PRINCIPAL
## STEP ONE : DEFINING THE NEEDED RESOURCES - ÉTAPE UN : DÉFINITION DES RESSOURCES NÉCESAIRES
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY="Ce fichier de librairie a été sourcé avec succès : %s";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG="Ce fichier de configuration a été sourcé avec succès : %s":
# -----------------------------------------------
## STEP TWO : MINIMAL INCLUSION OF FILES IN ORDER TO USE THEIR RESOURCES DURING THE TRANSLATION PART - ÉTAPE DEUX : INCLUSION MINIMALE DE FICHIERS AFIN D'UTILISER LEURS RESSOURCES PENDANT LA PARTIE DE TRADUCTION
# Aucun texte à afficher dans cette section pour le moment.
# -----------------------------------------------
## STEP THREE : PROCESSING THE MAIN MODULE'S PARAMETERS - ÉTAPE TROIS : TRAITEMENT DES PARAMÈTRES DU MODULE PRINCIPAL
# Liste des valeurs acceptées.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE__SUPPORTED_ARGS="Les arguments supportés pour le module principal sont :":
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______DECHO="--stat-decho=authorize         OU --stat-decho=forbid          OU --stat-decho=resctrict";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE________ECHO="--stat-echo=false              OU --stat-echo=true";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______ERROR="--stat-error=fatal             OU --stat-error=void			OU --stat-error=warning";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_________LOG="--stat-log=false               OU --stat-log=true";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______LOG_R="--stat-log-r=log               OU --stat-log-r=tee             OU --stat-log-r=void";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____OP_ROOT="--stat-op-root=authorized      OU --stat-op-root=forbidden     OU --stat-op-root=restricted";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_H="--stat-time-header=float,      où « float » est un nombre à virgule flottante";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_N="--stat-time-newline=float,     où « float » est un nombre à virgule flottante";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_T="--stat-time-txt=float,         où « float » est un nombre à virgule flottante";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____TXT_FMT="--stat-txt-fmt=false           OU --stat-txt-fmt=true";
# Une valeur incorrecte a été donnée à l'option "--stat-*".
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN="$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_WARNING : La valeur « %s » de l'option '--stat-*' est incorrecte.";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN__ADVICE="Essayez une seule de ces valeurs acceptées pour cette variable globale de statut : ";
# Traitement de la description de chaque variable globale de statut : écriture de phrases redondantes.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL="Cette variable globale de statut enregistre une valeur booléenne, servant à";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT="Cette variable globale de statut enregistre un nombre décimal, servant à";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING="Cette variable globale de statut enregistre une chaîne de caractères, servant à";
# Traitement de la description de chaque variable globale de statut.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL activer les fonctionnalités de déboguage";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG_BASHX_FNCT_="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING activer les fonctionnalités de déboguage avancées pour les fonctions lors d'une procédure de déboguage avec la commande « bash -x »";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DECHO="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING déterminer le niveau de décoration de texte";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ECHO="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL éviter de provoquer une boucle infinie lors de l'appel d'une fonction d'écriture de texte au cas où ces fonctions doivent être appelées pour fournir les mêmes fonctionnalités que d'habitude";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING déterminer si l'exécution du script doit être arrêtée en cas d'erreur";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL déterminer si un texte doit être redirigé vers un fichier de logs ou non";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_R="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING déterminer si le texte doit être redirigé vers le fichier de logs uniquement, vers l'écran uniquement, ou vers les deux en même temps.";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_OP_ROOT="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING déterminer si le script peut modifier des fichiers ou des dossiers situés directement dans le dossier racine du système, ou dans l'un de ses sous-dossiers directs.";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_H="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT déterminer le temps de pause du script après l'affichage d'un en-tête";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_N="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT déterminer le temps de pause du script après l'affichage d'un saut de ligne";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_T="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT déterminer le temps de pause du script après l'affichage de tout texte";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TXT_FMT="$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL déterminer si le script a le droit d'afficher une décoration textuelle.";
# Effacement des valeurs enregistrées pour l'écriture des phrases redondantes.
unset __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__BOOL \
    __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__FLOAT \
    __BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR__STRING
# -----------------------------------------------
# STEP FOUR : INCLUSION OF THE REST OF THE LIBRARY AND CONFIGURATION FILES - ÉTAPE QUATRE : INCLUSION DU RESTE DE LA LIBRAIRIE ET DES FICHIERS DE CONFIGURATION
# -----------------------------------------------
## STEP FIVE : PROCESSING PROJECT'S RESOURCES - ÉTAPE CINQ : TRAITEMENT DES RESSOURCES DU PROJET
# Création du fichier de code couleur du texte.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__ERROR="IMPOSIBLE DE CRÉER LE FICHIER DE CODE COULEUR DU TEXTE %s DANS LE DOSSIER %s";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__SUCCESS="Le fichier de code couleur du texte %s an été créé avec succès dans le dossier %s";
# Création du fichier de code de couleur de fond.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__ERROR="Impossible de créer le fichier de code de couleur de fond %s dans le dossier %s";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__SUCCESS="Le fichier de code couleur de fond %s a été créé avec succès dans le dossier %s";
# Création du fichier de logs du projet.
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__ERROR="IMPOSSIBLE DE CRÉER LE FICHIER DE LOGS %s POUR LE PROJET %s";
__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_LOG_FILE__SUCCESS="Le fichier de logs %s a été créé avec succès dans le dossier %s";
# /home/dimob/Bash-utils-init.sh
#!/usr/bin/env bash
# ----------------------
## SCRIPT'S INFORMATIONS
# Name          : Bash-utils-init.sh
# Description   : Library initializer script, initializing all the modules you need for your scripts.
# Author(s)     : Dimitri Obeid
# Version       : 3.0
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154,SC1090
# ---------------------
# NOTE ABOUT SHELLCHECK
# To display the content of a variable in a translated string, the use of the printf command is mandatory in order to interpret each "%s" pattern as the value of a variable.
# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entire translated string in a variable.
# If you add new messages to translate, you must call the directive "shellcheck disable=SC2059" before the line where you call the
# command "printf" to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.
# -----------------------------------------------------------------------------
# DO NOT EXECUTE IT DIRECTLY, instead, just source it in your main script file.
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
    local p_code=${1-1};    # Int   - Default : 1   - Exit code.
    local p_sleep=${2-2};   # Int   - Default : 2   - Pause time in seconds.
    #**** Code ****
printf "
-------------------------------------------------
                      DEBUG
-------------------------------------------------
"
    sleep "$p_sleep";
    if [ "$p_code" -eq 0 ]; then return 0;
    else
        # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
        exit "$p_code";
    fi
}
# Checking if the function and / or sourced code currently executed is a part of a script file or running in an interactive shell.
function BU::IsInScript() { if [ "${0:0:2}" = './' ]; then return 0; elif [ "$0" == 'bash' ]; then return 1; fi }
# -----------------------------------------------
## FUNCTIONS NEEDED FOR THE INITIALIZATION PROCESS TRANSLATIONS
function BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary()
{
    echo '------------------------------------------------------------------------' >&2;
    echo >&2;
    [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'de' ] && echo "Der Rest der Bibliothek wird Englisch als Standardsprache verwenden" >&2 && echo >&2;
    [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'en' ] && echo "The rest of the library will use english as default language" >&2 && echo >&2;
    [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'es' ] && echo "El resto de la biblioteca utilizará el inglés como idioma por defecto" >&2 && echo >&2;
    [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'fr' ] && echo "Le reste de la librairie utilisera l'anglais en tant que langue par défaut" >&2 && echo >&2;
    sleep 0.5;
    BU::ModuleInit::GetModuleInitLanguage_SetEnglishAsDefaultLanguage || return 1;
}
function BU::ModuleInit::GetModuleInitLanguage_SetEnglishAsDefaultLanguage()
{
    # Changing the current language to English.
    LANG="en_US.UTF-8";
    source "$__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR/en.locale" || {
        echo >&2;
        # Deutch | German
        [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'de' ] && {
            echo '------------------------------------------------------------------------------------------------' >&2 && echo >&2;
            echo "FATALER FEHLER : DIE ENGLISCHE ÜBERSETZUNGSDATEI KONNTE NICHT VON DER QUELLE REFERENZIERT WERDEN" >&2 && echo >&2;
            echo "Da die Nachrichten in der Modulinitialisierungsdatei in Variablen gespeichert werden, stützt sich diese Datei auf diese Übersetzungsdateien, die diese Variablen definieren" >&2;
            echo "Anhalten der Skriptausführung" >&2;
            echo >&2;
            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            return 1;
        }
        # English
        [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'en' ] && {
            echo '-----------------------------------------------------------' >&2 && echo >&2;
            echo "FATAL ERROR : UNABLE TO SOURCE THE ENGLISH TRANSLATION FILE" >&2 && echo >&2;
            echo "Since the messages in the module initialization file are stored into variables, this file relies on these translation files, which define these variables" >&2;
            echo "Aborting the script's execution" >&2;
            echo >&2;
            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            return 1;
        }
        # Español | Spanish
        [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'es' ] && {
            echo '-----------------------------------------------------------------' >&2 && echo >&2;
            echo "ERROR FATAL: IMPOSIBLE OBTENER EL ARCHIVO DE TRADUCCIÓN AL INGLÉS" >&2 && echo >&2;
            echo "Como los mensajes del fichero de inicialización del módulo se almacenan en variables, este fichero es asumido por estos ficheros de traducción, que definen estas variables" >&2;
            echo "Detener la ejecución del script" >&2;
            echo >&2;
            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            return 1;
        }
        # Français | French
        [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'fr' ] && {
            echo '----------------------------------------------------------------------' >&2 && echo >&2;
            echo "ERREUR FATALE : IMPOSSIBLE D'INCLURE LE FICHIER DE TRADUCTIONS ANGLAIS" >&2 && echo >&2;
            echo "Comme les messages du fichier d'initialisation du module sont stockés dans des variables, ce fichier s'appuie sur ces fichiers de traduction, qui définissent ces variables" >&2;
            echo "Arrêt de l'exécution du script" >&2;
            echo >&2;
            # WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
            return 1;
        }
    }
}
# Rewriting the library's languages messages.
function BU::ModuleInit::GetModuleInitLanguage()
{
    #**** Parameters ****
    local p_lang_ISO_639_1=$1; # String     - Default : NULL    - Wanted language.
    #**** Variables ****
    local v_supportedLang=('de' 'en' 'es' 'fr');
    local v_langMatch;
    #**** Code ****
    for i in "${v_supportedLang[@]}"; do
        if [[ "$i" == "$p_lang_ISO_639_1" ]]; then
            v_langMatch="match";
            break;
        fi
    done
    # If the selected language was not found.
    if [ -z "$v_langMatch" ]; then
        if [ -n "$p_lang_ISO_639_1" ]; then
            echo "WARNING : Your selected language ($p_lang_ISO_639_1) is not (yet) supported by the initialisation script" >&2
            echo >&2;
        else
            echo "WARNING : Your current language ($__BU_MODULE_INIT__USER_LANG) is not (yet) supported by the initialisation script" >&2
            echo >&2;
        fi
        echo "The initialisation script will use english as default language" >&2;
        echo >&2;
        # Changing the current language to English.
        LANG="en_US.UTF-8";
    fi
	if [ -z "$p_lang_ISO_639_1" ]; then
        [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Keine Sprache wird als Argument angegeben, wenn die Funktion « ${FUNCNAME[0]} » aufgerufen wird" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'en' ] && echo "WARNING : No language specified as argument when calling the « ${FUNCNAME[0]} » function" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'es' ] && echo "ADVERTENCIA : No se especifica ningún idioma como argumento al llamar a la función « ${FUNCNAME[0]} »" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'fr' ] && echo "Attention : Aucune langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} »" >&2 && echo >&2;
		BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary || return 1;
    elif [ -n "$p_lang_ISO_639_1" ] && [ ! -f "$__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR/$p_lang_ISO_639_1.locale" ]; then
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die Sprache, die beim Aufruf der Funktion « ${FUNCNAME[0]} » als Argument angegeben wurde, konnte im Ordner « $__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR » nicht gefunden werden" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'en' ] && echo "WARNING : The translation file for the language specified as an argument when calling the « ${FUNCNAME[0]} » function was not found in the « $__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR » directory" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'es' ] && echo "ADVERTENCIA : El archivo de traducción para el idioma especificado como argumento al llamar a la función « ${FUNCNAME[0]} » no se encontró en el directorio « $__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR »" >&2 && echo >&2;
		[ "${__BU_MODULE_INIT__USER_LANG,,}" = 'fr' ] && echo "ATTENTION : Le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} » n'a pas été trouvé dans le dossier « $__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR »" >&2 && echo >&2;
        BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary || return 1;
    else
        source "$__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR/$p_lang_ISO_639_1.locale" || {
            [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'de' ] && echo "ACHTUNG : Die Übersetzungsdatei für die als Argument angegebene Sprache konnte beim Aufruf der Funktion « ${FUNCNAME[0]} » nicht gefunden werden." >&2 && echo >&2;
            [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'en' ] && echo "WARNING : Unable to source the translation file for the language specified as argument when calling the « ${FUNCNAME[0]} » function" >&2 && echo >&2;
            [ "${__BU_MODULE_INIT__USER_LANG,,}" = "es" ] && echo "ADVERTENCIA : No se ha podido obtener el archivo de traducción para el idioma especificado en el argumento al llamar a la función « ${FUNCNAME[0]} »" >&2 && echo >&2;
            [ "${__BU_MODULE_INIT__USER_LANG,,}" = 'fr' ] && echo "FR | ATTENTION : Impossible de sourcer le fichier de traduction destiné à la langue spécifiée en argument lors de l'appel de la fonction « ${FUNCNAME[0]} »" >&2 && echo >&2;
            BU::ModuleInit::GetModuleInitLanguage_RestOfLibrary || return 1;
        }
    fi
}
# -----------------------------------------------
## FUNCTIONS NEEDED FOR THE DISPLAYING OF THE INITIALIZATION MESSAGES
# Asking to the user if (s)he wants to display the initialization logs on the screen (preferably before stopping the script's execution after a fatal error).
function BU::ModuleInit::AskPrintLog()
{
	#**** Code ****
	if [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" == '--log-display' ]; then
        echo;
		BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__ASK_DISPLAY" '#' 'echo';
		# If the user's defined language is not English, then a message will be displayed to ask the user in his/her language to write 'yes' or 'Y' if he/she wants to display the initialization logs.
		if [ "${__BU_MODULE_INIT__USER_LANG,}" != 'en' ]; then
            echo; echo "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_ENGLISH";
		fi
		echo; read -rp "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__ENTER_ANS" read_ask_print_log;
		if [ "${read_ask_print_log,,}" = 'yes' ] || [ "${read_ask_print_log^^}" = 'Y' ]; then
			BU::ModuleInit::PrintLog || return 1;
			return 0;
		else
			echo; echo "$__BU_MODULE_INIT_MSG__ASKPRINTLOG__NO_DISPLAY"; echo; return 0;
		fi
	else
		return 0;
	fi
}
# Printing and / or logging the global variables already defined.
function BU::ModuleInit::DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos()
{
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_GLOBAL_VARS" '#' 'msg';
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__SCRIPT_INFO" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_PROJECT_PID'           "$__BU_MODULE_INIT_PROJECT_PID"             'Int'       "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__PID"                   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__project_pid__lineno";
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_ROOT_DIR_VARS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__ROOT_HOME"            "$__BU_MODULE_INIT__ROOT_HOME"              'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT_HOME"             "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__root_home__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__ROOT"                 "$__BU_MODULE_INIT__ROOT"                   'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__ROOT"                  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__root__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__INITIALIZER_PATH'     "$__BU_MODULE_INIT__INITIALIZER_PATH"       'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INITIALIZER_PATH"      "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__initializer_path__lineno";
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_CONF_DIRS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_DIR"           "$__BU_MODULE_INIT__CONFIG_DIR"             'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_DIR"            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__config_dir__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_DIR"      "$__BU_MODULE_INIT__CONFIG_INIT_DIR"        'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__config_init_dir__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_MODULES_DIR"   "$__BU_MODULE_INIT__CONFIG_MODULES_DIR"     'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_MODULES_DIR"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__config_modules_dir__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR" "$__BU_MODULE_INIT__CONFIG_INIT_LANG_DIR"   'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_LANG_DIR"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__config_init_lang_dir__lineno";
    BU::ModuleInit::Msg;
    # Initializer script's configuration files.
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__CONFIGURATION_FILES" '+' 'msg';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS' "$__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS" 'Filepath' "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__CONFIG_INIT_DIR__STATUS"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__config_init_dir__status__lineno";
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MODULE_INIT_DIR" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__MODULES_DIR"          "$__BU_MODULE_INIT__MODULES_DIR"                'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__MODULES_DIR"               "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__modules_dir__lineno";
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_FILE_PATH" '+' 'msg'; BU::ModuleInit::Msg
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME"              "$__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME"            'File'      "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir__file_name__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR"        "$__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR"      'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir_file__parent_dir__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH"              "$__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH"            'Filepath'  "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir__file_path__lineno";
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_VARS_LIB_ROOT_DIR_ROOT_FILE" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME"         "$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME"       'File'      "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_NAME"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir_root__file_name__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE__PARENT_DIR"   "$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE__PARENT_DIR" 'Dirpath'   "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PARENT_DIR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir_root_file__parent_dir__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos "__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH"         "$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH"       'Filepath'  "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__LIB_ROOT_DIR_ROOT_FILE_PATH"       "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__lib_root_dir_root__file_path__lineno";
    BU::ModuleInit::Msg;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__INIT_MISC_VARS" '+' 'msg'; BU::ModuleInit::Msg;
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM'          "$__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM"        'Char'      "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__TRANSLATION_FILE_DELIM"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__csv_translation_file__delim__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__DATE_LOG'                             "$__BU_MODULE_INIT__DATE_LOG"                           'CMD'       "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__DATE_LOG"                  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__date_log__lineno";
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT__USER_LANG'                            "$__BU_MODULE_INIT__USER_LANG"                          'CMD'       "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__USER_LANG"                 "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__bu_module_init__user_lang__lineno";
    # Unsetting every string variables in order to free up some memory.
	# Don't double quote the command substitution.
	# shellcheck disable=SC2046
	unset $(compgen -v "__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__");
    # Unsetting the line number values.
    # shellcheck disable=SC2046
	unset $(compgen -v "__bu_module_init__");
    unset __bu_module_init__project_pid__lineno \
        __bu_module_init__root_home__lineno \
        __bu_module_init__root__lineno \
        __bu_module_init__initializer_path__lineno \
        __bu_module_init__config_dir__lineno \
        __bu_module_init__config_init_dir__lineno \
        __bu_module_init__config_modules_dir__lineno \
        __bu_module_init__config_init_lang_dir__lineno \
        __bu_module_init__config_init_dir__status__lineno \
        __bu_module_init__modules_dir__lineno \
        __bu_module_init__lib_root_dir__file_name__lineno \
        __bu_module_init__lib_root_dir_file__parent_dir__lineno \
        __bu_module_init__lib_root_dir__file_path__lineno \
        __bu_module_init__lib_root_dir_root__file_name__lineno \
        __bu_module_init__lib_root_dir_root_file__parent_dir__lineno \
        __bu_module_init__lib_root_dir_root__file_path__lineno \
        __bu_module_init__csv_translation_file__delim__lineno \
        __bu_module_init__date_log__lineno \
        __bu_module_init__user_lang__lineno
}
# Displaying the information on the initialized global variables.
# shellcheck disable=SC2059
function BU::ModuleInit::DisplayInitGlobalVarsInfos()
{
    if [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-full' ]; then
        #**** Parameters ****
        local p_var_name=$1;	# String    - Default : NULL    - Name of the variable.
        local p_var_val=$2;		# String    - Default : NULL    - Value stored in the variable.
		local p_var_type=$3;	# String    - Default : NULL    - Type of variable (array, int (integer), float, path, string).
        local p_var_desc=$4;	# String    - Default : NULL    - Description of the variable.
        local p_file=$5;        # String    - Default : NULL    - File where the variable was declared.
        local p_func=$6;        # String    - Default : NULL    - Function where the variable was declared.
        local p_line=$7;        # Int       - Default : NULL    - Line where the variable was declared.
        # If the variable type is an array, then the values must be passed as an array,
        # or else only the first index's value will be displayed.
        shift 7
        local pa_var_val_array=("$@")
        #**** Variables ****
        local v_file; v_file="$([[ -n "$p_file" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE" "$p_file" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FILE_NULL")";
        local v_func; v_func="$([[ -f "$p_func" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC" "$p_func" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__FUNC_NULL")";
        local v_line; v_line="$([[ -n "$p_line" ]] && printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE" "$p_line" || echo "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__LINE_NULL")";
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
			&& [ "${p_var_type,,}" != 'bool' ] \
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
            BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_ARRAY" "$p_var_name")" '-' 'msg';
		# Checking if the variable is not an array.
		else
            # shellcheck disable=SC2059
            BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__CHECK_IS_NOT_ARRAY" "$p_var_name")" '-' 'msg';
		fi
		BU::ModuleInit::Msg;
		BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DESCRIPTION $p_var_desc";
		BU::ModuleInit::Msg;
		BU::ModuleInit::Msg "$v_file";
		BU::ModuleInit::Msg "$v_func";
		BU::ModuleInit::Msg "$v_line";
		if [ "${p_var_type,,}" = 'array' ]; then
            BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_TYPE";
            BU::ModuleInit::Msg;
    		# If a value or more are stored in the processed array.
			if [ -n "${pa_var_val_array[*]}" ]; then
                local v_index=0;
                for _ in "${pa_var_val_array[@]}"; do
                    BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_VALUE [$v_index] : $_";
                    # Line break every five lines, in order to keep the values list readable for a human.
                    local v_value_line=$(( v_index + 1 ));
                    if [ $(( v_value_line % 5 )) -eq 0 ]; then
                        # Avoid line breaks when the end of the array is reached, if it's last index's modulo of five is equal to 0.
                        if [ "$i" -eq "${pa_var_val_array[${#pa_var_val_array[@]} -1]}" ]; then BU::ModuleInit::Msg '' '-n';
                        else BU::ModuleInit::Msg;
                        fi
                    fi
                    v_index=$(( v_index+1 ));
                done;
                BU::ModuleInit::Msg;
                local v_index=0;
			else
				BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__ARR_PROC_ARR_EMPTY" '-' 'msg';
                BU::ModuleInit::Msg;
			fi
		else
            # shellcheck disable=SC2059
            BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_TYPE" "$p_var_type")";
            BU::ModuleInit::Msg;
			# If a variable is stored in the processed variable.
			if [ -n "$p_var_val" ]; then
				if [ "${p_var_type,,}" = 'cmd' ]; then
                    # shellcheck disable=SC2059
					BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_CMD" "$p_var_name")";
				else
                    # shellcheck disable=SC2059
					BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_NOT_CMD" "$p_var_val")";
				fi
			else
				BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__VAL_IS_EMPTY" '-' 'msg';
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
    local p_str=$1;     # String  - Default : NULL  - The string to display.
    local p_option=$2;  # String  - Default : NULL  - The "echo" command's options.
    #**** Code ****
    # If the '--log-display' argument is passed as a 'module' parameter, then every messages must
    # be printed on the screen and redirected towards the "$__BU_MODULE_INIT_MSG_ARRAY" array.
    if [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=''; echo -ne '';
                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT__DATE_LOG $p_str");
                    echo -ne "${p_str##* ] }"; fi;
					return 0;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n'); echo -e '';
                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT__DATE_LOG $p_str\n");
                    echo -e "${p_str##* ] }"; fi;
					return 0;;
        esac
    # Else, if the '--log-shut' argument is passed as a 'module' parameter, then every initialization
    # messages must be redirected towards the "/dev/null" virtual device file, and the array must be emptied.
    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-shut' ]; then
        return 0;
    # Else, if the '--log-shut-display' argument is passed as a 'module' parameter, then
    # every initialization messages must be redirected to the screen only, not to the array.
    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-shut-display' ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    echo -ne '';
                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    echo -ne "$p_str"; fi
					return 0;
                ;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    echo -e '';
                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    echo -e "$p_str"; fi
                return 0;
            ;;
        esac
    # Else, if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable stores no value (empty by default), then every
    # initialization messages must be stored in the "$__BU_MODULE_INIT_MSG_ARRAY" array without being printed on the screen.
    elif [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
        case "${p_option,,}" in
            '-n' | 'n')
                # If no value is stored in the string parameter, it must not be interpreted as a newline, since the '-n' echo command's parameter forbids carriage returns.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('');
                # Else, if a value is stored in the string parameter, it must be printed on the screen, without carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT__DATE_LOG $p_str");
                    echo -ne "${p_str##* ] }"; fi;
					return 0;
                ;;
            '' | *)
                # If no value is stored in the string parameter, it must be interpreted as a newline.
                if [ -z "$p_str" ]; then
                    __BU_MODULE_INIT_MSG_ARRAY+=('\n'); echo -e '';
                # Else, if a value is stored in the string parameter, it must be printed on the screen with carriage returns.
                else
                    # Printing the date before the text to log.
                    __BU_MODULE_INIT_MSG_ARRAY+=("$__BU_MODULE_INIT__DATE_LOG $p_str\n"); fi
                return 0;
            ;;
        esac
    # Else, if an incorrect value is passed as "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable's value.
    else
        echo >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_1" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" >&2; echo >&2;
        echo "$__BU_MODULE_INIT_MSG__MSG__BAD_PERMISSION_2" >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    return 0;
}
# Writing a text under a line with the same size.
function BU::ModuleInit::MsgLine()
{
    #**** Parameters ****
    local p_str=$1;     # String  - Default : NULL  - String to display.
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
        echo >&2; echo "TEST-MSGLINE" >&2; echo >&2; return 1;
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
        echo >&2; echo "TEST-MSGLINECOUNT" >&2; echo >&2; return 1;
    fi
    return 0;
}
# Displaying a text when the script's execution must be stopped.
function BU::ModuleInit::MsgAbort() { echo >&2; echo "$__BU_MODULE_INIT_MSG__MSG_ABORT__ABORT" >&2; echo >&2; return 0; }
# Pressing any key on the keyboard to do an action.
# shellcheck disable=SC2059
function BU::ModuleInit::PressAnyKey() { echo; read -n 1 -s -r -p "$(printf "$__BU_MODULE_INIT_MSG__PRESS_ANY_KEY__PRESS %s" "$1")"; echo; return 0; }
# Printing the initialization on the screen. Although this function is called if the '--log-display' value is passed with the
# "module" argument, this function could be used as a help, in case this value's parameters doesn't work in case of a rework.
function BU::ModuleInit::PrintLog()
{
    #**** Variables ****
    local v_init_logs_str="$__BU_MODULE_INIT_MSG__PRINTLOG__INITLOGS";
    local v_tmp_file;
        v_tmp_file_original="$(echo "$RANDOM" | md5sum).tmp";
    shopt -s extglob;
    local v_tmp_file;
         v_tmp_file="${v_tmp_file_original%%+( - )}";   # Removing the extra whitespace with the dash.
    shopt -u extglob;
    #**** Code ****
    echo;
    BU::ModuleInit::MsgLine "$__BU_MODULE_INIT_MSG__PRINTLOG__HERE" '#' 'echo'; echo
    if [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-full' ]; then
        echo "$__BU_MODULE_INIT_MSG__PRINTLOG__FULL_MODE"; echo;
    elif [ "$__BU_MODULE_INIT_MSG_ARRAY_MODE" = '--mode-log-partial' ]; then
        echo "$__BU_MODULE_INIT_MSG__PRINTLOG__PARTIAL_MODE"; echo;
    fi
    BU::ModuleInit::MsgLine "$v_init_logs_str" '-' 'echo';
    BU::ModuleInit::MsgLineCount "${#v_init_logs_str}" '-' 'echo';
    BU::ModuleInit::Msg;
    BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE";
    BU::ModuleInit::Msg;
	BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_ADVICE_IF_NO_LOGS_ARE_DISPLAYED";
	BU::ModuleInit::Msg;
    BU::ModuleInit::PressAnyKey "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CALL_PRESS_ANY_KEY_FNCT";
    BU::ModuleInit::Msg;
    touch "$v_tmp_file" || { echo >&2; echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_CANNOT_CREATE_TMP_FILE" >&2; echo >&2; return 1; };
    echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DISPLAY_LOGS_TITLE" >> "$v_tmp_file";
    echo >> "$v_tmp_file";
    echo "$__BU_MODULE_INIT_MSG__PRINTLOG__DONT_PRESS_Q" >> "$v_tmp_file"
    echo >> "$v_tmp_file";
    echo >> "$v_tmp_file";
    for value in "${__BU_MODULE_INIT_MSG_ARRAY[@]}"; do
        # shellcheck disable=SC2059
        printf "${value##* ] }" >> "$v_tmp_file";
    done
    less "$v_tmp_file";
    rm "$v_tmp_file";
    echo; echo ">>>>> $__BU_MODULE_INIT_MSG__PRINTLOG__POST_DISPLAY_TEXT"; echo;
	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array, and it calls this function.
	return 0;
}
# Print an error message in the log storage variable.
function BU::ModuleInit::PrintLogError()
{
    #**** Parameters ****
    local p_desc=$1;    # Description of the error.
    local p_lineno=$2;  # Line where the error happened.
    #**** Code ****
    if [[ "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" = '--log-shut'* ]]; then
        local backup="$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION";
        __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='--log-display';
    fi
    BU::ModuleInit::Msg >&2;
    # shellcheck disable=SC2059
    BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__PRINTLOG_ERROR__PRINT_ERROR" "$p_desc" "$p_lineno")" '-' 'msg' >&2;
    BU::ModuleInit::Msg >&2;
    if [ -n "$backup" ]; then __BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$backup"; fi
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
		# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
		return 1;
	fi
}
# Check if the given path exists (This function is called by the "BU::ModuleInit::SourcingFailure()" function).
function BU::ModuleInit::CheckPath()
{
    #**** Parameters ****
    local p_path=$1;    # String  - Default : NULL    - Path of the target file or directory.
    local p_target=$2;  # String  - Default : NULL    - Specify if the target is a directory or a file.
    #**** Code ****
    if [ -z "$p_path" ]; then
        # shellcheck disable=SC2059
        printf "« $__BU_MODULE_INIT_MSG__CHECKPATH__NO_FILE_PATH »" >&2; return 0;
    else
        if [ -z "$p_target" ]; then
            echo  >&2;
            # shellcheck disable=SC2059
            printf "$__BU_MODULE_INIT_MSG__CHECKPATH__NO_TARGET_SPECIFICATION\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2;
            # shellcheck disable=SC2059
            printf "$__BU_MODULE_INIT_MSG__CHECKPATH__PLEASE_SPECIFY_TARGET_SPECIFICATION" "${FUNCNAME[0]}" >&2; echo >&2; return 1;
        else
            if [[ "$p_target" = [D-d] ]]; then
                if [ -d "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;
                else
                    printf "%s $__BU_MODULE_INIT_MSG__CHECKPATH__DIR_NOT_FOUND" "$p_path" >&2; return 0;
                fi
            elif [[ "$p_target" = [F-f] ]]; then
                if [ -f "$p_path" ]; then
                    printf "%s" "$p_path"; return 0;
                else
                    printf "%s $__BU_MODULE_INIT_MSG__CHECKPATH__FILE_NOT_FOUND" "$p_path" >&2; return 0;
                fi
            else
                echo >&2;
                # shellcheck disable=SC2059
                printf "$__BU_MODULE_INIT_MSG__CHECKPATH__UNKNOWN_TARGET\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$p_target" >&2; echo >&2; return 1;
            fi
        fi
    fi
}
# Getting the path returned by the "find" command, to make the directories and files searching case insensitive.
function BU::ModuleInit::FindPath()
{
	#	$1	--> String  - Default : NULL    - Parent directory.
    #	$2	--> String  - Default : NULL    - Targeted directory or file.
    find "$1" -maxdepth 1 -iname "$2" -print 2>&1 | grep -v "Permission denied" ||
	{
        if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_EXISTS" ]; then
            echo >&2;
            # shellcheck disable=SC2059
            printf "$__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$1" "$2" >&2; echo >&2;
        else
            BU::ModuleInit::Msg >&2;
            # shellcheck disable=SC2059
            BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__FIND_PATH__PATH_NOT_FOUND --> %s/%s\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" "$1" "$2")" >&2; BU::ModuleInit::Msg >&2;
        fi
        if BU::IsInScript; then exit 1; else return 1; fi
	}; return 0;
}
# Getting the module's name from a subdirectory (this function is called in the main module's "module.conf" configuration file).
function BU::ModuleInit::GetModuleName()
{
    v_module="$(cd "$(dirname "$1")" || {
        echo >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__GET_MODULE_NAME__UNABLE_TO_GET" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2;
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    }; pwd -P)";
    echo "${v_module##*/}"; return 0;
}
# Listing all the installed modules if the developer mistyped the module's name at the beginning of the main project's script.
# shellcheck disable=SC2059
function BU::ModuleInit::ListInstalledModules()
{
    #**** Variables ****
    local v_module_tmp_d="$__BU_MODULE_INIT__ROOT/tmp";
    local v_module_conf_f="$v_module_tmp_d/BU_modules_config_dir.out";
    local v_module_diff_f="$v_module_tmp_d/BU_modules_init_diff.out";
    local v_module_init_f="$v_module_tmp_d/BU_modules_init_dir.out";
    #**** Code ****
    if [ ! -d "$v_module_tmp_d" ]; then
        mkdir -p "$v_module_tmp_d" ||
		{
            BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__CALL_PLE" "$__BU_MODULE_INIT__ROOT")" "$LINENO";
			printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))" "$__BU_MODULE_INIT__ROOT" >&2; echo >&2;
			echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNABLE_TO_CREATE_TMP_DIR__ADVICE" >&2; echo >&2;
			BU::ModuleInit::AskPrintLog >&2 || return 1;
			return 1;
		}
    fi
    if [ -d "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" ] && [ -d "$__BU_MODULE_INIT__MODULES_DIR" ]; then
																				# In case the "ls" command points towards a bad path because of a bad variable's value.
        ls -1 "$__BU_MODULE_INIT__CONFIG_MODULES_DIR"	> "$v_module_conf_f"    || { echo >&2; printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2; BU::ModuleInit::AskPrintLog >&2 || return 1; return 1; };
        ls -1 "$__BU_MODULE_INIT__MODULES_DIR"			> "$v_module_init_f"    || { echo >&2; printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__UNEXISTENT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO" >&2; echo >&2; BU::ModuleInit::AskPrintLog >&2 || return 1; return 1; };
        if diff "$v_module_conf_f" "$v_module_init_f" > "$v_module_diff_f"; then
            echo; echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INSTALLED_MODULES_LIST :"; echo; sleep ".5";
            # Displaying the content of the file which stores both the found modules configuration folders and the the modules initialization folders.
            cat "$v_module_conf_f"; echo; sleep 1;
        else
            echo >&2;
            printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__ONE_OR_MORE_MODULES_MISSING\n" "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" "$__BU_MODULE_INIT__MODULES_DIR" >&2; echo >&2;
            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_CONFIGURATION_FOLDER_LIST :" >&2; echo >&2;
            # Displaying the content of the file which stores the found modules configuration folders.
            cat "$v_module_conf_f" >&2; echo >&2;
            echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__MODULES_INITIALIZATION_FOLDER_LIST :" >&2; echo >&2;
            # Displaying the content of the file which stores the found modules initialization folders.
            cat "$v_module_init_f"; echo >&2; echo >&2;
			# Getting the differences between the two files.
			echo "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__LISTED_MODULES_DIFFERENCES_BELOW" >&2; echo >&2;
			# Printing the differences between the two generated files.
			sdiff "$v_module_conf_f" "$v_module_conf_f"; echo >&2;
        fi
    else
        if [ ! -d "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" ] && [ ! -d "$__BU_MODULE_INIT__MODULES_DIR" ]; then
            printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__BOTH_CONF_AND_INIT_FOLDER_ARE_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;
        elif [ -d "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" ]; then
            printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__CONF_FOLDER_IS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;
        elif [ -d "$__BU_MODULE_INIT__MODULES_DIR" ]; then
            printf "$__BU_MODULE_INIT_MSG__LIST_INSTALLED_MODULES__INIT_FOLDER_IS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" >&2;
        fi
		echo >&2;
    fi
	BU::ModuleInit::AskPrintLog >&2 || return 1;
    return 1;
}
# Printing an error message if a file cannot be sourced.
# shellcheck disable=SC2059
function BU::ModuleInit::SourcingFailure()
{
    #**** Parameters ****
    local p_path=$1;    # String    - Default : NULL    - Path of the file that cannot be sourced.
    local p_module=$2;  # String    - Default : NULL    - Name of the module.
    #**** Code ****
    BU::ModuleInit::Msg >&2; BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__SOURCING_FAILURE__UNABLE_TO_SOURCE" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" "$p_module" "$(BU::ModuleInit::CheckPath "$p_path" 'f')")" >&2; BU::ModuleInit::Msg >&2; BU::ModuleInit::AskPrintLog >&2 || return 1; return 1;
}
# -----------------------------------------------
## FUNCTIONS NEEDED FOR THE MODULES PROCESSING
# Usage function
function BU::ModuleInit::Usage()
{
    echo >&2; echo "$__BU_MODULE_INIT_MSG__USAGE__SUPVALS" >&2;
    echo >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG";
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_DISPLAY" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_LOG_SHUT_DISPLAY" >&2;
	echo >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG";
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_FULL" >&2;
	echo "$__BU_MODULE_INIT_MSG__USAGE__INCOMPATIBLE_VALS_MODE_LOG_PARTIAL" >&2;
	echo >&2
	echo "$__BU_MODULE_INIT_MSG__USAGE__DEBUG_VALUES_LIST" >&2;
    echo "$__BU_MODULE_INIT_MSG__USAGE__DEBUG" >&2;
    echo "$__BU_MODULE_INIT_MSG__USAGE__DEBUG_BASHX" >&2;
}
# Easy writing status error.
function BU::ModuleInit::DisplayStatError()
{
    #**** Parameters ****
    local p_file=$1;        # String    - Default : NULL    - File where the current function is called (mainly from the "BU::Main::StatusCheckSTAT<...>()" functions).
    local p_lineno=$2;      # Int       - Default : NULL    - Line where the current function is called (mainly from the "BU::Main::StatusCheckSTAT<...>()" functions).
    local p_bad_value=$3;   # String    - Default : NULL    - Bad value passed as "BU::Main::StatusCheckSTAT<...>()" function's argument.
    local p_var_name=$4     # String    - Default : NULL    - Name of the variable that stores the bad value.
    # Shifting the same number of time as the former arguments number
    # to avoid including these arguments values in the allowed values array.
    shift 4;
    local pa_correctValues=("$@");
    #**** Variables ****
    local i=0;
    #**** Code ****
    echo "AN ERROR OCCURED DURING THIS STATUS VARIABLE CHECKING --> $p_var_name" >&2;
    printf "In « %s », line « %s »" "$p_file" "$p_lineno" >&2;
    echo "Error : the « %s » variable's value is incorrect." "$p_var_name" >&2;
    if [ -z "$p_bad_value" ]; then
        echo >&2; echo "Bad value : 'An empty string'" >&2;
    else
        echo >&2; EchoError "Bad value : « %s »" "$p_bad_value" >&2;
    fi
    echo "The allowed values are :" >&2;
    # Displaying the list of every allowed arguments.
    for val in "${pa_correctValues[@]}"; do
        i=$(( i+1 ));
        # If an empty argument is allowed.
        if [ -z "$val" ]; then
            echo "%s/%s --> 'An empty argument'" "$i" "${#pa_correctValues[@]}" >&2;
        else
            echo "%s/%s  --> %s" "$i" "${#pa_correctValues[@]}" "$val" >&2;
        fi
    done
    echo >&2;
    return 1;
}
# Checking the "$__BU_MODULE_INIT_STAT_DEBUG" status variable's value.
function BU::ModuleInit::CheckSTAT_DEBUG()
{
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("true" "false");
    #**** Code ****
    if [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" != "true" ] && [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" != "false" ]; then
        BU::ModuleInit::DisplayStatError "$p_file" "$p_lineno" "$__BU_MODULE_INIT_STAT_DEBUG" "__BU_MODULE_INIT_STAT_DEBUG" "${va_correctValues[@]}"; return "$?";
    fi
    return 0;
}
# Checking the "$__BU_MODULE_INIT_STAT_DEBUG_BASHX" status variable's value.
function BU::ModuleInit::CheckSTAT_DEBUG_BASHX()
{
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("file" "category" "sub-category" "subcategory");
    #**** Code ****
    if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" != "file" ] && [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" != "category" ] && [[ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" != sub?(-)category ]]; then
        BU::ModuleInit::DisplayStatError "$p_file" "$p_lineno" "$__BU_MODULE_INIT_STAT_DEBUG_BASHX" "__BU_MODULE_INIT_STAT_DEBUG_BASHX" "${va_correctValues[@]}"; return "$?";
    fi
    return 0;
}
# Changing the "$__BU_MODULE_INIT_STAT_DEBUG" status variable's value.
function BU::ModuleInit::ChangeSTAT_DEBUG       { __BU_MODULE_INIT_STAT_DEBUG="$1";         BU::ModuleInit::CheckSTAT_DEBUG         "$2" "$3" || return "$?"; return 0; }
# Changing the "$__BU_MODULE_INIT_STAT_DEBUG" status variable's value.
function BU::ModuleInit::ChangeSTAT_DEBUG_BASHX { __BU_MODULE_INIT_STAT_DEBUG_BASHX="$1";   BU::ModuleInit::CheckSTAT_DEBUG_BASHX   "$2" "$3" || return "$?"; return 0; }
# Checking if the debug mode is active.
function BU::ModuleInit::CheckIsDebugging() { if [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" = 'true' ]; then return 0; else return 1; fi; }
# Processing the "module" value's parameters.
function BU::ModuleInit::ProcessFirstModuleParameters()
{
    #**** Parameters ****
    local p_module=$1;  # Mmodules to include passed as argument, with its own parameters.
    local p_count=$2;   # Counting the times the function was called in the "BashUtils_InitModules" function's main loop.
    #**** Variables ****
    local v_module_name;
        v_module_name="$(echo "$p_module" | cut -d' ' -f1)";
    # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    local v_loop_error;
    #**** Code ****
    # -----------------------------------------------
    ## PROCESSING THE 'module' VALUE'S ARGUMENTS VALUES
    # Checking if the "module --" value is passed as first argument, in order to configure immediately the initialization language and the authorization to display the initialization logs on the screen.
    # These numbers stored in the "$p_count" variable refer to the modules indexes.
    if [ "$p_count" -eq 0 ]; then
        # If the "module" value is passed without parameters.
        if [[ "$p_module" == "$v_module_name" ]]; then
            # shellcheck disable=SC2059
            BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__CALL_PLE\n" "${FUNCNAME[0]}")" "$(( LINENO - 1 ))"; echo >&2;
            # shellcheck disable=SC2059
            printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( BASH_LINENO - 5 ))" >&2; echo >&2;
            echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_NO_OPTS__ADVICE" >&2;
            BU::ModuleInit::MsgAbort;
            BU::ModuleInit::AskPrintLog >&2 || return 1;
            return 1;
        elif [[ "$p_module" == 'module --'* ]]; then
            # Creating a new global variable to store the word array made with the "module" value and the values that come with it.
            read -ra module_array <<< "$p_module";
			# Unsetting the "module" value from the newly created array, in order to avoid an "unsupported argument" error.
			unset "module_array[0]";
            # -----------------------------------------------
            ## MODULE : DEFINING RESOURCES FOR THE « module » ARGUMENTS PROCESSING
            # Defining a function to optimize the displaying of errors for the 3 "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable's accepted values.
            function BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize()
            {
                #**** Parameters ****
                local p_value=$1;   # New value to assign to the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable.
                #**** Code ****
                # If the current value AND the new value are the same.
                if [ "$p_value" = "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
                    # shellcheck disable=SC2059
                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE__CALL_PLE" "${FUNCNAME[0]}")" "$p_value" "$(( LINENO - 1 ))"; echo >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__SAME_MSG_ARRAY_PERM_PASSED_TWICE\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" "$p_value" >&2;
                    echo >&2; return 1;
                else
                    # shellcheck disable=SC2059
                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__CALL_PLE" "${FUNCNAME[0]}" "$p_value" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION")" "$LINENO"; echo >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_1\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" >&2; echo >&2;
                    echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED__ADVICE_2" >&2; echo >&2
                    echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_EXTRA_INFO" >&2; echo >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_CURRENT_VAL\n" "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__LPWO__DIFF_MSG_ARRAY_PERM_PASSED_NEW_VAL\n" "$p_value" >&2;
                    echo >&2; return 1;
                fi
            }
            # Processing the list of arguments for the "module" module.
            for module_args in "${module_array[@]}"; do
                # -----------------------------------------------
                ## MODULE : USER'S LANGUAGE PROCESSING
                # If the "module" value's argument is "--lang="
#                 if [[ "$module_args" == *'--lang='* ]]; then
#
#                     if [ -n "$__BU_MODULE_INIT_MODULE_LANG_ARG" ]; then
#                         BU::ModuleInit::PrintLogError "${FUNCNAME[0]} : Another language added to the « module » value's arguments list (first : $__BU_MODULE_INIT_MODULE_LANG_ARG | New : $module_args)" "$LINENO";
#
#                         echo >&2; echo "In « ${BASH_SOURCE[0]} », line $(( LINENO-3 )) --> Warning : you already passed a language to the « module » argument list";
#                         echo "Please choose only one of these languages" >&2;
#                         echo >&2;
#
#                         echo "Current language : $__BU_MODULE_INIT_MODULE_LANG_ARG" >&2;
#                         echo "Chosen language : $module_args" >&2;
#                     else
#                         case "$module_args" in
#                             # Deutch | German
#                             'de_'[A-Z][A-Z])
#                                 # Erstellung einer neuen Variablen zur Speicherung der derzeit vom Betriebssystem verwendeten Sprache.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # English
#                             'en_'[A-Z][A-Z])
#                                 # Creating a new variable to store the language currently used by the operating system.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # Español | Spanish
#                             'es_'[A-Z][A-Z])
#                                 # Creación de una nueva variable para almacenar el idioma utilizado actualmente por el sistema operativo.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#
#                             # Français | French
#                             'fr_'[A-Z][A-Z])
#                                 # Création d'une nouvelle variable pour y enregistrer la langue actuellement utilisée par le système d'exploitation.
#                                 __BU_MODULE_INIT_MODULE_LANG_ARG="$module_args";;
#                             *)
#                                 ;;
#                         esac
#                     fi
                # -----------------------------------------------
                ## "DEBUG" AND "DEBUG_BASHX" STATUS VARIABLES
                # Creating a function to print the correct values for the current option in different languages structures.
                function BU::ModuleInit::ProcessFirstModuleParameters::ProcessBadStatusOptionValues()
                {
                    BU::ModuleInit::Msg "$(printf "Warning : the supported values for the « %s » option are : %s" "$1" "$2")" >&2;
                    BU::ModuleInit::Msg >&2;
                }
                # Else, if the "module" parameter's value is a debug value : '--stat-debug=false', '--stat-debug=true'
                if [[ "${module_args,,}" = *'--stat-'* ]]; then
                    # Sourcing the "Status.conf" file, and then modifying the sourced global status variables values.
                    source "$__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS" || {
                        echo "$(basename "${BASH_SOURCE[0]}"), line $LINENO --> ERROR : UNABLE TO SOURCE THE « $__BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS » file";
                        v_loop_error='error'; break;
                    }; echo "Sourced the Status.conf file"; echo;
                    case "${module_args,,}" in
                        # "$__BU_MODULE_INIT_STAT_DEBUG" global status variable.
                        '--stat-debug='*)
                            if      [ "${value[i],,}" = '--stat-debug=false' ]          || [ "${value[i],,}" = '--stat-debug=true' ]; then
                                    __BU_MODULE_INIT_STAT_DEBUG="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_STAT_DEBUG' "$__BU_MODULE_INIT_STAT_DEBUG" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                                    __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                            else
                                BU::ModuleInit::ProcessFirstModuleParameters::ProcessBadStatusOptionValues "--stat-debug" "« --stat-debug=false », « --stat-debug=true »" || { v_loop_error='error'; break; };
                            fi
                        ;;
                        # "$__BU_MODULE_INIT_STAT_DEBUG_BASHX" global status variable.
                        '--stat-debug-bashx='*)
                            if BU::ModuleInit::CheckIsDebugging; then
                                if      [ "${value[i],,}" = '--stat-debug-bashx=file' ]       || [ "${value[i],,}" = 'stat-debug-bashx=category' ]             || [[ "${value[i],,}" == stat-debug-bashx=sub?(-)category ]]; then
                                    __BU_MODULE_INIT_STAT_DEBUG_BASHX="${value#*=}";            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_STAT_DEBUG_BASHX' "$__BU_MODULE_INIT_STAT_DEBUG_BASHX" 'String' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG_BASHX_FNCT_" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                                    __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                                elif    [ "${value[i],,}" = '--stat-debug-void=void' ]; then
                                    __BU_MODULE_INIT_STAT_DEBUG_BASHX='';                       BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_STAT_DEBUG_BASHX' "$__BU_MODULE_INIT_STAT_DEBUG_BASHX" 'String' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DEBUG_BASHX_FNCT_" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                                else
                                    BU::ModuleInit::ProcessFirstModuleParameters::ProcessBadStatusOptionValues "--stat-debug-bashx" "« --stat-debug-bashx=category », « --stat-debug-bashx=file », « --stat-debug-bashx=function », « --stat-debug-bashx=sub-category »" || { v_loop_error='error'; break; };
                                fi
                            else
                                BU::ModuleInit::Msg "NOTE : The « __BU_MODULE_INIT_STAT_DEBUG » status global variable's value must be set to « true » in order to use this advanced debugging functionnality";
                                BU::ModuleInit::Msg;
                            fi
                        ;;
                        *)
                            echo "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED STATUS ARGUMENT FOR THE « module » PARAMETER" >&2;
                            echo >&2;
                            return 1;
                        ;;
                    esac
                # -----------------------------------------------
                ## MODULE : LOG MESSAGES PROCESSING
                # Else, if the "module" parameter's value is a log redirection parameter : '--log-display', '--log-shut' or '--log-shut-display'.
				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" == *'--log-'* ]]; then
					case "${module_args,,}" in
						# Log value : --log-display (printing the initialization messages on the screen while they are appened to the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-display')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
								# By default, the initialization process doesn't prints the log messages, unless there's an error (this printing cannot be avoided).
								# To print the initialization logs on the screen, you have to pass the '--log-display' argument when you pass the "module" value as first argument
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							fi
                        ;;
						# Log value : --log-shut (don't print the initialization messages on the screen, nor append them into the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_INIT_MSG_ARRAY" variable,
								# the existing logged messages will be erased, and no initialization messages will be displayed, unless it's an error message.
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
								# Erasing the content of the "$__BU_MODULE_INIT_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_INIT_MSG_ARRAY;
							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
								# Erasing the content of the "$__BU_MODULE_INIT_MSG_ARRAY" variable, since it's no more useful.
								unset __BU_MODULE_INIT_MSG_ARRAY;
							fi
                        ;;
						# Log value : --log-shut-display (print the initialization messages on the screen without appening them into the "$__BU_MODULE_INIT_MSG_ARRAY" array).
						'--log-shut-display')
							if [ -z "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" ]; then
								# If this argument is passed, no initialization messages will be logged in the "$__BU_MODULE_INIT_MSG_ARRAY" variable,
								# but all the log messages will be displayed on the screen.
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							# Handling the incompatibility with each other '--log-display', '--log-shut' and '--log-shut-display' arguments
							# by checking if the "$__BU_MODULE_INIT_MSG_ARRAY_PERMISSION" global variable already contains a value.
							else
								BU::ModuleInit::ProcessFirstModuleParameters::LogPermissionWarningOptimize "$module_args";
								__BU_MODULE_INIT_MSG_ARRAY_PERMISSION="$module_args";
							fi
                        ;;
						# An unsupported log argument is passed.
						*)
                            local v_unsupported_log_param;
                                v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";
                            # shellcheck disable=SC2059
							BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}" "$module_args")" "$(( LINENO - 3))"; echo >&2;
							# shellcheck disable=SC2059
							printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_unsupported_log_param" >&2; echo >&2;
							# shellcheck disable=SC2059
							printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_LOG_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;
							BU::ModuleInit::Usage;
							BU::ModuleInit::MsgAbort;
							BU::ModuleInit::AskPrintLog >&2 || { v_loop_error='error'; break; }
							v_loop_error='error'; break;
                        ;;
					esac
                # -----------------------------------------------
                ## MODULE : MODES PROCESSING
				# Else, if the "module" parameter's value is a logging option : "--mode-log-full" or "--mode-log-partial".
				# WARNING : these arguments are incompatible with each other, adding a new value will overwrite the former one.
                elif [[ "${module_args,,}" = '--mode-'* ]]; then
					case "${module_args,,}" in
						# Setting the "$__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-full', in order to print every initialization messages, and not only the essential initialization messages.
						'--mode-log-full')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="$module_args";
							# Displaying the initialization messages already appened in the "$__BU_MODULE_INIT_MSG_ARRAY" global variable.
							BU::ModuleInit::DisplayInitGlobalVarsInfos__DisplayInitializedGlobalVarsInfos;;
						# Setting the "$__BU_MODULE_INIT_MSG_ARRAY_MODE" global variable to '--mode-log-partial', in order to print the essential initialization messages only (already set by default).
						'--mode-log-partial')
							__BU_MODULE_INIT_MSG_ARRAY_MODE="$module_args";
                            # Unsetting every unsused string variables in order to free up some memory.
                            # shellcheck disable=SC2046
                            unset $(compgen -v "__BU_MODULE_INIT_MSG__DISP_INIT_GLOB_VARS_INFO__DIGVI__")
                        ;;
						# An unsupported mode argument is passed.
						*)
                            local v_unsupported_log_param;
                                v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";
                            # shellcheck disable=SC2059
							BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}" "$module_args")" "$(( LINENO - 3))"; echo >&2;
							# shellcheck disable=SC2059
							printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))" "$v_unsupported_log_param" >&2; echo >&2;
							# shellcheck disable=SC2059
							printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_VAL_MODE_LOG_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;
							BU::ModuleInit::Usage;
							BU::ModuleInit::MsgAbort;
							BU::ModuleInit::AskPrintLog >&2 || { v_loop_error='error'; break; }
							v_loop_error='error'; break;
                        ;;
					esac
                # -----------------------------------------------
                ## MODULE : HANDLING UNSUPPORTED ARGUMENTS
                # Else, if the "module" value's argument is not a supported one.
                else
                    local v_unsupported_log_param;
                        v_unsupported_log_param="$(printf "%s" "$module_args" | sed "s/^[^ ]* //")";
                    # shellcheck disable=SC2059
                    BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__CALL_PLE" "${FUNCNAME[0]}")" "$(( LINENO - 3 ))"; echo >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))" "$v_unsupported_log_param" >&2; echo >&2;
                    # shellcheck disable=SC2059
                    printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_GEN_OPT_UNSUPPORTED_VAL__ADVICE\n" "$p_count" >&2;
                    BU::ModuleInit::Usage;
                    BU::ModuleInit::MsgAbort;
                    BU::ModuleInit::AskPrintLog >&2 || { v_loop_error='error'; break; };
                    v_loop_error='error'; break;
                fi
            done; if [ "${v_loop_error,,}" = 'error' ]; then return 1; fi
            # Creating a global variable to store a value which proves that the 'module --*' value was passed as first argument, for the condition which checks if the 'main' module is passed as second argument.
            __BU_MODULE_INIT_MODULE_FIRST_ARG='true';
        fi
    # -----------------------------------------------
    ## MISSING 'main' MODULE AFTER THE 'module' VALUE
    # Else, if the the "module --" value is passed as first argument, but the "main" module is missing.
    # Note : the « main » value is made case insensitive, in order to support uppercase and lowercase arguments.
    elif [ "$p_count" -eq 1 ] && [ -z "$__BU_MODULE_INIT_MODULE_FIRST_ARG" ] && [[ "${p_module,,}" != 'main' ]] || [[ "${p_module,,}" != [Mm][Aa][Ii][Nn][[:space:]]--* ]]; then
        # shellcheck disable=SC2059
        BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__CALL_PLE" "${FUNCNAME[0]}")" "$LINENO"; echo >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))" >&2; echo >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_MAIN_MODULE_MISSING__ADVICE\n" "$v_module_name" "${FUNCNAME[0]}" >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
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
        # shellcheck disable=SC2059
		BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__CALL_PLE" "${FUNCNAME[0]}")" "$LINENO"; echo >&2;
		# shellcheck disable=SC2059
		printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
		echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_PARAM_PASSED_AFTER_MAIN_MODULE__ADVICE" >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    # -----------------------------------------------
    ## HANDLING OTHER MODULES, AFTER THE 'module' VALUE OR THE 'main' MODULE PASSING
    # Else, if the count is superior to 0 or 1, then the function'e execution is stopped.
    elif [ "$p_count" -ge 1 ]; then
        return 0;
    # -----------------------------------------------
    ## NO 'module' AND 'main' PASSED AS FIRST, THEN AS SECOND ARGUMENTS
    else
        # shellcheck disable=SC2059
        BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__CALL_PLE\n" "${FUNCNAME[0]}")" "$LINENO"; echo >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 3 ))" >&2;
        echo >&2; echo "$__BU_MODULE_INIT_MSG__PROCESS_FIRST_MODULE_PARAMS__MODULE_AND_MAIN_PARAMS_MISSING__ADVICE" >&2;
        BU::ModuleInit::MsgAbort;
        echo >&2; BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### BEGIN INITIALIZATION PROCESS
## CHECKING IF THE CURRENT SHELL IS BASH
if ! ps -a | grep -E "$$" | grep "bash" > /dev/null; then
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'de' ] && echo "BASH-UTILS ERROR : Ihr aktueller Shell-Interpreter ist nicht der « Bash » Interpreter, sondern der « ${SHELL##*/} » Interpreter" >&2 && echo >&2;
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'en' ] && echo "BASH-UTILS ERROR : Your current shell interpreter is not the « Bash » interpretor, but the « ${SHELL##*/} » interpretor" >&2 && echo >&2;
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'es' ] && echo "ERROR BASH-UTILS : Su intérprete de shell actual no es el intérprete « Bash », sino el intérprete « ${SHELL##*/} »" && echo >&2;
    [ "$(echo "$LANG" | cut -d _ -f1)" = 'fr' ] && echo "ERREUR DE BASH-UTILS : Votre interpréteur shell actuel n'est pas l'interpréteur « Bash », mais l'interpréteur « ${SHELL##*/} »" >&2 echo >&2;
	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
    BU::IsInScript && exit 1; return 1;
fi
# -----------------------------------------------
## DEFINING GLOBAL VARIABLES
__BU_MODULE_INIT_PROJECT_PID="$$";  __bu_module_init__project_pid__lineno="$LINENO";
__BU_MODULE_INIT__ROOT_HOME="$HOME"; __bu_module_init__root_home__lineno="$LINENO";
if [ -d "$__BU_MODULE_INIT__ROOT_HOME/.Bash-utils" ]; then
    __BU_MODULE_INIT__ROOT="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__ROOT_HOME" ".Bash-utils")";                                  __bu_module_init__root__lineno="$LINENO";
    # shellcheck disable=SC2034
    __BU_MODULE_INIT__INITIALIZER_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__ROOT_HOME" "$(basename "${BASH_SOURCE[0]}")")";  __bu_module_init__initializer_path__lineno="$LINENO";
    # Configurations directories
    __BU_MODULE_INIT__CONFIG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__ROOT" "config")";                      __bu_module_init__config_dir__lineno="$LINENO";
    __BU_MODULE_INIT__CONFIG_INIT_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_DIR" "initializer")";      __bu_module_init__config_init_dir__lineno="$LINENO",
    __BU_MODULE_INIT__CONFIG_MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_DIR" "modules")";       __bu_module_init__config_modules_dir__lineno="$LINENO";
    __BU_MODULE_INIT__CONFIG_INIT_LANG_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_INIT_DIR" "locale")"; __bu_module_init__config_init_lang_dir__lineno="$LINENO";
    # Initializer script's configuration files
    __BU_MODULE_INIT__CONFIG_INIT_DIR__STATUS="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_INIT_DIR" "Status.conf")"; __bu_module_init__config_init_dir__status__lineno="$LINENO";
    # Modules directories
    __BU_MODULE_INIT__MODULES_DIR="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__ROOT" "modules")"; __bu_module_init__modules_dir__lineno="$LINENO";
    # Files
    __BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME="Bash-utils-root-val.path";                                                                       __bu_module_init__lib_root_dir__file_name__lineno="$LINENO";
    __BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR="$__BU_MODULE_INIT__ROOT";                                                                  __bu_module_init__lib_root_dir_file__parent_dir__lineno="$LINENO";
    __BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH="$__BU_MODULE_INIT__LIB_ROOT_DIR_FILE__PARENT_DIR/$__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_NAME";    __bu_module_init__lib_root_dir__file_path__lineno="$LINENO";
	__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME="Bash-utils-root-val-ROOT.path";                                                                         __bu_module_init__lib_root_dir_root__file_name__lineno="$LINENO";
	__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE__PARENT_DIR="$__BU_MODULE_INIT__ROOT";                                                                         __bu_module_init__lib_root_dir_root_file__parent_dir__lineno="$LINENO";
	__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH="$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT_FILE__PARENT_DIR/$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_NAME"; __bu_module_init__lib_root_dir_root__file_path__lineno="$LINENO";
	# Misc
	__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM=',';              __bu_module_init__csv_translation_file__delim__lineno="$LINENO";
	__BU_MODULE_INIT__DATE_LOG="[ $(date +"%Y-%m-%d %H:%M:%S") ]";  __bu_module_init__date_log__lineno="$LINENO";
	__BU_MODULE_INIT__USER_LANG="$(echo "$LANG" | cut -d _ -f1)";   __bu_module_init__user_lang__lineno="$LINENO";
else
    # Setting the whole project's language by getting and sourcing the "gettext.sh" file.
    BU::ModuleInit::GetModuleInitLanguage "$__BU_MODULE_INIT__USER_LANG";
	echo >&2;
	# shellcheck disable=SC2059
	printf "$__BU_MODULE_INIT_MSG__CURRENT_LOCALE_FILE__BU_ERROR\n" >&2; echo >&2;
	echo "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER" >&2; echo >&2;
	echo "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MISSING_BASH_UTILS_HOME_FOLDER__ADVICE" >&2; echo >&2;
	BU::ModuleInit::MsgAbort;
	# WARNING : Do not call the "BU::ModuleInit::AskPrintLog()" function here, the current function is defined before the "$__BU_MODULE_INIT_MSG_ARRAY" array.
	BU::IsInScript && exit 1; return 1;
fi
# -----------------------------------------------
## CALLING THE NEEDED FUNCTIONS (DEFINED IN THIS FILE) THAT MUST BE CALLED BEFORE INITIALIZING THE FIRST GLOBAL VARIABLES
# THIS FUNCTION (BU::ModuleInit::GetModuleInitLanguage()) MUST BE THE FIRST FUNCTION TO BE CALLED !!!!
# Since this function gets the language currently used by the system, if you want to change the language, you just have to define
# a new value to the "$LANG" environment variable before calling the "BashUtils_InitModules()" function in your main script file.
# Setting the whole project's language by getting and sourcing the "gettext.sh" file.
BU::ModuleInit::GetModuleInitLanguage "$__BU_MODULE_INIT__USER_LANG" || { if BU::IsInScript; then exit 1; else return 1; fi };
# Checking the currently used Bash language's version.
BU::ModuleInit::CheckBashMinimalVersion || { if BU::IsInScript; then exit 1; else return 1; fi };
# -----------------------------------------------
## DEFINING NEW GLOBAL VARIABLES TO STORE THE INITIALIZATION LOGS AND DISPLAY THEM OR NO
# NOTE : The redirections are processed by the "BU::ModuleInit::Msg" function.
# This global variable stores the log messages.
declare __BU_MODULE_INIT_MSG_ARRAY=();
# This global variables stores a random text. It's enough to determine if the messages can be printed and / or stored in the "$__BU_MODULE_INIT_MSG_ARRAY" array with the "BU::ModuleInit::Msg" function.
declare __BU_MODULE_INIT_MSG_ARRAY_EXISTS="$((RANDOM % 255))";
# This global variable stores the processing mode (partial or full).
# By default, it stores the '--mode-log-partial' value, in order to avoid the initialization process being too much verbose.
declare __BU_MODULE_INIT_MSG_ARRAY_MODE='--mode-log-partial'
# This global variable stores the value (given in the "BashUtils_InitModules()" function's main loop)
# which authorizes the displaying of the logs messages on the screen.
# By default, it stores no value, so that the messages are redirected to the "$__BU_MODULE_INIT_MSG_ARRAY" only,
# without being redirected to the screen too (these instructions are processed in the "BU::ModuleInit::Msg" function).
declare __BU_MODULE_INIT_MSG_ARRAY_PERMISSION='';
# -----------------------------------------------
## CALLING THE OTHER FUNCTIONS FOR INITIALIZATION
# Writing the initialization content into the messages array. It will be displayed later on the screen if the « --log-init-display » argument is passed with the « module » argument.
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__OUT_OF_FNCT__MSG_INITIALIZING_THE_MODULES")");
__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### SOURCING THE MODULES
## INCLUSION OF LIBRARY FILES ACCORDING TO THE INCLUDED MODULE
# Remaking the "BU::Main::Errors::HandleErrors()" function in order to make it working for the initialization process.
function BU::ModuleInit::HandleErrors()
{
    #**** Parameters ****
	local p_errorString=$1;    # String     - Default : NULL    - String of the type of error to display.
	local p_adviceString=$2;   # String     - Default : NULL    - String of characters displaying a tip to direct the user to the best solution to apply in case of a problem.
    local p_badValue=$3;       # String     - Default : NULL    - Incorrect value which caused the error.
	local p_file=$4;           # String     - Default : NULL    - The name of the file where the error occured.
	local p_function=$5;       # String     - Default : NULL    - The name of the function where the error occured.
	local p_lineno=$6;         # String     - Default : NULL    - Line on which the error message occured (obtained in a very simple way by calling the POSIX environment variable "$LINENO").
    #**** Code ****
    echo "IN $p_file, FUNCTION $p_function, LINE $p_lineno --> ERROR : $p_errorString" >&2;
    echo "Advice : $p_adviceString" >&2;
    echo >&2;
    echo "Value that caused this error : $p_badValue" >&2;
    BU::ModuleInit::MsgAbort;
    return 0;
}
# Parsing each module's translation CSV file.
# The "BU::ModuleInit::ParseCSVLang" function MUST be called in the current module's initialization script.
# IMPORTANT : It MUST be called AFTER the "BU::Main::Initializer::SourceLibrary" and BEFORE the "BU::Main::Initializer::SourceConfig"
# functions in the main module's initialization file, in the "STEP THREE" sub-section, in order to get the main module's functions and
# to translate the global variables descriptions written with the "BU::ModuleInit::DisplayInitGlobalVarsInfos" function.
function BU::ModuleInit::ParseCSVLang()
{
    #**** Parameters ****
    local p_lang_ISO_639_1=${1:-$__BU_MODULE_INIT__USER_LANG};	# String    - Default : $__BU_MODULE_INIT__USER_LANG     - Language to fetch.
    local p_delim=$2;                                   		# Char      - Default : NULL                            - CSV file's delimiter.
    #**** Variables ****
    local v_outputFileName="$__BU_MODULE_INIT_MODULE_NAME.$p_lang_ISO_639_1.translate";
    local v_outputFileParent="$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH";
    local v_outputFilePath="$v_outputFileParent/$v_outputFileName";
    local v_filename="$__BU_MODULE_INIT_MODULE_NAME-$p_lang_ISO_639_1.csv";
    local v_CSVFirstColRow;
    # Getting the total number of columns.
    local x;
	# Gets the return code of the Perl script used to parse the translation file in CSV format.
	local v_perlScriptReturnCode;
	local v_perlScriptExecLineno;
    # Getting the wanted column (set to 0, and the value will be taken from a new assignation of the variable with the call of the "BU::Main::Text::GetSubStringAfterDelim" function as sub-shell).
    local v_wantedColID=0;
    # Getting the string of values (gathered from the CSV file's first row) after the nth delimiter.
    local v_CSVFirstColRowAfterNthDelim;
    #**** Code ****
    # Note : if the file cannot be obtained, or if there is another error during the parsing of the current module's translations CSV file,
    # then the script's execution MUST be stopped, or else no messages will be printed on the screen while the script is executed.
    # If the output file already exists, then it's not necessary to retranslate the module.
    if [ -f "$v_outputFile" ] && [ -n "$v_outputFile" ]; then
		BU::ModuleInit::Msg "The $__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH translations CSV file already exists for this language : $p_lang_ISO_639_1";
		BU::ModuleInit::Msg;
		source "$v_outputFile" || {
            local lineno="$(( LINENO - 1 ))";
            BU::ModuleInit::PrintLogError "UNABLE TO SOURCE THE EXISTING TRANSLATIONS OUTPUT FILE" "$lineno";
            BU::ModuleInit::HandleErrors "$(printf "UNABLE TO SOURCE THE EXISTING « %s » TRANSLATIONS FILE" "$v_outputFile")" \
                "Please check what causes the script to not source the output file, which contains the target language's translations" \
                "$v_outputFile" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
            BU::ModuleInit::AskPrintLog >&2 || return 1;
            return 1;
        }
		return 0;
	fi
    # If no path to the module's translation CSV file is given.
    if [ -z "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "NO PATH TO THE TARGET MODULE'S TRANSLATION FILE EXISTS" "$lineno";
        BU::ModuleInit::HandleErrors "$(printf "NO PATH TO THE « %s » MODULE'S TRANSLATION FILE EXISTS" "$__BU_MODULE_INIT_MODULE_NAME")" \
            "Please give a valid path to the current module's translations CSV file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    if [ -z "$v_filename" ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "NO PATH TO THE TARGET CSV TRANSLATION FILE EXISTS" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    # if a path to the module's translation CSV was given, but doesn't matches to a valid file path (the given path doesn't exists).
    if [ -n "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ] && [ ! -f "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "THE PATH TO THE TARGET TRANSLATION FILE IS NOT VALID" "$lineno";
        BU::ModuleInit::HandleErrors "$(printf "THE PATH TO THE « %s » TRANSLATION FILE IS NOT VALID" "$__BU_MODULE_INIT_MODULE_NAME")" \
            "Please give a valid path to the current module's translations CSV file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    # If a path to the module's translation CSV was given AND the path exists AND the output file doesn't exists, but the exact file name doesn't matches with the defined name pattern.
    if [ -n "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ] \
        && [ -f "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ] \
        && [ ! -f "$v_outputFile" ] \
        && [ "$(basename "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")" != "$v_filename" ]; then local lineno="$LINENO";
            BU::ModuleInit::PrintLogError "THE NAME OF THE TARGET PROJECT'S TRANSLATION FILE DOESN'T MATCHES WITH THE DEFINED NAME PATTERN" "$lineno";
            BU::ModuleInit::HandleErrors "$(printf "THE NAME OF THE « %s » PROJECT'S TRANSLATION FILE DOESN'T MATCHES WITH THE DEFINED NAME PATTERN" "$__BU_MODULE_INIT_MODULE_NAME")" \
                "Please give a valid name to the current module's translations CSV file. The pattern is (without single quotes) : '\$module_name'-'\$ISO_639-1_language_code'" \
				"$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
            BU::ModuleInit::AskPrintLog >&2 || return 1;
            return 1;
    fi
    # If no delimiter is given.
    if [ -z "$p_delim" ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "NO DELIMITER WAS GIVEN FOR THE TARGET CSV FILE" "$lineno";
        BU::ModuleInit::HandleErrors "NO DELIMITER WAS GIVEN FOR THE CSV FILE" \
            "Please give a « single unicode character » as CSV delimiter in order to get each wanted cell" \
            "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    if [ -n "$p_delim" ] && [ "${#p_delim}" -gt 1 ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "" "$lineno";
        BU::ModuleInit::HandleErrors '1' "THE GIVEN DELIMITER MUST BE A SINGLE UNICODE CHARACTER" \
            "Please give a « single unicode character » as valid CSV delimiter in order to get each wanted cell" \
            "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    # Begin parsing the CSV file.
    BU::HeaderBlue "$(printf "PARSING THE « %s » PROJECT'S  « %s » TRANSLATIONS CSV FILE" "$__BU_MAIN_PROJECT_NAME" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")";
    BU::ModuleInit::Msg "Finding the variables list column";
    BU::ModuleInit::Msg;
    # If the targeted CSV file cannot be read by the current user.
    if [ ! -r "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" ]; then local lineno="$lineno";
        BU::ModuleInit::PrintLogError "UNABLE TO READ THE TARGET CSV FILE" "$lineno";
        BU::ModuleInit::HandleErrors "$(printf "Unable to read the « %s » file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")" \
            "Please check the permissions of this file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" \
            "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    fi
    # Getting the first row and first column's cell.
    v_CSVFirstColRow="$(BU::Main::Text::GetSubStringBeforeDelim "$(awk 'NR == 1 {print $1}' "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" || {
        local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "UNABLE TO FIND THE VALUE « VARIABLE » IN THE FIRST ROW AND FIRST COLUMN OF THE TARGET CSV FILE" "$lineno";
        BU::ModuleInit::HandleErrors "$(printf "Unable to find the value « VARIABLE » in the first row and first column of the « %s » file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")" \
            "$(printf "Please check if the value mentioned above is present on this EXACT cell of the « %s » file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")" \
            "$v_CSVFirstColRow" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    })" "$p_delim" '--init')";
    if [ "$v_CSVFirstColRow" != "VARIABLE" ]; then local lineno="$LINENO";
        BU::ModuleInit::PrintLogError "NO « VARIABLE » VALUE FOUND AT THE FIRST COLUMNN AND FIRST ROW OF THE TARGET CSV FILE" "$lineno";
        BU::ModuleInit::HandleErrors "$(printf "NO « VARIABLE » VALUE FOUND AT THE FIRST COLUMNN AND FIRST ROW OF THE « %s »" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")" \
            "Make sure the current module's CSV translations file is correctly formatted. You can check the main module's CSV file to check how the formatting should be done" \
            "$v_CSVFirstColRow" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
        BU::ModuleInit::AskPrintLog >&2 || return 1;
        return 1;
    else
        BU::ModuleInit::Msg "$(printf "Parsing the « %s » translations file" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")";
        BU::ModuleInit::Msg;
        BU::ModuleInit::Msg "$(printf "Getting the chosen language's row (targeted language : %s)" "$p_lang_ISO_639_1")";
        BU::ModuleInit::Msg;
        # Getting the total number of columns.
        x="$(awk -F, '{ print NF; exit }' "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH")";
        # Getting the langage ISO 639-1 code from the first row.
        v_CSVFirstColRowAfterNthDelim="$(BU::Main::Text::GetSubStringAfterDelim "$v_CSVFirstColRow" "$p_delim" "$(( x - 1 ))") '' '--init'";
        # Getting the wanted language's column.
        v_wantedColID="$(BU::Main::Text::GetSubStringAfterDelim "$v_CSVFirstColRow" "$p_delim" "$(( x - 1 ))" "count" '--init')";
        # The targeted column is acquired, the Perl script's parsing program SetMouduleLang.pl can finally be called.
		v_perlScriptExecLineno="$LINENO"; perl "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" "$v_filename" "$v_wantedColID" "$v_outputFile";
        # Getting the return value of the last command.
		v_perlScriptReturnCode="$?";
		# Checking the eventual errors returned by the parsing program.
		if [ "$v_perlScriptReturnCode" -eq 0 ]; then
			BU::ModuleInit::Msg "$(printf "The « %s » translations CSV file was successfully parsed, and the « %s » language's translations output file « %s » was successfully created" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" "$p_lang_ISO_639_1" "$v_outputFilePath")";
			BU::ModuleInit::Msg;
			source "$v_outputFile" || { BU::ModuleInit::SourcingFailure "$v_outputFile" "$__BU_MODULE_INIT_MODULE_NAME"; return "$?"; };
			return 0;
		else
			# The CSV file was not passed as first argument.
			if		[ "$v_perlScriptReturnCode" -eq 10022 ]; then
                BU::ModuleInit::PrintLogError "$(printf "NO CSV FILE GIVEN AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$(printf "NO CSV FILE GIVEN AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" \
                    "Please pass as first argument the path of the translations CSV file you want to process"
                    "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# A path was passed as first argument, but it's a directory path.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "DIRECTORY PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$(printf "THE PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL SCRIPT IS A DIRECTORY PATH, AND NOT A CSV FILE PATH" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" \
                    "Please pass as first argument the path of the translations CSV ${__BU_MAIN_TXT_FMT_ITALIC}>>> file <<<${__BU_MAIN_TXT_FMT_ITALIC_RESET} you want to process" \
                    "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# A path was passed as first argument. It's a file, but not in CSV format.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "FILE PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT, BUT NOT A CSV FILE" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$(printf "THE FILE PATH PASSED AS FIRST ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT IS NOT A CSV FILE PATH" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" \
                    "Please pass as first argument the path of the translations ${__BU_MAIN_TXT_FMT_ITALIC}>>> CSV file <<<${__BU_MAIN_TXT_FMT_ITALIC_RESET} you want to process" \
                    "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# The column's index was not passed as second argument.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "NO COLUMN INDEX PASSED AS SECOND ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$(printf "NO COLUMN INDEX PASSED AS SECOND ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" \
                    "Please pass as second argument as the index of the column you want to process" "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# The column's index passed as second argument was not an integer.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "« %s » PERL TRANSLATION SCRIPT'S SECOND ARGUMENT IS NOT AN INTEGER" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "THE PERL TRANSLATION SCRIPT'S SECOND ARGUMENT IS NOT AN INTEGER" \
                    "Please pass an integer as second argument, as the target column ID" "$v_perlScriptReturnCode" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
            # The language file's output path was not passed as third argument.
            elif    [ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "NO LANGUAGE FILE'S OUTPUT PATH PASSED AS THIRD ARGUMENT FOR THE « %s » PERL TRANSLATION SCRIPT" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
                    "Please pass a third argument as the output file path to create" "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# The CSV file cannot be read by the Perl script.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "$(printf "« %s » PERL TRANSLATION SCRIPT UNABLE TO READ THE CSV TRANSLATIONS FILE" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$(printf "THE « %s » PERL TRANSLATION SCRIPT CANNOT READ THE TARGET « %s » CSV TRANSLATIONS FILE" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH" "$v_filename")" \
                    "Please check the permissions of the targeted CSV file, then relaunch the script" "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
			# The output file cannot be created by the Perl script.
			elif	[ "$v_perlScriptReturnCode" -eq TODO ]; then
                BU::ModuleInit::PrintLogError "UNABLE TO CREATE THE LANGUAGE'S OUTPUT FILE" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$v_perlScriptReturnCode" "$(printf "THE « %s » LANGUAGE'S OUTPUT FILE CANNOT BE CREATED BY THE « %s » PERL TRANSLATION SCRIPT" "$v_outputFilePath" "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME")" \
                    "Please check the cause of this error, then relaunch the script" "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                BU::ModuleInit::AskPrintLog >&2 || return 1;
				return "$v_perlScriptReturnCode";
            # Not enough storage is available to complete this operation.
            elif    [ "$v_perlScriptReturnCode" -eq 14 ]; then
                BU::ModuleInit::PrintLogError "$(printf "NO SPACE LEFT ON THE DEVICE FOR THE CREATION OF THE « %s » LANGUAGE'S OUTPUT FILE" "$v_outputFilePath")" "$v_perlScriptExecLineno";
				BU::ModuleInit::HandleErrors "$v_perlScriptReturnCode" "$(printf "NO SPACE LEFT ON THE DEVICE FOR THE CREATION OF THE « %s » LANGUAGE'S OUTPUT FILE" "$v_outputFilePath")" \
                    "Please free up some disk memory before using this script to translate the current module" "$v_perlScriptReturnCode" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$v_perlScriptExecLineno";
                printf "Deleting the created language's output file « %s »\n" "$v_outputFilePath" >&2;
                echo >&2;
                if rm -v "$v_outputFilePath"; then
                    printf "The « %s » file was successfully erased\n" "$v_outputFilePath" >&2;
                    echo >&2;
                else
                    printf "UNABLE TO DELETE THE LANGUAGE'S OUTPUT FILE « %s »\n" "$v_outputFilePath" >&2;
                    echo "Please do so before relaunching this script after freeing some space on your hard drive, in order to avoid this script to consider the translations already done" >&2;
                    echo >&2;
                fi
                BU::ModuleInit::AskPrintLog >&2 || { if BU::IsInScript; then exit 1; else return 1; fi };
                if BU::IsInScript; then exit "$v_perlScriptReturnCode"; else return "$v_perlScriptReturnCode"; fi
            fi
		fi
	fi
}
# Please call immediately this function once this file is sourced, and pass it each module you need as arguments, and their supported options.
function BashUtils_InitModules()
{
    if [ -n "$__BU_MODULE_INIT_IS_SOURCED" ] && [ "sourced" = "$__BU_MODULE_INIT_IS_SOURCED" ]; then
        # shellcheck disable=SC2059
        BU::HeaderWarning "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED\n" "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")")"; return 1;
    fi
    #**** Parameters ****
    local p_modules_list=("$@");    # List of all the modules to include passed as arguments
	#**** Variables (global) ****
	#**** Variables (local) ****
    local v_index=0;    # Index of the currently processed module (incremented at each loop's iteration). ALWAYS BEGIN WITH THE '0' VALUE !!!
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
	#**** Code ****
	# Checking if the arguments array length is equal to zero (no arguments passed).
	if [ -z "${p_modules_list[*]}" ]; then
        # shellcheck disable=SC2059
		printf "$__BU_MODULE_INIT_MSG__BU_IM__MUST_PASS_A_MODULE_NAME\n\n" "${FUNCNAME[0]}" >&2;
		return 1;
	fi
    # Writing the list of the installed modules.
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG")");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
    # Listing the included modules.
	for module_args in "${p_modules_list[@]}"; do
        i=0; # Module's array index incrementer.
        if [[ "${module_args,,}" == 'module --'* ]]; then
            # shellcheck disable=SC2059
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_MODULE_PARAM" "$i" "$module_args")")");
        else
            i="$(( i+1 ))" # Incrementing the module's array index
            # Name and arguments of the module stored as the nth index of the module list array.
            # shellcheck disable=SC2059
            __BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__MODULES_INIT_MSG__LOOP_ADD_ARRAY_INDEX__IS_NOT_MODULE_PARAM" "$i" "$module_args")")");
        fi
	done
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
	__BU_MODULE_INIT_MSG_ARRAY+=("$(BU::ModuleInit::Msg)");
	# Checking if any wanted module exists with its configuration and its library, then source every related shell files.
	for module in "${p_modules_list[@]}"; do
		# -----------------------------------------------
		## INITIALIZER'S FIRST ARGUMENTS PROCESSING ("module --*" AND "main --*" VALUES)
		# Calling the function which processes the « module » argument and its parameters, along with the « main » module.
        BU::ModuleInit::ProcessFirstModuleParameters "$module" "$v_index" || { v_loop_error='error'; break; }
		# -----------------------------------------------
		## DEFINING LOCAL VARIABLES FOR EACH MODULE TO BE INITIALIZED
		# Defining variables for each iteration.
		local v_module_name;
            v_module_name="$(echo "$module" | cut -d' ' -f1)";
		# -----------------------------------------------
		## DEFINING GLOBAL VARIABLES FOR EACH MODULE TO BE INITIALIZED
		__BU_MODULE_INIT_MODULE_NAME="$v_module_name";
		# Getting the current module's configurations directory AND its initialization directory (the "module --"* value is NOT a module).
		if [[ "$module" != 'module --'* ]]; then
            # Getting the current module's configurations directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" "$v_module_name")";
            # shellcheck disable=SC2059
            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH' "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" 'Dirpath' \
                "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__CONF_PATH__DIGVI" "$v_module_name" "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH")" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
            # Getting the current module's initialization directory, in order to process each directory's files and sub-folders.
            __BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__MODULES_DIR" "$v_module_name")";
            # shellcheck disable=SC2059
            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH' "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" 'Dirpath' \
                "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INIT_PATH__DIGVI" "$v_module_name" "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH")" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
        fi
		# Storing the module's name with it's arguments, in order to transform it in an array of strings to be processed in this loop (for each module, in their "initializer.sh" file).
		if [[ "${p_modules_list[i]}" == "$v_module_name --"* ]]; then
            # shellcheck disable=SC2034
			__BU_MODULE_INIT_MODULE_AND_ARGS_STRING="$module";
			# shellcheck disable=SC2059
			BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MODULE_INIT_MODULE_AND_ARGS_STRING' "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING" 'String' \
				"$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__NAME_WITH_ARGS" "${FUNCNAME[0]}" "${#p_modules_list}" "$module")" \
				"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
		fi
        # Checking for each module's files if the currently processed "BashUtils_InitModules" argument is not "module" (already processed in the "BU::ModuleInit::ProcessFirstModuleParameters()" function).
        if [[ "$module" != 'module --'* ]]; then
            # -----------------------------------------------
            # MODULES' CONFIGURATION FILES SOURCING
            # Checking if the module's configuration directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH"; then
                # shellcheck disable=SC2059
                BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__CALL_PLE" "$v_module_name")" "$LINENO";
                printf '\n' >&2;
                # shellcheck disable=SC2059
                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_module_name" >&2;
                # shellcheck disable=SC2059
                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__DIR_NOT_FOUND__ADVICE" >&2; BU::ModuleInit::CheckPath "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" 'f' >&2;
                printf '\n\n';
                # Listing all the installed modules in the user's hard drive.
                # No need to call the function "BU::ModuleInit::AskPrintLog" function, it's already called in the function "BU::ModuleInit::ListInstalledModules".
                BU::ModuleInit::ListInstalledModules || v_loop_error="error"; break;
                return 1;
            else
                BU::ModuleInit::Msg;
                # shellcheck disable=SC2059
                BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_CONF_DIRS__SOURCE" "$v_module_name")" '#' 'msg'; BU::ModuleInit::Msg;
                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH" "module.conf")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_INIT_CURRENT_MODULE_CONF_PATH/module.conf" "$v_module_name"; v_loop_error="error"; break; }
            fi
            # -----------------------------------------------
            # MODULES' INITIALIZATION FILES SOURCING
            # Checking if the module's initialization directory exists (by removing its optionnaly passed configurations arguments).
            if ! ls --directory "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH"; then
                # shellcheck disable=SC2059
                BU::ModuleInit::PrintLogError "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__CALL_PLE" "$v_module_name")" "$LINENO";
                printf '\n' >&2;
                # shellcheck disable=SC2059
                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND\n\n" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO - 5 ))" "$v_module_name" >&2;
                # shellcheck disable=SC2059
                printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__DIR_NOT_FOUND__ADVICE"; BU::ModuleInit::CheckPath "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" 'f' >&2;
                printf '\n\n' >&2;
                BU::ModuleInit::MsgAbort;
                return 1;
            else
                # shellcheck disable=SC2059
                BU::ModuleInit::MsgLine "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__INCLUDE_INIT_DIRS__SOURCE" "$v_module_name")" '-' 'msg';
                # shellcheck disable=SC1090
                source "$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH" "Initializer.sh")" || { BU::ModuleInit::SourcingFailure "$__BU_MODULE_INIT_CURRENT_MODULE_INIT_PATH/Initializer.sh" "$v_module_name"; v_loop_error="error"; break; }
                # shellcheck disable=SC2059
                BU::HeaderGreen "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__SOURCE_MODULES_CONF_DIRS__CURRENT_MODULE__END_OF_MODULE_INIT" "$(BU::DechoHighlight "$v_module_name")")";
            fi
        fi
        # Incrementing the modules array index variable.
        v_index="$(( v_index+1 ))";
	done; if [ "${v_loop_error,,}" = 'error' ]; then return 1; fi
	# Sourcing the user defined aliases file if the library is directly used from a script file.
	if ! BU::IsInScript && [ -f "$__BU_MAIN_PROJECT_ALIAS_FILE_PATH" ] && [ -n "$__BU_MAIN_PROJECT_ALIAS_FILE_PATH" ]; then BU::Main::Files::SourceFile "$__BU_MAIN_PROJECT_ALIAS_FILE_PATH" || return 1; fi
	echo "RETURN STATUS : $?";
	# /////////////////////////////////////////////////////////////////////////////////////////////// #
	#### ENDING THE WHOLE INITIALIZATION PROCESS
	# shellcheck disable=SC2059
	BU::HeaderGreen "$(printf "$__BU_MODULE_INIT_MSG__BU_IM__END_OF_FRAMEWORK_INIT" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_FILE_PATH" "$__BU_MAIN_COLOR_TXT_PATH")")";
	# This is the ONLY line where the "$__BU_MAIN_STAT_INITIALIZING" global status variable's value can be modified.
	# DO NOT set it anymore to "true", or else your script can be prone to bugs.
    if  BU::Main::Status::CheckStatIsInitializing; then
        BU::Main::Status::ChangeSTAT_INITIALIZING "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || return 1;
	fi
	# Note : the "$__BU_MODULE_INIT_MSG_ARRAY" variable is purged from the logged messages after writing its content in the project's log file.
	# Setting a global variable that prevent a new call of this function.
	__BU_MODULE_INIT_IS_SOURCED='sourced';
	# Backupping a message variable in case the current function is called again, in order to display again the same error message after unsetting every initialization message variables.
	local var_backup="$__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED";
	# Unsetting every initialization message variables in order to free up some memory.
	# Don't double quote the command substitution.
	# shellcheck disable=SC2046
	unset $(compgen -v "__BU_MODULE_INIT_MSG__");
	# Resetting the "$__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED" variable.
	__BU_MODULE_INIT_MSG__BU_IM__IS_ALREADY_CALLED="$var_backup";
    # Defining a function which is to be used to check if the framework is already sourced, in order to avoid too many checkings in the very beginning of any script that uses this framework, and a new inclusion of the framework's files.
    # Just write this line at the beginning of your script : "x="$(IsInBUFramework)"; if [ "${x^^}" != 'BU' ]; then"
    # After the 'then', call the "BashUtils_InitModules()" with it's mandatory arguments, and then your wanted arguments.
    if ! BU::IsInScript; then function IsInBUFramework() { echo "BU"; }; fi
	return 0;
}
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/COLORS.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores color-related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
## PRINTING TEXT FUNCTIONS
# Writing the command substitution text for the background coloration
# Don't call the "BU::DechoHighlightFunction()" function to color the function name, it must stay perfectly visible on every colors, and the default,
# and the "$__BU_MAIN_STAT_DECHO" function's value is still set as its default value (in order to avoid bugs during the main module's initialization) : forbid
function BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd() { printf "This command substitution executes the « BU::Main::Decho::SetBGColor() » function in order to color the text's background with the defined « %s » color's code" "$1"; }
# Writing the command substitution text for the text coloration.
# Don't call the "BU::DechoHighlightFunction()" function to color the function name, it must stay perfectly visible on every colors, and the default,
# and the "$__BU_MAIN_STAT_DECHO" function's value is still set as its default value (in order to avoid bugs during the main module's initialization) : forbid
function BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd() { printf "This command substitution executes the « BU::Main::Decho::SetTextColor() » function in order to color the text with the defined « %s » color's code" "$1"; }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### COLOR ENCODING
## COLOR CODES FOR TEXT ENCODING (SYSTEM)
__BU_MAIN_COLOR_CODE_BLACK='0';
__BU_MAIN_COLOR_CODE_MAROON='1';
__BU_MAIN_COLOR_CODE_GREEN='2';
__BU_MAIN_COLOR_CODE_OLIVE='3';
__BU_MAIN_COLOR_CODE_NAVY='4';
__BU_MAIN_COLOR_CODE_PURPLE='5';
__BU_MAIN_COLOR_CODE_TEAL='6';
__BU_MAIN_COLOR_CODE_SILVER='7';
__BU_MAIN_COLOR_CODE_GRAY="8";
__BU_MAIN_COLOR_CODE_RED='9';
__BU_MAIN_COLOR_CODE_LIME='10';
__BU_MAIN_COLOR_CODE_YELLOW='11';
__BU_MAIN_COLOR_CODE_BLUE='12';
__BU_MAIN_COLOR_CODE_FUCHSIA='13';
__BU_MAIN_COLOR_CODE_AQUA='14';
__BU_MAIN_COLOR_CODE_WHITE='15';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_BLACK'		"$__BU_MAIN_COLOR_CODE_BLACK"	'Int'	"This variable stores the « black » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_MAROON'	"$__BU_MAIN_COLOR_CODE_MAROON"	'Int'	"This variable stores the « maroon » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_GREEN'		"$__BU_MAIN_COLOR_CODE_GREEN"	'Int'	"This variable stores the « light green » color code"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_OLIVE'		"$__BU_MAIN_COLOR_CODE_OLIVE"	'Int'	"This variable stores the « olive green » color code"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_NAVY'		"$__BU_MAIN_COLOR_CODE_NAVY"	'Int'	"This variable stores the « navy blue » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_PURPLE'	"$__BU_MAIN_COLOR_CODE_PURPLE"	'Int'	"This variable stores the « purple » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_TEAL'		"$__BU_MAIN_COLOR_CODE_TEAL"	'Int'	"This variable stores the « teal » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_SILVER'	"$__BU_MAIN_COLOR_CODE_SILVER"	'Int'	"This variable stores the « silver gray » color code"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_GRAY'		"$__BU_MAIN_COLOR_CODE_GRAY"	'Int'	"This variable stores the « gray » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_RED'		"$__BU_MAIN_COLOR_CODE_RED"		'Int'	"This variable stores the « light red » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_LIME'		"$__BU_MAIN_COLOR_CODE_LIME"	'Int'	"This variable stores the « lime green » color code"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_YELLOW'	"$__BU_MAIN_COLOR_CODE_YELLOW"	'Int'	"This variable stores the « light yellow » color code"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_BLUE'		"$__BU_MAIN_COLOR_CODE_BLUE"	'Int'	"This variable stores the « blue » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_FUCHSIA'	"$__BU_MAIN_COLOR_CODE_FUCHSIA"	'Int'	"This variable stores the « fuchsia » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_AQUA'		"$__BU_MAIN_COLOR_CODE_AQUA"	'Int'	"This variable stores the « aqua blue » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_WHITE'		"$__BU_MAIN_COLOR_CODE_WHITE"	'Int'	"This variable stores the « white » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-20 ))";
# -----------------------------------------------
## COLOR CODES FOR TEXT ENCODING (OTHERS)
__BU_MAIN_COLOR_CODE_CYAN='51';
__BU_MAIN_COLOR_CODE_ORANGE='166';
__BU_MAIN_COLOR_CODE_PINK='200';
__BU_MAIN_COLOR_CODE_SALMON='209';
__BU_MAIN_COLOR_CODE_TAN='180';
__BU_MAIN_COLOR_CODE_TURQUOISE='51';
__BU_MAIN_COLOR_CODE_VIOLET='177';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_CYAN'		"$__BU_MAIN_COLOR_CODE_CYAN"		'Int'	"This variable stores the « cyan » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_ORANGE'	"$__BU_MAIN_COLOR_CODE_ORANGE"		'Int'	"This variable stores the « orange  » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_PINK'		"$__BU_MAIN_COLOR_CODE_PINK"		'Int'	"This variable stores the « pink » color code"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_SALMON'	"$__BU_MAIN_COLOR_CODE_SALMON"		'Int'	"This variable stores the « salmon » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_TAN'		"$__BU_MAIN_COLOR_CODE_TAN"			'Int'	"This variable stores the « brown tan » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_TURQUOISE'	"$__BU_MAIN_COLOR_CODE_TURQUOISE"	'Int'	"This variable stores the « turquoise » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_VIOLET'	"$__BU_MAIN_COLOR_CODE_VIOLET"		'Int'	"This variable stores the « violet » color code"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
# -----------------------------------------------
## COLOR CODES FOR SPECIFIC TEXT DISPLAY, PRINTED AND REDIRECTED WITH THE "BU::Main::Decho::SetTextColor" FUNCTIONS, THEN ENCODED WITH THE "tput" COMMAND
# Commands text display color           | Default color : gray
__BU_MAIN_COLOR_CODE_CMD="$__BU_MAIN_COLOR_CODE_GRAY";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_CMD' "$__BU_MAIN_COLOR_CODE_CMD"			'Int' "This variable stores the color code for the commands names messages" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Error text display color				| Default color : Red
__BU_MAIN_COLOR_CODE_ERROR="$__BU_MAIN_COLOR_CODE_RED";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_ERROR' "$__BU_MAIN_COLOR_CODE_ERROR"			'Int' "This variable stores the color code for the error messages" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Function name display color           | Default color : Purple
__BU_MAIN_COLOR_CODE_FUNCTION="$__BU_MAIN_COLOR_CODE_PURPLE";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_FUNCTION' "$__BU_MAIN_COLOR_CODE_FUNCTION"		'Int' "This variable stores the color code for the functions name's displaying" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Highlighted text display color		| Default color : Cyan
__BU_MAIN_COLOR_CODE_HIGHLIGHT="$__BU_MAIN_COLOR_CODE_CYAN";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_HIGHLIGHT' "$__BU_MAIN_COLOR_CODE_HIGHLIGHT"	'Int' "This variable stores the color code for the text highlighting" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Newstep text display color            | Default color : Orange
__BU_MAIN_COLOR_CODE_NEWSTEP="$__BU_MAIN_COLOR_CODE_ORANGE";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_NEWSTEP' "$__BU_MAIN_COLOR_CODE_NEWSTEP"	'Int' "This variable stores the color code for the new steps messages" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Directories and files paths display color     | Default color : Lime
__BU_MAIN_COLOR_CODE_PATH="$__BU_MAIN_COLOR_CODE_LIME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_PATH' "$__BU_MAIN_COLOR_CODE_PATH"			'Int' "This variable stores the color code for the paths highlighting" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Reset color to terminal's default text color  | Always "tput sgr0"
__BU_MAIN_COLOR_CODE_RESET="$(tput sgr0)"; printf "%s" "$__BU_MAIN_COLOR_CODE_RESET";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_RESET' "$__BU_MAIN_COLOR_CODE_RESET"		'CMD' "This command substitution executes the « tput sgr0 » command to reset the text mode's text color" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Success text display color			| Default color : Green
__BU_MAIN_COLOR_CODE_SUCCESS="$__BU_MAIN_COLOR_CODE_GREEN";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_SUCCESS' "$__BU_MAIN_COLOR_CODE_SUCCESS"	'Int' "This variable stores the color code for the succes messages" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Variable, parameter or argument name  | Default color : Orange
__BU_MAIN_COLOR_CODE_VAR="$__BU_MAIN_COLOR_CODE_ORANGE";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_VAR' "$__BU_MAIN_COLOR_CODE_VAR"			'Int' "This variable stores the color code for the variables names highlighting" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Warning text display color			| Default color : Yellow
__BU_MAIN_COLOR_CODE_WARNING="$__BU_MAIN_COLOR_CODE_YELLOW";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_CODE_WARNING' "$__BU_MAIN_COLOR_CODE_WARNING"	'Int' "This variable stores the color code for the warning messages" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
# ///////////////////////////////////////////////////////////////////////////////////////////////
#### ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "BU::Main::Decho::SetTextColor" FUNCTIONS
## TEXT ENCODING
# Note : The "TEXT ENCODING" subsection is defined first in order to color the text according to the background color in the "BACKGROUND ENCODING" subsection.
# Encodage des couleurs (codes de la commande "tput setaf") pour mieux lire les étapes de l'exécution du script.
# Aqua blue colored text.
__BU_MAIN_COLOR_TXT_AQUA="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_AQUA" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_AQUA";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_AQUA' "$__BU_MAIN_COLOR_TXT_AQUA"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'aqua blue')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Black colored text.
__BU_MAIN_COLOR_TXT_BLACK="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_BLACK" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_BLACK' "$__BU_MAIN_COLOR_TXT_BLACK" 'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'black')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Deep blue colored text.
__BU_MAIN_COLOR_TXT_BLUE="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_BLUE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_BLUE";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_BLUE' "$__BU_MAIN_COLOR_TXT_BLUE"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'blue')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Cyan blue colored text.
__BU_MAIN_COLOR_TXT_CYAN="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_CYAN" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_CYAN";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_CYAN' "$__BU_MAIN_COLOR_TXT_CYAN"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'cyan')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Fuchsia colored text.
__BU_MAIN_COLOR_TXT_FUCHSIA="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_FUCHSIA" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_FUCHSIA";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_FUCHSIA' "$__BU_MAIN_COLOR_TXT_FUCHSIA"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'fuchsia')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Gray colored text.
__BU_MAIN_COLOR_TXT_GRAY="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_GRAY" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_GRAY";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_GRAY' "$__BU_MAIN_COLOR_TXT_GRAY"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'gray')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Light green colored text.
__BU_MAIN_COLOR_TXT_GREEN="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_GREEN" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_GREEN";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_GREEN' "$__BU_MAIN_COLOR_TXT_GREEN"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'light green')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Lime green colored text.
__BU_MAIN_COLOR_TXT_LIME="$(BU::Main::Decho::SetTextColor			"$__BU_MAIN_COLOR_CODE_LIME" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_LIME";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_LIME' "$__BU_MAIN_COLOR_TXT_LIME"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'lime green')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Maroon colored text.
__BU_MAIN_COLOR_TXT_MAROON="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_MAROON" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_MAROON";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_MAROON' "$__BU_MAIN_COLOR_TXT_MAROON"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'maroon')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Navy blue colored text.
__BU_MAIN_COLOR_TXT_NAVY="$(BU::Main::Decho::SetTextColor			"$__BU_MAIN_COLOR_CODE_NAVY" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_NAVY";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_NAVY' "$__BU_MAIN_COLOR_TXT_NAVY"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'navy blue')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Green olive colored text.
__BU_MAIN_COLOR_TXT_OLIVE="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_OLIVE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_OLIVE";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_OLIVE' "$__BU_MAIN_COLOR_TXT_OLIVE"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'olive green')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Orange colored text.
__BU_MAIN_COLOR_TXT_ORANGE="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_ORANGE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_ORANGE";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_ORANGE' "$__BU_MAIN_COLOR_TXT_ORANGE"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'orange')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -------
# Pink colored text.
__BU_MAIN_COLOR_TXT_PINK="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_PINK" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_PINK";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_PINK' "$__BU_MAIN_COLOR_TXT_PINK"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'pink')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Purple colored text.
__BU_MAIN_COLOR_TXT_PURPLE="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_PURPLE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_PURPLE";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_PURPLE' "$__BU_MAIN_COLOR_TXT_PURPLE"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'purple')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Light red colored text.
__BU_MAIN_COLOR_TXT_RED="$(BU::Main::Decho::SetTextColor 			"$__BU_MAIN_COLOR_CODE_RED" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_RED";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_RED' "$__BU_MAIN_COLOR_TXT_RED"			'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'light red')"			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -------
# Salmon colored text.
__BU_MAIN_COLOR_TXT_SALMON="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_SALMON" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_SALMON";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_SALMON' "$__BU_MAIN_COLOR_TXT_SALMON"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'salmon')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Silver gray colored text.
__BU_MAIN_COLOR_TXT_SILVER="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_SILVER" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_SILVER";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_SILVER' "$__BU_MAIN_COLOR_TXT_SILVER"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'silver gray')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Brown tan colored text.
__BU_MAIN_COLOR_TXT_TAN="$(BU::Main::Decho::SetTextColor			"$__BU_MAIN_COLOR_CODE_TAN" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_TAN";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_TAN' "$__BU_MAIN_COLOR_TXT_TAN"			'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'brown tan')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -------
# Teal colored text.
__BU_MAIN_COLOR_TXT_TEAL="$(BU::Main::Decho::SetTextColor			"$__BU_MAIN_COLOR_CODE_TEAL" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_TEAL";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_TEAL' "$__BU_MAIN_COLOR_TXT_TEAL"			'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'teal')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Turquoise colored text.
__BU_MAIN_COLOR_TXT_TURQUOISE="$(BU::Main::Decho::SetTextColor	"$__BU_MAIN_COLOR_CODE_TURQUOISE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_TURQUOISE";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_TURQUOISE' "$__BU_MAIN_COLOR_TXT_TURQUOISE"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'turquoise')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Violet colored text.
__BU_MAIN_COLOR_TXT_VIOLET="$(BU::Main::Decho::SetTextColor		"$__BU_MAIN_COLOR_CODE_VIOLET" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_VIOLET";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_VIOLET' "$__BU_MAIN_COLOR_TXT_VIOLET"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'violet')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -------
# White colored text.
__BU_MAIN_COLOR_TXT_WHITE="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_WHITE" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_WHITE' "$__BU_MAIN_COLOR_TXT_WHITE"			'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'white')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Light yellow colored text.
__BU_MAIN_COLOR_TXT_YELLOW="$(BU::Main::Decho::SetTextColor 		"$__BU_MAIN_COLOR_CODE_YELLOW" '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_TXT_YELLOW";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_YELLOW' "$__BU_MAIN_COLOR_TXT_YELLOW"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'yellow')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Resetting the text color, since the text generated by the "BU::ModuleInit::DisplayInitGlobalVarsInfos()" function is colored.
printf "%s" "$__BU_MAIN_COLOR_CODE_RESET";
# -----------------------------------------------
## SPECIFIC TEXT ENCODING
# Specific colors encoding.
__BU_MAIN_COLOR_TXT_CMD="$(BU::Main::Decho::SetTextColor        "$__BU_MAIN_COLOR_CODE_CMD"         '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Command name's display color.
__BU_MAIN_COLOR_TXT_ERROR="$(BU::Main::Decho::SetTextColor      "$__BU_MAIN_COLOR_CODE_ERROR"       '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Error text display color.
__BU_MAIN_COLOR_TXT_FUNCTION="$(BU::Main::Decho::SetTextColor   "$__BU_MAIN_COLOR_CODE_FUNCTION"    '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Function name display color
__BU_MAIN_COLOR_TXT_HIGHLIGHT="$(BU::Main::Decho::SetTextColor  "$__BU_MAIN_COLOR_CODE_HIGHLIGHT"   '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Highlighted text display color.
__BU_MAIN_COLOR_TXT_NEWSTEP="$(BU::Main::Decho::SetTextColor    "$__BU_MAIN_COLOR_CODE_NEWSTEP"     '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # New setps text display color.
__BU_MAIN_COLOR_TXT_PATH="$(BU::Main::Decho::SetTextColor       "$__BU_MAIN_COLOR_CODE_PATH"        '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Directories and files paths display color.
__BU_MAIN_COLOR_TXT_SUCCESS="$(BU::Main::Decho::SetTextColor    "$__BU_MAIN_COLOR_CODE_SUCCESS"     '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Success text display color.
__BU_MAIN_COLOR_TXT_VAR="$(BU::Main::Decho::SetTextColor        "$__BU_MAIN_COLOR_CODE_VAR"         '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Variable, parameter or argument name.
__BU_MAIN_COLOR_TXT_WARNING="$(BU::Main::Decho::SetTextColor    "$__BU_MAIN_COLOR_CODE_WARNING"     '--init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; }; # Warning text display color.
# Resetting the text's color to terminal's default text color.
__BU_MAIN_COLOR_TXT_RESET="$__BU_MAIN_COLOR_CODE_RESET"
printf "%s" "$__BU_MAIN_COLOR_TXT_CMD";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_CMD'        "$__BU_MAIN_COLOR_TXT_CMD"          'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'commands names')"      "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_ERROR";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_ERROR'		"$__BU_MAIN_COLOR_TXT_ERROR"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'error messages')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_FUNCTION";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_FUNCTION'	"$__BU_MAIN_COLOR_TXT_FUNCTION"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'function names')"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT";	BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_HIGHLIGHT'	"$__BU_MAIN_COLOR_TXT_HIGHLIGHT"	'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'text highlighting')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_NEWSTEP";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_NEWSTEP'	"$__BU_MAIN_COLOR_TXT_NEWSTEP"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'new step messages')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_PATH";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_PATH'		"$__BU_MAIN_COLOR_TXT_PATH"			'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'paths highlighting')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_RESET";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_RESET'		"$__BU_MAIN_COLOR_TXT_RESET"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'success messages')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_SUCCESS";		BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_SUCCESS'	"$__BU_MAIN_COLOR_TXT_SUCCESS"		'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'success messages')"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_VAR";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_VAR'        "$__BU_MAIN_COLOR_TXT_VAR"          'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'variables names highlighting')"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-14 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_WARNING";     BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_WARNING'    "$__BU_MAIN_COLOR_TXT_WARNING"      'CMD' "$(BU::Main::ModConfig::Colors::PrintColorTextVarsNameSubsCmd 'warning messages')"                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-14 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_RESET";       BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_TXT_RESET'      "$__BU_MAIN_COLOR_TXT_RESET"        'CMD' "This command substitution executes the « tput sgr0 » command to reset the text mode's text color"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-15 ))";
# -----------------------------------------------
# ///////////////////////////////////////////////////////////////////////////////////////////////
#### ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "BU::Main::Decho::SetBGColor" FUNCTIONS
## BACKGROUND ENCODING
# Aqua blue colored background.
__BU_MAIN_COLOR_BG_AQUA="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_AQUA" 'init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; echo 'rr'; return 1; };
BU::ModuleInit::DisplayInitGlobalVarsInfos
printf "%s" "$__BU_MAIN_COLOR_BG_AQUA";printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK";    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_AQUA' "$__BU_MAIN_COLOR_BG_AQUA"     'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "aqua")"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Black colored background.
__BU_MAIN_COLOR_BG_BLACK="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_BLACK" '-init')" || { printf "%s" "$__BU_MAIN_COLOR_CODE_RESET"; return 1; };
printf "%s" "$__BU_MAIN_COLOR_BG_BLACK"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE";  BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_BLACK' "$__BU_MAIN_COLOR_BG_BLACK"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "black")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Deep blue colored background.
__BU_MAIN_COLOR_BG_BLUE="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_BLUE")" || echo "kkkkkk";
printf "%s" "$__BU_MAIN_COLOR_BG_BLUE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_BLUE' "$__BU_MAIN_COLOR_BG_BLUE"             'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "blue")"      "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Cyan blue colored background.
__BU_MAIN_COLOR_BG_CYAN="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_CYAN")";
printf "%s" "$__BU_MAIN_COLOR_BG_CYAN"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_CYAN' "$__BU_MAIN_COLOR_BG_CYAN"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "cyan")"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Fuchsia colored background.
__BU_MAIN_COLOR_BG_FUCHSIA="$(BU::Main::Decho::SetBGColor     "$__BU_MAIN_COLOR_CODE_FUCHSIA")";
printf "%s" "$__BU_MAIN_COLOR_BG_FUCHSIA"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_FUCHSIA' "$__BU_MAIN_COLOR_BG_FUCHSIA"    'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "fuchsia")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Gray colored background.
__BU_MAIN_COLOR_BG_GRAY="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_GRAY")";
printf "%s" "$__BU_MAIN_COLOR_BG_GRAY"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_GRAY' "$__BU_MAIN_COLOR_BG_GRAY"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "gray")"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Light green colored background.
__BU_MAIN_COLOR_BG_GREEN="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_GREEN")";
printf "%s" "$__BU_MAIN_COLOR_BG_GREEN"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_GREEN' "$__BU_MAIN_COLOR_BG_GREEN"          'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "light green")"                   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Lime green colored background.
__BU_MAIN_COLOR_BG_LIME="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_LIME")";
printf "%s" "$__BU_MAIN_COLOR_BG_LIME"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_LIME' "$__BU_MAIN_COLOR_BG_LIME"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "lime green")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Marron colored background.
__BU_MAIN_COLOR_BG_MAROON="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_MAROON")";
printf "%s" "$__BU_MAIN_COLOR_BG_MAROON"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_MAROON' "$__BU_MAIN_COLOR_BG_MAROON" 'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "maroon")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Navy blue colored background.
__BU_MAIN_COLOR_BG_NAVY="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_NAVY")";
printf "%s" "$__BU_MAIN_COLOR_BG_NAVY"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_NAVY' "$__BU_MAIN_COLOR_BG_NAVY"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "navy blue")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Green olive colored background.
__BU_MAIN_COLOR_BG_OLIVE="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_OLIVE")";
printf "%s" "$__BU_MAIN_COLOR_BG_OLIVE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_OLIVE' "$__BU_MAIN_COLOR_BG_OLIVE"      'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "olive green")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Orange colored background.
__BU_MAIN_COLOR_BG_ORANGE="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_ORANGE")";
printf "%s" "$__BU_MAIN_COLOR_BG_ORANGE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_ORANGE' "$__BU_MAIN_COLOR_BG_ORANGE"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "orange")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Pink colored background.
__BU_MAIN_COLOR_BG_PINK="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_PINK")";
printf "%s" "$__BU_MAIN_COLOR_BG_PINK"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_PINK' "$__BU_MAIN_COLOR_BG_PINK"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "pink")"          "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Purple colored background.
__BU_MAIN_COLOR_BG_PURPLE="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_PURPLE")";
printf "%s" "$__BU_MAIN_COLOR_BG_PURPLE"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_PURPLE' "$__BU_MAIN_COLOR_BG_PURPLE"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "purple")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Light red colored background.
__BU_MAIN_COLOR_BG_RED="$(BU::Main::Decho::SetBGColor         "$__BU_MAIN_COLOR_CODE_RED")";
printf "%s" "$__BU_MAIN_COLOR_BG_RED"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_RED' "$__BU_MAIN_COLOR_BG_RED"            'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "light red")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Salmon colored background.
__BU_MAIN_COLOR_BG_SALMON="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_SALMON")";
printf "%s" "$__BU_MAIN_COLOR_BG_SALMON"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_SALMON' "$__BU_MAIN_COLOR_BG_SALMON"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "salmon")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Silver gray colored background.
__BU_MAIN_COLOR_BG_SILVER="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_SILVER")";
printf "%s" "$__BU_MAIN_COLOR_BG_SILVER"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_SILVER' "$__BU_MAIN_COLOR_BG_SILVER"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "silver gray")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Brown tan colored background.
__BU_MAIN_COLOR_BG_TAN="$(BU::Main::Decho::SetBGColor         "$__BU_MAIN_COLOR_CODE_TAN")";
printf "%s" "$__BU_MAIN_COLOR_BG_TAN"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_TAN' "$__BU_MAIN_COLOR_BG_TAN"            'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "brown tan")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# Teal colored background.
__BU_MAIN_COLOR_BG_TEAL="$(BU::Main::Decho::SetBGColor        "$__BU_MAIN_COLOR_CODE_TEAL")";
printf "%s" "$__BU_MAIN_COLOR_BG_TEAL"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_TEAL' "$__BU_MAIN_COLOR_BG_TEAL"         'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "teal")"          "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Turquoise colored background.
__BU_MAIN_COLOR_BG_TURQUOISE="$(BU::Main::Decho::SetBGColor   "$__BU_MAIN_COLOR_CODE_TURQUOISE")";
printf "%s" "$__BU_MAIN_COLOR_BG_TURQUOISE"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_TURQUOISE' "$__BU_MAIN_COLOR_BG_TURQUOISE" 'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "turquoise")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Violet colored background.
__BU_MAIN_COLOR_BG_VIOLET="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_VIOLET")";
printf "%s" "$__BU_MAIN_COLOR_BG_VIOLET"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_VIOLET' "$__BU_MAIN_COLOR_BG_VIOLET"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "violet")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -------
# White colored background.
__BU_MAIN_COLOR_BG_WHITE="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_WHITE")";
printf "%s" "$__BU_MAIN_COLOR_BG_WHITE"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_WHITE' "$__BU_MAIN_COLOR_BG_WHITE"    'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "white")"                         "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Light yellow colored background.
__BU_MAIN_COLOR_BG_YELLOW="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_YELLOW")";
printf "%s" "$__BU_MAIN_COLOR_BG_YELLOW"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_YELLOW' "$__BU_MAIN_COLOR_BG_YELLOW"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd "yellow")"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
printf "%s" "$__BU_MAIN_COLOR_TXT_RESET";
# -----------------------------------------------
## SPECIFIC BACKGROUND ENCODING
# Specific colors encoding.
__BU_MAIN_COLOR_BG_CMD="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_ERROR")";        # Command name's display color.
__BU_MAIN_COLOR_BG_ERROR="$(BU::Main::Decho::SetBGColor     "$__BU_MAIN_COLOR_CODE_ERROR")";        # Error text display color.
__BU_MAIN_COLOR_BG_FUNCTION="$(BU::Main::Decho::SetBGColor  "$__BU_MAIN_COLOR_CODE_FUNCTION")";     # Function name display color
__BU_MAIN_COLOR_BG_HIGHLIGHT="$(BU::Main::Decho::SetBGColor "$__BU_MAIN_COLOR_CODE_HIGHLIGHT")";    # Highlighted text display color.
__BU_MAIN_COLOR_BG_NEWSTEP="$(BU::Main::Decho::SetBGColor   "$__BU_MAIN_COLOR_CODE_NEWSTEP")";      # New setps text display color.
__BU_MAIN_COLOR_BG_PATH="$(BU::Main::Decho::SetBGColor      "$__BU_MAIN_COLOR_CODE_PATH")";         # Directories and files paths display color.
__BU_MAIN_COLOR_BG_SUCCESS="$(BU::Main::Decho::SetBGColor   "$__BU_MAIN_COLOR_CODE_SUCCESS")";      # Success text display color.
__BU_MAIN_COLOR_BG_VAR="$(BU::Main::Decho::SetBGColor       "$__BU_MAIN_COLOR_CODE_VAR")";          # Variable, parameter or argument name.
__BU_MAIN_COLOR_BG_WARNING="$(BU::Main::Decho::SetBGColor   "$__BU_MAIN_COLOR_CODE_WARNING")";      # Warning text display color.
# Resetting the text's background color to terminal's default text color.
__BU_MAIN_COLOR_BG_RESET="$__BU_MAIN_COLOR_CODE_RESET"
printf "%s" "$__BU_MAIN_COLOR_BG_CMD";          BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_CMD'         "$__BU_MAIN_COLOR_BG_CMD"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'commands names')"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_BG_ERROR";        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_ERROR'       "$__BU_MAIN_COLOR_BG_ERROR"     'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'error messages')"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))";
printf "%s" "$__BU_MAIN_COLOR_BG_FUNCTION";     BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_FUNCTION'    "$__BU_MAIN_COLOR_BG_FUNCTION"  'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'function names')"        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK";
printf "%s" "$__BU_MAIN_COLOR_BG_HIGHLIGHT";    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_HIGHLIGHT'   "$__BU_MAIN_COLOR_BG_HIGHLIGHT" 'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'text highlighting')"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE";
printf "%s" "$__BU_MAIN_COLOR_BG_NEWSTEP";      BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_NEWSTEP'     "$__BU_MAIN_COLOR_BG_NEWSTEP"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'new step messages')"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK";
printf "%s" "$__BU_MAIN_COLOR_BG_PATH";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_PATH'        "$__BU_MAIN_COLOR_BG_PATH"      'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'paths highlighting')"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))"; printf "%s" "$__BU_MAIN_COLOR_TXT_WHITE";
printf "%s" "$__BU_MAIN_COLOR_BG_SUCCESS";      BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_SUCCESS'     "$__BU_MAIN_COLOR_BG_SUCCESS"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'success messages')"      "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-13 ))"; printf "%s" "$__BU_MAIN_COLOR_TXT_BLACK";
printf "%s" "$__BU_MAIN_COLOR_BG_VAR";          BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_VAR'         "$__BU_MAIN_COLOR_BG_VAR"       'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'variables names highlighting')"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-14 ))";
printf "%s" "$__BU_MAIN_COLOR_BG_WARNING";      BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_WARNING'     "$__BU_MAIN_COLOR_BG_WARNING"   'CMD' "$(BU::Main::ModConfig::Colors::PrintColorBGVarsNameSubsCmd 'warning messages')"              "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-14 ))";
printf "%s" "$__BU_MAIN_COLOR_BG_RESET";        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_COLOR_BG_RESET'       "$__BU_MAIN_COLOR_BG_RESET"     'CMD' "This command substitution executes the « tput sgr0 » command to reset the text mode's text color"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-15 ))";
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/DEBUG.CONF
#!/usr/bin/env bash
# Debug function that displays function and file name.
function debug()
{
	#**** Parameters ****
	p_function=$1
	p_file=$2
	p_line=$3
	#**** Code ****
	if [ "$__BU_MODULE_INIT_STAT_DEBUG" = 'true' ]; then
		echo -ne "$__BU_MAIN_COLOR_TXT_PINK"
		for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
			echo -ne "+"
		done
		echo -ne "$__BU_MAIN_COLOR_TXT_RESET"; echo -e; echo -e
		echo -e "${__BU_MAIN_COLOR_TXT_YELLOW}FUNCTION ${__BU_MAIN_COLOR_TXT_PINK}$p_function${__BU_MAIN_COLOR_TXT_YELLOW} IN ${__BU_MAIN_COLOR_TXT_PINK}$p_file${__BU_MAIN_COLOR_TXT_YELLOW}, ON ${__BU_MAIN_COLOR_TXT_PINK}$p_line${__BU_MAIN_COLOR_TXT_RESET}"
		echo -ne "$__BU_MAIN_COLOR_TXT_PINK"
		for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
                        echo -ne "+"
		done
		echo -ne "$__BU_MAIN_COLOR_TXT_RESET"; echo -e; echo -e
	fi
}
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/EXIT.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores every exit codes used in this framework.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
## FUNCTIONS
# Writing the command substitution text for the return values definitions.
function BU::Main::ModConfig::PrintReturnValue { printf "This global variable stores the return value of the last command in this situation : « %s »" "$1"; }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### BASH-UTILS EXIT CODES PROCESSING
## GENERAL GLOBAL VARIABLES
# Storing an exit code to be processed by a parent function.
__BU_MAIN_EXIT_CURRENT_CODE="";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_CURRENT_CODE' "$__BU_MAIN_EXIT_CURRENT_CODE" 'Int' \
	"This global variable stores the current return value of the last command, in order to be processed by another function" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## EXIT CODES LIST
# Operation not permitted.
__BU_MAIN_EXIT_NOT_PERMITTED='1';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_NOT_PERMITTED' "$__BU_MAIN_EXIT_NOT_PERMITTED" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the operation was not permitted')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# No such file or directory.
__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND='2';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND' "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the target file or folder was not found')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Permission denied.
__BU_MAIN_EXIT_PERMISSION_DENIED='13';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_PERMISSION_DENIED' "$__BU_MAIN_EXIT_PERMISSION_DENIED" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue "you don't have the permission to perform this action")" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# File exists.
__BU_MAIN_EXIT_FILE_EXISTS='17';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_FILE_EXISTS' "$__BU_MAIN_EXIT_FILE_EXISTS" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the target file already exists')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Not a directory.
__BU_MAIN_EXIT_NOT_DIR='20';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_NOT_DIR' "$__BU_MAIN_EXIT_NOT_DIR" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the target is not a directory')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Target is a directory.
__BU_MAIN_EXIT_IS_DIR='21';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_IS_DIR' "$__BU_MAIN_EXIT_IS_DIR" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the target is a directory')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Invalid argument
__BU_MAIN_EXIT_INVALID_ARGUMENT="22";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_INVALID_ARGUMENT' "$__BU_MAIN_EXIT_INVALID_ARGUMENT" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue "bad argument provided")" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# File too large
__BU_MAIN_EXIT_FILE_TOO_LARGE="27";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_FILE_TOO_LARGE' "$__BU_MAIN_EXIT_FILE_TOO_LARGE" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue "file is too large")" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Not space left on the hard drive.
__BU_MAIN_EXIT_NO_SPACE_LEFT='28';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_NO_SPACE_LEFT' "$__BU_MAIN_EXIT_NO_SPACE_LEFT" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue "no space left on the target hard drive's partition")" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Read-only file system.
__BU_MAIN_EXIT_RO_FS='30';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_RO_FS' "$__BU_MAIN_EXIT_RO_FS" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'read-only file system')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# File name too long.
__BU_MAIN_EXIT_FILENAME_TOO_LONG='36';
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_EXIT_FILENAME_TOO_LONG' "$__BU_MAIN_EXIT_FILENAME_TOO_LONG" 'Int' \
	"$(BU::Main::ModConfig::PrintReturnValue 'the name of the file to create is too long')" \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/FILESYSTEM.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores main module's initialization process related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
# Feel free to define any needed resources (functions, etc...) here.
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### PROCESSING FILE SYSTEM'S INFORMATIONS
# Getting the filesystem's name with the "df" command, and parsing the output list according to the operating system's command version.
BU::IsOSHaiku && __BU_MAIN_FS_NAME="$(df "$0" | awk 'FNR == 4 {print $3}')";
BU::IsOSLinux && __BU_MAIN_FS_NAME="$(df -Th "$0" | awk 'FNR == 2 {print $2}')";
## EXT2 FILE SYSTEM'S INFORMATIONS
if [ "${__BU_MAIN_FS_NAME,,}" = 'apfs' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        "This global variable stores the maximum length in bytes of a file name. This length is associated with the Apple's APFS file system" \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## BTRFS FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'btrfs' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the Btrfs file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## EXT2 FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'ext2' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the EXT2 file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## EXT3 FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'ext3' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the EXT3 file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## EXT4 FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'ext4' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the EXT4 file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## JFS FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'jfs' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the JFS file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## XFS FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'xfs' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the XFS file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## ZFS FILE SYSTEM'S INFORMATIONS
elif [ "${__BU_MAIN_FS_NAME,,}" = 'zfs' ]; then
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is associated with the ZFS file system' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
else
    BU::Main::Errors::HandleSmallErrors 'W' "Unsupported filesystem (found $(BU::DechoHighlight "$__BU_MAIN_FS_NAME"))\n\nGeneration of basic informations, but several functionalities of this framework may be prone to bugs" 'R';
    # File system max filename length.
    __BU_MAIN_FS_MAX_FILENAME_LENGTH='255';
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_FS_MAX_FILENAME_LENGTH' "$__BU_MAIN_FS_MAX_FILENAME_LENGTH" 'Int' \
        'This global variable stores the maximum length in bytes of a file name. This length is not associated with any file system, but rather according to general specification' \
        "$(basename "${BASH_SOURCE[0]}")" "${FUNCAME[0]}" "$(( LINENO-2 ))";
fi
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/MODULE.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores main module's initialization process related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
# Feel free to define any needed resources (functions, etc...) here.
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### BASH-UTILS VARIABLES
## BASH-UTILS DIRECTORIES PATHS
# Bash Utils root directory path checking.
# If the Bash Utils root directory is located in the directory where the main developer is used to develop this framework, on Ubuntu.
if [ -d "/usr/local/lib/Bash-utils" ]; then
    __BU_MAIN_ROOT_DIR_PATH='/usr/local/lib/Bash-utils';
# If the Bash Utils root directory is installed in the hidden directory, normally located in the user's home directory.
elif [ -d "$__BU_MODULE_INIT__ROOT/Bash-utils" ]; then
    __BU_MAIN_ROOT_DIR_PATH="$__BU_MODULE_INIT__ROOT/Bash-utils";
# Else, if the library's root directory doesn't exists in at least one of the above paths, then the value stored in the "Bash-utils-root-val.path" is used as the path of this root directory.
else
    # For a better environment integration, it is highly advised to store the path in a file
    # in the configurations directory, and to call the "cat" command to display its value.
    if [ -f "$__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH" ]; then
        __BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH="$__BU_MODULE_INIT__LIB_ROOT_DIR__FILE_PATH";
        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH' "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" 'Filepath' "This global variable stores the path of the file which contains the path of the Bash Utils library's root path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    # Including the same file, if it was generated by the "install_and_update.sh" file when executed with root privileges
    # (failsafe for the users who cannot execute this file with these privileges, if the same file than the one above exists
    # and is (still) owned by the super-user or its group, which means that this file cannot be modified normally, and may not be readable).
    elif [ -f "$__BU_MODULES_UTILS_LIB_ROOT_DIR_ROOT_FILE_PATH" ]; then
        __BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH="$__BU_MODULE_INIT__LIB_ROOT_DIR_ROOT__FILE_PATH";
        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH' "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" 'Filepath' "This global variable stores the path of the file which contains the path of the Bash Utils library's root path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
    # The possible absence of this file is managed below.
    fi
    # Checking if the "Bash-utils-root-val.path" file exists AND if this file contains a string (the wanted string here is the library's root folder path).
    if [ -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ] && [ -s "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ]; then
        __BU_MAIN_ROOT_DIR_PATH="$(cat "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH")";
        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_ROOT_DIR_PATH' "$__BU_MAIN_ROOT_DIR_PATH" 'Dirpath' "This global variable stores the Bash Utils library's root path, which is written in the « $__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH » file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
        # Checking if the library's root folder path written in this file is valid.
        if [ ! -d "$__BU_MAIN_ROOT_DIR_PATH" ]; then
            echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2;
            echo "The Bash Utils library's root folder's path written in the « $__BU_MODULES_UTILS_LIB_FILE_PATH » file was not found in your hard drive." >&2; echo >&2;
            echo "The currently written path is « $__BU_MAIN_ROOT_DIR_PATH »" >&2; echo >&2;
            echo "Please check the path recorded in this file for typos if you typed it by yourself, or verify where you've stored this root folder." >&2; echo >&2;
            BU::ModuleInit::MsgAbort;
            BU::ModuleInit::AskPrintLog;
            exit 1;
        fi
    # Checking if the "Bash-utils-root-val.path" exists AND if this file is empty (no library's path specified).
    elif [ -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ] && [ ! -s "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ]; then
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> WARNING !" >&2; echo >&2;
        echo "The Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH » exists, but is empty." >&2; echo >&2;
        echo "Please write the path of the library's root folder inside this file, manually or with the installer file." >&2; echo >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog;
        exit 1;
    # Checking if the current user cannot read the "Bash-utils-root-val.path" (file owned by the "root" user).
    elif [ -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ] && [ ! -r "$__BU_MODULES_UTILS_LIB_ROOT_DIR_FILE_PATH" ]; then
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2;
        echo "You don't have the right to read the Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH »" >&2;
        echo "It means that you've created this file with the super-user privileges, by hand or with the installation script (in this case, something may have be wrong)" >&2; echo >&2;
        echo "Please execute this script as root user, or change the ownership of the « $__BU_MAIN_ROOT_DIR_PATH » file, or create a new file, and rename the file to find in the « $__BU_MODULE_INIT__INITIALIZER_PATH » file";
        echo "If you opt for the last solution, please find the line containing the string « __BU_MODULES_UTILS_LIB_ROOT_DIR_FILE_NAME= » in the « DEFINING GLOBAL VARIABLES » subsection"; echo >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog;
        exit 1;
    # Handling the absence of the "Bash-utils-root-val.path" file.
    elif [ ! -f "$__BU_MAIN_ROOT_DIR_PATH_STORAGE_FILE_PATH" ]; then
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE $LINENO --> ERROR !" >&2; echo >&2;
        echo "The Bash Utils's root folder's path storage file « $__BU_MAIN_ROOT_DIR_PATH » doesn't exists" >&2; echo >&2;
        echo "Please create this file and write the path of the library's root folder inside this file, manually or with the installer file." >&2; echo >&2;
        BU::ModuleInit::MsgAbort;
        BU::ModuleInit::AskPrintLog;
        exit 1;
    fi
fi
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### BASH UTILS LIBRARY DIRECTORIES PATHS
## BASH UTIILS SUB-FOLDERS PATHS
# Bash Utils binary files folder            |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_BIN_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_ROOT_DIR_PATH" "bin")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_BIN_DIR_PATH' "$__BU_MAIN_MODULE_BIN_DIR_PATH"     		'Dirpath' "This global variable stores the path of the library's binaries directory"				"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils configuration files folder		|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_CONF_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__CONFIG_MODULES_DIR" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_DIR_PATH' "$__BU_MAIN_MODULE_CONF_DIR_PATH"   		'Dirpath' "This global variable stores the path of the « main » module's configurations directory"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils documentation folder			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DOCS_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_ROOT_DIR_PATH" "docs")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DOCS_DIR_PATH' "$__BU_MAIN_MODULE_DOCS_DIR_PATH"   		'Dirpath' "This global variable stores the path of the whole library's documentation directory"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils library root directory	        |	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_LIB_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_ROOT_DIR_PATH" "lib")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIB_DIR_PATH' "$__BU_MAIN_MODULE_LIB_DIR_PATH"				'Dirpath' "This global variable stores the path of the library's « lib » directory"					"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils library resources path			|	Default parent folder --> "$__BU_MAIN_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_RES_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_ROOT_DIR_PATH" "res")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_RES_DIR_PATH' "$__BU_MAIN_MODULE_RES_DIR_PATH"     		'Dirpath' "This global variable stores the path of the library's « res » resources directory"		"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## BASH UTILS DEV-TOOLS PATHS
# Bash Utils development tools root directory          	|	Default parent folder --> "$__BU_MAIN_MODULE_RES_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_RES_DIR_PATH" "dev-tools")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH' "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" 'Dirpath' "This global variable stores the path of the development tools root directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils development tools binary files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_BIN="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-bin")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_BIN' "$__BU_MAIN_MODULE_DEVTOOLS_BIN" 'Dirpath' "This global variable stores the path of the development tools binaries folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils development tools desktop files folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_DSK="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-desktop")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_DSK' "$__BU_MAIN_MODULE_DEVTOOLS_DSK" 'Dirpath' "This global variable stores the path of the development tools desktop files folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils development tools desktop icons folder		|	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_IMG="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-img")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_IMG' "$__BU_MAIN_MODULE_DEVTOOLS_IMG" 'Dirpath' "This global variable stores the path of the development tools icons folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils development tools source files             |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_SRC="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-src")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_SRC' "$__BU_MAIN_MODULE_DEVTOOLS_SRC" 'Dirpath' "This global variable stores the path of the development tools source files folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils development tools translation files folder |	Default parent folder --> "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH/"
__BU_MAIN_MODULE_DEVTOOLS_TRANSL="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_DEVTOOLS_ROOT_DIR_PATH" "dev-translations")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_DEVTOOLS_TRANSL' "$__BU_MAIN_MODULE_DEVTOOLS_TRANSL" 'Dirpath' "This global variable stores the path of the development tools translation files folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## "lib" FOLDER'S CONTENT.
# Bash Utils main module's functions directory      |	Default parent folder --> "$__BU_MAIN_MODULE_LIB_DIR_PATH/"
__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "functions")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH' "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH" 'Dirpath' "This global variable stores the path of the « functions » folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils library module's directory             |	Default parent folder --> "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH/"
__BU_MAIN_MODULE_LIB_MOD_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_LIB_FUNCTS_DIR_PATH" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIB_MOD_DIR_PATH' "$__BU_MAIN_MODULE_LIB_MOD_DIR_PATH" 'Dirpath' "This global variable stores the path of the « main » module's functions folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils languages directory			|	Default parent folder --> "$__BU_MAIN_MODULE_LIB_DIR_PATH/"
__BU_MAIN_MODULE_LANG_DIR_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_LIB_DIR_PATH" "lang")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LANG_DIR_PATH' "$__BU_MAIN_MODULE_LANG_DIR_PATH"			'Dirpath' "This global variable stores the path of the modules « lib » translation files directory"	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### BASH UTILS LIBRARY FILES PATHS
## "config" FOLDER'S CONTENT
# Bash Utils color encoding variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_COLORS_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Colors.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_COLORS_PATH' "$__BU_MAIN_MODULE_CONF_FILE_COLORS_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Colors.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils exit code variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_EXIT_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Exit.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_EXIT_PATH' "$__BU_MAIN_MODULE_CONF_FILE_EXIT_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Exit.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils file system variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_FILESYSTEM_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Filesystem.conf")"
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_FILESYSTEM_PATH' "$__BU_MAIN_MODULE_CONF_FILE_FILESYSTEM_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Filesystem.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils project's initialization variables.
__BU_MAIN_MODULE_CONF_FILE_INIT_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Project.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_INIT_PATH' "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Project.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils status variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Status.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH' "$__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Status.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils text variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_TEXT_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Text.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_TEXT_PATH' "$__BU_MAIN_MODULE_CONF_FILE_TEXT_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Text.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Bash Utils time variables configuration file.
__BU_MAIN_MODULE_CONF_FILE_TIME_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_CONF_DIR_PATH" "Time.conf")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONF_FILE_TIME_PATH' "$__BU_MAIN_MODULE_CONF_FILE_TIME_PATH" 'Filepath' "This global variable stores the path of the « main » module's « Time.conf » configuration file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## BASH UTILS INITIALIZER PATH
# Module's initializer file.
__BU_MAIN_MODULE_LIB_FILE_INITIALIZER_FILE_PATH="$(BU::ModuleInit::FindPath "$__BU_MODULE_INIT__MODULES_DIR" "Initializer.sh")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIB_FILE_INITIALIZER_FILE_PATH' "$__BU_MAIN_MODULE_LIB_FILE_INITIALIZER_FILE_PATH" 'Filepath' "This global variable stores the path of the « main » module's initializer script" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## "functions" FOLDER'S SUB-FOLDERS CONTENT
# Note : if a variable is an array, please leave empty the second argument of the "BU::ModuleInit::DisplayInitGlobalVarsInfos()" function.
# Main module's library functions folder's path.
__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY=("$__BU_MAIN_MODULE_LIB_MOD_DIR_PATH/"*.lib);
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY' "" 'Array' "This array stores the path of each « main » module's functions folder's library « .lib » file TO SOURCE (NOT SOURCED YET)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))" "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY[@]}";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### INITALIZATION VARIABLES
## INITIALIZATION VARIABLES DECLARATIONS
# Note : if a variable is an array, please leave empty the second argument of the "BU::ModuleInit::DisplayInitGlobalVarsInfos()" function.
# Defining an array of parameters in order to store the modified global status variables values,
# in order to check which status variables values have to be changed to their new default value,
# after the main module's initialization.
# It MUST NOT store any value now, it will be processed in the main module's initializer file.
__BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY=()
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY' "" 'Array' "This array (MUST BE EMPTY BY DEFAULT) stores the global status variables values modified as the « main » module's by the user" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## LIBRARY INITALIZATION VARIABLES DECLARATIONS
# Defining an associative array to store each sourced library file's path.
__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY=();
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY' "" 'Array' "This array (MUST BE EMPTY BY DEFAULT) stores the path of each SOURCED « main » module's library files" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# -----------------------------------------------
## CONFIGURATION FILES INITALIZATION VARIABLES DECLARATIONS
# Defining an associative array to store each sourced configuration file's path.
__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY=();
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY' "" 'Array' "This array (MUST BE EMPTY BY DEFAULT) stores the path of each SOURCED « main » module's configuration files" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
# Storing the configuration files path variable values into an array to source, print and add easier into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" associative array.
# Those files are, respectly, the :
#   - Project's and initialization process global variable
#   - Project's status variable
#   - Text color
#   - Text decoration, formatting and printing variable
#   - Time variable
# The "ProjectInit.conf" file MUST be sourced first, then the "ProjectStatus.conf" file MUST be sourced in the second.
# Unless otherwise stated, the other configuration files may be sourced in any order.
__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY=();
# Please source these files in this order of priority :
#   - $__BU_MAIN_MODULE_CONF_FILE_EXIT_PATH     ("Exit.conf")
#   - $__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH   ("Status.conf")
#   - $__BU_MAIN_MODULE_CONF_FILE_INIT_PATH     ("Project.conf")
#   - Then the rest of the configuration files.
__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY+=("$__BU_MAIN_MODULE_CONF_FILE_EXIT_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_COLORS_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_FILESYSTEM_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_TEXT_PATH" \
    "$__BU_MAIN_MODULE_CONF_FILE_TIME_PATH");
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY' "" 'Array' "This array stores the path of each « main » module's configuration files TO SOURCE (NOT SOURCED YET)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))" "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}";
# -----------------------------------------------
## END OF Bash-utils GLOBAL VARIABLES DEFINITION
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/PROJECT.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores project-related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
# Feel free to define any needed resources (functions, etc...) here.
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### PROJECT'S VARIABLES
## PROJECT'S PATHS VARIABLES
# Script file's informations
__BU_MAIN_PROJECT_FILE_NAME=$(basename "$0");                    # Project file's name.
__BU_MAIN_PROJECT_NAME=$(basename "$0" | cut -f 1 -d '.');       # Name of the project (project file's name without its file extension).
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_FILE_NAME' "$__BU_MAIN_PROJECT_FILE_NAME"	'String' "This global variable stores the name of the main project's script (the one executed right now), with it's file extension" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_NAME' "$__BU_MAIN_PROJECT_NAME"			'String' "This global variable stores the name of the main project's script (the one executed right now), without it's file extension" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
function GetProjectFilePath()
{
    #**** Variables ****
    local v_cut="${__BU_MAIN_PROJECT_FILE_NAME##*./}";
    local find_path;
        find_path="$(BU::ModuleInit::FindPath "$(cd "$(printf "%s" "$__BU_MAIN_PROJECT_FILE_PARENT")" || \
        {
            echo >&2; echo "IN « ${BASH_SOURCE[0]} », FUNCTION « ${FUNCNAME[0]} », LINE « $LINENO » --> ERROR : UNABLE TO GET THE " >&2; echo >&2; exit 1;
        }; pwd)" "$v_cut")";
    #**** Code ****
    echo "$find_path";
	return 0;
}
__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME="tmp";
__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH="$__BU_MAIN_ROOT_DIR_PATH/$__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME' "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_NAME" 'Dir'	"This global variable stores the name of the project's temporary folder's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH' "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH" 'Dirpath'	"This global variable stores the path to the project's temporary folder's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
if [ ! -d "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH" ]; then
    mkdir -p "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH" || { echo >&2; echo "UNABLE TO CREATE THE PROJECT'S TEMPORARY FOLDER'S PARENT DIRECTORY « $__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH » !" >&2; echo >&2; exit 1; };
fi
# Checking first if the effective user identifiant (EUID) is equal to super-user's EUID or not.
# The folders names have to be different according to the EUID, as files and folders created by the root user belong to this user,
# which means that a regular user won't have any write permission on these files, so nothing can be written on a log file, for example.
# To remove these folders, please run the "rm -rf $folder" command with sudo if you're not logged as super-user.
if [ "$EUID" -eq 0 ]; then
    __BU_MAIN_PROJECT_TMP_DIR_PATH="$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME - ROOT"; # Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME - ROOT"
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_TMP_DIR_PATH' "$__BU_MAIN_PROJECT_TMP_DIR_PATH" 'Dirpath' "This global variable stores the path to the temporary folder" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
else
    __BU_MAIN_PROJECT_TMP_DIR_PATH="$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME";        # Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PARENT_PATH/$__BU_MAIN_PROJECT_NAME"
    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_TMP_DIR_PATH' "$__BU_MAIN_PROJECT_TMP_DIR_PATH" 'Dirpath' "This global variable stores the path to the temporary folder (with super-user's privileges)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
fi
# Project's file path.
__BU_MAIN_PROJECT_FILE_PATH="$(GetProjectFilePath "$__BU_MAIN_PROJECT_FILE_NAME")"; echo "$__BU_MAIN_PROJECT_FILE_PATH";
# -------
# Defining the project's aliases file's informations.
# __BU_MAIN_PROJECT_ALIAS_FILE_PARENT   --> Default value : "$__BU_MODULE_INIT__ROOT" (~/.Bash-utils)
# __BU_MAIN_PROJECT_ALIAS_FILE_NAME     --> Default value : "Aliases.sh"
# __BU_MAIN_PROJECT_ALIAS_FILE_PATH     --> Default value : "$__BU_MAIN_PROJECT_ALIAS_FILE_PARENT/$__BU_MAIN_PROJECT_ALIAS_FILE_NAME"
__BU_MAIN_PROJECT_ALIAS_FILE_PARENT="$__BU_MODULE_INIT__ROOT";
__BU_MAIN_PROJECT_ALIAS_FILE_NAME="Aliases.sh";
__BU_MAIN_PROJECT_ALIAS_FILE_PATH="$__BU_MAIN_PROJECT_ALIAS_FILE_PARENT/$__BU_MAIN_PROJECT_ALIAS_FILE_NAME";
# -------
# Defining the project's background color code storage file's informations.
# __BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT   --> Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PATH"
# __BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME     --> Default value : "fgcolors.tmp"
# __BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH     --> Default value : "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT/$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME"
__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH";
__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME="fgcolors.tmp";
__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH="$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT/$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT' "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" 'Dirpath'	"This global variable stores the path to the Decho background color code file's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME' "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME"     'File'		"This global variable stores the name of the Decho background color code file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH' "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH"     'Filepath'	"This global variable stores the path to the Decho background color code file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -------
# Defining the project's text color code storage file's informations.
# __BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT --> Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PATH"
# __BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME   --> Default value : "fgcolors.tmp"
# __BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH   --> Default value : "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT/$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME"
__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH";
__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME="fgcolors.tmp";
__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH="$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT/$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT' "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT"   'Dirpath'	"This global variable stores the path to the Decho color code file's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME' "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME"       'File'		"This global variable stores the name of the Decho color code file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH' "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH"       'Filepath'	"This global variable stores the path to the Decho color code file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -------
# Defining the project's "BU::Echo<...>()" functions debug output (to have a better view during a "bash - x" debug).
# __BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT --> Default value : "$__BU_MAIN_PROJECT_LOG_DIR_PATH"
# __BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME   --> Default value : "echo_output.log"
# __BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH   --> Default value : "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT/$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME"
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT="$__BU_MAIN_PROJECT_LOG_DIR_PATH";
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME="echo_output.log";
__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH="$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT/$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT' "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT" 'Dirpath'	"This global variable stores the path to the echo debugging file's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME' "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME"     'File'		"This global variable stores the name of the echo debugging file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH' "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH"     'Filepath'	"This global variable stores the path to the echo debugging file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -------
# Defining the project's log file's parent directory path.
# __BU_MAIN_PROJECT_LOG_DIR_PARENT  --> Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PATH"
# __BU_MAIN_PROJECT_LOG_DIR_NAME    --> Default value : "logs"
# __BU_MAIN_PROJECT_LOG_DIR_PATH    --> Default value : "$__BU_MAIN_PROJECT_TMP_DIR_PATH/$__BU_MAIN_PROJECT_LOG_DIR_NAME"
__BU_MAIN_PROJECT_LOG_DIR_PARENT="$__BU_MAIN_PROJECT_TMP_DIR_PATH";
__BU_MAIN_PROJECT_LOG_DIR_NAME="logs";
__BU_MAIN_PROJECT_LOG_DIR_PATH="$__BU_MAIN_PROJECT_LOG_DIR_PARENT/$__BU_MAIN_PROJECT_LOG_DIR_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_DIR_PARENT' "$__BU_MAIN_PROJECT_LOG_DIR_PARENT"   'Dirpath'	"This global variable stores the path to the parent directory of the project's log file's directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_DIR_NAME' "$__BU_MAIN_PROJECT_LOG_DIR_NAME"       'Dir'		"This global variable stores the name of the parent directory of the project's log file's directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_DIR_PATH' "$__BU_MAIN_PROJECT_LOG_DIR_PATH"       'Dirpath'	"This global variable stores the path to the parent directory of the project's log file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -------
# Defining the project's log file's path.
# __BU_MAIN_PROJECT_LOG_FILE_PARENT --> Default value : "$__BU_MAIN_PROJECT_LOG_DIR_PATH"
# __BU_MAIN_PROJECT_LOG_FILE_NAME   --> Default value : "$__BU_MAIN_PROJECT_NAME.log"
# __BU_MAIN_PROJECT_LOG_FILE_PATH   --> Default value : "$__BU_MAIN_PROJECT_LOG_FILE_PARENT/$__BU_MAIN_PROJECT_LOG_FILE_NAME"
__BU_MAIN_PROJECT_LOG_FILE_PARENT="$__BU_MAIN_PROJECT_LOG_DIR_PATH";
__BU_MAIN_PROJECT_LOG_FILE_NAME="$__BU_MAIN_PROJECT_NAME.log";
__BU_MAIN_PROJECT_LOG_FILE_PATH="$__BU_MAIN_PROJECT_LOG_FILE_PARENT/$__BU_MAIN_PROJECT_LOG_FILE_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_FILE_PARENT' "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" 'Dirpath'	"This global variable stores the path to the project's log file's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_FILE_NAME' "$__BU_MAIN_PROJECT_LOG_FILE_NAME"     'File'		"This global variable stores the name of the project's log file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LOG_FILE_PATH' "$__BU_MAIN_PROJECT_LOG_FILE_PATH"     'FilePath'	"This global variable stores the path to the project's log path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -------
# Defining the project's translations script's informations.
# __BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT   --> Default value : "$__BU_MAIN_MODULE_LANG_DIR_PATH"
# __BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME     --> Default value : "SetModuleLang.pl"
# __BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH     --> Default value : "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT/$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME"
__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT="$__BU_MAIN_MODULE_LANG_DIR_PATH";
__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME="SetModuleLang.pl"
__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH="$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT/$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT' "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PARENT"	'Dirpath'	"This global variable stores the path to the CSV translations parser script's parent directory" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME' "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_NAME"		'File'		"This global variable stores the name of the CSV translations parser script" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH' "$__BU_MAIN_PROJECT_LANG_CSV_PARSER_SCRIPT_PATH"		'Filepath'	"This global variable stores the path to the CSV translations parser script" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
# -----------------------------------------------
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/STATUS.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# These status variable can be changed anywhere in the main script, except for the following variables :
#   - __BU_MAIN_STATUS_INITIALIZING     -> This variable is used as (...).
# Their values are checked in the "Status.lib" file, located in the "Bash-utils/lib/functions/main" directory, with the "CheckSTAT_" functions (CV = Correct Value).
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
# Default value : "forbidden" (by security, and since there's no need to change its value during the initialization, you have to change this value manually or in your code with the "BU::Main::Status::ChangeSTAT_OPERATE_ROOT()" function).
# shellcheck disable=SC2034
__BU_MAIN_STAT_OPERATE_ROOT="forbidden"
# Project's headers messages display pause time.
# This variable only accepts any integer of floating number.
# Default value : ".6"
# shellcheck disable=SC2034
__BU_MAIN_STAT_TIME_HEADER="1"
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
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/TEXT.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores text-related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
## FUNCTIONS - TEXT MODE PROCESSING
# Writing the command substitution text when the text mode is processed.
function BU::Main::ModConfig::Text::PrintTextModeCmdSubs() { printf "This command substitution executes the « tput $1 » OR the « stty size » commands in order to get the total number of « %s » on the current text mode" "$1"; }
# -----------------------------------------------
## FUNCTIONS - TEXT FORMATTING
# Writing the command substitution text when a formatting is defined.
function BU::Main::ModConfig::Text::PrintFormatCmdSubs() { printf "This command substitution executes the « BU::Main::Checkings::CheckTextFormat() » function in order to format the text with the defined « %s » text formatting" "$1"; }
# Writing the command substitution text when a resetting is defined.
function BU::Main::ModConfig::Text::PrintResetCmdSubs() { printf "This command substitution executes the « BU::Main::Checkings::CheckTextFormat() » function in order to reset the text from the « %s » text formatting" "$1"; }
# Writing the command substitution text when a total resetting is defined.
function BU::Main::ModConfig::Text::PrintAllResetCmdSubs() { printf "This command substitution executes the « BU::Main::Checkings::CheckTextFormat() » function in order to reset the text from the every text formatting"; }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### TEXT MODE PROCESSING
## COLUMNS AND LINES
# Getting the columns number on the current text mode according to its window's length.
__BU_MAIN_TXT_COLS="$(tput cols || stty size | cut -d " " -f2)"
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_COLS' "$__BU_MAIN_TXT_COLS" 'CMD' "$(BU::Main::ModConfig::Text::PrintTextModeCmdSubs 'cols')" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Getting the lines number on the current text mode according to its window's height.
__BU_MAIN_TXT_LINES="$(tput lines || stty size | cut -d " " -f1)"
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_LINES' "$__BU_MAIN_TXT_LINES" 'CMD' "$(BU::Main::ModConfig::Text::PrintTextModeCmdSubs 'lines')" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## PRINTING CHARACTERS
# Caractère utilisé pour dessiner les lignes des headers. Si vous souhaitez mettre un autre caractère à la place d'un tiret, changez le caractère entre les double guillemets.
# Ne mettez pas plus d'un caractère si vous ne souhaitez pas voir le texte de chaque header apparaître entre plusieurs lignes (une ligne de chaque caractère).
__BU_MAIN_TXT_CHAR_HEADER_LINE="-"		# Caractère à afficher en boucle pour créer une ligne des headers de changement d'étapes.
# Since the color global variables are defined in the "Colors.conf" file, AND since this file is already sourced before this file, it's safe to call these global variables.
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_CHAR_HEADER_LINE' "$__BU_MAIN_TXT_CHAR_HEADER_LINE" 'Char' "This global variable stores the default character that composes each lines drawn by the ${__BU_MAIN_COLOR_TXT_FUNCTION}BU::Main::Headers::DrawLine${__BU_MAIN_COLOR_TXT_RESET} function" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
# Affichage de chevrons avant une chaîne de caractères (par exemple).
__BU_MAIN_TXT_PRINT_TAB=">>>>"
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_PRINT_TAB' "$__BU_MAIN_TXT_PRINT_TAB" 'String' "This global variable stores the string which better showcases a string" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## STORING TEXT
# Storing a string got from a specific line (with a function like "BU::Main::Files::GetLineFromTextFile()", from "main/Files.lib" source file).
__BU_MAIN_TXT_STORE_LINE=""
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_STORE_LINE' "$__BU_MAIN_TXT_STORE_LINE" 'String' "This global variable stores a string extracted from a line in a file" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# Getting the messages printed with the "$__BU_MAIN_STAT_ECHO='true'" status ?
__BU_MAIN_TXT_STORE_ECHO_TRUE_MESSAGES_ARRAY=();    # Note : since this variable is an array, please leave empty the second argument of the "BU::ModuleInit::DisplayInitGlobalVarsInfos()" function.
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_STORE_ECHO_TRUE_MESSAGES_ARRAY' "" 'Array' "This array stores each error message displayed when the ${__BU_MAIN_COLOR_TXT_VAR}\$__BU_MAIN_STAT_ECHO${__BU_MAIN_COLOR_TXT_RESET} global status variable's value is set to ${__BU_MAIN_COLOR_TXT_VAR}true${__BU_MAIN_COLOR_TXT_RESET}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## TEXT FORMATTING
# Wrapping the code in a function in order to prevent the execution of the command substitutions, in order to avoid bugs to be ignored while sourcing the configuration files in the main module's initializer file's "BU::Main::Initializer::SourceConfig()" function's loop.
function BU::Main::ModConfig::Text::WrapTextFormattingSubSection()
{
    # Blink
    __BU_MAIN_TXT_FMT_BLINK="$(BU::Main::Checkings::CheckTextFormat 'blink' '5';)"; || return 1;
    __BU_MAIN_TXT_FMT_BLINK_RESET="$(BU::Main::Checkings::CheckTextFormat 'sgr0' '25';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_BLINK";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_BLINK'        "$__BU_MAIN_TXT_FMT_BLINK"          'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "blink")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_BLINK_RESET";   BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_BLINK_RESET'  "$__BU_MAIN_TXT_FMT_BLINK_RESET"    'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "blink")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Bold
    __BU_MAIN_TXT_FMT_BOLD="$(BU::Main::Checkings::CheckTextFormat 'bold' '1';)"; || return 1;
    __BU_MAIN_TXT_FMT_BOLD_RESET="$(BU::Main::Checkings::CheckTextFormat '' '0';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_BOLD";          BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_BOLD'         "$__BU_MAIN_TXT_FMT_BOLD"           'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "bold")" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_BOLD_RESET";    BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_BOLD_RESET'   "$__BU_MAIN_TXT_FMT_BOLD_RESET"     'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "bold")"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Dim
    __BU_MAIN_TXT_FMT_DIM="$(BU::Main::Checkings::CheckTextFormat 'dim' '2';)"; || return 1;
    __BU_MAIN_TXT_FMT_DIM_RESET="$(BU::Main::Checkings::CheckTextFormat '' '22';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_DIM";           BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_DIM'              "$__BU_MAIN_TXT_FMT_DIM"        'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "dim")"  "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_DIM_RESET";     BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_DIM_RESET'        "$__BU_MAIN_TXT_FMT_DIM_RESET"  'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "dim")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Hidden (useful for password typing).
    __BU_MAIN_TXT_FMT_HIDDEN="$(BU::Main::Checkings::CheckTextFormat '' '8';)"; || return 1;
    __BU_MAIN_TXT_FMT_HIDDEN_RESET="$(BU::Main::Checkings::CheckTextFormat '' '28';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_HIDDEN";        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_HIDDEN'       "$__BU_MAIN_TXT_FMT_HIDDEN"         'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "hidden")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_HIDDEN_RESET";  BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_HIDDEN_RESET' "$__BU_MAIN_TXT_FMT_HIDDEN_RESET"   'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "hidden")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Italic
    __BU_MAIN_TXT_FMT_ITALIC="$(BU::Main::Checkings::CheckTextFormat 'sitm' '3';)"; || return 1;
    __BU_MAIN_TXT_FMT_ITALIC_RESET="$(BU::Main::Checkings::CheckTextFormat 'ritm' '23';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_ITALIC";        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_ITALIC'       "$__BU_MAIN_TXT_FMT_ITALIC"         'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "italic")"   "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_ITALIC_RESET";  BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_ITALIC_RESET' "$__BU_MAIN_TXT_FMT_ITALIC_RESET"   'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "italic")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Reset
    __BU_MAIN_TXT_FMT_RESET="$(BU::Main::Checkings::CheckTextFormat 'sgr0' '0';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_RESET"; BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_RESET' "$__BU_MAIN_TXT_FMT_RESET" 'CMD' "$(BU::Main::ModConfig::Text::PrintAllResetCmdSubs)" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Strikethrough
    __BU_MAIN_TXT_FMT_STRIKETHROUGH="$(BU::Main::Checkings::CheckTextFormat '' '9';)"; || return 1;
    __BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET="$(BU::Main::Checkings::CheckTextFormat '' '29';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_STRIKETHROUGH";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_STRIKETHROUGH'        "$__BU_MAIN_TXT_FMT_STRIKETHROUGH"          'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "strikethrough")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET";   BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET'  "$__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET"    'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "strikethrough")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    # Underline
    __BU_MAIN_TXT_FMT_UNDERLINE="$(BU::Main::Checkings::CheckTextFormat 'smul' '4';)"; || return 1;
    __BU_MAIN_TXT_FMT_UNDERLINE_RESET="$(BU::Main::Checkings::CheckTextFormat 'rmul' '24';)"; || return 1;
    printf "%s" "$__BU_MAIN_TXT_FMT_UNDERLINE";         BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_UNDERLINE'        "$__BU_MAIN_TXT_FMT_UNDERLINE"          'CMD' "$(BU::Main::ModConfig::Text::PrintFormatCmdSubs "Underline")"    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
    printf "%s" "$__BU_MAIN_TXT_FMT_UNDERLINE_RESET";   BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TXT_FMT_UNDERLINE_RESET'  "$__BU_MAIN_TXT_FMT_UNDERLINE_RESET"    'CMD' "$(BU::Main::ModConfig::Text::PrintResetCmdSubs "Underline")"     "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
}
BU::Main::ModConfig::Text::WrapTextFormattingSubSection || return 1;
# -----------------------------------------------
# /HOME/DIMOB/.BASH-UTILS/CONFIG/MODULES/MAIN/TIME.CONF
#!/usr/bin/env bash
# Disabling the SC2034 warning from Shellcheck (SC2034: <Variable name> appears unused. Verify use (or export if used externally)), because of the huge number of global variables declared in the configuration files, but only used in the library files.
# shellcheck disable=SC2034
# This configuration file stores date-related global variables.
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
######################################## DEFINING VARIABLES #######################################
#### DEFINING THE NEEDED RESOURCES
# Feel free to define any needed resources (functions, etc...) here.
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### DATE PROCESSING
## GETTING THE DATE
# Saving the current date in YYYYY-MM-DD hh-mm-ss format (YEAR-MONTH-DAY hour-minute-second)
__BU_MAIN_TIME_DATE="$(date +"%Y-%m-%d %H:%M:%S")";
BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TIME_DATE' "$__BU_MAIN_TIME_DATE" 'CMD' \
	"This command substitution executes the « date » command, and passes arguments in order to print the date at the « YYYY-MM-DD hh-mm-ss » format"  \
	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# -----------------------------------------------
## PRINTING THE DATE
# Displaying the current date YYYYY-MM-DD hh:mm:ss format (YEAR-MONTH-DAY hour-minute-second) with a colored text (for a better view in the log file).
# Unlike the "$__BU_MODULES_UNIT_DATE_LOG" global variable, this log entry displays colors.
# Declaring the variables which contains the color codes.
v_time_conf_date_display_color_1="78";
v_time_conf_date_display_color_2="111";
v_time_conf_date_display_color_3="78";
# __BU_MAIN_TIME_DATE_DISPLAY="$(printf "\e[38;5;%sm[ \e[38;5;%sm%s\e[38;5;%sm ]\e[38;5;0m" \
#     "$(tput setaf "$v_time_conf_date_display_color_1")" \
#     "$(tput setaf "$v_time_conf_date_display_color_2")" \
#     "$__BU_MAIN_TIME_DATE" \
#     "$(tput setaf "$v_time_conf_date_display_color_3")")";
# 
# BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_TIME_DATE_DISPLAY' "$__BU_MAIN_TIME_DATE_DISPLAY" 'CMD' \
# 	"This command substitution prints the output of the « __BU_MAIN_TIME_DATE » command substitution, with more decoration in order to display the date in an easily and colored readable log format : [ YYYY-MM-DD hh-mm-ss ]" \
# 	"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
# /HOME/DIMOB/.BASH-UTILS/MODULES/MAIN/INITIALIZER.SH
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Initializer.sh
# Module        : Main
# Description   : Module initializer file, initializing all the module's functions and variables you need for your scripts.
# Author(s)     : Dimitri Obeid
# Version       : 1.0
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# ---------------------
# NOTE ABOUT SHELLCHECK
# To display the content of a variable in a translated string, the use of the printf command is mandatory in order to interpret each "%s" pattern as the value of a variable.
# This means that the Shellcheck warning code SC2059 will be triggered anyway, since we have no choice but to store the entire translated string in a variable.
# If you add new messages to translate, you must call the directive "shellcheck disable=SC2059" before the line where you call the
# command "printf" to display the translated message, otherwise Shellcheck will display many warnings during the debugging procedure.
# ----------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it in the "Bash-utils-init.sh" file's function "BashUtils_InitModules()"
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
################################### INITIALIZING THE MAIN MODULE ##################################
#### STEP ONE : DEFINING THE NEEDED RESOURCES
## FUNCTIONS
# Sourcing each library file stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
function BU::Main::Initializer::SourceLibrary()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    #**** Code ****
	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;
	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY[@]}"; do
		source "$f" || { BU::ModuleInit::SourcingFailure "$f" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f"); v_loop_error='error'; break; }
		# shellcheck disable=SC2059
		BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_LIBRARY" "$f")";
	done
	if [ "${v_loop_error,,}" = 'error' ]; then return 1; fi
	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;
	return 0;
}
# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
function BU::Main::Initializer::SourceConfig()
{
    #**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    #**** Code ****
    if [ "${__BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS,,}" = 'true' ]; then
        # Deleting the index 1 of the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]" array,
        # which contains the path to the "Status.conf" configuration file, which was included just
        # before the processing of the status global variables vaues given as main module's arguments.
        unset '__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[1]';
        # Shifting each array's indexes which followed the deleted index.
        __BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY=( "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}" );
    fi
	# shellcheck disable=SC1090
	for f in "${__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY[@]}"; do
		source "$f" || { BU::ModuleInit::SourcingFailure "$f" "$(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")"; __BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY+=("$f"); v_loop_error='error'; break; };
		# shellcheck disable=SC2059
		BU::ModuleInit::Msg "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_ONE__SOURCE_CONFIG" "$f")";
	done;
	if [ "${v_loop_error,,}" = 'error' ]; then return 1; fi
	# Leaving a newline for a better text display in the log file and the terminal.
	BU::ModuleInit::Msg;
	return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### STEP TWO : MINIMAL INCLUSION OF FILES IN ORDER TO USE THEIR RESOURCES DURING THE TRANSLATION PART
## SOURCING LIBRARY FILES FIRST
# Note : Several functions from the main module are used
# Sourcing each needed library files stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
__BU_MAIN_INITIALIZER__TEXT_LIB_PATH="$(BU::ModuleInit::FindPath "$__BU_MAIN_MODULE_LIB_MOD_DIR_PATH" "Text.lib")";
# shellcheck disable=SC1090
source "$__BU_MAIN_INITIALIZER__TEXT_LIB_PATH" || { BU::ModuleInit::SourcingFailure "$__BU_MAIN_INITIALIZER__TEXT_LIB_PATH" "$__BU_MODULE_INIT_MODULE_NAME"; };
# -----------------------------------------------
## SOURCING CONFIGURATION FILES
# Sourcing each needed configuration files listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
# Remember that "Project.conf", the file whose path is stored in the "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" global variable,
# does not call any library functions from the main module, so it is totally safe to include this file.
# shellcheck disable=SC1090
source "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" || { BU::ModuleInit::SourcingFailure "$__BU_MAIN_MODULE_CONF_FILE_INIT_PATH" "$__BU_MODULE_INIT_MODULE_NAME"; }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### STEP THREE : PROCESSING THE MAIN MODULE'S PARAMETERS
# Usage function.
function BU::Main::Initializer::Usage()
{
    echo >&2; echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE__SUPPORTED_ARGS" >&2;
    sleep 2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______DECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE________ECHO" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______ERROR" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_________LOG" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_______LOG_R" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____OP_ROOT" >&2;
    echo >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_H" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_N" >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE______TIME_T" >&2;
    echo >&2;
    echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__USAGE_____TXT_FMT" >&2;
    echo >&2;
    echo >&2;
    echo "If you plan to debug the framework, the « __BU_MODULE_INIT_STAT_DEBUG_BASHX » status global variable can print the name of any function by file, category, sub-category or function" >&2;
    echo "With this global variable, you can print the name of the function before each instructions execution reported with the output of the « bash -x » command" >&2;
    echo >&2;
    return 0;
}
# Creating a function to print the correct values for the current option in different languages structures.
function BU::Main::Initializer::ProcessBadStatusOptionValues()
{
    BU::ModuleInit::Msg "$(printf "Warning : the supported values for the « %s » option are : %s" "$1" "$2")" >&2;
    BU::ModuleInit::Msg >&2;
}
# If arguments were given in the same double quotes as the "main" module's value.
if [ "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING" = "main --*" ]; then
	# Defining an array ($main_module_array) to store the module's arguments string as an array of words.
	read -ra main_module_array <<< "$__BU_MODULE_INIT_MODULE_AND_ARGS_STRING";
	# Unsetting the "main" value from the newly created array, in order to avoid an "unsupported argument" error.
	unset "main_module_array[0]";
	# Process each supported arguments in this "for" loop.
	for value in "${main_module_array[@]}"; do
        stat_value_warning="Warning : the supported values for this option are :" >&2;
        # shellcheck disable=SC2059
        printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN" "$value" >&2;
        echo -ne "${__BU_MAIN_COLOR_TXT_RESET}" >&2; echo >&2;
        echo "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__BAD_VALUE_GIVEN__ADVICE" >&2;
        # As the "Status.conf" file is sourced, the default global status variables values will be overwritten with the new values.
        if [[ "${value[i],,}" = "--stat-"* ]]; then
            # --stat option argument, with all the global status variables that can be modified : main --stat='debug=true decho=restrict'
            # Extracting the "--stat" option's values.
            case "${value[i],,}" in
                # "$__BU_MAIN_STAT_DECHO" global status variable.
                '--stat-decho='*)
                    if      [ "${value[i],,}" = '--stat-decho=authorize' ]      || [ "${value[i],,}" = '--stat-decho=forbid' ]  || [ "${value[i],,}" = '--stat-decho=restrict' ]; then
                            __BU_MAIN_STAT_DECHO="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_DECHO' "$__BU_MAIN_STAT_DECHO" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_DECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-decho" "« --stat-decho=authorize », « --stat-decho=forbid », « --stat-decho=restrict »";
                    fi;;
                # "$__BU_MAIN_STAT_ECHO" global status variable.
                '--stat-echo'*)
                    if      [ "${value[i],,}" = '--stat-echo=false' ]           || [ "${value[i],,}" = '--stat-echo=true' ]; then
                            __BU_MAIN_STAT_ECHO="${value#*=}";                  BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ECHO' "$__BU_MAIN_STAT_ECHO" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ECHO" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-echo" "« --stat-echo=false », « stat-echo=true »";
                    fi;;
                # "$__BU_MAIN_STAT_ERROR" global status variable.
                '--stat-error='*)
                    if      [ "${value[i],,}" = 'stat-error=fatal' ]; then
                            __BU_MAIN_STAT_ERROR="${value#*=}";                 BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ERROR' "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    elif    [ "${value[i],,}" = 'stat-error=void' ]; then
                            __BU_MAIN_STAT_ERROR='';                            BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_ERROR' "$__BU_MAIN_STAT_ERROR" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_ERROR" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-error" "« --stat-error=fatal », « stat-error=void »";
                    fi;;
                # "$__BU_MAIN_STAT_LOG" global status variable.
                '--stat-log='*)
                    if      [ "${value[i],,}" = '--stat-log=false' ]            || [ "${value[i],,}" = '--stat-log=true' ]; then
                            __BU_MAIN_STAT_LOG="${value#*=}";                   BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG' "$__BU_MAIN_STAT_LOG" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-log" "« --stat-log=false », « stat-log=true »";
                    fi;;
                # "$__BU_MAIN_STAT_LOG_REDIRECT" global status variable.
                'stat-log-r='*)
                    if      [ "${value[i],,}" = 'stat-log-r=log' ]              || [ "${value[i],,}" = '--stat-log-r=tee' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT="${value#*=}";          BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG_REDIRECT' "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_R" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    elif    [ "${value[i],,}" = '--stat-log-r=void' ]; then
                            __BU_MAIN_STAT_LOG_REDIRECT='';                     BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_LOG_REDIRECT' "$__BU_MAIN_STAT_LOG_REDIRECT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_LOG_Rs" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-log-r" "« --stat-log-r=log », « stat-log-r=tee », « --stat-log-r=void »";
                    fi;;
                # "$__BU_MAIN_STAT_OPERATE_ROOT" global status variable.
                '--stat-op-root='*)
                    if      [ "${value[i],,}" = '--stat-op-root=authorized' ]   || [ "${value[i],,}" = '--stat-op-root=forbidden' ] || [ "${value[i],,}" = '--stat-op-root=restricted' ]; then
                            __BU_MAIN_STAT_OPERATE_ROOT="${value#*=}";          BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_OPERATE_ROOT' "$__BU_MAIN_STAT_OPERATE_ROOT" 'string' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_OP_ROOT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-op-root" "« --stat-op-root=authorized », « stat-op-root=forbidden », « --stat-op-root=restricted »";
                    fi;;
                # "$__BU_MAIN_STAT_TIME_HEADER" global status variable.
                '--stat-time-header='*)
                    if      [ "${value[i],,}" = "--stat-time-header=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_HEADER="${value[i]#*=}";        BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_HEADER' "$__BU_MAIN_STAT_TIME_HEADER" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_H" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-time-header" "« $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;
                # "$__BU_MAIN_STAT_TIME_NEWLINE" global status variable.
                '--stat-time-newline='*)
                    if      [ "${value[i],,}" = "--stat-time-newline=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_NEWLINE="${value[i]#*=}";       BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_NEWLINE' "$__BU_MAIN_STAT_TIME_NEWLINE" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_N" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-time-newline" "« $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;
                # "$__BU_MAIN_STAT_TIME_TXT" global status variable.
                '--stat-time-txt='*)
                    if      [ "${value[i],,}" = "--stat-time-txt=$(BU::IsPositiveFloat "${value[i]#*=}")" ]; then
                            __BU_MAIN_STAT_TIME_TXT="${value[i]#*=}";           BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TIME_TXT' "$__BU_MAIN_STAT_TIME_TXT" 'float' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TIME_T" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-time-txt" "« $(BU::Decho_FMT_I "a floating number" "$__BU_MAIN_COLOR_TXT_HIGHLIGHT") »";
                    fi;;
                # "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                '--stat-txt-fmt='*)
                    if      [ "${value[i],,}" = '--stat-txt-fmt=false' ]        || [ "${value[i],,}" = '--stat-txt-fmt=true' ]; then
                            __BU_MAIN_STAT_TXT_FMT="${value#*=}";               BU::ModuleInit::DisplayInitGlobalVarsInfos '__BU_MAIN_STAT_TXT_FMT' "$__BU_MAIN_STAT_TXT_FMT" 'bool' "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_THREE__STAT_GLOB_VAR_DESC_TXT_FMT" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                            __BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY+="$value";
                    else
                            BU::Main::Initializer::ProcessBadStatusOptionValues "--stat-txt-fmt" "« --stat-txt-fmt=false », « --stat-txt-fmt=true »";
                    fi;;
                # Any unsupported global status variable.
                *)
                            echo "IN « ${BASH_SOURCE[0]} », LINE « $(( LINENO-1 )) » --> WARNING : THE « $value » IS NOT A SUPPORTED STATUS ARGUMENT FOR THE $(BU::ModuleInit::GetModuleName "${BASH_SOURCE[0]}")" >&2;
                            echo >&2;
                            BU::Main::Initializer::Usage; v_loop_error='error'; break;
            esac
            if [ -z "$__BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS" ]; then __BU_MAIN_INITIALIZER__STATUS_MODIFIED_BY_MAIN_MODULE_ARGS='true'; fi
        # Else, if an unsupported value is passed as « main » module's argument.
        else
            # Temporary situation.
            BU::Main::Initializer::Usage; v_loop_error='error'; break;
        fi
    done; if [ "${v_loop_error,,}" = 'error' ]; then if BU::IsInScript; then exit 1; else unset v_loop_error; return 1; fi; fi
fi
# Checking if a new default status global variable's value was modified (passed as one of the « main » module's « --stat-* » arguments).
for value in "${__BU_MAIN_MODULE_MODIFIED_STATUS_VARS_ARRAY[@]}"; do
    if [ "${value,,}" != '--stat-decho=authorize' ] && [ "${value,,}" != '--stat-decho-forbid' ] && [ "${value,,}" != '--stat-decho-restrict' ]; then
        BU::Main::Status::ChangeSTAT_DECHO        "authorize" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
    if [ "${value,,}" != '--stat-echo=false' ]      && [ "${value,,}" != '--stat-echo=true' ]; then
        BU::Main::Status::ChangeSTAT_ECHO         "false"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
    # Don't forget to set the "$__BU_MAIN_STAT_LOG_REDIRECT" value BEFORE calling a function which checks the value of the "$__BU_MAIN_STAT_LOG" value, since this function calls a function which creates the logs file.
    if [ "${value,,}" != '--stat-log-r=log' ]       && [ "${value,,}" != '--stat-log-r=tee' ]   && [ "${value,,}" != '--stat-log-r=void' ]; then
        BU::Main::Status::ChangeSTAT_LOG_REDIRECT "tee"       "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
    if [ "${value,,}" != '--stat-log=false' ]       && [ "${value,,}" != '--stat-true' ]; then
        # The function "CheckSTAT_LOG()" creates the log file and its path if the "$__BU_MAIN_STAT_LOG" variable's value is equal to "true".
        BU::Main::Status::ChangeSTAT_LOG          "true"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    fi
done
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### STEP FOUR : INCLUSION OF THE REST OF THE LIBRARY AND CONFIGURATION FILES
# Sourcing each library file stored into the function/main directory, from the "$__BU_MAIN_MODULE_FUNCTIONS_FILES_PATH_ARRAY" array.
BU::Main::Initializer::SourceLibrary || { if BU::IsInScript; then exit 1; else return 1; fi };
# -----------------------------------------------
## SOURCING CONFIGURATION FILES
# Sourcing each file listed into the "$__BU_MAIN_MODULE_LIST_CONFIG_FILES_PATH_ARRAY" array.
BU::Main::Initializer::SourceConfig || { if BU::IsInScript; then exit 1; else return 1; fi };
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### STEP FIVE : PROCESSING PROJECT'S RESOURCES
## CALLING NECESSARY FUNCTIONS
# Translating the main module's library messages
BU::ModuleInit::ParseCSVLang "$__BU_MODULE_INIT__USER_LANG" "$__BU_MODULE_INIT__CSV_TRANSLATION_FILE__DELIM" || { if BU::IsInScript; then exit 1; else return 1; fi };
# Since the "CheckProjectLogFile()" function manages the text displaying if the log file doesn't exists, it's okay to call this function now.
BU::Main::Directories::MkTmpDir;
# -----------------------------------------------
## PROCESSING SOME DIRECTORIES AND FILES
# Creating the text and background color code file if the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true".
if BU::Main::Status::CheckStatAllowFormatting; then
    # Creating the text color code file
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME" "f"; then
        # shellcheck disable=SC2059
        BU::Main::Errors::HandleErrors '1' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__ERROR" "$(BU::DechoPath "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")" "" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO"; return 1;
    else
        # shellcheck disable=SC2059
        BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_TXT_COL_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT")")"; BU::Newline;
    fi
    # Creating the background color code file
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME" 'f'; then
        # shellcheck disable=SC2059
        BU::Main::Errors::HandleSmallErrors 'E' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__ERROR" "$(BU::Decho "$__BU_MAIN_PROJECT_COLOR_TEXT_BG_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")" 'E' 'CPLS'; return 1;
    else
        # shellcheck disable=SC2059
        BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_BG_COL_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT")")"; BU::Newline;
    fi
fi
# Creating the project's log file if the "$__BU_MAIN_STAT_LOG" global status variable's value is set to "true".
if BU::Main::Status::CheckStatIsLogging; then
	if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" "f"; then
        # shellcheck disable=SC2059
		BU::Main::Errors::HandleErrors '1' "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FIVE__CREATE_LOG_FILE__ERROR" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PATH")" "$(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")")" "" "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "" "$LINENO";
		return 1;
	else
        # shellcheck disable=SC2059
		BU::EchoSuccess "$(printf "$__BU_MODULE_INIT_MSG__INIT_MAIN_MODULE__STEP_FOUR__CREATE_LOG_FILE__SUCCESS" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_NAME")" "$(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PARENT")")"s; BU::Newline;
	fi
fi
# -----------------------------------------------
## END OF THE "MAIN" MODULE INITIALIZATION PROCESS
__BU_MAIN_STAT_ECHO='true'
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/ARGS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Args.lib
# Module        : Main
# Description   : These functions act as argument checkers for several functions in the library, whose checking would make the code more difficult to read.
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154,SC2116
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### ARGUMENT VALUES CHECKING : UTILITES FUNCTIONS
#### DEBUG ID : args::argument-values-checking--utilities-functions
# shellcheck disable=SC2034
__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS="";
## PATH CHECKING FUNCTIONS
## DEBUG ID : path-checking-functions
# shellcheck disable=SC2034
__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__PATH_CHECKING_FUNCTIONS="$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS::path-checking-functions";
# -----------------------------------------------
## QUICK MESSAGE PRINTING
## DEBUG ID : quick-message-printing
# shellcheck disable=SC2034
__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__QUICK_MESSAGE_PRINTING="$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS::quick-message-printing";
# Print a message without the need to write the whole "BU::Main::Errors::HandleErrors()" function's second argument, and according to the test option which failed :
function BU::Main::Args::PrintBadOption()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__QUICK_MESSAGE_PRINTING";
    #**** Parameters ****
    local p_option=$1;      # String    - Default : NULL    - Test option.
    local p_advice=$2;      # String    - Default : NULL    - "BU::Main::Errors::HandleErrors()"'s advice argument.
    local p_argname=$3;     # String    - Default : NULL    - Name of the parameter that stores the argument.
    local p_value=$4;       # Any       - Default : NULL    - "BU::Main::Errors::HandleErrors()"'s value argument.
    local p_filename=$5;	# String    - Default : NULL    - Name of the file where the error occured.
    local p_funcname=$6;    # String    - Default : NULL    - Name of the function where the test failed.
    local p_lineno=$7;      # Int       - Default : NULL    - Line where the test failed.
    #**** Variables ****
	# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value to "true" in case this function is called during a .
	if [ "${__BU_MAIN_STAT_ECHO,,}" = "false" ]; then
		local v_STAT_ECHO_was_false="true";
		BU::Main::Status::ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || {
            local C="$?";
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
            return "$C";
		}
	fi
	# Since this function can be called from the "Lang.lib" file, and eventually in other library files, it's better to include a support for an appropriated file name.
	if [ -n "$p_filename" ]; then
        local v_filename="$p_filename";
	else
        local v_filename; v_filename="$(BU::Main::Args::GetFileName)";
	fi
	if [ -n "$p_funcname" ]; then
        local v_funcname; v_funcname="$p_funcname";
	else
        local v_funcname; v_funcname="$(BU::Main::Args::GetFunctionName)";
	fi
	if [ -n "$p_lineno" ]; then
        local v_lineno; v_lineno="$p_lineno";
	else
        local v_lineno; v_lineno="$(BU::Main::Args::GetLineNumber)";
	fi
    #**** Code ****
	# Verifying that all the mandatory arguments are given.
	BU::Main::Args::Argc "$#" '6' "$v_filename" "$v_funcname" "$v_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
	# If no value is passed as argument.
    if [[ "$p_option" = [Z-z] ]]; then
		BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER HAS NO VALUE" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
    # Else, if the value passed as argument is not an alphabetic character.
    elif [ "${p_option,,}" = '!alphachar' ]; then
        BU::Main::Errors::HandleErrors '1' \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHABETIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an alphabetic string.
    elif [ "${p_option,,}" = '!alphastr' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHABETIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an alphabetic string OR character.
    elif [ "${p_option,,}" = '!alphastrchar' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHABETIC STRING OR CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an alphanumeric character.
    elif [ "${p_option,,}" = '!alphanumchar' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an alphanumeric string.
    elif [ "${p_option,,}" = '!alphanumstr' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC STRING" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an alphanumeric string OR character.
    elif [ "${p_option,,}" = '!alphanumstrchar' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN ALPHANUMERIC STRING OR CHARACTER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
    # Else, if the value passed as argument is not a string, which is precisely the name of a command or any other executable file.
    elif [ "${p_option^^}" = '!CMDSTR' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A COMMAND OR EXECUTABLE FILE NAME" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a valid directory path (only directories accepted).
    elif [ "${p_option,,}" = '!d' ]; then
        BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A VALID DIRECTORY PATH" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_DIR";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a valid directory or file path (both are accepted).
    elif [ "${p_option,,}" = '!df' ]; then
        BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A VALID DIRECTORY OR FILE PATH" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a valid file path (only files accepted).
    elif [ "${p_option,,}" = '!f' ]; then
        BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A VALID FILE PATH" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a floating number.
    elif [ "${p_option,,}" = '!float' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
    # Else, if the value passed as argument is not a negative floating number.
    elif [ "${p_option,,}" = '!floatneg' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A NEGATIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return 1;
	# Else, if the value passed as argument is not a positive floating number.
    elif [ "${p_option,,}" = '!floatpos' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A POSITIVE FLOAT" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not an integer.
    elif [ "${p_option,,}" = '!int' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT AN INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a negative integer.
    elif [ "${p_option,,}" = '!intneg' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A NEGATIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$__BU_MAIN_EXIT_CURRENT_CODE";
	# Else, if the value passed as argument is not a positive integer.
    elif [ "${p_option,,}" = '!intpos' ]; then
        BU::Main::Errors::HandleErrors "1" \
            "THE $(BU::__Decho "$v_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')$p_argname" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A POSITIVE INTEGER" \
            "$p_advice" "$p_value" "$v_filename" "$v_funcname" "$v_lineno";
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
		return "$__BU_MAIN_EXIT_CURRENT_CODE";
    fi
	if [ "$v_STAT_ECHO_was_false" = "true" ]; then
		BU::Main::Status::ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
	fi
    BU::SetLastReturnValue 0;
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    return "$__BU_MAIN_EXIT_CURRENT_CODE";
}
# -----------------------------------------------
## ARGUMENT PRESENCE CHECKING
## DEBUG ID = argument-presence-checking
# shellcheck disable=SC2034
__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING="$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS::argument-presence-checking";
# Checking the values stored in the argument array of a function.
function BU::Main::Args::GetFuncArgsArrayValues()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_funcname=$1; shift 1;   # String    - Default : NULL    - Name of the function where the array was set.
    local pa_argsArray=("$@");      # Array     - Default : NULL    - Array of values to check and display.
    #**** Variables ****
    local v_index=0;    # Int   - Default : 0   - Initial value of the "for" loop's iterations counter.
    # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    local v_loop_error;
    #**** Code ****
    BU::Main::Status::CheckStatIsBackupEchoing || {
        local v_echo="$__BU_MAIN_STAT_ECHO";
        BU::Main::Status::ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
    }
    BU::ModuleInit::CheckIsDebugging && {
        BU::EchoNewstep "Values stored in the $v_funcname function's array of arguments :";
        for i in "${pa_argsArray[@]}"; do
            BU::EchoMsg "Value [$v_index] : $i" || { local C="$?"; v_loop_error='error'; break; }
            # Line break every five lines, in order to keep the values list readable for a human.
            local v_value_line=$(( v_index + 1 ));
            if [ $(( v_value_line % 5 )) -eq 0 ]; then
                BU::Newline || { local C="$?"; v_loop_error='error'; break; };
            fi
            v_index=$(( v_index+1 ));
        done; if [ "${v_loop_error,,}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    }
    if [ -n "$v_echo" ] && [ "${v_echo,,}" = 'false' ]; then
        BU::Main::Status::ChangeSTAT_ECHO "$v_echo" "$(basename "${BASH_SOURCE[0]}")" "$(( LINENO-1 ))" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    return 0;
}
# Checking a file's name passed as argument.
function BU::Main::Args::GetFileName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_filename=$1;    # String    - Default : NULL    - Name of the file to process.
    #**** Code ****
    # Checking if the file's name was specified, in order to print it.
    if [ -z "$p_filename" ]; then printf "« no file identified »"; else printf "« %s »" "$p_filename"; fi;
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking a function's name passed argument.
function BU::Main::Args::GetFunctionName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_funcname=$1;    # String    - Default : NULL    - Name of the function to process.
    #**** Code ****
    # Checking if the function's name was specified, in order to print it.
    if [ -z "$p_funcname" ]; then printf "« no function identified »"; else printf "« %s »" "$p_filename"; fi;
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking a file's name passed as argument.
function BU::Main::Args::GetLineNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_lineno=$1;  # Int   - Default : NULL    - Line number to process.
    #**** Code ****
    # Checking if the file's name was specified, in order to print it.
    if [ -z "$p_lineno" ]; then printf "« no line identified »"; else printf "« %s »" "$p_lineno"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the three informations simultaneously.
function BU::Main::Args::GetFFL()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_filename=$1;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$2;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$3;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
    if [ -n "$p_filename" ] && [ -n "$p_funcname" ] && [ -n "$p_lineno" ] && BU::IsPositiveInt "$p_lineno"; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        #**** Variables ****
        local v_missing_filename="« NULL (as GetFFL arg 1) »";
        local v_missing_funcname="« NULL (as GetFFL arg 2) »";
        local v_missing_lineno="« NULL (as GetFFL arg 3) | »";$
        if [ -z "$p_filename" ]; then
            if [ -n "$p_funcname" ] && [ -n "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "$(BU::Main::Args::PrintFFL "$v_missing_filename" "$v_missing_funcname" "$p_lineno") : " \
                    "Please give a  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_filename' "$v_missing_filename" "$p_funcname" "$p_lineno (as GetFFL arg3) | $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -n "$p_funcname" ] && [ -z "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "$(BU::Main::Args::PrintFFL "$v_missing_filename" "$p_funcname" "$v_missing_lineno") : " \
                    "Please give a  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_filename' "$v_missing_filename" "$p_funcname" "$v_missing_lineno $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -z "$p_funcname" ] && [ -n "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "$(BU::Main::Args::PrintFFL "$v_missing_filename" "$v_funcname" "$p_lineno") : " \
                    "Please give a  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_filename' "$v_missing_filename" "$v_missing_funcname" "$p_lineno (as GetFFL arg3) | $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -z "$p_funcname" ] && [ -z "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "$(BU::Main::Args::PrintFFL "$v_missing_filename" "$v_missing_funcname" "$v_missing_lineno") : " \
                    "Please give a  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_filename' "$v_missing_filename" "$v_missing_funcname" "$v_missing_lineno $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        else
            if [ -n "$p_funcname" ] && [ -z "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "" \
                    "  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_funcname' "$p_filename" "$p_funcname" "$v_missing_lineno $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -z "$p_funcname" ] && [ -n "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    " " \
                    "  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_funcname' "$p_filename" "$v_missing_funcname" "$p_lineno (as GetFFL arg3) | $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -z "$p_funcname" ] && [ -z "$p_lineno" ]; then
                BU::Main::Errors::HandleErrors '1' \
                    "" \
                    "  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_lineno' "$p_filename" "$v_missing_funcname" "$v_missing_lineno $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            elif [ -n "$p_lineno" ] && ! BU::IsPositiveInt "$p_lineno"; then
                BU::Main::Errors::HandleErrors '1' \
                    "" \
                    "  [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    'p_lineno' "$p_filename" "$p_funcname" "$p_lineno (as GetFFL arg3) | $(( LINENO-1 )) (actual file line)";
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        fi
    fi
}
# Printing the file, function and line.
# This function is called in the "BU::Main::Args::Argc()" and "BU::Main::Echo::__EchoOutput()" functions, for example.
function BU::Main::Args::PrintFFL()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_filename=$1;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$2;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$3;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Variables ****
    local v_filename; v_filename="$(BU::Main::Args::GetFileName "$p_filename")";
    local v_funcname; v_funcname="$(BU::Main::Args::GetFunctionName "$p_funcname")";
    local v_lineno; v_lineno="$(BU::Main::Args::GetLineNumber "$p_lineno")";
    #**** Code ****
    echo -n "$v_filename file, function $v_funcname, line $v_lineno";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Printing the file, function and line.
# Please call this function after the advice given as second argument for the "BU::Main::Args::PrintBadOption()" function.
function BU::Main::Args::PrintFFLErrorOccured()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_target_f=$1;    # String    - Default : NULL    - Function where the checking happened.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Variables ****
    local v_filename; v_filename="$(BU::Main::Args::GetFileName "$p_filename")";
    local v_funcname; v_funcname="$(BU::Main::Args::GetFunctionName "$p_funcname")";
    local v_lineno; v_lineno="$(BU::Main::Args::GetLineNumber "$p_lineno")";
    #**** Code ****
    echo -n "The error occured in the $v_filename file, at function $v_funcname, on line $v_lineno, during the checking of the $(BU::__Decho "$p_target_f" "$__BU_MAIN_COLOR_HIGHLIGHT") function";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking if any mandatory arguments are provided for any function.
# This function is called in the "BU::Main::Args::PrintBadOption()" function, DO NOT call the "BU::Main::Args::PrintBadOption()" function here.
function BU::Main::Args::Argc()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    local p_argcount=$1;    # Int       - Default : NULL    - Number of arguments passed.
    local p_argawait=$2;    # Int       - Default : NULL    - Number of arguments awaited.
    local p_filename=$3;    # Path      - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Variables ****
    local v_funcname; v_funcname="$(BU::__Decho "$(BU::Main::Args::GetFunctionName "$p_funcname")" "$__BU_MAIN_COLOR_HIGHLIGHT" "$__BU_MAIN_COLOR_ERROR")";
    #**** Code ****
    # If both "$p_argcount" and "$p_argawait" arguments contain a value.
    if [ -n "$p_argcount" ] && [ -n "$p_argawait" ]; then
        # If both "$p_argcount" and "$p_argawait" argument values are integer.
        if BU::IsPositiveInt "$p_argcount" && BU::IsPositiveInt "$p_argawait"; then
            # If the correct number of arguments is given to the processed function.
            if [ "$p_argcount" -eq "$p_argawait" ] || [ "$p_argawait" -eq 0 ]; then
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
            # Else, if an incorrect number of arguments is given to the processed function.
            else
                # If the function awaits only one argument AND no argument is given to the function.
                if [ "$p_argawait" -eq 1 ] && [ "$p_argcount" -lt "$p_argawait" ]; then
                    BU::Main::Errors::HandleErrors "1" "THE FUNCTION $v_funcname NEEDS AN ARGUMENT" \
                        "Please pass only one argument to the $v_funcname function [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                        "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                # Else, if the function awaits more than one argument AND less arguments are passed to the function.
                elif [ "$p_argawait" -ge 1 ] && [ "$p_argcount" -eq 0 ]; then
                    BU::Main::Errors::HandleErrors "1" "THE FUNCTION $v_funcname NEEDS $(BU::__Decho "$p_argawait" "$__BU_MAIN_COLOR_HIGHLIGHT") ARGUMENTS" \
                        "Please pass $(BU::__Decho "$p_argawait" "$__BU_MAIN_COLOR_HIGHLIGHT") arguments to the $v_funcname function [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                        "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                # Else, if the function awaits more than one argument AND not enough arguments are passed to the function.
                elif [ "$p_argcount" -gt 0 ] && [ "$p_argcount" -lt "$p_argawait" ]; then
                    BU::Main::Errors::HandleErrors "1" "THE FUNCTION $v_funcname HAS NOT ENOUGH ARGUMENTS" \
                        "Please pass $(BU::__Decho "$(( p_argawait-p_argcount ))" "$__BU_MAIN_COLOR_HIGHLIGHT") more arguments to the $v_funcname function [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                        "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                # Else, if more arguments than expected are given to the function.
                elif [ "$p_argcount" -gt "$p_argawait" ]; then
                    BU::Main::Errors::HandleErrors "1" "THE FUNCTION $v_funcname HAS TOO MUCH ARGUMENTS" \
                        "Please remove $(BU::__Decho "$(( p_argcount-p_argawait ))" "$__BU_MAIN_COLOR_HIGHLIGHT") arguments to the $v_funcname function [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                        "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                fi
            fi
        # Else, if "$p_argcount" AND / OR "$p_argawait" argument values are not integer.
        else
            if ! BU::IsPositiveInt "$p_argcount"; then local lineno="$LINENO";
                BU::Main::Errors::HandleErrors '1' \
                    "THE $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S ARGUMENT COUNTER $(BU::__Decho "$(echo -n '$')p_argcount" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A POSITIVE INTEGER" \
                    "The function $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION") first argument $(BU::__Decho 'p_argcount' "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")'s value needs to be an integer, since it is an argument counter [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
            if ! BU::IsPositiveInt "$p_argawait"; then local lineno="$LINENO";
                BU::Main::Args::PrintBadOption '1' \
                    "THE $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S AWAITED ARGUMENTS COUNTER $(BU::__Decho "$(echo -n '$')p_argawait" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER'S VALUE IS NOT A POSITIVE INTEGER" \
                    "The function $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION") second argument $(BU::__Decho 'p_argawait' "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")'s value needs to be an integer, since it is an argument limit [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                    "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        fi
    # Else, if "$p_argcount" AND / OR "$p_argawait" argument values are empty.
    else
        if [ -z "$p_argcount" ]; then local lineno="$LINENO";
            BU::Main::Errors::HandleErrors '1' \
                "THE $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')p_argcount" "$__BU_MAIN_COLOR_CODE_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER HAS NO VALUE" \
                "The function $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") first argument $(BU::__Decho 'p_argcount' "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")'s value needs to be an integer, since it is an argument counter [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
        fi
        if [ -z "$p_argawait" ]; then local lineno="$LINENO";
            BU::Main::Errors::HandleErrors '1' \
                "THE $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") FUNCTION'S $(BU::__Decho "$(echo -n '$')p_argawait" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") PARAMETER HAS NO VALUE" \
                "The function $(BU::__Decho "$p_funcname" "$__BU_MAIN_COLOR_FUNCTION" "$__BU_MAIN_COLOR_ERROR") second argument $(BU::__Decho 'p_argawait' "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")'s value needs to be an integer, since it is an argument limit [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                "$p_argcount" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
        fi
    fi
}
# Checking if any mandatory arguments are provided for any function AND the file, function and line number
# informations simultaneously, by calling both the "BU::Main::Args::Argc" and "BU::Main::Args::GetFFL()" functions.
function BU::Main::Args::GetArgc-FFL()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ARGS_LIB__CAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS" \
        "$__BU_MAIN_ARGS_LIB__SUBCAT_DEBUG_ID__ARGUMENT_VALUES_CHECKINGS__ARGUMENT_PRESENCE_CHECKING";
    #**** Parameters ****
    #   $1  -> BU::Main::Args::Argc "$p_argcount" parameter.
    #   $2  -> BU::Main::Args::Argc "$p_argawait" parameter.
    #   $3  -> BU::Main::Args::Argc && BU::Main::Args::GetFFL "$p_filename" parameter.
    #   $4  -> BU::Main::Args::Argc && BU::Main::Args::GetFFL "$p_funcname" parameter.
    #   $5  -> BU::Main::Args::Argc && BU::Main::Args::GetFFL "$p_lineno" parameter.
    BU::Main::Args::Argc "$1" "$2" "$3" "$4" "$5"   || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Args::GetFFL "$3" "$4" "$5"           || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### "Checkings.lib" FILE'S FUNCTIONS
## CATEGORY : FILES PATHS CHECKING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Checkings::CheckProjectRelatedFile()" function.
function BU::Main::Args__Checkings::CheckProjectRelatedFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
	#**** Parameters ****
    local p_parent=$1;      # String    - Default : NULL    - Name of the folder to process (into its parent directory).
    local p_child=$2;       # String    - Default : NULL    - Name of the file or folder to process (into its parent directory).
    local p_type=$3;        # Char      - Default : NULL    - Type of data to create (d = directory, f = file).
    local p_filename=$4;    # Path      - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
	#**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_parent" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "The function $(BU::Main::Text::CutSubStringBeforeNthDelim "$(BU::DechoHighlightFunction "$p_funcname")") needs a function passed as first argument to work properly (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_parent' "$p_parent" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_child" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "The function $(BU::Main::Text::CutSubStringBeforeNthDelim "$(BU::DechoHighlightFunction "$p_funcname")") needs a function passed as second argument to work properly (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_child' "$p_child" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	if [ -z "$p_type" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "The function $(BU::Main::Text::CutSubStringBeforeNthDelim "$(BU::DechoHighlightFunction "$p_funcname")") needs a function passed as third argument to work properly (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_type' "$p_type" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	if [ "$p_type" != 'd' ] && [ "$p_type" != 'f' ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption '!df' \
            "You need to precise if what you want to create is a directory or a file (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_type' "$p_type" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### "CMDS.lib" FILE'S FUNCTIONS
## CATEGORY : GET COMMAND OUTPUTS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::CMDS::GetCommandPath()" function.
function BU::Main::Args__CMDS::GetCommandPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_cmd=$1;         # String    - Default : NULL    - Command's name.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_cmd" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "You must specify the name of the command whose path you want to know (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_cmd' "$p_cmd" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MAIN MODULE'S "Decho.lib" FILE'S FUNCTIONS
## CATEGORY : TEXT WRITING AND DECORATION (FORMATTING)
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Decho()" function.
function BU::Main::Args__Decho::Decho()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
	#**** Parameters ****
    local p_string=$1;          # String	- Default : NULL	- String to display.
    local p_newTextColor=$2;    # Int       - Default : NULL	- Color to apply on each string's characters.
    local p_newBGColor=$3;      # Int       - Default : NULL	- Color to apply in the text's background.
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
	#**** Code ****
	# If the text's color code is not an integer.
	if ! BU::IsPositiveInt "$p_newTextColor"; then local lineno="$LINENO";
		# Changing the
		if [ "${__BU_MAIN_STAT_DECHO,,}" != 'forbid' ]; then
			local __bu_main_stat_decho_backup="$__BU_MAIN_STAT_DECHO";
			BU::Main::Status::ChangeSTAT_DECHO "forbid" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
		fi
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as text color code, as second argument for the ${__BU_MAIN_COLOR_FUNCTION}$p_funcname$__BU_MAIN_COLOR_ERROR function (optional argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_newTextColor' "$p_newTextColor" "$p_filename" "$p_funcname" "$lineno";
        local C="$?";
		if [ -n "$__bu_main_stat_decho_backup" ]; then BU::Main::Status::ChangeSTAT_DECHO "$__bu_main_stat_decho_backup" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local D="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$D"; }; fi
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # If the background's color code is not an integer.
    if ! BU::IsPositiveInt "$p_newBGColor"; then local lineno="$LINENO";
		if [ "${__BU_MAIN_STAT_DECHO,,}" != 'forbid' ]; then
			local __bu_main_stat_decho_backup="$__BU_MAIN_STAT_DECHO";
			BU::Main::Status::ChangeSTAT_DECHO "forbid" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
		fi
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as background color code, as second argument for the ${__BU_MAIN_COLOR_FUNCTION}$p_funcname$__BU_MAIN_COLOR_ERROR function (optional argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_newBGColor' "$p_newBGColor" "$p_filename" "$p_funcname" "$p_lineno";
        local C="$1";
		if [ -n "$__bu_main_stat_decho_backup" ]; then BU::Main::Status::ChangeSTAT_DECHO "$__bu_main_stat_decho_backup" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local D="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$D"; }; fi
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### "Directories.lib" FILE'S FUNCTION
## CATEGORY : MAIN MODULE'S "Directories.lib" FILE'S FUNCTIONS - PROCESSING FUNCTIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::ProcessingDir()" function.
function BU::Main::Args__Directories::ProcessingDir()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_function=$1;    # String    - Default : NULL    - Name of the function to process.
    local p_parent=$2;      # String    - Default : NULL    - Path of the target directory's parent.
    local p_name=$3;        # String    - Default : NULL    - name of the target directory.
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_function" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass a function's name as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_function' "$p_function" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
		return 1;
    fi
    if [ -z "$p_parent" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass a valid parent directory path as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_parent' "$p_parent" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_name" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the name of the folder to process as third argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_name' "$p_name" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : MAIN MODULE'S "Directories.lib" FILE'S FUNCTIONS - FOLDER CREATION FUNCTIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Directories::OverwriteDir()" function.
function BU::Main::Args__Directories::OverwriteDir()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the directory to overwrite.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    # If the target folder path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the directory to overwrite as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the given folder path is incorrect.
    if [ ! -d "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption '!d' \
            "Please pass the correct path of the directory to overwrite as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Directories::Make()" function.
function BU::Main::Args__Directories::Make()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_parent=$1;      # String    - Default : NULL    - Parent folder's path.
    local p_name=$2;        # String    - Default : NULL    - Name of the folder to create.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    # If the parent folder's path is missing (no path is given).
    if [ -z  "$p_parent" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the new directory's parent folder as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_parent' "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the parent folder's path is incorrect.
    if [ ! -d "$p_parent" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption '!d' \
            "Please pass a valid parent directory path as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_parent' "$p_parent" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the folder's name is missing (no name is given).
    if [ -z "$p_name" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "Please pass the name of the directory to create as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_name' "$p_name" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Directories::MakePath()" function.
function BU::Main::Args__Directories::MakePath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Full path of the directory to create.
    local p_overwrite=$2;   # String    - Default : NULL    - Authorization to overwrite the directory.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    # If the new folder's full path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass the full path of the directory to create as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	if [ -n "$p_overwrite" ] && [ "$p_overwrite" != "--rmdir" ]; then local lineno="$LINENO";
		BU::Main::Args::PrintBadOption '' \
			"Please pass the valid string $(BU::DechoHighlightVar "--rmdir") that allows overwriting the $(BU::DechoHighlightFunction "$p_path") directory (optional argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_overwrite' "$p_overwrite" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
	fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : MAIN MODULE'S "Directories.lib" FILE'S FUNCTIONS - PATH PROCESSING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Directories::GetDirectoryName()" function.
function BU::Main::Args__Directories::GetDirectoryName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the directory to process.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "The $(BU::Main::Text::CutSubStringBeforeNthDelim "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")") function takes a path as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Directories::GetDirectoryPath()" function.
function BU::Main::Args__Directories::GetDirectoryPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the directory to process.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "The $(BU::Main::Text::CutSubStringBeforeNthDelim "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")") function takes a path as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Directories::GetParentDirectoryName()" function.
function BU::Main::Args__Directories::GetParentDirectoryName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the directory to process.
    local p_iterations=$2;  # Int       - Default : NULL    - Number of iterations.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    # If the target folder path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the directory to overwrite as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Directories::GetParentDirectoryPath()" function.
function BU::Main::Args__Directories::GetParentDirectoryPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the directory to process.
    local p_iterations=$2;  # Int       - Default : 1       - Number of iterations.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    # If the target folder path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the directory to overwrite as argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_iterations" ] ! BU::IsPositiveInt "$p_iterations"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as number of iterations (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")"
            'p_iterations' "$p_iterations" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MAIN MODULE'S "Errors.lib" FILE'S FUNCTIONS
## CATEGORY : EXIT AND RETURN CODES HANDLING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Errors::SetLastReturnValue()" function.
BU::Main::Args__Errors::SetLastReturnValue()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
	#**** Parameters ****
	local p_code=$1;	# Int	- Default : 1	- Return value
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
	#**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
	# If no return value is passed to as 1st argument.
	if [ -z "$p_code" ]; then local lineno="$LINENO";
		BU::Main::Args::PrintBadOption 'z' \
			"Please pass a valid integer value, from $(BU::DechoHighlight '0') to $(BU::DechoHighlight '255'), as function return code (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_code' "$p_code" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
	fi
	# If the return value is not an integer.
	if [ -n "$p_code" ] && ! BU::IsPositiveInt "$p_code"; then local lineno="$LINENO";
		BU::Main::Args::PrintBadOption '!intpos' \
			"Please pass a valid integer value, from $(BU::DechoHighlight '0') to $(BU::DechoHighlight '255'), as function return code (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
			'p_code' "$p_code" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MAIN MODULE'S "Files.lib" FILE'S FUNCTIONS
## CATEGORY : TEXT FILE PROCESSING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Files::ProcessingFile()" function.
function BU::Main::Args__Files::ProcessingFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_function=$1;    # Function to process.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_function" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "Please pass a valid file processing function as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_function' "$p_function" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Files::OverwriteFile()" function.
function BU::Main::Args__Files::OverwriteFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #***** Parameters ****
    local p_path=$1             # String    - Default : NULL    - Path of the file to overwrite.
    local p_authorization=$2;   # String    - Default : NULL    - Authorization to overwrite the file.
    local p_filename=$3;        # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;        # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;          # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    # If the target file's path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the directory to overwrite as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the given file path is incorrect.
    if [ ! -d "$p_path" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption '!d' \
            "Please pass the correct path of the directory to overwrite as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if no authorization to overwrite the current file is given.
	if [ -z "$p_authorization" ]; then local lineno="$LINENO";
		 BU::Main::Args::PrintBadOption 'z' \
            "Please enter a valid value for the overwrite authorization as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_authorization' "$p_authorization" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Files::Make()" function's arguments.
function BU::Main::Args__Files::Make()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_parent=$1;      # String    - Parent folder path of the file to create.
    local p_name=$2;        # String    - Name of the file to create.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    # If the parent folder's path is missing (no path is given).
    if [ -z "$p_parent" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the path of the new file's parent folder as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_parent' "$p_parent" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the parent folder's path is incorrect.
    if [ ! -d "$p_parent" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption '!d' \
            "Please pass a valid parent directory path as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_parent' "$p_parent" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # Else, if the file's name is missing (no name is given).
    if [ -z "$p_name" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass the name of the file to create as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_name' "$p_name" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
#     # Else, if the file's name is too long (usually with a string size greater than 255 bytes).
    if [ "$(echo "$p_name" | wc --bytes)" -gt "$__BU_MAIN_FS_MAX_FILE_SIZE" ]; then local lineno="$LINENO";
        BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_FILENAME_TOO_LONG" \
            "THE FILE NAME IS TOO LONG FOR THIS FILESYSTEM" \
            "Please give a name length smaller than $(BU::DechoHighlight "$__BU_MAIN_FS_MAX_FILENAME_LENGTH") bytes [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_name' "$p_name" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Files::MakePath()" function.
function BU::Main::Args__Files::MakePath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Full path of the file to create.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    # If the new file's full path is missing (no path is given).
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass the full path of the directory to create as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : SETTING FILE INFORMATIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Files::SetLastAccess()" function.
function BU::Main::Args__Files::SetLastAccess()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_filepath=$1;    # String    - Path of the file to check its last access.
    local p_fakedate=$2;    # Date      - Access date to replace.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_filepath" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass as first argument the path of the file whose last access date you wish to change (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_filepath' "$p_filepath" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ ! -f "$p_filepath" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!f' \
            "Please pass a valid file path as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_filepath' "$p_filepath" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_fakedate" ]; then local lineno="$LINENO";
         BU::Main::Args::PrintBadOption 'z' \
            "Please pass a date in $(BU::DechoHighlight "[[CC]YY]MMDDhhmm[.ss]") format as second argument (like 20220221212020.22 | 2022 02 21 21h 20m 20s and 22 ms) (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_fakedate' "$p_fakedate" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : ARCHIVES PROCESSING FUNCTIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Files::Compress()" function.
function BU::Main::Args__Files::Compress()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_cmd=$1          # String    - Default : NULL    - Compression command.
    local p_name=$2         # String    - Default : NULL    - Archive's name.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_cmd" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass a compression command name as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_cmd' "$p_cmd" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
	# If the command line compression tool is not found.
    if ! command -v "$p_cmd"; then
        if  [ "${p_cmd^^}" = 'TGZ' ] \
        || [[ "${p_cmd,,}" = tar?(.)gz ]] \
        || [[ "${p_cmd,,}" = tar?(.)bz?(2) ]] \
        || [[ "${p_cmd^^}" = TBZ?(2) ]] \
        || [ "${p_cmd^^}" = 'TXZ' ] \
        || [[ "${p_cmd,,}" = tar?(.)xz ]]; then local lineno="$LINENO";
            BU::Main::Args::PrintBadOption '!CMDSTR' \
                "Please pass an existing / installed compression command name as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                'p_cmd' "$p_cmd" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
        fi
    fi
    # If no name of the archive to create is given.
    if [ -z "$p_name" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass as fourth argument the path of the archive to uncompress (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	return 0;
}
# "BU::Main::Files::Uncompress()" function.
function BU::Main::Args__Files::Uncompress()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_cmd=$1          # String    - Default : NULL    - Compression command.
    local p_name=$2         # String    - Default : NULL    - Path to the archive to uncompress.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_cmd" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass a(n) (un)compression command name as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_cmd' "$p_cmd" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
	# If the command line compression tool is not found.
    if ! command -v "$p_cmd"; then
        if  [ "${p_cmd^^}" = 'TGZ' ] \
        || [[ "${p_cmd,,}" = tar?(.)gz ]] \
        || [[ "${p_cmd,,}" = tar?(.)bz?(2) ]] \
        || [[ "${p_cmd^^}" = TBZ?(2) ]] \
        || [ "${p_cmd^^}" = 'TXZ' ] \
        || [[ "${p_cmd,,}" = tar?(.)xz ]]; then local lineno="$LINENO";
            BU::Main::Args::PrintBadOption '!CMDSTR' \
                "Please pass an existing / installed (un)compression command name as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
                'p_cmd' "$p_cmd" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
        fi
    fi
    # If no path to the archive to uncompress is given.
    if [ -z "$p_name" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass as fourth argument the path of the archive to uncompress (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_name' "$p_name" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MAIN MODULE'S "Filesystem.lib" FILE'S FUNCTIONS
## CATEGORY : GETTING FILE SYSTEM'S INFORMATIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Filesystem::IsPartitionFull()" function.
function BU::Main::Args__Filesystem::IsPartitionFull()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_fileFS=$1;      # String    - Default : NULL    - Path of the file or folder's file system host.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
    BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_fileFS" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass a path to get the file or folder's host file system (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_fileFS' "$p_fileFS" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_fileFS" ] && [ ! -d "$p_fileFS" ] || [ ! -f "$p_fileFS" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!df' \
            "Please pass a valid path to get the file or folder's host file system (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_fileFS' "$p_fileFS" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : GETTING FILE SYSTEM'S INFORMATIONS
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Filesystem::GetFS<...>()" functions.
function BU::Main::Args__Filesystem::GetFSInfos()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_path=$1;        # String    - Default : NULL    - Path of the file or folder's file system host.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
    BU::Main::Args::GetArgc-FFL "$#" '4' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass a path to get the file or folder's host file system (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_path" ] && [ ! -d "$p_path" ] || [ ! -f "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!df' \
            "Please pass a valid path to get the file or folder's host file system (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_fileFS' "$p_fileFS" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : NON-RECURSIVE PERMISSION AND OWNERSHIP PROCESSING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Filesystem::Chown()" function.
function BU::Main::Args__Filesystem::Chown()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_currentOwner=$1;    # String    - Default : NULL    - Former owner of the directory or the file (this parameter is used in the translated / log messages, stored into their own variables).
    local p_newOwner=$2;        # String    - Default : NULL    - New owner of the directory or the file.
    local p_path=$3;            # String    - Default : NULL    - Path of the directory or the file to process.
    local p_filename=$4;        # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;        # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;          # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
    BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_currentOwner" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the name of the former directory's or file's owner (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_currentOwner' "$p_currentOwner" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_newOwner" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the name of the new directory's or file's owner (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_newOwner' "$p_newOwner" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the path to the directory or the file to process (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_path" ] && [ ! -d "$p_path" ] || [ ! -f "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!df' \
            "Please give a valid path for the directory or the file to process (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : RECURSIVE PERMISSION AND OWNERSHIP PROCESSING
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Filesystem::ChownRec()" function.
function BU::Main::Args__Filesystem::ChownRec()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_currentOwner=$1;    # String    - Default : NULL    - Former owner of the directory (this parameter is used in the translated / log messages, stored into their own variables).
    local p_newOwner=$2;        # String    - Default : NULL    - New owner of the directory.
    local p_path=$3;            # String    - Default : NULL    - Path of the directory to process.
    local p_filename=$4;        # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;        # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;          # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
    BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_currentOwner" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the name of the former directory's owner (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_currentOwner' "$p_currentOwner" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_newOwner" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the name of the new directory's owner (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_newOwner' "$p_newOwner" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give the path to the directory to process (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_path" ] && [ ! -d "$p_path" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!d' \
            "Please give a valid path for the directory to process (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "$p_path" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### MAIN MODULE'S "Text.lib" FILE'S FUNCTIONS
## MULTI-CATEGORY FUNCTIONS :
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# Functions :
#	- BU::Main::Text::CutFirstFieldBeforeDelim()
#	- BU::Main::Text::CutLastFieldAfterDelim()
#	- BU::Main::Text::GetFirstFieldBeforeDelim()
#	- BU::Main::Text::GetLastFieldAfterDelim()
function BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1;      # String    - Default : NULL    - String to process.
    local p_delimiter=$2;   # Char      - Default : NULL    - Delimiter.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_delimiter" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a character as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_delimiter' "$p_delimiter" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CATEGORY : CUTTING TEXT
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Text::CutSubStringAfterNthDelim()" function.
function BU::Main::Args__Text::CutSubStringAfterNthDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1;      # String    - Default : NULL    - String to process.
    local p_delimiter=$2;   # Char      - Default : NULL    - Delimiter.
    local p_iterations=$3;  # Int       - Default : 1       - Iterations.
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_delimiter" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a character as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_delimiter' "$p_delimiter" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_iterations" ] && ! BU::IsPositiveInt "$p_iterations"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as third argument (optional argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_iterations' "$p_iterations" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Text::CutSubStringBeforeNthDelim()" function.
function BU::Main::Args__Text::CutSubStringBeforeNthDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1;      # String    - Default : NULL    - String to process.
    local p_delimiter=$2;   # String	- Default : NULL    - Delimiter.
    local p_iterations=$3;  # Int       - Default : 1       - Iterations.
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_delimiter" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a character as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_delimiter' "$p_delimiter" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_iterations" ] && ! BU::IsPositiveInt "$p_iterations"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as third argument (optional) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_iterations' "$p_iterations" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Text::DeleteLettersInString()" function
function BU::Main::Args__Text::DeleteLettersInString()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1;      # String    - Default : NULL    - String to process.
    local p_filename=$2;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$3;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$4;      # Int       - Default : NULL    - Line where this argument processing function is called.
    shift;
    local p_char=("$@");    # String    - Default : NULL    - Letters and strings to remove.
    #**** Code ****
}
# -----------------------------------------------
## CATEGORY : GETTING TEXT
## DEBUG ID : Dependant on the debug ID from the original function's file sub-category.
# "BU::Main::Text::GetCharacterOccurences()" function.
function BU::Main::Args__Text::GetCharacterOccurences()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1       # String    - Default : NULL  - String to process.
    local p_target=$2       # Char      - Default : NULL  - Targeted character.
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_target" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give any single character to process as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_target' "$p_target" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -n "$p_target" ] && [ "${#p_target}" -gt 1 ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!alphanumchar' \
            "Please give only a single character to process as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_target' "$p_target" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Args__Text::GetSubStringAfterDelim()" function.
function BU::Main::Args__Text::GetSubStringAfterDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1;              # String    - Default : NULL    - String to process.
    local p_delim=$2;               # String	- Default : NULL    - Delimiter
    local p_iterations=${3:-1};     # Int       - Default : 1       - Iterations
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
	if [ -z "$p_delim" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give any single character as delimiter to process as second argument [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")"
            'p_delim' "$p_delim" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
    if [ -n "$p_iterations" ] && ! BU::IsPositiveInt "$p_iterations"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as third argument (optional) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_iterations' "$p_iterations" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Text::GetSubStringBeforeDelim()" function.
function BU::Main::Args__Text::GetSubStringBeforeDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1       # String    - Default : NULL	- String to process.
    local p_delim=$2        # String    - Default : NULL	- Delimiter
	local p_iterations=$3;	# Int		- Default : 1		- Iterations
    local p_filename=$4;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$5;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$6;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '6' "$p_filename" "$p_funcname" "$p_lineno";
	if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
	if [ -z "$p_delim" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give any single character as delimiter to process as second argument [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")"
            'p_delim' "$p_delim" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
    if [ -n "$p_iterations" ] && ! BU::IsPositiveInt "$p_iterations"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption '!intpos' \
            "Please pass a positive integer as third argument (optional) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_iterations' "$p_iterations" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# "BU::Main::Text::GetSubStringOccurences()" function.
function BU::Main::Args__Text::GetSubStringOccurences()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "" "";
    #**** Parameters ****
    local p_string=$1       # String    - Default : NULL  - String to process.
    local p_target=$2       # String    - Default : NULL  - Targeted sub-string
    local p_filename=$3;    # String    - Default : NULL    - Path of the file in which the currently processed function is located.
    local p_funcname=$4;    # String    - Default : NULL    - Name of the currently processed function.
    local p_lineno=$5;      # Int       - Default : NULL    - Line where this argument processing function is called.
    #**** Code ****
	BU::Main::Args::GetArgc-FFL "$#" '5' "$p_filename" "$p_funcname" "$p_lineno";
    if [ -z "$p_string" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give a string to process as first argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_string' "$p_string" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    if [ -z "$p_target" ]; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please give any sub-string to process as second argument (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_target' "$p_target" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/BASICMATHS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : BasicMaths.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### CONVERSIONS
#### DEBUG ID : basicmaths::conversions
__BU_MAIN_BASICMATHS_LIB__CAT_DEBUG_ID__CONVERSIONS="basicmaths::conversions";
## NUMERIC CONVERSIONS
## DEBUG ID : numeric-conversions
__BU_MAIN_BASICMATHS_LIB__SUBCAT_DEBUG_ID__CONVERSIONS__NUMERIC_CONVERSIONS="$__BU_MAIN_BASICMATHS_LIB__CAT_DEBUG_ID__CONVERSIONS::numeric-conversions";
# Converts a byte count to a human readable format in IEC binary notation (base-1024 (eg : GiB)), rounded to two decimal places for anything larger than a byte. Switchable to padded format and base-1000 (eg : MB) if desired.
# Initial source of this AWK script (since it's not mine and I added more informations as comments) :
# https://unix.stackexchange.com/questions/44040/a-standard-tool-to-convert-a-byte-count-into-human-kib-mib-etc-like-du-ls1/98790#98790
function BU::Main::BasicMaths::BytesToHuman()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_BASICMATHS_LIB__CAT_DEBUG_ID__CONVERSIONS" \
        "$__BU_MAIN_BASICMATHS_LIB__SUBCAT_DEBUG_ID__CONVERSIONS__NUMERIC_CONVERSIONS";
    #**** Parameters ****
    local L_BYTES="${1:-0}"     # Int       - Default : 0       - Raw size in bytes.
    local L_PAD="${2:-no}"      # String    - Default : "no"    - Allow result display padding.
    local L_BASE="${3:-1024}"   # Int       - Default : 1024    - Base (1000 (metric) or 1024 (binary notation))
    #**** Code ****
    # Creating a command substitution to calculate the byte count according to the values passed as arguments, with an AWK script.
    local BYTESTOHUMAN_RESULT; BYTESTOHUMAN_RESULT=$(awk -v bytes="${L_BYTES}" -v pad="${L_PAD}" -v base="${L_BASE}" 'function human(x, pad, base) {
        # If the desired base format is not the binary prefix, then the base format used will be the metric one.
         if(base!=1024)base=1000
        # Ternary condition : if the base format uses the binary prefix, then the "iB" ([prefix]bibyte) unit is displayed after the value. Else the "[prefix]byte" unit is displayed after the value.
         basesuf=(base==1024)?"iB":"B"
        # Setting the prefixes list (K = kilo, M = mega, G = giga, T = tera, P = peta, E = exa, Z = zeta, Y = yotta), and corrected the inversion of the Exa with Peta, and Zeta with Yotta, which was present on the original script from Stack Overflow.
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
    BU::EchoMsg "$BYTESTOHUMAN_RESULT" '-n' 'nodate';
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    return 0;
}
# Negative number (float or int) to positive number (float or int).
function BU::Main::BasicMaths::NegativeToPositive()
{
    #**** Parameters ****
    local x=$1;         # Number    - Default : NULL    - Value to convert.
    #**** Code ****
    echo "$(( x = x < 0 ? x * -1 : x ))";
    return 0;
}
# Positive number (float or int) to negative number (float or int).
function BU::Main::BasicMaths::PositiveToNegative()
{
    #**** Parameters ****
    local x=$1;         # Number    - Default : NULL    - Value to convert.
    #**** Code ****
    echo "$(( x = x > 0 ? x * -1 : x ))";
    return 0;
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/CASE.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Case.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### LIBRARY RESOURCES
## VARIABLES
# __BU_MAIN_CASE_INVALID_ANSWER="Please enter a valid answer ($(BU::DechoHighlight 'yes') or ($(BU::DechoHighlight 'no')) !";
# 
# __BU_MAIN_CASE_ASK_CONTINUE_EXEC="Do you want to continue the script's execution ? (yes / no)";
# 
# __BU_MAIN_CASE_ANSWER_PROMPT="Enter your answer : ";
# 
# __BU_MAIN_CASE_RESUME_EXEC="Resuming the execution of the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") script.";
# 
# __BU_MAIN_CASE_CANCEL_EXEC="Aborting the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'s execution.";
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### READING CASE STATEMENTS BY FUNCTIONS
#### DEBUG ID : case::reading-case-statements-by-functions
__BU_MAIN_CASE_LIB__CAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS="case::reading-case-statements-by-functions";
## "Directories.lib" FILE
## DEBUG ID : directories.lib-file
__BU_MAIN_CASE_LIB__SUBCAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS__DIRECTORIES_LIB_FILE="$__BU_MAIN_CASE_LIB__CAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS::directories.lib-file";
# "BU::Main::Directories::TriggerRootDirWarning" function.
function BU::Main::Case::Read_Directories::TriggerRootDirWarning()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CASE_LIB__CAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS" \
        "$__BU_MAIN_CASE_LIB__SUBCAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS__DIRECTORIES_LIB_FILE";
    #**** Variables ****
    local __read_TriggerRootDirWarning;
    #**** Code ****
    BU::EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC";
	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_TriggerRootDirWarning;
	BU::EchoRead "$__read_TriggerRootDirWarning";
	BU::Newline;
	# shellcheck disable=SC2154
	case "${__read_TriggerRootDirWarning,,}" in
		"yes")
            BU::EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC";
			BU::SetLastReturnValue 0;
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
			return 0;
			;;
		"no")
            BU::EchoError "$__BU_MAIN_CASE_CANCEL_EXEC";
			BU::SetLastReturnValue "$__BU_MAIN_EXIT_PERMISSION_DENIED";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
			return "$__BU_MAIN_EXIT_PERMISSION_DENIED";
			;;
		*)
			BU::EchoError "$__BU_MAIN_CASE_INVALID_ANSWER";
			BU::Main::Case::Read_Directories::TriggerRootDirWarning;
			;;
	esac
}
# -----------------------------------------------
## "Errors.lib" FILE
## DEBUG ID : errors.lib-file
__BU_MAIN_CASE_LIB__SUBCAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS__ERRORS_LIB_FILE="$__BU_MAIN_CASE_LIB__CAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS::errors.lib-file";
# "BU::Main::Errors::HandleErrors" function, with the "$__BU_MAIN_STAT_ECHO" variable set to "false".
function BU::Main::Case::Read_Errors::HandleErrors()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CASE_LIB__CAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS" \
        "$__BU_MAIN_CASE_LIB__SUBCAT_DEBUG_ID__READING_CASE_STATEMENTS_BY_FUNCTIONS__ERRORS_LIB_FILE";
    #**** Variables ****
    local __read_HandleErrors;
    #**** Code ****
	BU::EchoNewstep "$__BU_MAIN_CASE_ASK_CONTINUE_EXEC";
	read -rp "$__BU_MAIN_CASE_ANSWER_PROMPT" __read_HandleErrors;
	BU::EchoRead "$__read_HandleErrors";
    BU::Newline;
	# shellcheck disable=SC2154
	case "${__read_BU::Main::Errors::HandleErrors,,}" in
		"yes")
			BU::EchoNewstep "$__BU_MAIN_CASE_RESUME_EXEC";
			BU::SetLastReturnValue 0;
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
			return 0;
			;;
		"no")
			BU::EchoError "$__BU_MAIN_CASE_CANCEL_EXEC";
			BU::SetLastReturnValue "$__BU_MAIN_EXIT_PERMISSION_DENIED";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
			BU::Exit "$__BU_MAIN_EXIT_PERMISSION_DENIED";
			;;
		*)
			BU::EchoError "$__BU_MAIN_CASE_INVALID_ANSWER";
			BU::Main::Case::Read_Errors::HandleErrors;
			;;
	esac
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/CHECKINGS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Checkings.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### OPERATING SYSTEM CHECKINGS
#### DEBUG ID : checkings::operating-system-checkings
__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__OPERATING_SYSTEM_CHECKINGS="checkings::operating-system-checkings";
## OS TYPE CHECKINGS
## DEBUG ID : os-type-checkings
# shellcheck disable=SC2034
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__OPERATING_SYSTEM_CHECKINGS__OS_TYPE_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__OPERATING_SYSTEM_CHECKINGS::os-type-checkings";
# Checking if current OS is Android, running with the Termux terminal emulator.
function BU::IsOSAndroidTermux()    { if [[ "$OSTYPE" == 'linux-android' ]];    then return 0; else return 1; fi }
# Checking if current OS is FreeBSD.
function BU::IsOSFreeBSD()          { if [[ "$OSTYPE" == 'FreeBSD' ]];          then return 0; else return 1; fi }
# Checking if current OS is Haiku OS.
function BU::IsOSHaiku()            { if [[ "$OSTYPE" == 'haiku' ]];            then return 0; else return 1; fi }
# Checking if current OS is OpenBSD.
function BU::IsOSOpenBSD()          { if [[ "$OSTYPE" == 'openbsd'* ]];         then return 0; else return 1; fi }
# Checking if current OS is Linux (or Android without the Termux terminal emulator).
function BU::IsOSLinux()            { if [[ "$OSTYPE" == 'linux'* ]];           then return 0; else return 1; fi }
# Checking if current OS is a Linux distribution running on Windows Subsystem for Linux.
function BU::IsOSLinuxWSL()         { if [[ "$(< /proc/sys/kernel/osrelease)" == *[M-m]icrosoft* ]]; then return 0; else return 1; fi }
# Checking if current OS is NetBSD.
function BU::IsOSNetBSD()           { if [[ "$OSTYPE" == 'netbsd' ]];           then return 0; else return 1; fi }
# Checking if current OS is OSx.
function BU::IsOSx()                { if [[ "$OSTYPE" == 'darwin'* ]];          then return 0; else return 1; fi }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### VARIABLES VALUES CHECKINGS
#### DEBUG ID : checkings::variable-values-checkings
__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS="checkings::variable-values-checkings";
## ARRAYS CHECKINGS
## DEBUG ID : array-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__ARRAY_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS::array-checkings";
# Checking if the variable is an array.
function BU::IsArray()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__ARRAY_CHECKINGS";
    if [[ -n ${1} ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking if an array in empty.
function BU::IsArrayEmpty()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__ARRAY_CHECKINGS";
    #**** Parameters ****
    local arr=("$@")
    #**** Code ****
    if [ ${#arr[@]} -eq 0 ]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking if an array is not empty.
function BU::IsArrayNotEmpty()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__ARRAY_CHECKINGS";
    #**** Parameters ****
    local arr=("$@")
    #**** Code ****
    if [ ${#arr[@]} -gt 0 ]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# -----------------------------------------------
## DATE FORMAT
## DEBUG ID : date-format
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__DATE_FORMAT="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS::date-format";
# Checking if a given hour is formatted in timestamp format, with separators, and in these formats :
#   - hh:mm:ss
function BU::IsDateHMS() { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__DATE_FORMAT"; [[ "$(date "+%H:%M:%S" > /dev/null)" ]] || return 1; return 0; }
# Checking if a given date is formatted in timestamp format, with separators, and in these formats :
#   - YYYY-MM-DD
#   - DD-MM-YYYY
#   - YYYY/MM/DD
#   - DD/MM/YYYY
#   - YYYYMMDD
#   - DDMMYYYY
function BU::IsDateYMD() { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__DATE_FORMAT"; [[ $(date "+%d-%m-%Y" -d "$1" > /dev/null) ]] || return 1; return 0; }
# Checking if a given date is formatted in timestamp format, with separators, and in these formats.
#   - YYYY-MM-DD hh:mm:ss
#   - DD-MM-YYYY hh:mm:ss
#   - YYYY/MM/DD hh:mm:ss
#   - DD/MM/YYYY hh:mm:ss
#   - YYYYMMDD hh:mm:ss
#   - DDMMYYYY hh:mm:ss
function BU::IsDateYMD_HMS()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__DATE_FORMAT";
    #**** Variables ****
    local v_date; v_date="$(echo "$1" | rev | cut -d ' ' -f2- | rev)"; # Getting the year, the month and the day.
    local v_hour; v_hour="$(echo "$1" | rev | cut -d ' ' -f 1 | rev)"; # Getting the hour.
    #**** Code ****
    [[ $(BU::IsDateYMD "$v_date" > /dev/null) ]] || \
    {
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")() --> Warning : the date is not formatted in a correct timestamp";
        BU::EchoWarning "Please use one of these formats :";
        BU::EchoWarning "YYYY-MM-DD";
        BU::EchoWarning "DD-MM-YYYY";
        BU::EchoWarning "YYYY/MM/DD";
        BU::EchoWarning "DD/MM/YYYY";
        BU::Newline;
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    };
    date "+%H:%M:%S" -d "$v_hour" || \
    {
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}")() --> Warning : the hour is not formatted in a correct timestamp";
        BU::EchoWarning "Please use only this format : hh:mm:ss";
        BU::Newline;
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## NUMBER VALUES
## DEBUG ID : number-values
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS::number-values";
# Checking floating value.
function BU::IsFloat()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
    if [[ "$1" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking negative only floating value.
function BU::IsNegativeFloat()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
    if BU::IsFloat "$1" && (( 1 < 0 )); then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking positive only floating value.
function BU::IsPositiveFloat()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
    if BU::IsFloat "$1" && (( 1 >= 0 )); then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking integer value.
function BU::IsInt()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
    if [[ "$1" =~ ^[\-0-9]+$ ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking negative only integer value.
function BU::IsNegativeInt()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
	if BU::IsInt "$1" && (( 1 < 0 )); then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# Checking positive only integer value.
function BU::IsPositiveInt()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__NUMBER_VALUES";
	if BU::IsInt "$1" && (( 1 >= 0 )); then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# -----------------------------------------------
## CHARACTERS AND STRING VALUES
## DEBUG ID : characters-and-string-values
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS::characters-and-string-values";
# Checking if the value is an alphabetic character (not any number allowed).
function BU::IsAlphaChar()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
	if [[ "$1" = [a-zA-Z] ]]; then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# Checking if the value is an alphabetic string (not any number allowed)
function BU::IsAlphaString()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
    if [[ "$1" = [^a-zA-Z\ ] ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking if the value is an alphabetic string only (not less than two characters AND not any number allowed).
function BU::IsAlphaStringOnly()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
	if [ "${#1}" -lt 2 ]; then
    	echo "Not a string"; return 1;
	else
		if [[ "$1" = [^a-zA-Z\ ] ]]; then
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		else
    		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
		fi
	fi
}
# Checking if the value is a character.
function BU::IsAlphaNumChar()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
	if [[ "$1" = [a-zA-Z0-9] ]]; then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# Checking if the value is an alphanumeric string.
function BU::IsAlphaNumString()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
    if [[ "$1" =~ [^a-zA-Z0-9\ ] ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking if the value is an alphabetic string only (not less than two characters).
function BU::IsAlphaNumStringOnly()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__CHARACTERS_AND_STRING_VALUES";
	if [ "${#1}" -lt 2 ]; then
    	echo "Not a string"; return 1;
	else
		if [[ "$1" = [^a-zA-Z0-9\ ] ]]; then
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		else
    		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
		fi
	fi
}
# -----------------------------------------------
## OTHER VARIABLES CHECKINGS
## DEBUG ID : other-variables-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__OTHER_VARIABLES_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS::other-variables-checkings";
# Checking if the variable is an array.
function BU::IsArray()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS" "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_CHECKINGS__OTHER_VARIABLES_CHECKINGS";
    if [[ -n ${1} ]]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### DIFFERENT CHECKINGS
#### DEBUG ID : checkings::different-checkings
__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__DIFFERENT_CHECKINGS="checkings::different-checkings";
## CHECKING FOR IDENTIFIANTS
## DEBUG ID : checking-fort-identifiants
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__DIFFERENT_CHECKINGS__CHECKING_FOR_IDENTIFIANTS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__DIFFERENT_CHECKINGS::checking-fort-identifiants";
# Checking if the current effective UID (EUID) is not equal to 0 (root user's EUID).
# Required functions and files :
#   - BU::Main::Errors::HandleErrors      --> From this file.
function BU::Main::Checkings::CheckRootEUID()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__DIFFERENT_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__DIFFERENT_CHECKINGS__CHECKING_FOR_IDENTIFIANTS";
    if [ "$EUID" -ne 0 ]; then
        BU::Main::Errors::HandleErrors "1" "YOU NEED ROOT USER'S PRIVILEGES TO PERFORM THIS ACTION !" "Please launch your script with super-user privileges." \
            "EUID = 0" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# -----------------------------------------------
## BASIC HARDWARE CHECKINGS
## DEBUG ID : basic-hardware-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__DIFFERENT_CHECKINGS__BASIC_HARDWARE_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__DIFFERENT_CHECKINGS::basic-hardware-checkings";
# Check if hard drive is full.
function BU::Main::Checkings::CheckDiskUsedSpace()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__DIFFERENT_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__DIFFERENT_CHECKINGS__BASIC_HARDWARE_CHECKINGS";
	#**** Parameters ****
    local p_fileFS=$1;          # String    - Default : NULL    - Target file's file system.
    local p_authorization=$2;   # String    - Default : NULL    - Authorization to call the "BU::Main::Errors::HandleErrors()" function (since this function is called in the "BU::Main::Decho::SetBG/TextColor()" functions, and that "BU::__/Decho()" functions are called in the "BU::Main::Errors::HandleErrors()" function). Set this value to "false" to forbid this call.
	#**** Code ****
	# The function "BU::Main::Checkings::CheckProjectLogStatus()" function is called in each "Echo<...>()" functions if the "$__BU_MAIN_STAT_ECHO" status global
	# variable's value is set to 'false', and the current function is called at the beginning of the "BU::Main::Checkings::CheckProjectLogStatus()" function.
	# Changing the "$__BU_MAIN_STAT_ECHO" global status variable's value to 'true', in order to avoid an infinite
	# loop during the call of any function from the "Filesystem.lib" file, which call an "Echo<...>()" function.
	if [ "${__BU_MAIN_STAT_ECHO,,}" = 'false' ]; then
        local v_echoBackup="$__BU_MAIN_STAT_ECHO";
        # There is no need to call the associated function "BU::Main::Status::ChangeSTAT_ECHO", since no text have to be redirected to the log file afterwards, because the script has to definitely exit if the disk is full.
        __BU_MAIN_STAT_ECHO="true";
    fi
    BU::Main::Filesystem::IsPartitionFull "$p_fileFS"; local IsPartitionFullReturnCode="$?";
    if [ "$IsPartitionFullReturnCode" = "$__BU_MAIN_EXIT_INVALID_ARGUMENT" ]; then local lineno="$LINENO";
        # As mentioned in the previous comment, it is mandatory that the script's execution ends.
        BU::Main::Status::ChangeSTAT_ERROR 'fatal' "${FUNCNAME[0]}" "$LINENO";
        if [ "${p_authorization,,}" = 'true' ]; then
            BU::Main::Errors::HandleErrors "$IsPartitionFullReturnCode" "NO DIRECTORY OR FILE PASSED AS FIRST ARGUMENT !!!" \
                "Please give a filepath in order to check if the target file system is full or not [/|\] Since the file system's disk space is unknown, the script has to be exited, in order to avoid potential bugs"
                "Unknown file system size because of a missing path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
            BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        else
            echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : NO DIRECTORY OR FILE PASSED AS FIRST ARGUMENT !!!" >&2;
            echo "Please give a path in order to check if the target file system is full or not" >&2;
            echo >&2;
            echo "Since the file system's disk space is unknown, the script has to be exited, in order to avoid potential bugs" >&2;
            echo >&2;
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        fi
    elif [ "$IsPartitionFullReturnCode" == "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND" ]; then local lineno="$LINENO";
        # As mentioned in the previous comment, it is mandatory that the script's execution ends.
        BU::Main::Status::ChangeSTAT_ERROR 'fatal' "${FUNCNAME[0]}" "$LINENO";
        if [ "${p_authorization,,}" = 'true' ]; then
            BU::Main::Errors::HandleErrors "$IsPartitionFullReturnCode" "INVALID DIRECTORY OR FILE PASSED AS FIRST ARGUMENT !!!" \
                "Please give a valid path in order to check if the target file system is full or not [/|\] Since the file system's disk space is unknown, the script has to be exited, in order to avoid potential bugs" \
                "Unknown file system size because of a missing file path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
            BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        else
            echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : INVALID DIRECTORY OR FILE PASSED AS FIRST ARGUMENT !!!" >&2;
            echo "Please give a valid path in order to check if the target file system is full or not" >&2;
            echo >&2;
            echo "Since the file system's disk space is unknown, the script has to be exited, in order to avoid potential bugs" >&2;
            echo >&2;
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        fi
    elif [ "$IsPartitionFullReturnCode" == "$__BU_MAIN_EXIT_NO_SPACE_LEFT" ]; then local lineno="$LINENO";
        # As mentioned in the previous comment, it is mandatory that the script's execution ends.
        BU::Main::Status::ChangeSTAT_ERROR 'fatal' "${FUNCNAME[0]}" "$LINENO";
        if [ "${p_authorization,,}" = 'true' ]; then
            BU::Main::Errors::HandleErrors "$IsPartitionFullReturnCode" \
                "NO SPACE LEFT ON THE TARGET FILE SYSTEM !!!" \
				"Please empty this file system (mounted on the « $(BU::Main::Filesystem::GetFSMountPoint "$p_fileFS") » partition) before using it, or use another partition to write data in a file [/|\] Since the file system's disk space is full, the script has to be exited in order to avoid potential bugs" \
                "No space left on the target device's partition" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        elif [ "${p_authorization,,}" = 'false' ] || [ -z "$p_authorization" ]; then
            echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : NO SPACE LEFT ON THE TARGET FILE SYSTEM !!!" >&2;
            echo "Please empty this file system (mounted on the « $(BU::Main::Filesystem::GetFSMountPoint "$p_fileFS") » partition) before using it, or use another partition to write data in a file" >&2;
            echo >&2;
            echo "Since the file system's disk space is full, the script has to be exited" >&2;
            echo >&2;
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; BU::IsInScript && exit "$IsPartitionFullReturnCode"; return "$IsPartitionFullReturnCode";
        fi
    fi
    # Resetting the former "$__BU_MAIN_STAT_ECHO" global status variable's value.
	if [ "${v_echoBackup,,}" = 'false' ]; then
        __BU_MAIN_STAT_ECHO="$v_echoBackup";
	fi
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### PATHS CHECKINGS
#### DEBUG ID : checkings::paths-checkings
__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS="checkings::paths-checkings";
## DIRECTORIES PATHS CHECKINGS
## DEBUG ID : directories-paths-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__DIRECTORIES_PATHS_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS::directories-paths-checkings";
# Checking for an existent directory path (for the "BU::Main::Errors::HandleErrors()" function mainly).
function BU::Main::Checkings::CheckDirPathExists()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__DIRECTORIES_PATHS_CHECKINGS";
    #**** Parameters ****
    local p_path=$1;            # String    - Default : NULL    - Path of the (in)existent directory.
    local p_authorization=$2;   # String    - Default : NULL    - Authorization to call the "BU::__DechoHighlightPath()" function (since this function is called in the "BU::Main::Decho::SetBG/TextColor()" functions, and they are called in the "BU::__Decho<...>()" functions). Set this value to "false" to forbid this call.
    #**** Code ****
    if [ ! -d "$p_path" ] && [ "${p_authorization,,}" = 'true' ]; then
        BU::__DechoHighlightPath "<missing directory path>";  # Since this function should be called into a string, it's better to use a formatting function.
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    elif [ ! -d "$p_path" ] && [ "${p_authorization,,}" = 'false' ] || [ -z "$p_authorization" ]; then
        printf "<missing directory path>"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking if a directory was successfully created.
function BU::Main::Checkings::CheckDirPathWasCreated()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__DIRECTORIES_PATHS_CHECKINGS";
	#**** Parameters ****
    local p_path=$1;    # String - Path of the newly created directory.
	#**** Code ****
	if [ -d "$p_path" ]; then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# -----------------------------------------------
## FILES PATHS CHECKINGS
## DEBUG ID : files-path-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS::files-paths-checkings";
# Checking for an existent file path (for the "BU::Main::Errors::HandleErrors()" function mainly).
function BU::Main::Checkings::CheckFilePathExists()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS";
    #**** Parameters ****
    local p_path=$1;            # String    - Default : NULL    - Path of the (in)existent file.
    local p_authorization=$2;   # String    - Default : NULL    - Authorization to call the "BU::__DechoHighlightPath()" function (since this function is called in the "BU::Main::Decho::SetBG/TextColor()" functions, and they are called in the "BU::__Decho<...>()" functions). Set this value to "false" to forbid this call.
    #**** Code ****
    if [ ! -f "$p_path" ] && [ "${p_authorization,,}" = 'true' ]; then
        BU::__DechoHighlightPath "<missing file path>";       # Since this function should be called into a string, it's better to use a formatting function.
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    elif [ ! -f "$p_path" ] && [ "${p_authorization,,}" = 'false' ] || [ -z "$p_authorization" ]; then
        printf "<missing file path>"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    return 0;
}
# Checking if a file was successfully created.
function BU::Main::Checkings::CheckFilePathWasCreated()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS";
	#**** Parameters ****
    local p_path=$1;    # String - Path of the newliy created file.
	#**** Code ****
	if [ -f "$p_path" ]; then
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	fi
}
# Checking for "$__BU_MAIN_PROJECT_LOG_FILE_PATH"
# Required functions and files :
function BU::Main::Checkings::CheckProjectLogPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS";
    # Since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "BU::CheckProjectLogStatus()" function
    # (the only one where the "BU::Main::Checkings::CheckProjectLogPath()" function can be called), it's safe to call an "BU::Echo<...>()" function, the "BU::Main::Errors::HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
    if [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
		BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : no existing log file";
		BU::EchoNewstep "Creating a log file for the $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME") project";
		if ! BU::Main::Files::CreateProjectLogFile; then
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
		else
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		fi
    # Remember : since the "$__BU_MAIN_STAT_DECHO" and the "$__BU_MAIN_STAT_ECHO" status variables values are set to their safe mode in the "BU::CheckProjectLogStatus()" function
    # (the only one where the "BU::Main::Checkings::CheckProjectLogPath()" function can be called), it's safe to call an "BU::Echo<...>()" function, the "BU::Main::Errors::HandleErrors()" or the "DechoHighlight" functions without risking an infinite loop.
     elif [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
         echo "$__BU_MAIN_PROJECT_LOG_FILE_PATH";
         BU::Main::Errors::HandleErrors "1" "BAD PATH PROVIDED INTO THE $(BU::DechoHighlightPath "__BU_MAIN_PROJECT_LOG_FILE_PATH") VARIABLE" \
             "Please correct the path passed as argument, or redefine the variable if its value was modified somewhere" \
             "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
 		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    fi
}
# Checking for project's log file's status, then write the wanted text with 'echo' command's parameters.
# Accepted arguments : 'nodate', '<an empty string>'
function BU::CheckProjectLogStatus()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS";
	# Checking first if the partition where the log file exists is not fully used.
	BU::Main::Checkings::CheckDiskUsedSpace "$__BU_MAIN_PROJECT_LOG_FILE_PATH" 'true' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit "$?"; };
    #**** Parameters ****
    local p_string=$1;      # Any       - Text to display.
    local p_option=$2;      # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");   # Array - More processing arguments (like the processing of a whole line-long string).
    #**** Variables ****
	# WARNING : DO NOT call any "BU::Echo<...>()" function from the "main/Echo.lib" file, as they all call the "BU::CheckProjectLogStatus()" function.
	# Also, DO NOT call any "Decho<...>()" function, as they call the "BU::Main::Errors::HandleErrors()" function in case of a bad value passed as array of argument,
	# which also calls this same "BU::CheckProjectLogStatus()" function.
    # If you need to call a function here, please verify if it doesn't calls the "BU::CheckProjectLogStatus()" function,
    # nor any function called by the function you want to add, or else set the "$__BU_MAIN_STAT_ECHO" status variable value to "true" BEFORE calling the wanted function.
    # -------------------------------------------
    # Setting the "$__BU_MAIN_STAT_DECHO" global status variable's value to 'restrict', in case an error occurs during a function call.
    # Also disabling a shellcheck warning, which is a false positive (saying that "$__BU_MAIN_STAT_DECHO" may not be assigned, but "$__BU_MAIN_STAT_ECHO" is (both of them are valid and working differently)).
    # shellcheck disable=SC2153
    local v_bu_stat_decho_old="$__BU_MAIN_STAT_DECHO"; BU::Main::Status::ChangeSTAT_DECHO "restrict" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || {
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$C";
    }
    # Setting the "$__BU_MAIN_STAT_ECHO" global status variable's value to 'true', in case an error occurs during a function call, where the "BU::CheckProjectLogStatus()" function or any other function that calls it might be called.
    local v_bu_stat_echo_old="$__BU_MAIN_STAT_ECHO"; BU::Main::Status::ChangeSTAT_ECHO "true"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { 
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$C";
    }
    local v_redirectionError;
        v_redirectionError="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : unable to write into the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file.\nRedirection option --> ";
    local v_warning_array_value;
        v_warning_array_value="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : incorrect argument given as extra argument array in $(BU::DechoHighlightPath "${BASH_SOURCE[0]}"), function $(BU::DechoHighlightFunction "${FUNCNAME[0]}()").\nValue --> $(BU::DechoHighlight "$val")\nLine -->";
    #**** Code ****
    # This checking must be done before the long condition below, since it needs to know if the project's log file is present.
    if [ "${__BU_MAIN_STAT_LOG,,}" = "true" ]; then
        BU::Main::Checkings::CheckProjectLogPath || \
        {
            local returnCode="$?";
            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is stopped.
            BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
            # Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is stopped.
            BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
            return "$returnCode";
        };
    fi
    BU::Main::Status::CheckSTAT_LOG             "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
    BU::Main::Status::CheckSTAT_LOG_REDIRECT    "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
    BU::Main::Status::CheckSTAT_TIME_TXT        "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }
    # If a log file exists AND if "$__BU_MAIN_STAT_LOG" value is "false" AND if "$__BU_MAIN_STAT_LOG_REDIRECT" has a redirection value.
    if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ] && [ "${__BU_MAIN_STAT_LOG,,}" = "true" ]; then
        # If messages must be redirected in the log file only ("$__BU_MAIN_STAT_LOG_REDIRECT" value is equal to "log").
        if [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" = "log" ]; then
            # Setting the "$__BU_MAIN_STAT_TIME_HEADER" global status variable's value to 0 seconds, since no text is being displayed on the screen.
            local v_stat_time_header="$__BU_MAIN_STAT_TIME_HEADER"; BU::Main::Status::ChangeSTAT_TIME_HEADER "0";
			# Setting the "$__BU_MAIN_STAT_TIME_NEWLINE" global status variable's value to 0 seconds, since no text is being displayed on the screen.
			local v_stat_time_newline="$__BU_MAIN_STAT_NEWLINE"; BU::Main::Status::ChangeSTAT_TIME_NEWLINE "0";
            # Setting the "$__BU_MAIN_STAT_TIME_TXT" global status variable's value to 0 seconds, since no text is being displayed on the screen.
            local v_stat_time_txt="$__BU_MAIN_STAT_TIME_TXT"; BU::Main::Status::ChangeSTAT_TIME_TXT "0";
            for val in "${pa_extraArgs[@]}"; do
                # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
                local v_loop_error;
                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "${p_option,,}" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "${p_string#* ] }" 'n';
                            else
                                echo -ne "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "${p_string#* ] }";
                            else
                                echo -e "$p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "log")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                    esac
                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "${p_option,,}" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n';
                            else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                            else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                    esac
                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "log" option)).
                else
                    case "${p_option,,}" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n';
                                # Since the "$__BU_MAIN_STAT_ECHO" status variable's value is set to 'true', this "BU::CheckProjectLogStatus()" function won't be called, only a minimalist substitute function.
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline;
							else
                                echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; v_loop_error='error'; break; };
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							fi; BU::Newline;
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							else
                                echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; v_loop_error='error'; break; };
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::__DechoHighlightVar "log")\nLine --> $(BU::__DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							fi
                            ;;
                    esac
                fi
            done; if [ "${v_loop_error}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
            BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            # Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
            BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"     "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            # Resetting the "$__BU_MAIN_STAT_TIME_HEADER" global status variable's value to the former timer.
            BU::Main::Status::ChangeSTAT_TIME_HEADER    "$v_stat_time_header"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            # Resetting the "$__BU_MAIN_STAT_TIME_HEADER" global status variable's value to the former timer.
            BU::Main::Status::ChangeSTAT_TIME_NEWLINE   "$v_stat_time_newline"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            # Resetting the "$__BU_MAIN_STAT_TIME_TXT" global status variable's value to the former timer.
            BU::Main::Status::ChangeSTAT_TIME_TXT       "$v_stat_time_txt"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            return 0;
        # Else, if messages must be redirected in the log file AND to the terminal ("$__BU_MAIN_STAT_LOG_REDIRECT" value is equal to "tee").
        elif [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" = "tee" ]; then
            for val in "${pa_extraArgs[@]}"; do
                # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
                local v_loop_error;
                # If the 'nodate' value is passed as argument.
                if [ "${val,,}" = 'nodate' ]; then
                    case "${p_option,,}" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "${p_string#* ] }" 'n';
                            else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "${p_string#* ] }";
                            else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                            fi
                            ;;
                    esac
                # Else, if no argument is passed in "$pa_extraArgs" parameter array.
                elif [ -z "$val" ]; then
                    case "${p_option,,}" in
                    '-n' | 'n')
                        if BU::Main::Status::CheckStatIsInitializing; then
                            BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n';
                        else
                            echo -ne "$p_string";
                            echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                        fi
                        ;;
                    '' | *)
                        if BU::Main::Status::CheckStatIsInitializing; then
                            BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                        else
                            echo -e "$p_string";
                            echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
                        fi
                        ;;
                    esac
                # Else, if an unsupported option is passed (note for myself : the extra args checking
                # "for" loop (for val in "${pa_extraArgs[@]}"; do) is still running (for the "tee" option)).
                else
                    case "${p_option,,}" in
                        '-n' | 'n')
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n'
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							else
                                echo -ne "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; v_loop_error='error'; break; };
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							fi; BU::Newline;
                            ;;
                        '' | *)
                            if BU::Main::Status::CheckStatIsInitializing; then
                                BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string"
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							else
                                echo -e "$p_string" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; v_loop_error='error'; break; };
                                BU::EchoWarning "$v_warning_array_value $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate' 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { local C="$?"; BU::Newline >&2; BU::EchoError "$v_redirectionError $(BU::DechoHighlightVar "tee")\nLine --> $(BU::DechoHighlight "$LINENO")" "$p_option" 'nodate'; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; v_loop_error='error'; break; };
							fi
                            ;;
                    esac
                fi
            done; if [ "${v_loop_error}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
            sleep "$__BU_MAIN_STAT_TIME_TXT";
			# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
			BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"  "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
			# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
			BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
			return 0;
        # Else, if messages must not be redirected in the log file.
        else
            case "${p_option,,}" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string";
                    else
                        echo -ne "$p_string";
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string";
                    else
                        echo -e "$p_string";
                    fi
                    ;;
            esac
            sleep "$__BU_MAIN_STAT_TIME_TXT";
            # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
            BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            # Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
            BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            return 0;
        fi
    # Else, if no log file exists OR if "$__BU_MAIN_STAT_LOG" value is "false" OR if "$__BU_MAIN_STAT_LOG_REDIRECT" has no redirection value.
    else
        case "${p_option,,}" in
            '-n' | 'n')
                if BU::Main::Status::CheckStatIsInitializing; then
                    BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string" 'n';
                else
                    echo -ne "$p_string";
                fi
                ;;
            '' | *)
                if BU::Main::Status::CheckStatIsInitializing; then
                    BU::ModuleInit::Msg "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                else
                    echo -e "$p_string";
                fi
                ;;
        esac
        sleep "$__BU_MAIN_STAT_TIME_TXT";
        # Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value, since the "BU::CheckProjectLogStatus()" function's execution is over.
        BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
		# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
		BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"   "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
		return 0;
	fi
	# Resetting the "$__BU_MAIN_STAT_DECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
	BU::Main::Status::ChangeSTAT_DECHO "$v_bu_stat_decho_old"    "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	# Resetting the "$__BU_MAIN_STAT_ECHO" status variable's value to its former value if it was "false", since the "BU::CheckProjectLogStatus()" function's execution is over.
	BU::Main::Status::ChangeSTAT_ECHO "$v_bu_stat_echo_old"      "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Check project related file presence, or create this file.
function BU::Main::Checkings::CheckProjectRelatedFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__PATHS_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__PATHS_CHECKINGS__FILES_PATHS_CHECKINGS";
	#**** Parameters ****
    local p_parent=$1;  # String    - Default : NULL    - Name of the folder to process (into its parent directory).
    local p_child=$2;   # String    - Default : NULL    - Name of the file or folder to process (into its parent directory).
    local p_type=$3;    # Char      - Default : NULL    - Type of data to create (d = directory, f = file).
    local p_decho=$4;   # String    - Default : NULL    - 
	#**** Variables ****
    local v_path="$p_parent/$p_child";
	#**** Code ****
	# Checking first if the target partition is not fully used.
	BU::Main::Checkings::CheckDiskUsedSpace "$v_path" 'true' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit "$C"; };
	if [ -z "$p_decho" ] || [ -n "$p_decho" ] && [ "${p_decho,,}" = '--decho' ]; then
        if ! BU::Main::Args__Checkings::CheckProjectRelatedFile "$p_parent" "$p_child" "$p_type" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    fi
	if [ "$p_type" = 'f' ]; then
		if [ -f "$v_path" ]; then
			if [ -s "$v_path" ]; then
				true > "$v_path" || {
                    if [ -z "$p_decho" ] || [ -n "$p_decho" ] && [ "${p_decho,,}" = '--decho' ]; then
                        BU::Main::Errors::HandleSmallErrors 'E' \
                            "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : unable to overwrite this $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(BU::Main::Checkings::CheckFilePathExists "$v_path" 'true')" 'E';
                    else
                        BU::EchoError "${FUNCNAME[0]}() --> Error : unable to overwrite this « $__BU_MAIN_PROJECT_NAME » project's file --> $v_path";
                        BU::Newline;
                    fi
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                }
			fi
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		else
			if [ ! -d "$p_parent" ]; then
                mkdir -p "$p_parent" || {
                    local returnCode="$?";
                    if [ -z "$p_decho" ] || [ -n "$p_decho" ] && [ "${p_decho,,}" = '--decho' ]; then
                        BU::Main::Errors::HandleSmallErrors 'E' \
                            "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file's parent folder --> $(BU::Main::Checkings::CheckDirPathExists "$p_parent" 'true')" 'E';
                    else
                        BU::EchoError "${FUNCNAME[0]}() --> Error : unable to create this « $__BU_MAIN_PROJECT_NAME » project's file parent folder --> $p_parent";
                        BU::Newline;
                    fi
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$returnCode";
                }
				BU::Main::Checkings::CheckDirPathWasCreated "$p_parent" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
			fi
			touch "$v_path" || {
                local returnCode="$?";
                if [ -z "$p_decho" ] || [ -n "$p_decho" ] && [ "${p_decho,,}" = '--decho' ]; then
                    BU::Main::Errors::HandleSmallErrors 'E' \
                        "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's file --> $(BU::Main::Checkings::CheckFilePathExists "$v_path" 'true')" 'E';
                else
                    BU::EchoError "${FUNCNAME[0]}() --> Error : unable to overwrite this « $__BU_MAIN_PROJECT_NAME » project's file --> $v_path";
                    BU::Newline;
                fi
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$returnCode";
            }
			BU::Main::Checkings::CheckFilePathWasCreated "$v_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; return 0;
		fi
    elif [ "$p_type" = 'd' ]; then
		if [ -d "$v_path" ]; then
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		else
			mkdir -p "$v_path" || {
                local returnCode="$?";
                if [ -z "$p_decho" ] || [ -n "$p_decho" ] && [ "${p_decho,,}" = '--decho' ]; then
                    BU::Main::Errors::HandleSmallErrors 'E' \
                        "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : unable to create this $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME") project's folder --> $(BU::Main::Checkings::CheckDirPathExists "$v_path" 'true')" 'E';
                else
                    BU::EchoError "${FUNCNAME[0]}() --> Error : unable to create this « $__BU_MAIN_PROJECT_NAME » project's folder --> $v_path";
                    BU::Newline;
                fi
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$returnCode";
            }
			BU::Main::Checkings::CheckDirPathWasCreated "$v_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		fi
    fi
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### TEXT CHECKINGS
#### DEBUG ID : checkings::text-checkings
__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__TEXT_CHECKINGS="checkings::text-checkings";
## FORMATTING CHECKINGS
## DEBUG ID : formatting-checkings
__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__TEXT_CHECKINGS__FORMATTING_CHECKINGS="$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__TEXT_CHECKINGS::formatting-checkings";
# Checking if the project's color code file exists or not.
# WARNING ! DO NOT CALL ANY "Decho<...>()" FUNCTION HERE, OR THE SCRIPT WILL LOOP FOREVER !!!
function BU::Main::Checkings::CheckDecho()
{
    #**** Code ****
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__TEXT_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__TEXT_CHECKINGS__FORMATTING_CHECKINGS";
    # If the text formatting is forbidden, then the "Decho()" function will not decorate the targeted text :
    if [ "${__BU_MAIN_STAT_TXT_FMT,,}" = "false" ] || [ "${__BU_MAIN_STAT_DECHO,,}" = 'forbid' ]; then
        return 1;
    else
        # Creating the "fgcolors.tmp" (text color) file in case it doesn't exists.
        if [ ! -f "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" ]; then
            if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_NAME" 'f'; then
                BU::Main::Errors::HandleSmallErrors 'E' "Unable to create the $(BU::Decho "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH") file" 'E' 'CPLS'; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        fi
        # Creating the "bgcolors.tmp" (background color) file in case it doesn't exists.
        if [ ! -f "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" ]; then
            if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_NAME" 'f'; then
                BU::Main::Errors::HandleSmallErrors 'E' "Unable to create the $(BU::Decho "$__BU_MAIN_PROJECT_COLOR_TEXT_BG_FILE_PATH") file" 'E' 'CPLS'; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        fi
        if [ -f "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" ] && [ "$(cat "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")" = '' ]; then
            echo "$__BU_MAIN_COLOR_TXT_RESET" > "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" || \
            {
                # It's better to call the "BU::EchoMsg()" function, so that its redirection and debug process wil not have to be reprogrammed.
                # It's also better to not call the "BU::Main::Errors::HandleSmallErrors()" function here, so that there won't be any problem when this function calls the "Decho<...>()" functions.
                BU::EchoMsg "${__BU_MAIN_COLOR_TXT_HIGHLIGHT}${FUNCNAME[0]}()${__BU_MAIN_COLOR_TXT_WARNING}--> Warning : Unable to write any color code into the ${__BU_MAIN_COLOR_TXT_HIGHLIGHT}$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH${__BU_MAIN_COLOR_TXT_WARNING} file." 'R' '';
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            }
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        else
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
	fi
}
# Checking if the "$__BU_MAIN_STAT_TXT_FMT" status value is set to "true".
function BU::Main::Checkings::CheckTextFormat()
{
    #**** Parameters ****
    #   $1  -> "tput" command's text formatting option.
    #   $2  -> Corresponding ANSI escape sequence (useful if the "tput" command is not detected or unavailable).
    #**** Code ****
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CHECKINGS_LIB__CAT_DEBUG_ID__TEXT_CHECKINGS" \
        "$__BU_MAIN_CHECKINGS_LIB__SUBCAT_DEBUG_ID__TEXT_CHECKINGS__FORMATTING_CHECKINGS";
    if [ "${__BU_MAIN_STAT_TXT_FMT,,}" = "true" ]; then
        if [ -n "$1" ]; then
			if command -v "tput" &> /dev/null; then
				# Formatting text with the tput command or directly with the backslash escapes.
				tput "$1" || echo -ne "\e[$2m";	# If the "tput" command fails, then the text is encoded with ANSI control sequences.
				BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
			else
				echo -ne "\e[$2m"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
			fi
        # In case there's no value passed as first argument (like if the wanted tput option is unknown), the script only echoes its ANSI escape sequence.
        else
            echo -ne "\e[$2m";
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    fi
}
# -----------------------------------------------
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/CMDS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : CMDS.lib
# Module        : Main
# Description   : Functions used to process information about executable commands.
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### PROCCESSING COMMANDS
#### DEBUG ID : cmds::processing-commands
__BU_MAIN_CMDS_LIB__CAT_DEBUG_ID__PROCESSING_COMMANDS="cmds::processing-commands";
## GET COMMAND OUTPUTS
## DEBUG ID : get-command-output
__BU_MAIN_CMDS_LIB__SUBCAT_DEBUG_ID__PROCESSING_COMMANDS__GET_COMMAND_OUTPUTS="$__BU_MAIN_CMDS_LIB__CAT_DEBUG_ID__PROCESSING_COMMANDS::get-command-output";
# Get command's executable file's path.
function BU::Main::CMDS::GetCommandPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CMDS_LIB__CAT_DEBUG_ID__PROCESSING_COMMANDS" \
        "$__BU_MAIN_CMDS_LIB__SUBCAT_DEBUG_ID__PROCESSING_COMMANDS__GET_COMMAND_OUTPUTS";
    #**** Parameters ****
    local p_cmd=$1;     # String    - Default : NULL    - Name of the command to process, with it's options.
    #**** Code ****
    if ! BU::Main::Args__CMDS::GetCommandPath "$p_cmd" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    command -v "$p_cmd" || { local C="$?"; BU::Main::Errors::HandleSmallErrors 'E' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : The $(BU::DechoHighlight "$p_cmd") command was not found on your system" 'E'; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Get the command's return output.
function BU::Main::CMDS::GetCommandReturnOutputValue()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_CMDS_LIB__CAT_DEBUG_ID__PROCESSING_COMMANDS" \
        "$__BU_MAIN_CMDS_LIB__SUBCAT_DEBUG_ID__PROCESSING_COMMANDS__GET_COMMAND_OUTPUTS";
    #**** Parameters ****
    local p_cmd=$1;     # String    - Default : NULL    - Name of the command to process, with it's options.
    #**** Code ****
    if eval "$p_cmd" > /dev/null; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/DECHO.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : BU::Decho.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154,SC2181
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### TEXT WRITING AND DECORATION (FORMATTING)
#### DEBUG ID : decho::text-writing-and-decoration-(formatting)
__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING="decho::text-writing-and-decoration-(formatting)";
## SETTING
## DEBUG ID : setting
__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__SETTING="$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING::setting";
# Writing the text zone's background color into a file, to be processed by any function which needs to know what is the current color.
## WARNING !! DO NOT CALL THESE FUNCTIONS HERE, THEY CALL THE "BU::__Decho()" AND "BU::Decho()" FUNCTIONS, AND SO THE FOLLOWING FUNCTION :
#   - BU::Main::Checkings::CheckProjectRelatedFile()
#   - BU::Main::Errors::HandleSmallErrors
#   - BU::Main::Errors::HandleErrors
function BU::Main::Decho::SetBGColor()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING" \
        "$__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__SETTING";
	#**** Parameters ****
	local p_color_code=$1;     # Int       # Default : NULL    - Color code
	local p_init_ctrl=$2;      # String    # Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the creation of the background color's temporary file.
	#**** Code ****
	# Checking first if the target partition is not fully used.
	if [ "${p_init_ctrl,,}" != '--init' ]; then BU::Main::Checkings::CheckDiskUsedSpace "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" 'false' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
	# If the script is allowed to format text.
    if BU::Main::Status::CheckStatAllowFormatting; then
        if command -v tput &> /dev/null; then
            tput setab "$1" || { echo -ne "\e[" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0; }
            if [ "${p_init_ctrl,,}" = '--init' ]; then return 0;
                # Checking if the "bgcolors.tmp" (background color) file exists.
                if [ ! -d "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" ]; then mkdir -p "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT" || {
                    echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : THE $__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PARENT FOLDER CANNOT BE CREATED" >&2;
                    echo "Please check what is preventing this directory from being created. It may be a directory permission issue." >&2;
                    echo >&2;
                    echo "Aborting the script's execution" >&2;
                    echo >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }; fi
                if [ ! -f "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" ]; then touch "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" || {
                    echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : THE $__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH FILE CANNOT BE CREATED" >&2;
                    echo "Please check what is preventing this file from being created. It may be a directory permission issue" >&2;
                    echo >&2;
                    echo "Aborting the script's execution" >&2;
                    echo >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }; fi
                # Redirecting the background's color code in its dedicated temporary file.
                echo "$1" > "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH"; local X="$?";
                [ "$X" -ne 0 ] && {
                    echo -e >&2; echo -e "The $(BU::Main::Checkings::CheckFilePathExists "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH" 'false') (bgcolors.tmp) file doesn't exists" >&2; echo -e >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }
            fi
        else
            echo -ne "\e["; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Writing the text's color code into a file, to be processed by any function which needs to know what is the current text color.
## WARNING !! DO NOT CALL THESE FUNCTIONS HERE, THEY CALL THE "BU::__Decho()" AND "BU::Decho()" FUNCTIONS, AND SO THE FOLLOWING FUNCTION :
#   - BU::Main::Checkings::CheckProjectRelatedFile()
#   - BU::Main::Errors::HandleSmallErrors
#   - BU::Main::Errors::HandleErrors
function BU::Main::Decho::SetTextColor()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING" \
        "$__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__SETTING";
	#**** Parameters ****
	local p_color_code=$1;     # Int       # Default : NULL    - Color code
	local p_init_ctrl=$2;      # String    # Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the creation of the text color's temporary file.
	#**** Code ****
    shopt -s extglob;
    # Checking first if the target partition is not fully used.
    if [[ "${p_init_ctrl,,}" != *(-)init ]]; then BU::Main::Checkings::CheckDiskUsedSpace "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" 'false' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit "$C"; }; fi
    shopt -u extglob;
    # If the script is allowed to format text.
	if BU::Main::Status::CheckStatAllowFormatting; then
        if command -v tput &> /dev/null; then
            tput setaf "$p_color_code" || { echo -ne "\e[38;5;$1m" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0; }
            shopt -s extglob; if [[ "${p_init_ctrl,,}" == *(-)init ]]; then shopt -u extglob; return 0;
            else shopt -u extglob;
                # Checking if the "bgcolors.tmp" (background color) file exists.
                if [ ! -d "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" ]; then mkdir -p "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT" || {
                    echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : THE $__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PARENT FOLDER CANNOT BE CREATED" >&2;
                    echo "Please check what is preventing this directory from being created. It may be a directory permission issue." >&2;
                    echo >&2;
                    echo "Aborting the script's execution" >&2;
                    echo >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }; fi
                if [ ! -f "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" ]; then touch "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" || {
                    echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $(( LINENO - 1 )) --> ERROR : THE $__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH FILE CANNOT BE CREATED" >&2;
                    echo "Please check what is preventing this file from being created. It may be a directory permission issue" >&2;
                    echo >&2;
                    echo "Aborting the script's execution" >&2;
                    echo >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }; fi
                # Redirecting the text's color code in its dedicated temporary file.
                echo "$p_color_code" > "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH"; local X="$?";
                [ "$X" -ne 0 ] && {
                    echo -e >&2; echo -e "The $(BU::Main::Checkings::CheckFilePathExists "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" 'false') (fgcolors.tmp) file doesn't exists" >&2; echo -e >&2;
                    if BU::IsInScript; then exit 1; else return 1; fi
                }
            fi
        else
            echo -ne "\e[38;5;$1m"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
    else
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# -----------------------------------------------
## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT - BASIS
## DEBUG ID : writing-differently-cf-text-between-text::basis
__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__WRITING_DIFFERENTLY_COLORED_FORMATTED_TEXT_BETWEEN_TEXT_BASIS="$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING::writing-differently-cf-text-between-text::basis";
# Text's inside decoration/formatting procssing (light version, safe to use when the complete version cannot be called without provoking an infinite loop).
function BU::__Decho()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING" \
        "$__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__WRITING_DIFFERENTLY_COLORED_FORMATTED_TEXT_BETWEEN_TEXT_BASIS";
	#**** Parameters ****
	local p_string=$1;			# String	- Default : NULL	- String to display.
	local p_newTextColor=$2;	# CMD		- Default : NULL	- Color to apply on each string's characters.
	local p_oldTextColor=$3;	# CMD		- Default : NULL	- Color to apply in the text's background.
	#**** Code ****
    printf "%s\n" "$p_newTextColor$p_string$p_oldTextColor";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Text's inside decoration/formatting procssing (complete version).
# Featured functions and files from the "functions" folder :
#   - BU::Main::Checkings::CheckDecho
#   -
function BU::Decho()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DECHO_LIB__CAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING" \
        "$__BU_MAIN_DECHO_LIB__SUBCAT_DEBUG_ID__TEXT_WRITING_AND_DECORATION_FORMATTING__WRITING_DIFFERENTLY_COLORED_FORMATTED_TEXT_BETWEEN_TEXT_BASIS";
    #**** Parameters ****
    local p_string=$1;          # String	- Default : NULL	- String to display.
    local p_newTextColor=$2;    # Int       - Default : NULL	- Color to apply on each string's characters.
    local p_newBGColor=$3;      # Int       - Default : NULL	- Color to apply in the text's background.
    if [ -n "$p_string" ]; then
        if [ -z "$p_newTextColor" ] && [ -z "$p_newBGColor" ]; then
            shift 1; local pa_fmtArgs; pa_fmtArgs=$("$@");
            BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}";
        elif [ -n "$p_newTextColor" ] && [ -z "$p_newTextColor" ] || [ -n "$p_newTextColor" ] && [ -z "$p_newBGColor" ]; then
            shift 2; local pa_fmtArgs; pa_fmtArgs=$("$@");
            BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}";
        fi
   # else
    #    BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED" && return "$__BU_MAIN_EXIT_CURRENT_CODE";
    fi
	#**** Variables ****
    local v_loop_error; # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    #**** Code ****
    if ! BU::Main::Args__Decho::Decho "$p_string" "$p_newTextColor" "$p_newTextColor" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then return 1; fi
    BU::Main::Checkings::CheckDecho;
    if test "$?" -ne 0; then
        if [ "${__BU_MAIN_STAT_DECHO,,}" = 'forbid' ]; then
            # If the text formatting is forbidden, but the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "true", the text to decorate will be put between French guillemets.
            if BU::Main::Status::CheckStatAllowFormatting; then
                echo -ne "« $p_string »"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
            # Else, if the text formatting is forbidden, AND the "$__BU_MAIN_STAT_TXT_FMT" global status variable's value is set to "false", no decoration nor highlighting will be made.
            else
                echo -ne "$p_string"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
            fi
        else
            echo -ne "« $p_string »"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
        BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED" && return "$__BU_MAIN_EXIT_CURRENT_CODE";
    else
        local v_oldBGColor;
            v_oldBGColor="$(cat "$__BU_MAIN_PROJECT_COLOR_BG_CODE_FILE_PATH")";
        local v_oldTextColor;
            v_oldTextColor="$(cat "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH")";
    fi
    # If both of the new colors are equal.
    if [ "$p_newBGColor" = "$p_newTextColor" ]; then
        p_newBGColor="$(( p_newBGColor+34 ))"
    fi
    # If the text color code's value is equal to it's former value.
    if [ "$p_newTextColor" = "$v_oldTextColor" ]; then
        # TODO : Développer un meilleur système de changement de couleur (P-Ê en appelant une fonction à créer, ou en utilisant une formule mathématique). Se renseigner sur la commande "tput setaf".
		p_newTextColor="$(( p_newTextColor+38 ))";
    fi
    # If the background color code's value is equal to it's former value.
    if [ "$p_newBGColor" = "$v_oldBGColor" ]; then
		p_newBGColor="$(( p_newBGColor+38 ))";
	fi
    # Setting the new values in their color code temporary file.
    if [ -n "$p_newTextColor" ]; then BU::Main::Decho::SetTextColor "$p_newTextColor"; fi
    if [ -n "$p_newBGColor" ]; then BU::Main::Decho::SetBGColor "$p_newBGColor"; fi
    # Test code, to check the values from the command substitutes.
    echo "STRING : $p_string";
    echo "TEXT COLOR : $p_newTextColor";
    echo "BG COLOR : $p_newBGColor";
    # -----------------------------------------------
    ## APPLYING THE FORMATTINGS ON THE TEXT
	if [ "${__BU_MAIN_STAT_DECHO,,}" = 'restrict' ]; then
        printf "%s" "$p_newTextColor";
        printf "%s" "$p_newBGColor";
        printf "%s" "$p_string";
        printf "%s" "$v_oldBGColor";
        printf "%s" "$v_oldTextColor";
        printf "\n";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        # Setting every formattings.
        for val in "${pa_fmtArgs[@]}"; do
            case "${val^^}" in
                "$(BU::IsInt "${#val}")") return;;
                'BLINK') echo -ne "${__BU_MAIN_TXT_FMT_BLINK}";;
                'BOLD')  echo -ne "${__BU_MAIN_TXT_FMT_BOLD}";;
                'D') echo -ne "${__BU_MAIN_TXT_FMT_DIM}";;
                'I') echo -ne "${__BU_MAIN_TXT_FMT_ITALIC}";;
                'S') echo -ne "${__BU_MAIN_TXT_FMT_STRIKETHROUGH}";;
                'U') echo -ne "${__BU_MAIN_TXT_FMT_UNDERLINE}";;
                *)
                    # WARNING ! >>> DO NOT RESET <<< the "$__BU_MAIN_STAT_TXT_FMT" variable's value >>> to "true" <<<, or else the program will be stuck in an infinite loop.
                    # The function "HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_TXT_FMT" status variable's value is set to "false", the script will not call the following function indefinitely.
                    # Saving the "true" value from the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if BU::Main::Status::CheckStatAllowFormatting; then
                        local v_bu_main_stat_txt_fmt_old_val="$__BU_MAIN_STAT_TXT_FMT";
                        BU::Main::Status::ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    fi
                    BU::Main::Errors::HandleErrors "1" "AT LEAST ONE OF THE $(BU::DechoHighlightFunction "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                        "Check if the value is supported in the first value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                    BU::Main::Status::ChangeSTAT_TXT_FMT "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    # Restoration of the "true" value in the "$__BU_MAIN_STAT_TXT_FMT" global status variable, since it's possible to do so now.
                    if [ "$v_bu_main_stat_txt_fmt_old_val" ]; then
                        BU::Main::Status::ChangeSTAT_TXT_FMT "$v_bu_main_stat_txt_fmt_old_val" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    fi
                    local C="$__BU_MAIN_EXIT_NOT_PERMITTED"; v_loop_error='error'; break;
                ;;
            esac
        done; if [ "${v_loop_error}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
        echo -e "$p_string$p_newTextColor$__BU_MAIN_COLOR_CODE_RESET";
        # -----------------------------------------------
        ## APPLYING THE FORMATTINGS ON THE TEXT
        # Resetting the text's color.
        if [ -n "$p_newTextColor" ]; then BU::Main::Decho::SetTextColor "$p_oldTextColor"; fi
        if [ -n "$p_newBGColor" ]; then BU::Main::Decho::SetBGColor "$p_oldBGColor"; fi
        # Resetting every formattings.
        for val in "${pa_fmtArgs[@]}"; do
            case "${val^^}" in
                "$(BU::IsInt "${#val}")") return;;
                'BLINK') echo -ne "${__BU_MAIN_TXT_FMT_BLINK_RESET}";;
                'BOLD')  echo -ne "${__BU_MAIN_TXT_FMT_BOLD_RESET}";;
                'D') echo -ne "${__BU_MAIN_TXT_FMT_DIM_RESET}";;
                'I') echo -ne "${__BU_MAIN_TXT_FMT_ITALIC_RESET}";;
                'S') echo -ne "${__BU_MAIN_TXT_FMT_STRIKETHROUGH_RESET}";;
                'U') echo -ne "${__BU_MAIN_TXT_FMT_UNDERLINE_RESET}";;
                *)
                    # WARNING ! >>> DO NOT RESET <<< the "$__BU_MAIN_STAT_TXT_FMT" variable's value >>> to "true" <<<, or else the program will be stuck in an infinite loop.
                    # The function "BU::Main::Errors::HandleErrors()" will call this "Decho()" function, but thanks to the verification of the "CheckDecho()"'s function return code,
                    # if the "$__BU_MAIN_STAT_DECHO" status variable's value is set to "false", the script will not call the following function indefinitely.
                    # Saving the "true" value from the "$__BU_MAIN_STAT_TXT_FMT" global status variable.
                    if BU::Main::Status::CheckStatAllowFormatting; then
                        local v_bu_main_stat_txt_fmt_old_val="$__BU_MAIN_STAT_TXT_FMT";
                        BU::Main::Status::ChangeSTAT_TXT_FMT "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    fi
                    # shellcheck disable=SC2034
                    BU::Main::Status::ChangeSTAT_DECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    BU::Main::Errors::HandleErrors "1" "AT LEAST ONE OF THE $(BU::DechoHighlightFunction "${FUNCNAME[@]}")'S ARRAY ARGUMENT VALUE IS INCORRECT" \
                    "Check if the value is supported in the second value checking case" "${pa_fmtArgs[@]}" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO";
                    # Restoration of the "true" value in the "$__BU_MAIN_STAT_TXT_FMT" global status variable, since it's possible to do so now.
                    if [ "$v_bu_main_stat_txt_fmt_old_val" ]; then
                        BU::Main::Status::ChangeSTAT_TXT_FMT "$v_bu_main_stat_txt_fmt_old_val" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; v_loop_error='error'; break; };
                    fi
                    local C="$__BU_MAIN_EXIT_NOT_PERMITTED"; v_loop_error='error'; break;
                ;;
            esac
        done; if [ "${v_loop_error,,}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## WRITING DIFFERENTLY COLORED/FORMATTED TEXT BETWEEN TEXT - LIST
# Tip : to avoid defining a function for each color and formatting (which would take a monstruous amount of time, especially if new colors or formattings are added),
# it's easier to call the wanted text formatting function, then the wanted coloring text function, or vice-versa.
# Examples :
# echo -e "Lorem ipsum $(BU::Decho_FMT_BlinkBoldDISU "$(BU::DechoOrange "dolor")") sit amet..."
# echo -e "Lorem ipsum $(BU::DechoOrange "$(BU::Decho_FMT_BlinkBoldDISU "dolor")") sit amet..."
# Easy "BU::Decho()" function calls with colors.
function BU::DechoAqua              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_AQUA"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoBlack             { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_BLACK"     "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoBlue              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_BLUE"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoCyan              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_CYAN"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoFuchsia           { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_FUCHSIA"   "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoGray              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_GRAY"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoGreen             { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_GREEN"     "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoLime              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_LIME"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoMaroon            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_MAROON"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoNavy              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_NAVY"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoOlive             { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_OLIVE"     "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoOrange            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_ORANGE"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoPink              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_PINK"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoPurple            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_PURPLE"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoRed               { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_RED"       "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoSalmon            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_SALMON"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoSilver            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_SILVER"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoTan               { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_TAN"       "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoTeal              { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_TEAL"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoTurquoise         { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_TURQUOISE" "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoViolet            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_VIOLET"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoWhite             { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_WHITE"     "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoYellow            { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$v_str" "$__BU_MAIN_COLOR_CODE_YELLOW"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
# Easy "BU::Decho()" function calls with specific text display colors.
function BU::DechoHighlight         { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho            "$v_str" "$__BU_MAIN_COLOR_CODE_HIGHLIGHT"  "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightCMD      { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_Bold   "$v_str" "$__BU_MAIN_COLOR_CODE_CMD"        "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightError    { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_BoldIU "$v_str" "$__BU_MAIN_COLOR_CODE_ERROR"      "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightFunction { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_Bold   "$v_str" "$__BU_MAIN_COLOR_CODE_FUNCTION"   "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightNewstep  { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_I      "$v_str" "$__BU_MAIN_COLOR_CODE_NEWSTEP"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightPath     { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_Bold   "$v_str" "$__BU_MAIN_COLOR_CODE_PATH"       "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightSuccess  { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_I      "$v_str" "$__BU_MAIN_COLOR_CODE_SUCCESS"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightVar      { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_Bold   "$v_str" "$__BU_MAIN_COLOR_CODE_VAR"        "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
function BU::DechoHighlightWarning  { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho_FMT_BoldIU "$v_str" "$__BU_MAIN_COLOR_CODE_WARNING"    "$v_bg" "${pa_arr[@]}" || return 1; return 0; }
# Easy "BU::Decho()" function calls with background color display.
function BU::DechoBGColor           { local v_str=$1; local v_bg=$2; shift 2; local pa_arr=("$@"); BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_fmtArgs}"; BU::Decho "$1" "${pa_arr[@]}" || return 1; et"$2";urn 0; }
# Easy "BU::__Decho()" function calls with colors.
function BU::__DechoAqua        { BU::__Decho "$1" "$__BU_MAIN_COLOR_AQUA"      "$2"; }
function BU::__DechoBlack       { BU::__Decho "$1" "$__BU_MAIN_COLOR_BLACK"     "$2"; }
function BU::__DechoBlue        { BU::__Decho "$1" "$__BU_MAIN_COLOR_BLUE"      "$2"; }
function BU::__DechoCyan        { BU::__Decho "$1" "$__BU_MAIN_COLOR_CYAN"      "$2"; }
function BU::__DechoFuchsia     { BU::__Decho "$1" "$__BU_MAIN_COLOR_FUCHSIA"   "$2"; }
function BU::__DechoGray        { BU::__Decho "$1" "$__BU_MAIN_COLOR_GRAY"      "$2"; }
function BU::__DechoGreen       { BU::__Decho "$1" "$__BU_MAIN_COLOR_GREEN"     "$2"; }
function BU::__DechoLime        { BU::__Decho "$1" "$__BU_MAIN_COLOR_LIME"      "$2"; }
function BU::__DechoMaroon      { BU::__Decho "$1" "$__BU_MAIN_COLOR_MARRON"    "$2"; }
function BU::__DechoNavy        { BU::__Decho "$1" "$__BU_MAIN_COLOR_NAVY"      "$2"; }
function BU::__DechoOlive       { BU::__Decho "$1" "$__BU_MAIN_COLOR_OLIVE"     "$2"; }
function BU::__DechoOrange      { BU::__Decho "$1" "$__BU_MAIN_COLOR_ORANGE"    "$2"; }
function BU::__DechoPink        { BU::__Decho "$1" "$__BU_MAIN_COLOR_PINK"      "$2"; }
function BU::__DechoPurple      { BU::__Decho "$1" "$__BU_MAIN_COLOR_PURPLE"    "$2"; }
function BU::__DechoRed         { BU::__Decho "$1" "$__BU_MAIN_COLOR_RED"       "$2"; }
function BU::__DechoSalmon      { BU::__Decho "$1" "$__BU_MAIN_COLOR_SALMON"    "$2"; }
function BU::__DechoSilver      { BU::__Decho "$1" "$__BU_MAIN_COLOR_SILVER"    "$2"; }
function BU::__DechoTan         { BU::__Decho "$1" "$__BU_MAIN_COLOR_TAN"       "$2"; }
function BU::__DechoTeal        { BU::__Decho "$1" "$__BU_MAIN_COLOR_TEAL"      "$2"; }
function BU::__DechoTurquoise   { BU::__Decho "$1" "$__BU_MAIN_COLOR_TURQUOISE" "$2"; }
function BU::__DechoViolet      { BU::__Decho "$1" "$__BU_MAIN_COLOR_VIOLET"    "$2"; }
function BU::__DechoWhite       { BU::__Decho "$1" "$__BU_MAIN_COLOR_WHITE"     "$2"; }
function BU::__DechoYellow      { BU::__Decho "$1" "$__BU_MAIN_COLOR_YELLOW"    "$2"; }
# Easy "BU::__Decho()" function calls with specific text display colors.
function BU::__DechoHighlight           { BU::__Decho "$1" "$__BU_MAIN_COLOR_HIGLIGHT"  "$2"; }
function BU::__DechoHighlightCMD        { BU::__Decho "$1" "$__BU_MAIN_COLOR_CMD"       "$2"; }
function BU::__DechoHighlightError      { BU::__Decho "$1" "$__BU_MAIN_COLOR_ERROR"     "$2"; }
function BU::__DechoHighlightFunction   { BU::__Decho "$1" "$__BU_MAIN_COLOR_FUNCTION"  "$2"; }
function BU::__DechoHighlightNewstep    { BU::__Decho "$1" "$__BU_MAIN_COLOR_NEWSTEP"   "$2"; }
function BU::__DechoHighlightPath       { BU::__Decho "$1" "$__BU_MAIN_COLOR_PATH"      "$2"; }
function BU::__DechoHighlightSuccess    { BU::__Decho "$1" "$__BU_MAIN_COLOR_SUCCESS"   "$2"; }
function BU::__DechoHighlightVar        { BU::__Decho "$1" "$__BU_MAIN_COLOR_VAR"       "$2"; }
function BU::__DechoHighlightWarning    { BU::__Decho "$1" "$__BU_MAIN_COLOR_WARNING"   "$2"; }
# Tip : you can also pass a second argument when you call the following functions, which is the same than the "Decho" function's second argument
# (one of the color global variables defined in the main module's Colors.conf file, in the "ENCODING WITH THE "tput" COMMAND AND PRINTED AND REDIRECTED WITH THE "BU::Main::Decho::SetTextColor" FUNCTIONS" sub-section).
# Positionnal parameters :
#   $1  --> String to display.
#   $2  --> Text color to display.
#	$3	--> Background color display.
# Blink formatting.
function BU::Decho_FMT_Blink            { BU::Decho "$1" "$2" "$3" 'Blink'                         	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBold        { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold'                  	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldD       { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D'              	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDI      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'I'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDIS     { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'I' 'S'       || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDISU    { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'I' 'S' 'U'   || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDIU     { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'I' 'U'       || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDS      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'S'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDSU     { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'S' 'U'       || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldDU      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'D' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldI       { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'I'              	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldIS      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'I' 'S'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldISU     { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'I' 'S' 'U'       || return 1; return 0; }
function BU::Decho_FMT_BlinkBoldIU      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'I' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldS       { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'S'              	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldSU      { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'S' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BlinkBoldU       { BU::Decho "$1" "$2" "$3" 'Blink' 'Bold' 'U'              	|| return 1; return 0; }
function BU::Decho_FMT_BlinkD           { BU::Decho "$1" "$2" "$3" 'Blink' 'D'                     	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDI          { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'I'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDIS         { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'I' 'S'             	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDISU        { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'I' 'S' 'U'         	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDIU         { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'I' 'U'             	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDS          { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'S'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDSU         { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'S' 'U'             	|| return 1; return 0; }
function BU::Decho_FMT_BlinkDU          { BU::Decho "$1" "$2" "$3" 'Blink' 'D' 'U'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkI           { BU::Decho "$1" "$2" "$3" 'Blink' 'I'                      || return 1; return 0; }
function BU::Decho_FMT_BlinkIS          { BU::Decho "$1" "$2" "$3" 'Blink' 'I' 'S'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkISU         { BU::Decho "$1" "$2" "$3" 'Blink' 'I' 'S' 'U'             	|| return 1; return 0; }
function BU::Decho_FMT_BlinkIU          { BU::Decho "$1" "$2" "$3" 'Blink' 'I' 'U'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkS           { BU::Decho "$1" "$2" "$3" 'Blink' 'S'                     	|| return 1; return 0; }
function BU::Decho_FMT_BlinkSU          { BU::Decho "$1" "$2" "$3" 'Blink' 'S' 'U'                 	|| return 1; return 0; }
function BU::Decho_FMT_BlinkU           { BU::Decho "$1" "$2" "$3" 'Blink' 'U'                      || return 1; return 0; }
# Bold formatting.
function BU::Decho_FMT_Bold     { BU::Decho "$1" "$2" "$3" 'Bold'                  	|| return 1; return 0; }
function BU::Decho_FMT_BoldD    { BU::Decho "$1" "$2" "$3" 'Bold' 'D'              	|| return 1; return 0; }
function BU::Decho_FMT_BoldDI   { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'I'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldDIS  { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'I' 'S'      	|| return 1; return 0; }
function BU::Decho_FMT_BoldDISU { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'I' 'S' 'U'   || return 1; return 0; }
function BU::Decho_FMT_BoldDIU  { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'I' 'U'      	|| return 1; return 0; }
function BU::Decho_FMT_BoldDS   { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'S'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldDSU  { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'S' 'U'      	|| return 1; return 0; }
function BU::Decho_FMT_BoldDU   { BU::Decho "$1" "$2" "$3" 'Bold' 'D' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldI    { BU::Decho "$1" "$2" "$3" 'Bold' 'I'              	|| return 1; return 0; }
function BU::Decho_FMT_BoldIS   { BU::Decho "$1" "$2" "$3" 'Bold' 'I' 'S'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldISU  { BU::Decho "$1" "$2" "$3" 'Bold' 'I' 'S' 'U'      	|| return 1; return 0; }
function BU::Decho_FMT_BoldIU   { BU::Decho "$1" "$2" "$3" 'Bold' 'I' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldS    { BU::Decho "$1" "$2" "$3" 'Bold' 'S'              	|| return 1; return 0; }
function BU::Decho_FMT_BoldSU   { BU::Decho "$1" "$2" "$3" 'Bold' 'S' 'U'          	|| return 1; return 0; }
function BU::Decho_FMT_BoldU    { BU::Decho "$1" "$2" "$3" 'Bold' 'U'               || return 1; return 0; }
# Dim formatting
function BU::Decho_FMT_D    { BU::Decho "$1" "$2" "$3" 'D'                  || return 1; return 0; }
function BU::Decho_FMT_DI   { BU::Decho "$1" "$2" "$3" 'D' 'I'          	|| return 1; return 0; }
function BU::Decho_FMT_DIS  { BU::Decho "$1" "$2" "$3" 'D' 'I' 'S'      	|| return 1; return 0; }
function BU::Decho_FMT_DISU { BU::Decho "$1" "$2" "$3" 'D' 'I' 'S' 'U'  	|| return 1; return 0; }
function BU::Decho_FMT_DIU  { BU::Decho "$1" "$2" "$3" 'D' 'I' 'U'      	|| return 1; return 0; }
function BU::Decho_FMT_DS   { BU::Decho "$1" "$2" "$3" 'D' 'S'          	|| return 1; return 0; }
function BU::Decho_FMT_DSU  { BU::Decho "$1" "$2" "$3" 'D' 'S' 'U'      	|| return 1; return 0; }
function BU::Decho_FMT_DU   { BU::Decho "$1" "$2" "$3" 'D' 'U'              || return 1; return 0; }
# Italic formatting.
function BU::Decho_FMT_I    { BU::Decho "$1" "$2" "$3" 'I'          	|| return 1; return 0; }
function BU::Decho_FMT_IS   { BU::Decho "$1" "$2" "$3" 'I' 'S'      	|| return 1; return 0; }
function BU::Decho_FMT_ISU  { BU::Decho "$1" "$2" "$3" 'I' 'S' 'U'      || return 1; return 0; }
function BU::Decho_FMT_IU   { BU::Decho "$1" "$2" "$3" 'I' 'U'          || return 1; return 0; }
# Strikethrough formatting.
function BU::Decho_FMT_S    { BU::Decho "$1" "$2" "$3" 'S'          || return 1; return 0; }
function BU::Decho_FMT_SU   { BU::Decho "$1" "$2" "$3" 'S' 'U'      || return 1; return 0; }
# Underline formatting.
function BU::Decho_FMT_U    { BU::Decho "$1" "$2" "$3" 'U'      || return 1; return 0; }
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/DIRECTORIES.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Directories.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### DIRECTORIES FUNCTIONS
#### DEBUG ID : directories::directories-functions
__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS="directories::directories-functions";
## PROCESSING FUNCTIONS
## DEBUG ID : processing-functions
__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PROCESSING_FUNCTIONS="$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS::processing-functions";
# Separate processing steps displays from the rest of the main script with a line.
# Featured functions and files from the "functions" folder :
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Directories::ProcessingDir()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PROCESSING_FUNCTIONS";
    #**** Parameters ****
    local p_function=$1
    local p_parent=$2
    local p_name=$3
    #**** Variables ****
    local v_char='"'
    local v_path="$p_parent/$p_name"
    #**** Code ****
    # Arguments checking.
	if ! BU::Main::Args__Directories::ProcessingDir "$p_function" "$p_parent" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
	sleep "$PROJECT_STATUS_SLEEP_LINE";
    BU::EchoMsg "$(BU::Main::Headers::DrawLine "$v_char" "$__COL_RESET")" '-n' 'nodate';
    BU::EchoNewstep "Processing the $(BU::DechoHighlightPath "$p_name") folder in the parent folder $(BU::DechoHighlightPath "$p_parent").";
    BU::Newline;
    if "$p_function"; then
        BU::EchoSuccess "End of processing the $(BU::DechoHighlightPath "$p_name/") folder.";
		BU::EchoMsg "$(BU::Main::Headers::DrawLine "$v_char" "$__COL_RESET")" '-n' 'nodate';
		sleep "$PROJECT_STATUS_SLEEP_LINE";
		BU::Newline;
    else
        BU::EchoError "End of processing the $(BU::DechoHighlightPath "$p_name/") folder.";
		BU::EchoMsg "$(BU::Main::Headers::DrawLine "$v_char" "$__COL_RESET")" '-n' 'nodate';
		sleep "$PROJECT_STATUS_SLEEP_LINE";
		BU::Newline;
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## FOLDER CREATION FUNCTIONS
## DEBUG ID : folder-creation-functions
__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__FOLDER_CREATION_FUNCTIONS="$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS::folder-creation-functions";
# Overwriting an existing directory's content
# Featured functions and files from the "functions" folder :
#	- BU::EchoError			-> Echo.lib
#	- BU::EchoNewstep		-> Echo.lib
#	- BU::EchoSuccess		-> Echo.lib
#	- BU::Newline			-> Echo.lib
function BU::Main::Directories::OverwriteDir()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__FOLDER_CREATION_FUNCTIONS";
    #**** Parameters ****
    local p_path=$1;
	local p_authorization=$2;
    #**** Code ****
    # Checking first if the awaited arguments are given
    if ! BU::Main::Args__Directories::OverwriteDir "$p_path" "$p_authorization" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$p_path";
    BU::EchoNewstep "A non-empty folder with exactly the same name ($(BU::DechoHighlightPath "$p_name")) is already in the target folder $(BU::DechoHighlightPath "$p_parent/")";
	BU::EchoNewstep "Deleting the contents of the $(BU::DechoHighlightPath "$v_path/") folder";
	BU::Newline;
	if [ "$p_authorization" = "--rmdir" ]; then
        # TODO : Si la variable n'est pas initialisée.
        if [ -n "${p_path+x}" ]; then
            # WARNING ! DO NOT MODIFY THE FOLLOWING COMMAND, UNLESS YOU KNOW >>> EXACTLY <<< WHAT YOU DO !!!
            # WARNING ! IF YOU MODIFY THE NAME OF THE VARIABLES, PLEASE CHECK THE NAME OF EVERY
            # VARIABLES INTO THIS FUNCTION, OR ELSE THIS PROGRAM COULD OPERATE FROM THE ROOT DIRECTORY !!!!!!!!!
            # Check this link for more informations about this command --> https://github.com/koalaman/shellcheck/wiki/SC2115
            rm -rfv "${v_path/:?}/"*;
            BU::Main::Errors::HandleErrors "$?" "UNABLE TO DELETE THE CONTENT OF THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlightPath "$v_path/")") FOLDER." \
                "Please check the permissions of the targeted directory" "$v_path" "$v_path" \
                "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
            BU::EchoSuccess "Deletion of the contents of the folder $(BU::DechoHighlightPath "$v_path/") performed successfully";
            BU::Newline;
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        else
            BU::Main::Errors::HandleErrors "1" "" "" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
        fi
	fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# folder creation function, with the parent folder's path and the new folder's name as separated arguments.
# Featured functions and files from the "functions" folder :
#   - BU::Main::Args__Directories::Make        -> Main -> Args.lib
#   - BU::Main::Checkings::CheckFilePathWasCreated  -> Main -> Checkings.lib
#   - BU::Main::Directories::OverwriteDir           -> Main -> Directories.lib (this file)
#   - BU::Main::Directories::TriggerRootDirWarning  -> Main -> Directories.lib (this file)
#   - BU::Main::Errors::HandleErrors                -> Main -> Errors.lib
#   - BU::Main::Headers::DrawLine                   -> Main -> Headers.lib
#   - BU::DechoHighlightPath            -> Main -> Decho.lib
#   - BU::EchoError                     -> Main -> Echo.lib
#   - BU::EchoNewstep                   -> Main -> Echo.lib
#   - BU::EchoSuccess                   -> Main -> Echo.lib
function BU::Main::Directories::Make()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__FOLDER_CREATION_FUNCTIONS";
	#**** Parameters ****
	local p_parent=$1;	# String	- Emplacement of the currently processed directory's parent folder from the root directory.
	local p_name=$2;    # String	- Name of the folder to process (into its parent directory).
	local p_rm=$3;      # String	- Authorization to overwrite the targeted directory.
	#**** Variables ****
	local v_path="$p_parent/$p_name";	# String	- Path of the file to process.
	#**** Code ****
	# Checking first if the awaited arguments are given
    if ! BU::Main::Args__Directories::Make "$p_parent" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then return "$?"; fi
    # Checking second if the script is operating at the root directory.
    if ! BU::Main::Directories::TriggerRootDirWarning "$v_path"; then return 1; fi
	# If the folder to create doesn't exists, ths script creates it with the help of the "mkdir" command.
	if [ ! -d "$v_path" ]; then
		BU::EchoNewstep "Creating the $(BU::DechoHighlightPath "$p_name") folder in the parent folder $(BU::DechoHighlightPath "$p_parent/").";
		BU::Newline;
        mkdir -pv "$v_path"
        BU::Main::Errors::HandleErrors "$?" \
            "THE $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlightPath "$p_name/")") FOLDER CANNOT BE CREATED IN THE PARENT FOLDER $(BU::Main::Echo::KeepFormatting "$(BU::DechoHighlightPath "$p_parent/")") !" \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
        BU::EchoSuccess "The $(BU::DechoHighlightPath "$p_name") folder was successfully created in the $(BU::DechoHighlightPath "$p_parent/") folder.";
        BU::Newline;
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    # Else, if the folder to create already exists in its parent directory AND this folder already contains AT LEAST one file or folder.
	elif [ -d "$v_path" ] && [ "$(ls -A "$v_path")" ]; then
        if [ "$p_rm" = '--rmdir' ]; then
            BU::Main::Directories::OverwriteDir "$v_path" "$p_rm";
			if test "$?" -eq 0; then
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
            else
                return 1;
            fi
        fi
	# Else, if the folder to create already exists in its parent directory AND this folder is empty.
	elif [ -d "$v_path" ] && [ ! "$(ls -A "$v_path")" ]; then
		BU::EchoSuccess "The $(BU::DechoHighlightPath "$p_name/") folder already exists in the $(BU::DechoHighlightPath "$p_parent/") folder and is empty.";
		BU::Newline;
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    fi
}
# Folder creation function, with the parent folder's path and the directory's name as unique argument.
function BU::Main::Directories::MakePath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__FOLDER_CREATION_FUNCTIONS";
    #**** Parameters ****
    local p_path=$1;		# String	- Full path of the directory to create.
    local p_overwrite=$2;	# String	- Authorization to overwrite the directory.
    #**** Variables ****
    local v_parent; v_parent="$(echo "$p_path" | rev | cut -d '/' -f2- | rev)"; # Getting the parent directory of the folder to create.
    local v_target; v_target="$(echo "$p_path" | rev | cut -d '/' -f 1 | rev)"; # Getting the name of the folder to create.
    #**** Code ****
    if ! BU::Main::Args__Directories::MakePath "$p_path" "$p_overwrite" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    if [ "$p_overwrite" != 'rmdir' ]; then
        BU::Main::Directories::Make "$v_parent" "$v_target" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    else
        BU::Main::Directories::Make "$v_parent" "$v_target" '--rmdir' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    return 0;
}
# The function "CheckSTAT_LOG()" creates the log file and its path when the __BU_MAIN_STAT_LOG variable's value is "true",
# but in case the value is "false", it's necessary to check if the project's temporary folder exists anyway.
function BU::Main::Directories::MkTmpDir()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__FOLDER_CREATION_FUNCTIONS";
    local lineno="$LINENO"; if [ ! -d "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ]; then
        mkdir -p "$__BU_MAIN_PROJECT_TMP_DIR_PATH" ||
		{
			BU::Main::Status::ChangeSTAT_ECHO "true" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
			BU::Main::Errors::HandleErrors "1" "THE $(BU::Main::Checkings::CheckDirPathExists "$__BU_MAIN_PROJECT_TMP_DIR_PATH" 'true') CANNOT BE CREATED !" \
				"Please check at the mentionned line in the mentionned file." "$__BU_MAIN_PROJECT_TMP_DIR_PATH" \
				"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno";
			BU::Main::Status::ChangeSTAT_ECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
		}
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## PATH PROCESSING
## DEBUG ID : path-processing
__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING="$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS::path-processing";
# Getting the name of a target directory without its path.
function BU::Main::Directories::GetDirectoryName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING";
    #**** Parameters ****
    local p_path=$1;	# String	- Default : NULL	- Full path of the directory.
    #**** Variables ****
    local result;
    #**** Code ****
    if ! BU::Main::Args__Directories::GetDirectoryName "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    if [ -d "$p_path" ]; then
        shopt -s extglob;           # Enable +(...) glob syntax.
        result=${p_path%%+(/)};     # Trim however many trailing slashes exist
        result=${result##*/}:       # Remove everything before the last / that still remains
        shopt -u extglob;           # Disable +(...) glob syntax.
        echo -e "$result";
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Errors::HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-6 ))";
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Checking if the directory's sub-folders paths passed as argument exists, then print its path.
function BU::Main::Directories::GetDirectoryPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING";
    #**** Parameters ****
    local p_path=$1;    # String    - Default : NULL    - Path of the folder to get.
    #**** Code ****
    if ! BU::Main::Args__Directories::GetDirectoryPath "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    if [ -d "$p_path" ]; then
        echo -e "$p_path";
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        BU::Main::Errors::HandleErrors "1" "THE PROVIDED PATH IS INCORRECT !" "Please check if the provided path is correct." \
            "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))";
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# Getting parent folder's name only (without its full path from the root directory), then printing it.
function BU::Main::Directories::GetParentDirectoryName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING";
    #**** Parameters ****
    local p_path=$1;            # String	- Default : NULL    - Path of the child file or folder.
    local p_iterations=${2-1};  # Int   	- Default : 1       - Number of iterations, corresponding to the number of folders to go up in the directory tree.
    #**** Variables ****
    local result;
    #**** Code ****
    if ! BU::Main::Args__Directories::GetParentDirectoryName "$p_path" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    for ((i=0; i<p_iterations; i++)); do
        local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
            || {
                BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                    "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            }; pwd -P )";
        p_path="$v_parent";
    done
    shopt -s extglob;       # Enable +(...) glob syntax.
    result=${p_path%%+(/)};	# Trim however many trailing slashes exist.
    result=${result##*/};   # Remove everything before the last / that still remains.
    shopt -u extglob;       # Disable +(...) glob syntax.
    echo -e "$result";
}
# Getting parent folder's path from the root directory, then printing it
function BU::Main::Directories::GetParentDirectoryPath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING";
    #**** Parameters ****
    local p_path=$1;            # String    - Default : NULL    - Path of the child file or folder.
    local p_iterations=${2-1};  # Int       - Default : 1       - Number of iterations, corresponding to the number of folders to go up in the directory tree.
    #**** Variables ****
    local result;
    #**** Code ****
    if ! BU::Main::Args__Directories::GetParentDirectoryPath "$p_path" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    if [ "$p_iterations" -lt 1 ]; then
        p_iterations="$(BU::Main::BasicMaths::NegativeToPositive "$p_iterations")";
    fi
    if [ -d "$p_path" ]; then
        for ((i=0; i<p_iterations; i++)); do
            local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
                || {
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; BU::SetLastReturnValue "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_CURRENT_CODE";
                }; pwd -P )";
            p_path="$v_parent";
        done
        # Enable +(...) glob syntax.
        shopt -s extglob;
        # Trim however many trailing slashes exist.
        result=${p_path%%+(/)};
        # Disable +(...) glob syntax.
        shopt -u extglob;
        echo -e "$result";
    else
        local v_path_str="";
        local v_current_path="$p_path";
        for ((i=0; i<p_iterations; i++)); do
            local v_parent; v_parent="$( cd "$(dirname "$p_path")" > /dev/null 2>&1 \
                || {
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO GET THE PARENT DIRECTORY'S NAME" "Please check if the provided path is correct." "$p_path" \
                        "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; BU::SetLastReturnValue "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_CURRENT_CODE";
                }; pwd -P )"
            local v_path_cut; v_path_cut="${v_parent##*/}";
            local v_path_str+="$v_path_cut/";
            # Removing the unnecessary folders.
            # WARNING !!!! USE THE "rmdir" COMMAND ONLY !!!!
            # DO NOT USE THE "rm -rf" COMMAND AT ALL, OR FILES AND FOLDERS COULD BE UNINTENTIONNALY ERASED !!!!
            rmdir "$v_current_path"; BU::Main::Errors::HandleErrors "$?" "UNABLE TO ERASE THE $(BU::DechoHighlightPath "$v_current_path") NEWLY CREATED FOLDER !";
            local v_current_path="$v_parent";
        done
        BU::Main::Text::ReverseStringWordsOrder "$v_path_str" '/';
    fi
	BU::SetLastReturnValue 0;
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
	return 0;
}
# Check if the script is about to work at the root directory ('/').
function BU::Main::Directories::TriggerRootDirWarning()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_DIRECTORIES_LIB__CAT_DEBUG_ID__DIRECTORIES_FUNCTIONS" \
        "$__BU_MAIN_DIRECTORIES_LIB__SUBCAT_DEBUG_ID__DIRECTORIES_FUNCTIONS__PATH_PROCESSING";
	#**** Parameters ****
	local p_path=$1;	# String	- Default : NULL	- Path of the folder to check.
	#**** Code ****
	# Checking if the given path points towards the root directory or one of its subfolders
	# TODO : detecting if path points to a root sub-folder (like [ if "$p_path" = "/" ] || [ "$p_path" | cut blablabla ]).
	if [ "$(pwd "$p_path")" = "/" ] || [ "$(BU::Main::Directories::GetParentDirectoryPath "$p_path")" = '/' ]; then
		if [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" = "forbidden" ]; then
			BU::HeaderError "WARNING !!!!!! READ THIS MESSAGE CAREFULLY !!!!!!" 'strlen';
			BU::EchoError "The script was trying to operate at the root directory (or one of its sub directories) without authorization";
			BU::EchoError "Given path : $(BU::DechoHighlightPath "$p_path")";
			BU::EchoError "Authorization : $__BU_MAIN_STAT_OPERATE_ROOT";
			BU::Newline;
			BU::SetLastReturnValue "$__BU_MAIN_EXIT_PERMISSION_DENIED";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
			return "$__BU_MAIN_EXIT_CURRENT_CODE";
		elif [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" = "restricted" ]; then
            BU::HeaderWarning "WARNING !!!!!!! DO NOT SKIP THIS MESSAGE BEFORE READING IT CAREFULLY !!!!!!" 'strlen';
            BU::EchoWarning "You are about to operate at the root directory or one of its present sub-folders !";
			BU::EchoWarning "Given path : $(BU::DechoHighlightPath "$p_path")";
			BU::EchoWarning "Authorization : $__BU_MAIN_STAT_OPERATE_ROOT";
			BU::Newline;
			# Calling the function that processes the given answer.
			if BU::Main::Case::Read_Directories::TriggerRootDirWarning; then
				BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_CURRENT_CODE";
			else
				BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_CURRENT_CODE";
			fi
		fi
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
	return 0;
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/ECHO.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Echo.lib
# Module        : Main
# Description   : (Colored) text display functions.
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### PRINTING FORMATTED STRINGS
#### DEBUG ID : echo::printing-formatted-strings
__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS="echo::printing-formatted-strings";
## DEBUGGING
## DEBUG ID : debugging
__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS__DEBUGGING="$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS::debugging";
# This function only serves as text printer for the " BU::Main::Echo::Debug()" function.
function BU::Main::Echo::__Debug()
{
    BU::Main::Echo::__EchoVoid;
    echo "----------------------------------------" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH";
    echo "DEBUGGING THE FUNCTION $1" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH";
    echo; echo "Waiting for the timer for the $1() function to elapse"; echo;
    BU::Main::Echo::__EchoVoid;
}
# This function only serves as text printer for the " BU::Main::Echo::Debug()" function.
function BU::Main::Echo::DebugEnd()
{
    BU::ModuleInit::CheckIsDebugging && {
        if [ "${__BU_MAIN_ECHO__IS_DEBUGGING_THIS_FUNCTION,,}" = 'true' ]; then
            BU::Main::Echo::__EchoVoid;
            echo "---------------------------------------";
            echo "END OF THE DEBUGGING OF THE FUNCTION $1";
            BU::Main::Echo::__EchoVoid;
            __BU_MAIN_ECHO__IS_DEBUGGING_THIS_FUNCTION='false';
        fi
    } > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH";
}
# Printing the name of the processed function if the main script is launched with the "bash -x" command.
## TODO : RÉFLÉCHIR À LA MISE EN PLACE DE L'AFFICHAGE DU NOM DE LA FONCTION CIBLE LORS DE LA PROCÉDURE DE DÉBOGUAGE AVEC LA COMMANDE "bash -x".
function BU::Main::Echo::Debug()
{
    BU::ModuleInit::CheckIsDebugging && {
        #**** Parameters ****
        local p_filename=$1;    # String    - Default : NULL    - File where the function currently processed is defined.
        local p_funcname=$2;    # String    - Default : NULL    - Print the name of the function currently processed, during the debug procedure.
        local p_category=$3;    # String    - Default : NULL    - Get the category of the targeted function.
        local p_subcateg=$4;    # String    - Default : NULL    - Get the sub-category of the targeted function.
        #**** Code ****
        [ -n "$__BU_MAIN_STAT_DEBUB_CAT" ] &&
        {
            if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" = 'file' ] || [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX^^}" = 'F' ]; then
                local v_file="${p_filename%%.[Ll][Ii][Bb]*}";
                if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY[0],,}" == 'all' ]; then
                    BU::Main::Echo::__Debug "$p_funcname"; return 0;
                else
                    for targetFile in "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_FILES_ARRAY[@]}"; do
                        # If the "$targetFile" value is found in the array, and the function which comes from the "$v_file" file matches with the "$targetFile" variable's value.
                        [ "${targetFile,,}" == "${v_file,,}" ] && { BU::Main::Echo::__Debug "$p_funcname"; break; };
                    done
                fi
            elif [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" = 'function' ] || [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX^^}" = 'FNCT' ]; then
                if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_FUNCTIONS_ARRAY[0],,}" == 'all' ]; then
                    BU::Main::Echo::__Debug "$p_funcname"; return 0;
                else
                    for targetFunction in "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_FUNCTIONS_ARRAY[@]}"; do
                        # If the "$targetFunction" value is found in the array, and the function which comes from the "$p_funcname" file matches with the "$targetFunction" variable's value.
                        [ "${targetFunction,,}" == "${p_funcname,,}" ] && { BU::Main::Echo::__Debug "$p_funcname"; break; }
                    done
                fi
            elif [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" = 'category' ] || [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX^^}" = 'C' ]; then
                if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_CATEGORY_ARRAY[0],,}" == 'all' ]; then
                    BU::Main::Echo::__Debug "$p_funcname"; return 0;
                else
                    for targetCategory in "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_CATEGORY_ARRAY[@]}"; do
                        # If the "$targetCategory" value is found in the array, and the function which comes from the "$p_category" file matches with the "$targetCategory" variable's value.
                        [ "${targetCategory,,}" == "${p_category,,}" ] && { BU::Main::Echo__Debug "$p_funcname"; break; }
                    done
                fi
            elif [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" = 'subcategory' ] || [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX,,}" = 'sub-category' ] || [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX^^}" = 'S' ]; then
                if [ "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CATEGORY_ARRAY[0],,}" == 'all' ]; then
                    BU::Main::Echo::__Debug "$p_funcname"; return 0;
                else
                    for targetSubCategory in "${__BU_MODULE_INIT_STAT_DEBUG_BASHX_SUB_CATEGORY_ARRAY[@]}"; do
                        # If the "$targetSubCategory" value is found in the array, and the function which comes from the "$p_subcateg" file matches with the "$targetSubCategory" variable's value.
                        [ "${targetSubCategory,,}" == "${p_subcateg,,}" ] && { BU::Main::Echo__Debug "$p_funcname"; break; }
                    done
                fi
            fi
        }
        __BU_MAIN_ECHO__IS_DEBUGGING_THIS_FUNCTION='true';
    } > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH";
    return 0;
}
# Print void lines before and after calling a header.
function BU::Main::Echo::__EchoVoid()
{
printf "
" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" ||
    {
        echo >&2; echo "IN « ${BASH_SOURCE[0]} », LINE « $LINENO » --> WARNING --> UNABLE TO WRITE THE « ${FUNCNAME[0]} » IN THE « $__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH »" >&2; echo >&2; exit 1;
    }
}
# "BU::Echo<...>()" functions debug output for a better view during a debug process.
# It's better to also execute the project's script with the "bash - x $project_name" command, instead of the "./$project_name" way.
function BU::Main::Echo::__EchoOutput()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS__DEBUGGING";
	#**** Parameters ****
	local p_string=$1;     # String    - String to display.
	local p_context=$2;    # String    - Begin or end of the debug process.
	local p_type=$3;       # Char      - Type of message (error 'E', Msg 'm', newstep 'N', success 'S' or warning 'W').
	#**** Variables ****
	local v_strlen="${#p_string}";
	#**** Code ****
	# If the "$p_type" argument is a string, then the first character is extracted.
	if ! BU::IsAlphaChar "$p_type"; then
        local v_type=${p_type::1};
        p_type="$v_type";
	fi
	if [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" = 'false' ]; then return 0;
	elif [ "${__BU_MODULE_INIT_STAT_DEBUG,,}" = "true" ]; then
	    # Passing the "$__BU_MAIN_STAT_ECHO" global status variable's value from "false" to "true".
        if ! BU::Main::Status::CheckStatIsBackupEchoing; then
            local v_BU_MAIN_STAT_ECHO_val="$__BU_MAIN_STAT_ECHO"; BU::Main::Status::ChangeSTAT_ECHO "true" "${BASH_SOURCE[0]}" "$LINENO";
        fi
		BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PARENT" "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME" "f" || { BU::Main::Echo::__EchoCPLS "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Unable to create the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_NAME") debug log file" 'E' "CPLS"; exit 1; }
		BU::Main::Header::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" '' "$(( 24 + v_strlen ))";
        if [ "${p_context,,}" = "begin" ]; then
            BU::Main::Echo::__EchoVoid;
            if [ "${p_type^^}" = "E" ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}BEGIN DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "BEGIN DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type,,}" = 'm' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}BEGIN DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "BEGIN DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}BEGIN DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "BEGIN DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}BEGIN DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "BEGIN DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}BEGIN DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "BEGIN DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            fi
            BU::Main::Header::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" '' "$(( 24 + v_strlen ))";
            # Reassigning the "$__BU_MAIN_STAT_ECHO" global status variable's former value.
            if [ -n "$v_BU_MAIN_STAT_ECHO_val" ]; then
                __BU_MAIN_STAT_ECHO="$v_BU_MAIN_STAT_ECHO_val"; v_BU_MAIN_STAT_ECHO_val=''
            fi
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        elif [ "${p_context,,}" = "end" ]; then
            if [ "${p_type^^}" = "E" ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}END DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "END DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type,,}" = 'm' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}END DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "END DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'N' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}END DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "END DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'S' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}END DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "END DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            elif [ "${p_type^^}" = 'W' ]; then
                BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_}END DEBUGGING TEXT : $p_string${__BU_MAIN_COLOR_TXT_RESET}" > "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "In $(BU::Main::Args::PrintFFL "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO") --> Unable to write the $(BU::Decho "END DEBUGGING TEXT") debug test in the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_ECHO_OUTPUT_FILE_PATH") file"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
            fi
            BU::Main::Header::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" '' "$(( 24 + v_strlen ))";
            # Reassigning the "$__BU_MAIN_STAT_ECHO" global status variable's former value.
            if [ -n "$v_BU_MAIN_STAT_ECHO_val" ]; then
                __BU_MAIN_STAT_ECHO="$v_BU_MAIN_STAT_ECHO_val"; v_BU_MAIN_STAT_ECHO_val='';
            fi
            BU::Main::Echo::__EchoVoid; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        fi
    fi
}
# Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
function BU::Main::Echo::__EchoCPLS()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__PRINTING_FORMATTED_STRINGS__DEBUGGING";
    #**** Parameters ****
    local p_string=$1;  # Any       - Text to display.
    local p_option=$2;  # String    - "echo" command options.
    shift 2; pa_extraArgs=("$@");   # Array - More processing arguments (like the processing of a whole line-long string).
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    for val in "${pa_extraArgs[@]}"; do
        if [ "$val" = 'nodate' ]; then
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" 'n' || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -ne "$p_string";
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -e "$p_string";
                    fi
                    ;;
            esac
        elif [ -z "$val" ]; then
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" 'n' || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                    fi
                    ;;
            esac
        else
            case "$p_option" in
                '-n' | 'n')
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" 'n' || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -ne "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                    fi
                    ;;
                '' | *)
                    if BU::Main::Status::CheckStatIsInitializing; then
                        BU::ModuleInit::Msg "$p_string" || BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                    else
                        echo -e "$__BU_MAIN_TIME_DATE_DISPLAY $p_string";
                    fi
                    ;;
            esac
        fi
		if (( $(echo "$__BU_MAIN_STAT_TIME_HEADER > 0"    | bc -l ) )); then sleep "0"; fi
		if (( $(echo "$__BU_MAIN_STAT_TIME_NEWLINE > 0"   | bc -l ) )); then sleep "0"; fi
		if (( $(echo "$__BU_MAIN_STAT_TIME_TXT > 0"       | bc -l ) )); then sleep "0"; fi
    done
   # if (( $(echo "$num1 > $num2" |bc -l) ));
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### TEXT DISPLAYING
#### DEBUG ID : echo::text-displaying
__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING="echo::text-displaying";
## DISPLAYING A CONTEXT MESSAGE
## DEBUG ID : displaying-a-context-message
__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE="$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING::displaying-a-context-message";
# --> DISPLAYING A COLORED CONTEXT MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__BU_MAIN_STAT_TIME_TXT" STATUS VARIABLE.
# Error message
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoError()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
    #**** Parameters ****
    local p_string=$1;
    local p_option=$2;
    shift 2;
    local pa_extraArgs=("$@");  # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    if ! BU::Main::Status::CheckStatIsBackupEchoing; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'E' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_TXT_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'E' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'E' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_ERROR}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'E' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Normal message (without any extra color), with redirection checking.
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoMsg()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
    #**** Parameters ****
    local p_string=$1;
    local p_option=$2;
    shift 2;
    local pa_extraArgs=("$@");  # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    if ! BU::Main::Status::CheckStatIsBackupEchoing; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'm' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::CheckProjectLogStatus "$p_string" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'm' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'm' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoCPLS "$p_string" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'm' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# New sub-step message
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoNewstep()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
    #**** Parameters ****
    local p_string=$1;
    local p_option=$2;
    shift 2;
    local pa_extraArgs=("$@");  # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    if ! BU::Main::Status::CheckStatIsBackupEchoing; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'N' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_TXT_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'N' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'N' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_NEWSTEP}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'N' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Read input values
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#	- BU::CheckProjectLogStatus		--> Checkings.lib
function BU::EchoRead()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
	#**** Parameters ****
	local p_string=$1;     # User's keyboard input.
	#**** Code ****
	if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ] && [ "$__BU_MAIN_STAT_LOG" = "true" ] && [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ]; then
		echo -e "Keyboard input value : $(BU::DechoHighlightVar "$p_string")" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || { BU::Main::Echo::__EchoCPLS "" 'R' "CPLS"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; }
	fi; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Success message
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoSuccess()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
    #**** Parameters ****
    local p_string=$1;
    local p_option=$2;
    shift 2;
    local pa_extraArgs=("$@");  # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    if ! BU::Main::Status::CheckStatIsBackupEchoing; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'S' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_TXT_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'S' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'S' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_SUCCESS}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'S' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Warning message
# Usage :
#	BU::EchoError "<Text to write>" "<optional echo argument>" "<Any extra argument supported by the BU::CheckProjectLogStatus() function>"
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
function BU::EchoWarning()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ECHO_LIB__CAT_DEBUG_ID__TEXT_DISPLAYING" \
        "$__BU_MAIN_ECHO_LIB__SUBCAT_DEBUG_ID__TEXT_DISPLAYING__DISPLAYING_A_CONTEXT_MESSAGE";
    #**** Parameters ****
    local p_string=$1;
    local p_option=$2;
    shift 2;
    local pa_extraArgs=("$@");  # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::Main::Args::GetFuncArgsArrayValues "${FUNCNAME[0]}" "${pa_extraArgs[@]}";
    if ! BU::Main::Status::CheckStatIsBackupEchoing; then
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'W' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::CheckProjectLogStatus "${__BU_MAIN_COLOR_TXT_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'W' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    # Failsafe if any "BU::Echo<...>()" function has to be called in the "BU::CheckProjectLogStatus()" function.
    else
        BU::Main::Echo::__EchoOutput "$p_string" 'begin' 'W' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoCPLS "${__BU_MAIN_COLOR_TXT_WARNING}$__BU_MAIN_TXT_PRINT_TAB$__BU_MAIN_TXT_PRINT_TAB $p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        BU::Main::Echo::__EchoOutput "$p_string" 'end' 'W' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## DISPLAYING A COLORED MESSAGE
# --> DISPLAYING A COLORED MESSAGE WITH A PAUSE TIME DEPENDING ON THE "$__BU_MAIN_STAT_TIME_TXT" STATUS VARIABLE.
# Note : These function call the "BU::EchoMsg()" function in order to avoid rewriting tons of lines that would do the same thing.
# Aqua blue colored message.
function BU::EchoAqua()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_AQUA}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Black colored message.
function BU::EchoBlack()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_BLACK}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Blue colored message.
function BU::EchoBlue()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_BLUE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Cyan colored message.
function BU::EchoCyan()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_CYAN}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Fuchsia colored message.
function BU::EchoFuchsia()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_FUCHSIA}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Gray colored message.
function BU::EchoGray()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_GRAY}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Green colored message.
function BU::EchoGreen()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_GREEN}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Lime green colored message.
function BU::EchoLime()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_LIME}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Maroon colored message.
function BU::EchoMaroon()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_MAROON}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Navy blue colored message.
function BU::EchoNavy()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_NAVY}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Olive green colored message.
function BU::EchoOlive()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_OLIVE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Orange colored message.
function BU::EchoOrange()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_ORANGE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Pink colored message.
function BU::EchoPink()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_PINK}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Purple colored message.
function BU::EchoPurple()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_PURPLE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Red colored message.
function BU::EchoRed()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_RED}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Salmon colored message.
function BU::EchoSalmon()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_SALMON}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Silver colored message.
function BU::EchoSilver()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_SILVER}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Tan colored message.
function BU::EchoTan()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_TAN}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Teal colored message.
function BU::EchoTeal()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_TEAL}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Turquoise colored message.
function BU::EchoTurquoise()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_TURQUOISE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Violet colored message.
function BU::EchoViolet()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_VIOLET}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# White colored message.
function BU::EchoWhite()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_WHITE}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# Yellow colored message.
function BU::EchoYellow()
{
    #**** Parameters ****
    p_string=$1;        # Any       - String to display.
    p_option=$2;        # String    - "echo" command options.
    shift 2;
    local pa_extraArgs=("$@");      # Array - More processing arguments (like the processing of a whole line-long string) for the "BU::Main::Checkings::CheckProjectLogStatus" or the "BU::Main::Echo::__EchoCPLS" functions.
    #**** Code ****
    BU::EchoMsg "${__BU_MAIN_COLOR_TXT_YELLOW}$p_string${__BU_MAIN_COLOR_TXT_RESET}" "$p_option" "${pa_extraArgs[@]}" || return 1;
    return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### LINE BREAKS
#### DEBUG ID : echo::line-breaks
__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__LINE_BREAKS="echo::line-breaks";
## LINE BREAKS ACCORDING TO THE "$__BU_MAIN_PROJECT_LOG_FILE_PATH" VARIABLE VALUE
## DEBUG ID : line-breaks-according-to-the-project-log-file-var-val
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__LINE_BREAKS__LINE_BREAKS_ACCORDING_TO_THE_PROJECT_LOG_FILE_VAR_VAL="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__LINE_BREAKS::line-breaks-according-to-the-project-log-file-var-val":
# Redirecting the output of the "echo" command
# Featured functions and files from the "functions" folder :
#   - BU::CheckProjectLogStatus     --> Checkings.lib
#	- BU::Main::Errors::HandleErrors				--> Checkings.lib
function BU::Newline()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__LINE_BREAKS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__LINE_BREAKS__LINE_BREAKS_ACCORDING_TO_THE_PROJECT_LOG_FILE_VAR_VAL";
    #**** Parameters ****
    local p_number=$1;
    #**** Code ****
    if [ -n "$p_number" ]; then
        if ! BU::IsPositiveInt "$p_number"; then
            BU::EchoMsg "" "" "nodate";
            BU::Main::Echo::__EchoCPLS "$(BU::DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : the number of line breaks must be an integer" 'R';
            BU::EchoMsg "" "" "nodate";
        else
            # Doing X line breaks according to the number passed as argument.
            for ((i=0; i<p_number; i++)); do
                BU::EchoMsg "" "" "nodate";
            done
        fi
    else
        BU::EchoMsg "" "" "nodate";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/ERRORS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Errors.lib
# Module        : Main
# Description   : Errors handling functions.
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### ERRORS HANDLING FUNCTIONS
#### DEBUG ID : errors::errors-handling-functions
__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS="errors::errors-handling-functions";
## CLASSIC ERRORS HANDLING
## DEBUG ID : classic-errors-handling
__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__CLASSIC_ERRORS_HANDLING="$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS::classic-errors-handling";
# Saving time when displaying a newline, an error message and an exit or a return value.
# WARNING ! DO NOT CALL ANY FUNCTION THAT CALL THIS FUNCTION DIRECTLY OR INDIRECTLY HERE,
# OR THE SCRIPT WILL LOOP FOREVER IN CASE OF AN ERROR DURING THIS FUNCTION CALL !!!
function BU::Main::Errors::HandleSmallErrors()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS" \
        "$__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__CLASSIC_ERRORS_HANDLING";
    #**** Parameters ****
    local p_type=$1;        # Type of message to display ('E' = BU::EchoError; 'W' = BU::EchoWarning)
    local p_string=$2;      # String to display.
    local p_return=$3;      # Exit or return status ('E' = exit; 'R' = return).
    local p_cpls=$4;        # Enable the safe text printing mode.
    #**** Variables ****
    if [ "${p_cpls^^}" = 'CPLS' ]; then
        if [ "${__BU_MAIN_STAT_ECHO,,}" = 'false' ]; then
            local v_BU_STAT_ECHO_old="$__BU_MAIN_STAT_ECHO"; BU::Main::Status::ChangeSTAT_ECHO 'true' "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        fi
    fi
    #**** Code ****
    BU::Newline >&2;
    if      [ "${p_type^^}" = 'E' ];    then BU::EchoError      "$p_string" '' '';
    elif    [ "${p_type^^}" = 'W' ];    then BU::EchoWarning    "$p_string" '' '';
    # If no type of message to displays is passed as first argument, the script will choose between one of the accepted types.
    else
		local v_advise="Please don't forget to pass a type of message to display as first argument ('E' = BU::EchoError; 'W' = BU::EchoWarning)";
        if [ "$(( RANDOM%2 ))" = "0" ]; then
            BU::EchoError "$p_string    | ${__BU_MAIN_COLOR_TXT_RESET}$v_advise" '' '';
        else
            BU::EchoWarning "$p_string  | ${__BU_MAIN_COLOR_TXT_RESET}$v_advise" '' '';
        fi
    fi
    BU::Newline >&2
    # As the "BU::EchoWarning()" function will be called in case of a missing return or exit code (normally passed as second argument),
    # it's better to reset the value of the "$__BU_MAIN_STAT_ECHO" status variable condition per condition.
    if [ "${p_return^^}" = 'R' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then BU::Main::Status::ChangeSTAT_ECHO 'false' "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
        BU::SetLastReturnValue 1;
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$__BU_MAIN_EXIT_CURRENT_CODE";
    elif [ "${p_return^^}" = 'E' ]; then
        if [ "$v_BU_STAT_ECHO_old" = "true" ]; then BU::Main::Status::ChangeSTAT_ECHO 'false' "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        BU::Exit "$__BU_MAIN_EXIT_CURRENT_CODE";
    else
        BU::EchoWarning "${__BU_MAIN_COLOR_TXT_HIGHLIGHT}${FUNCNAME[0]}${__BU_MAIN_COLOR_TXT_WARNING} --> Warning : bad exit or return code given as second argument !"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; BU::Exit "$__BU_MAIN_EXIT_CURRENT_CODE";
    fi
    if [ "$v_BU_STAT_ECHO_old" = "true" ]; then __BU_MAIN_STAT_ECHO='false'; fi
    BU::SetLastReturnValue 0;
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
    return "$__BU_MAIN_EXIT_CURRENT_CODE";
}
# -----------------------------------------------
## EXIT AND RETURN CODES HANDLING
## DEBUG ID : exit-and-return-codes-handling
__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__CLASSIC_ERRORS_HANDLING="$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS::exit-and-return-codes-handling";
# Handling exit command from sourced files, as it's impossible to properly exit the script from these.
function BU::Exit()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS" \
        "$__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__CLASSIC_ERRORS_HANDLING";
    #**** Parameters ****
    local p_exitcode=$1;    # Int   : Exit code.
    local p_behavior=$2;    # Char  : Use "exit" or "return" keywords.
    #**** Code ****
    if BU::IsPositiveInt "$p_exitcode"; then
        if [ "${p_behavior^^}" = 'E' ] || [ -z "$p_behavior" ]; then
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit "$p_exitcode" || kill "$$";
        elif [ "${p_behavior^^}" = 'W' ]; then
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$p_exitcode";
        else
            # shellcheck disable=SC2034
            __BU_MAIN_STAT_DECHO='restrict';
            # shellcheck disable=SC2034
            __BU_MAIN_STAT_ECHO='true';
            BU::Newline 2 >&2;
            BU::EchoError "$(BU::DechoHighlightFunction "${FUNCNAME[0]}()") --> Error : No valid character passed as second argument ('E' (exit) or 'W' (warning) expected)";
            BU::Newline >&2;
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit "$p_exitcode"; kill "$__BU_MODULE_INIT_PROJECT_PID";
        fi
    else
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : unexpected exit code passed as argument";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit 1; kill "$__BU_MODULE_INIT_PROJECT_PID";
    fi
}
# Unsetting the last return value's variable value.
function BU::DeleteLastReturnValue() { unset __BU_MAIN_EXIT_CURRENT_CODE && return 0; }
# Setting the last function's return value in order to process it in another function.
function BU::SetLastReturnValue()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS" \
        "$__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__CLASSIC_ERRORS_HANDLING";
	#**** Parameters ****
	local p_code=${1:-1};		# Int	- Default : 1	- Return value.
	#**** Code ****
	if ! BU::Main::Args__Errors::SetLastReturnValue "$p_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then
        __BU_MAIN_EXIT_CURRENT_CODE="$__BU_MAIN_EXIT_NOT_PERMITTED";
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED";
    fi
	__BU_MAIN_EXIT_CURRENT_CODE="$p_code";
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
	return 0;
}
# -----------------------------------------------
## SCRIPT'S ERRORS HANDLING
## DEBUG ID : script-errors-handling
__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__SCRIPT_ERRORS_HANDLING="$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS::script-errors-handling";
# "BU::Main::Errors::HandleErrors()" function --> Handling file name presence.
function BU::Main::Errors::HandleErrors_File()        { if [ -z "$1" ]; then BU::DechoHighlightPath "<no specified file>"; else BU::DechoHighlightPath "$1"; fi; }
# "BU::Main::Errors::HandleErrors()" function --> Handling function name presence.
function BU::Main::Errors::HandleErrors_Function()    { if [ -z "$1" ]; then BU::DechoHighlightFunction "<no specified function>"; else BU::DechoHighlightFunction "$1"; fi; }
# "BU::Main::Errors::HandleErrors()" function --> Handling line number presence.
function BU::Main::Errors::HandleErrors_Line()        { if [ -z "$1" ]; then BU::DechoHighlight "<no specified line>"; else BU::DechoHighlight "$1"; fi; }
# Handling command outputs.
# Featured functions and files from the "basis" category :
#   -
function BU::Main::Errors::HandleErrors()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_ERRORS_LIB__CAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS" \
        "$__BU_MAIN_ERRORS_LIB__SUBCAT_DEBUG_ID__ERRORS_HANDLING_FUNCTIONS__SCRIPT_ERRORS_HANDLING";
	#**** Parameters ****
	local p_returnCode=$1;     # Int        - Default : NULL    - Return code of the last command executed. If you didn't launched any command before calling this function, you can pass any number different of '0' as first argument.
	local p_errorString=$2;    # String     - Default : NULL    - String of the type of error to display.
	local p_adviceString=$3;   # String     - Default : NULL    - String of characters displaying a tip to direct the user to the best solution to apply in case of a problem.
    local p_badValue=$4;       # String     - Default : NULL    - Incorrect value which caused the error.
	local p_file=$5;           # String     - Default : NULL    - The name of the file where the error occured.
	local p_function=$6;       # String     - Default : NULL    - The name of the function where the error occured.
	local p_lineno=$7;         # String     - Default : NULL    - Line on which the error message occured (obtained in a very simple way by calling the POSIX environment variable "$LINENO").
    #**** Variables ****
    local v_hdrString;
        v_hdrString="$(echo -ne "IN $(BU::Main::Errors::HandleErrors_File "$p_file") FILE, FUNCTION $(BU::Main::Errors::HandleErrors_Function "$p_function"), LINE $(BU::Main::Errors::HandleErrors_Line "$p_lineno") -->")";
	# ***** Code *****
	BU::Main::Status::CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
	if [ "$p_returnCode" -eq 0 ]; then
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
    else
        # -------- PART 1 : MANAGING THE CALL OF THIS "BU::Main::Errors::HandleErrors()" FUNCTION IF THIS "BU::Main::Errors::HandleErrors()" FUNCTION IS CALLED IN A FUNCTION CALLED BY THIS "BU::Main::Errors::HandleErrors()" FUNCTION
        # If the function needs to be called in the "BU::CheckProjectLogStatus()" function, then
        # this status variable's value MUST be set at "true", or else the script will loop forever.
        # WARNING : DO NOT call a text formatting function to format something else than the text color, or else the script will loop forever.
        if [ "${__BU_MAIN_STAT_ECHO,,}" = "true" ]; then
            if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "${__BU_MAIN_STAT_ERROR,,}" = "fatal" ]; then
                if [ "${__BU_MAIN_STAT_INITIALIZING,,}" = 'false' ]; then
                    BU::HeaderError "A FATAL ERROR OCCURED DURING A TEST IN THE $(BU::__DechoHighlightFunction "BU::CheckProjectLogStatus" "$__BU_MAIN_COLOR_ERROR") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !" 'strlen';
                else
                    BU::HeaderError "A FATAL ERROR OCCURED DURING THE $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME" "$__BU_MAIN_COLOR_ERROR")'S PROJECT INITIALIZATION" 'strlen';
                fi
            else
                if [ "${__BU_MAIN_STAT_INITIALIZING,,}" = 'false' ]; then
                    BU::HeaderError "AN ERROR OCCURED DURING A TEST IN THE $(BU::__DechoHighlightFunction "BU::CheckProjectLogStatus" "$__BU_MAIN_COLOR_ERROR") FUNCTION OR ANOTHER TEST WHERE THE MENTIONNED FUNCTION CANNOT BE CALLED !" 'strlen';
                else
                    BU::HeaderError "AN ERROR OCCURED DURING THE $(BU::__DechoHighlight "$__BU_MAIN_PROJECT_NAME" "$__BU_MAIN_COLOR_ERROR")'S PROJECT INITIALIZATION" 'strlen';
                fi
            fi
        fi
        # -------- PART 2 : PRINTING THE HEADER
        # Redirecting the log messages to the terminal, to show them to the user.
        if [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" = "log" ]; then
            local v_log_old="true"; __BU_MAIN_STAT_LOG_REDIRECT="tee"; BU::Main::Status::CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
        fi
        if [ "${__BU_MAIN_STAT_ERROR,,}" = "fatal" ]; then
            BU::HeaderRed "$v_hdrString FATAL ERROR : $p_errorString" >&2;
        else
            BU::HeaderRed "$v_hdrString ERROR : $p_errorString" >&2;
        fi
        # -------- PART 3 : GIVING AN ADVICE ABOUT THE ORIGIN OF THE ERROR TO THE USER/DEVELOPPER
        if [ -z "$p_adviceString" ]; then
            BU::EchoError "No advice to give."; BU::Newline >&2;
        else
            # Checking if the ' [/|\] ' substring exists only once, as separator from the advice and another comment.
            # IMPORTANT : the second argument of the "BU::Main::Text::GetSubStringOccurences" function MUST be SINGLE-quoted, or else the '\' will be interpreted.
            if [[ "$p_adviceString" == *" [/|\] "* ]] && [ "$(BU::Main::Text::GetSubStringOccurences "$p_advice" ' [/|\] ')" -eq 1 ]; then
                local v_string_part_1; v_string_part_1="$(echo "$1" | rev | cut -d ' [/|\] ' -f2- | rev)";   # Getting first sub-string.
                local v_string_part_2; v_string_part_2="$(echo "$1" | rev | cut -d ' [/|\] ' -f 1 | rev)";   # Getting second sub-string.
                BU::EchoError "$(BU::__DechoHighlight "Advice" "$__BU_MAIN_COLOR_ERROR") : $v_string_part_1" >&2;
                BU::Newline;
                BU::EchoError "$(BU::__DechoHighlight "Other comments" "$__BU_MAIN_COLOR_ERROR") : $v_string_part_2";
            # Checking if the ' [/|\] ' substring exists more than once, as separators from the advice and any other comments.
            # IMPORTANT : the second argument of the "BU::Main::Text::GetSubStringOccurences" function MUST be SINGLE-quoted, or else the '\' will be interpreted.
            elif [[ "$p_adviceString" == *" [/|\] "* ]] && [ "$(BU::Main::Text::GetSubStringOccurences "$p_advice" " [/|\] ")" -gt 1 ]; then
                true;
            else
                BU::EchoError "$(BU::__DechoHighlight "Advice" "$__BU_MAIN_COLOR_ERROR") : $p_adviceString" >&2;
            fi
        fi
        BU::Newline;
        if [ -z "$p_badValue" ]; then
            BU::EchoError "Value(s) that caused this error : $(BU::__DechoOrange 'no value' "$__BU_MAIN_COLOR_ERROR") OR $(BU::DechoOrange 'an unknown error')"; BU::Newline >&2;
        else
            BU::EchoError "Value(s) that caused this error : $(BU::__DechoHighlightVar "$p_badValue" "$__BU_MAIN_COLOR_ERROR")"; BU::Newline >&2;
        fi
        if [ "${__BU_MAIN_STAT_ERROR,,}" = "fatal" ]; then
            BU::EchoError "Stopping the execution of $(BU::__DechoHighlight "$(basename "$0")" "$__BU_MAIN_COLOR_ERROR")."; BU::Newline >&2;
            BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
            exit "$__BU_MAIN_EXIT_CURRENT_CODE";
        else
			if [ "${__BU_MAIN_STAT_ERROR,,}" == 'warning' ]; then
				# Calling the function that processes the given answer.
				BU::Main::Case::Read_Errors::HandleErrors;
			fi
		fi
        # -------- PART 4 : WRITING THE ERROR REPORT IN THE PROJECT'S LOG FILE IN CASE THE "$__BU_MAIN_STAT_ECHO" VARIABLE IS SET TO TRUE (SAFE MODE IF THE WRITING FUNCTIONS ARE CALLED FROM THE "BU::CheckProjectLogStatus()" FUNCTION).
        if [ "${__BU_MAIN_STAT_ECHO,,}" = "true" ] && [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
            BU::EchoWarning "" 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ||
            {
                BU::Main::Errors::HandleSmallErrors "Unable to write in the $(BU::__DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PATH" "$__BU_MAIN_COLOR_WARNING") projectlog file from the $(BU::DechoHighlightFunction "${FUNCNAME[0]}()") function" 'R' 'CPLS';
            }
        fi
        if [ "$v_log_old" = "true" ]; then
            __BU_MAIN_STAT_LOG_REDIRECT="log"; BU::Main::Status::CheckSTAT_LOG_REDIRECT "$(basename "${BASH_SOURCE[0]}")" "$LINENO";
        fi
        if BU::IsInt "$p_returnCode"; then
            BU::SetLastReturnValue "$p_returnCode"
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$p_returnCode";
        else
            BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_CURRENT_CODE";
        fi
    fi
}
# -----------------------------------------------
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/FILES.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Files.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### FILES PROCESSING FUNCTIONS
## DEBUG ID : files::files-processing-functions
__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS="files::files-processing-functions";
## PROCESSING FUNCTIONS
## DEBUG ID : processing-functions
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__PROCESSING_FUNCTIONS="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::processing-functions";
# This function only repeats some parts of the following function.
function BU::Main::Files::__ProcessingFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__PROCESSING_FUNCTIONS";
    #**** Parameters ****
    local p_output=$1;
    local p_name=$2;
    local p_char=$3;
    #**** Code ****
    if [ "$p_output" = 'E' ]; then
        BU::EchoError "End of processing the $(BU::DechoHighlightPath "$p_name") file";
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$v_char" "$__COL_RESET")" '-n' 'nodate';
        BU::Newline;
        sleep "$__BU_MAIN_STAT_TIME_TXT";
    elif [ "$p_output" = 'S' ]; then
        BU::EchoSuccess "End of processing the $(BU::DechoHighlightPath "$p_name") file";
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$p_char" "$__COL_RESET")" '-n' 'nodate';
        BU::Newline;
        sleep "$__BU_MAIN_STAT_TIME_TXT";
    else
        BU::EchoWarning "";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Separate processing steps displays from the rest of the main script between two horizontal lines.
# Featured functions and files from the "functions" folder :
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Files::ProcessingFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__PROCESSING_FUNCTIONS";
    #**** Parameters ****
    local p_function=$1;
    local p_name=$2;
    shift; local pa_arr; pa_arr=$("$@");
    #**** Variables ****
    local v_char="'";
    #**** Code ****
    # Arguments checking.
    if ! BU::Main::Args__Files::ProcessingFile "$p_function" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi;
	sleep "$__BU_MAIN_STAT_TIME_TXT";
    BU::EchoMsg "$(BU::Main::Headers::DrawLine "$v_char" "$__COL_RESET")" '-n' 'nodate';
    BU::EchoNewstep "Processing the $(BU::DechoHighlightPath "$p_name") file in the $(BU::DechoHighlightPath "$p_parent") parent directory.";
    BU::Newline;
    case "$p_function" in
        'BU::Main::Files::Make')
            if BU::Main::Files::Make "${pa_arr[@]}"; then
                BU::Main::Files::__ProcessingFile 'S' "$p_name" "$p_char";
            else
                BU::Main::Files::__ProcessingFile 'E' "$p_name" "$p_char";
            fi
            ;;
        'OverwriteFile')
            if BU::Main::Files::OverwriteFile "${pa_arr[@]}"; then
                BU::Main::Files::__ProcessingFile 'S' "$p_name" "$p_char";
            else
                BU::Main::Files::__ProcessingFile 'E' "$p_name" "$p_char";
            fi
            ;;
    esac
}
# -----------------------------------------------
## FILE CREATION FUNCTIONS
## DEBUG ID : file-creation-functions
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::file-creation-functions";
# Overwriting a file
# Featured functions and files from the "functions" folder :
#	- BU::EchoError			-> Main -> Echo.lib
#	- BU::EchoNewstep		-> Main -> Echo.lib
#	- BU::EchoSuccess		-> Main -> Echo.lib
#	- BU::Newline			-> Main -> Echo.lib
function BU::Main::Files::OverwriteFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS";
    #**** Parameters ****
    local p_path=$1;
	local p_authorization=$2;
    #**** Code ****
    # Checking first if the awaited arguments are given
    if ! BU::Main::Args__Files::OverwriteFile "$p_path" "$p_authorization" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$p_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    if [ "$p_authorization" = "true" ]; then
		BU::EchoNewstep "The $(BU::DechoHighlightPath "$p_path/") file already exists and is not empty.";
		BU::EchoNewstep "Overwriting data from file $(BU::DechoHighlightPath "$p_path/")";
		BU::Newline;
		true > "$p_path";
		BU::Main::Errors::HandleErrors "$?" "THE CONTENT OF THE $(BU::DechoHighlightPath "$p_path/") FILE HAD NOT BEEN OVERWRITTEN" "" "$p_path" \
			"$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
		BU::EchoSuccess "The content of the $(BU::DechoS "$p_path/") file has been successfully overwritten";
		BU::Newline;
	else
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# File creation function, with the parent folder's path and the file's name as separated arguments.
# Featured functions and files from the "functions" folder :
#   - BU::Main::Args__Files::Make                   -> Main -> Args.lib
#   - BU::Main::Checkings::CheckFilePathWasCreated  -> Main -> Checkings.lib
#   - BU::Main::Directories::TriggerRootDirWarning  -> Main -> Directories.lib
#   - BU::Main::Errors::HandleErrors                -> Main -> Errors.lib
#   - BU::Main::Files::OverwriteFile                -> Main -> Files.lib (this file)
#   - BU::Main::Headers::DrawLine                   -> Main -> Headers.lib
#   - BU::DechoHighlightPath            -> Main -> Decho.lib
#   - BU::EchoError                     -> Main -> Echo.lib
#   - BU::EchoNewstep                   -> Main -> Echo.lib
#   - BU::EchoSuccess                   -> Main -> Echo.lib
function BU::Main::Files::Make()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS";
	#**** Parameters ****
    local p_parent=$1;  # String    : Emplacement of the currently processed file's parent folder from the root directory.
    local p_name=$2;    # String    : Name of the file to process (into its parent directory).
    shift 2;
    pa_touchVals=("$@");
	#**** Variables ****
	local v_path="$p_parent/$p_name";	# Path of the file to process.
	#**** Code ****
	# Checking first if the target partition is not fully used.
	BU::Main::Checkings::CheckDiskUsedSpace "$v_path" 'true' || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	# Checking if the awaited arguments are given.
    if ! BU::Main::Args__Files::Make "$p_parent" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi;
    # Checking second if the script is operating at the root directory.
    BU::Main::Directories::TriggerRootDirWarning "$v_path" || return 1;
	# If the file to create doesn't exists, ths script creates it with the help of the "touch" command.
	if [ ! -f "$v_path" ]; then
        BU::EchoNewstep "Creating the $(BU::DechoHighlightPath "$p_name") file in the parent folder $(BU::DechoHighlightPath "$p_parent/").";
		touch "$v_path"; BU::Main::Checkings::CheckFilePathWasCreated "$v_path";
		# Testing if the file has been created by checking the return code of the "BU::Main::Checkings::CheckFilePathWasCreated" function via the "BU::Main::Errors::HandleErrors" function.
        # An error may come from the fact that the user did not run the script in superuser mode, a script that tried to create a file in a folder
		# where the user is not allowed to create a file without superuser privileges.
		BU::Main::Errors::HandleErrors "$?" "THE $(BU::DechoHighlightPath "$p_name") FILE CANNOT BE CREATED IN THE $(BU::DechoHighlightPath "$p_parent/") PARENT FOLDER." \
            "Please check the permissions of the targeted directory" "$v_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-4 ))";
		BU::EchoSuccess "The $(BU::DechoHighlightPath "$p_name") file was successfully created in the $(BU::DechoHighlightPath "$p_parent") folder.";
        BU::Newline;
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	# Else, if the file to be created already exists AND it is NOT empty.
	elif [ -f "$p_path" ] && [ -s "$p_path" ]; then
        if BU::Main::Files::OverwriteFile "$p_path"; then
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        else
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
        fi
	# Else, if the file to be created already exists AND it is empty.
	elif [ -f "$p_path" ] && [ ! -s "$p_path" ]; then
		BU::EchoSuccess "The $(BU::DechoHighlightPath "$p_path/") file already exists in the $(BU::DechoHighlightPath "$p_parent/") folder and is empty.";
		BU::Newline;
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	fi
}
# File creation function, with the parent folder's path and the file's name as unique argument.
function BU::Main::Files::MakePath()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS";
    #**** Parameters ****
    local p_path=$1;    # String : Full path of the file to create.
    #**** Variables ****
    local v_parent; v_parent="$(echo "$p_path" | rev | cut -d '/' -f2- | rev)"; # Getting the parent directory of the file to create.
    local v_target; v_target="$(echo "$p_path" | rev | cut -d '/' -f 1 | rev)"; # Getting the name of the file to create.
    #**** Code ****
	# Checking first if the target partition is not fully used.
	BU::Main::Checkings::CheckDiskUsedSpace "$__BU_MAIN_PROJECT_COLOR_TEXT_CODE_FILE_PATH" 'true';
    if ! BU::Main::Args__Files::MakePath "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    BU::Main::Files::Make "$v_parent" "$v_target" || return 1;
    return 0;
}
# Create a file directly in the computer's memory to redirect the informations that are often updated instead of using the hard drive.
# This method is safer for SSD drives, faster for HDD drives, and no permissions are needed.
function BU::Main::Files::MakeFileInMemory()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS";
    #**** Parameters ****
    local p_filename=$1;    # String :name of the file to create in the computer's random access memory.
    #**** Code ****
    echo "$p_filename";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Creating the project's log file.
function BU::Main::Files::CreateProjectLogFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_CREATION_FUNCTIONS";
	# Checking first if the target partition is not fully used.
	BU::Main::Checkings::CheckDiskUsedSpace "$__BU_MAIN_PROJECT_LOG_FILE_PATH" 'true';
    #**** Variables ****
    local v_terminfo_v; v_terminfo_v="$($(ps -p "$(ps -p "$$" -o ppid=)" o args=) -v)";
    #**** Code ****
    if ! BU::Main::Checkings::CheckProjectRelatedFile "$__BU_MAIN_PROJECT_LOG_FILE_PARENT" "$__BU_MAIN_PROJECT_LOG_FILE_NAME" 'f'; then BU::EchoError "UNABLE TO CREATE THE $(BU::DechoHighlight "$__BU_MAIN_PROJECT_NAME")'S LOG FILE"; BU::Exit '1'; fi
    BU::EchoSuccess "Successfully created the $(BU::DechoHighlightPath "$__BU_MAIN_PROJECT_LOG_FILE_PATH") file.";
    if [ "${__BU_MAIN_STAT_DECHO,,}" = 'true' ];    then BU::Main::Status::ChangeSTAT_DECHO "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    if [ "${__BU_MAIN_STAT_ECHO,}"  = 'true' ];     then BU::Main::Status::ChangeSTAT_ECHO  "false" "$(basename "${BASH_SOURCE[0]}")" "$LINENO" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; fi
    # Redirecting the initializer's log file content into the log file.
    BU::HeaderBlue "INITIALIZATION PROCESS LOG OUTPUT";
    BU::EchoNewstep "Sourced configuration files :"; for val in "${__BU_MAIN_MODULE_CONFIG_FILES_PATH_ARRAY[@]}"; do BU::EchoMsg "$val"; done; BU::Newline;
    BU::EchoNewstep "Sourced library files : "; for val in "${__BU_MAIN_MODULE_LIB_FILES_PATH_ARRAY[@]}"; do BU::EchoMsg "$val"; done; BU::Newline;
	if (( "${#__BU_MODULE_INIT_MSG_ARRAY[@]}" >= 1 )); then
		BU::EchoNewstep "Initialization log output :"; BU::Newline;
        for val in "${__BU_MODULE_INIT_MSG_ARRAY[@]}"; do
            BU::CheckProjectLogStatus "$val";
        done
    fi
    # Gathering informations about the user's operating system, allowing me to correct any bug that could occur on a precise Unix-like operating system.
    BU::HeaderBlue "GETTING INFORMATIONS ABOUT USER'S SYSTEM";
    # Getting operating system family.
    BU::EchoNewstep "Operating system family : $(BU::DechoHighlight "$OSTYPE")";
    BU::Newline;
    # Getting operating system's informations (Android's Termux terminal emulator) :
    BU::IsOSAndroidTermux && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : ";
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
    # Getting operating system's informations (FreeBSD) :
    BU::IsOSFreeBSD && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : ";
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
    # Getting operating system's informations (Linux platforms or Android without the Termux terminal emulator) :
    BU::IsOSLinux && {
        if [ -f "/etc/os-release" ]; then
            # Getting operating pretty system name.
            BU::EchoNewstep "Operating system pretty name : $(awk -F= '/PRETTY/ {print $2}' '/etc/os-release')";
            BU::Newline;
            # Gathering OS informations from the "/etc/os-release" file.
            BU::EchoNewstep "Operating system general informations :";
            BU::EchoMsg "$(cat '/etc/os-release')" "" "nodate";
            BU::Newline;
        else
            BU::EchoWarning "No available informations ($(BU::DechoHighlight '/etc/os-release') file not found)";
            BU::Newline;
        fi
        # Getting operating system extra informations (Windows Subsystem for Linux, etc...).
        BU::EchoNewstep "Operating system extra informations :";
        if [[ "$(< /proc/sys/kernel/osrelease)" == *[M-m]icrosoft* ]]; then BU::EchoMsg "Distro running on Windows Subsystem for Linux : $(awk -F= '/^NAME/{print $2}' /etc/os-release)"; fi
        BU::Newline;
    }
    # Getting operating system's informations (Haiku OS) :
    BU::IsOSHaiku && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : Haiku OS";
        BU::Newline;
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
    # Getting operating system's informations (OpenBSD) :
    BU::IsOSOpenBSD && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : ";
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
    # Getting operating system's informations (NetBSD) :
    BU::IsOSNetBSD && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : ";
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
    # Getting operating system's informations (Mac OS) :
    BU::IsOSx && {
        # Getting operating system pretty name.
        BU::EchoNewstep "Operating system pretty name : ";
        # Gathering OS informations.
        BU::EchoNewstep "Operating system general informations :";
    }
	# Getting Bash language's version.
    BU::EchoNewstep "Bash version : $(BU::DechoHighlight "$BASH_VERSION")";
    BU::Newline;
	# Getting terminal emulator's name and version.
	# shellcheck disable=SC2016
    BU::EchoNewstep "Terminal (emulator) version : $(BU::DechoHighlight "$v_terminfo_v")" || BU::EchoWarning "$(BU::DechoHighlight '$v_terminfo_v') : bad command call.";
    BU::Newline;
    BU::EchoSuccess "Successfully got the user's system's informations.";
    # Purging the "$__BU_MODULE_INIT_MSG_ARRAY" variable from the logged messages, after writing its content in the project's log file, in order to free memory.
    __BU_MODULE_INIT_MSG_ARRAY='';
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## GETTING FILE INFORMATIONS
## DEBUG ID : getting-file-informations
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::getting-file-informations";
# Getting the size of a file in bytes.
function BU::Main::Files::GetByteSize()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;    # Path to the file to process.
    local p_base=$2;        # Byte measure unit base (binary prefix (eg : MiB) or metric prefix (eg : MB)).
    #**** Code ****
    if [ -z "$p_base" ]; then
        wc --bytes < "$p_filepath" || \
            { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the size in bytes of the $(BU::DechoHighlightPath "$p_filepath") file"; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; };
    # Else, if a value is passed to the "base" parameter AND this value is an integer.
    elif [ -n "$p_base" ] && BU::IsInt "$b_base"; then
        # Convert the size from plain number to human readable metric prefix.
        if [ "$p_base" -ne 1024 ]; then
            BU::Main::BasicMaths::BytesToHuman "$(wc --bytes < "$p_filepath")" "$p_base" || \
                { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the size in bytes of the $(BU::DechoHighlightPath "$p_filepath") file"; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; };
        # Convert the size from plain number to human readable binary prefix.
        else
            BU::Main::BasicMaths::BytesToHuman "$(wc --bytes < "$p_filepath")" "$p_base" || \
                { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the size in bytes of the $(BU::DechoHighlightPath "$p_filepath") file"; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; };
        fi
    else
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : The byte measure unit byte $(BU::DechoHighlight "$p_base") is not an integer"; BU::Newline >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the file's creation date.
# Please note, some file systems don't store the file's creation date. In this case, the "stat" command will return '0'.
function BU::Main::Files::GetCreationDate()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    if ! stat -c %W "$p_filepath"; then
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the $(BU::DechoHighlightPath "$p_filepath") file's creation date"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED";
    elif [ "$(stat -c %W "$p_filepath")" -eq 0 ]; then
        BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : This filesystem ($(BU::DechoHighlight "$__BU_MAIN_FS_NAME")) does not stores the files creation dates"; BU::Newline; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED";
    fi
	## TODO
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the total number of characters in a file.
function BU::Main::Files::GetCharactersNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    wc --chars < "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the total number of characters in the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the last file's access date.
function BU::Main::Files::GetLastAccess()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
     "$p_filename" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the last access date from the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the last file's modification date.
function BU::Main::Files::GetLastModification()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    date -r "$p_filename" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the last modification date from the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    return 0;
}
# Getting the total number of lines in a file.
function BU::Main::Files::GetLinesNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    wc --lines < "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the total number of lines in the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the max line length in a file.
function BU::Main::Files::GetMaxLineLength()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****last access date
    wc --max-line-length < "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the max line length in the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the owner of a file.
function BU::Main::Files::GetOwnerName()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    stat -c "%U" "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the name of the owner of the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the group of the owner of a file.
function BU::Main::Files::GetOwnerGroup()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    stat -c "%G" "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the group of the owner of the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the total number of characters in a file.
function BU::Main::Files::GetWordsNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__GETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    #**** Code ****
    wc --words < "$p_filepath" || { BU::EchoWarning "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") : Unable to get the total number of words in the $(BU::DechoHighlightPath "$p_filepath") file"; BU::EchoWarning "Please check the permissions of this file"; BU::Newline; BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NOT_PERMITTED"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## SETTING FILE INFORMATIONS
## DEBUG ID : setting-file-informations
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__SETTING_FILE_INFORMATIONS="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::setting-file-informations";
# Setting a fake last access date to a file.
function BU::Main::File::SetFileLastAccess
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__SETTING_FILE_INFORMATIONS";
    #**** Parameters ****
    local p_filepath=$1;
    local p_fakedate=$2;
    #**** Code ****
    if ! BU::Main::Args__Files::SetFileLastAccess "$p_filepath" "$p_fakedate" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## FILE SOURCING
## DEBUG ID : file-sourcing
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_SOURCING="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::file-sourcing";
# Sourcing dependencies files.
function BU::Main::Files::SourceFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__FILE_SOURCING";
    #**** Parameters ****
    local p_path=$1;
    #**** Code ****
    if [ -f "$p_path" ]; then
		BU::EchoNewstep "Sourcing the $(BU::DechoHighlightPath "$p_path") file";
		BU::Newline
        # shellcheck disable=SC1090
        if source "$p_path"; then
            BU::EchoSuccess "Sourced file : $(BU::DechoHighlightPath "$p_path")";
			BU::Newline;
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
        else
            local C="$?";
            BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_NOT_PERMITTED" "UNABLE TO SOURCE THIS FILE : $(BU::DechoHighlightPath "$p_path")" "Please verify that the file's path passed as argument exists, and that you have read rights on this file." "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-5 ))";
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
        fi
    else
        local C="$?";
        BU::Main::Errors::HandleErrors "$__BU_MAIN_EXIT_NOT_PERMITTED" "UNABLE TO FIND THIS FILE : $(BU::DechoHighlightPath "$p_path")" "Please pass a filepath as argument" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-8 ))";
		return "$C";
    fi
}
# -----------------------------------------------
## TEXT FILE PARSING
## DEBUG ID : text-file-parsing
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__TEXT_FILE_PARSING="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS::text-file-parsing";
# Getting a specific line from a text file.
function BU::Main::Files::GetLineFromTextFile()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__FILES_PROCESSING_FUNCTIONS__TEXT_FILE_PARSING";
    #**** Parameters ****
    local p_source=$1;          # File to parse
    local p_wanted_line=$2;     # Line to get in the file
    #**** Variables ****
    local i=0;                  # Line incrementer
    #**** Code ****
	# shellcheck disable=SC2002
    cat "$p_source" | while read -r line; do
        # Incrementing the line incrementer variable's value...
        i=$(( i+1 ));
        # ... until it reaches the wanted line.
        if [ "$i" -eq "$p_wanted_line" ]; then
			# shellcheck disable=SC2034
            __BU_MAIN_TXT_STORE_LINE="$line";
        fi
    done
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### ARCHIVES PROCESSING FUNCTIONS
#### DEBUG ID : files::archive-processing-functions
__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS="files::archive-processing-functions";
## (UN)COMPRESSION FUNCTIONS
## DEBUG ID : (un)compression-functions
__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS__UN_COMPRESSION_FUNCTIONS="$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS::(un)compression-functions";
# Adding files or folders into an archive.
function BU::Main::Files::AddToArchive()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS__UN_COMPRESSION_FUNCTIONS";
}
# Compressing archives according to the used compression method.
# Featured functions and files from the "functions" folder :
#   -
function BU::Main::Files::Compress()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS__UN_COMPRESSION_FUNCTIONS";
    #**** Parameters ****
    local p_cmd=$1;         # String    - Default : NULL    - Compression command.
    local p_opts=$2;        # String    - Default : NULL    - Options of the compression command (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
    local p_name=$3;        # String    - Default : NULL    - Archive's name.
    shift 3;
    local p_paths=("$@");   # Array - Default : NULL    - Paths to the files / folders to archivate.
    #**** Code ****
    if BU::IsArrayEmpty "${p_paths[@]}"; then local lineno="$LINENO";
        BU::Main::Args::PrintBadOption 'z' \
            "Please pass as fourth argument the path of the directory/ies or the file(s) to compress (mandatory argument) [/|\] $(BU::Main::Args::PrintFFLErrorOccured "$p_funcname" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno")" \
            'p_path' "${p_paths[@]}" "$p_filename" "$p_funcname" "$p_lineno"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    # There is no need to pass the "$p_opts" parameter as argument for the "BU::Main::Args__Files::Compress()", as this is an optional current function's parameter.
    # EVEN IF THIS PARAMETER IS OPTIONAL, ANY OTHER FOLLOWING PARAMETERS ARE MANDATORY, SO USE AN EMPTY STRING BETWEEN QUOTES WHEN YOU CALL THE CURRENT FUNCTION !!!
    if ! BU::Main::Args__Files::Compress "$cmd" "$opts" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # If the 7-Zip compression format is wanted.
    if [ "$p_cmd" == '7z' ]; then
        7z a "$p_opts" "$p_opts" "$p_name" "${p_paths[@]}" || {
            # TODO : Gérer les cas d'erreur de compression au format 7-Zip.
            return 1;
        }
    # Else, if the BinHex compression format is wanted (works on Apple operating systems).
    elif [ "$p_cmd" == 'binhex' ]; then
        binhex "$p_opts" "${p_paths[@]}" > "$p_name"|| {
            # TODO : Gérer les cas d'erreur de compression au format BinHex.
            return 1;
        }
    # Else, if the Bzip2 compression format is wanted.
    elif [[ "${p_cmd^^}" = TBZ?(2) ]] || [[ "${p_cmd,,}" = tar?(.)bz?(2) ]]; then
        tar "-jcf$p_opts" "" "" || {
            # TODO : Gérer les cas d'erreur de compression au format Bzip2.
            return 1;
        }
    # Else, if the Gzip compression format is wanted.
    elif [ "${p_cmd^^}" = 'TGZ' ] || [[ "${p_cmd,,}" = tar?(.)gz ]]; then
        tar "-zcf$p_opts" "$p_name" "${p_paths[@]}" || {
            # TODO : Gérer les cas d'erreur de compression au format Gzip.
            return 1;
        }
    # Else, if the LZMA compression is wanted for a Tar archive.
    elif [ "${p_cmd^^}" = 'TXZ' ] || [[ "${p_cmd,,}" = tar?(.)xz ]]; then
        tar "JCxf$p_opts" "$p_name" "${p_paths[@]}" || {
            # TODO : Gérer les cas d'erreur de compression au format Gzip.
            return 1;
        }
    # Else, if the zip compression format is wanted.
    elif [ "$p_cmd" == 'zip' ]; then
        zip "$p_opts" "$p_name" "${p_paths[@]}" || {
            # TODO : Gérer les cas d'erreur de compression au format zip.
            return 1;
        }
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Deleting a file or a folder stored in an archive.
function BU::Main::Files::DeleteInArchive()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS__UN_COMPRESSION_FUNCTIONS";
    #**** Parameters ****
    local p_cmd=$1;     # String    - Default : NULL    - Compression command.
    local p_opts=$2;    # String    - Default : NULL    - Options of the compression command (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
    local p_name=$3;    # String    - Default : NULL    - Archive's name.
    #**** Code ****
}
# Uncompressing archives according to the used compression method.
# Featured functions and files from the "functions" folder :
#   - BU::Main::Errors::HandleErrors      -> Handles.lib
#   - BU::EchoSuccess       -> Echo.lib
#   - BU::Newline           -> Echo.lib
function BU::Main::Files::Uncompress()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILES_LIB__CAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_FILES_LIB__SUBCAT_DEBUG_ID__ARCHIVES_PROCESSING_FUNCTIONS__UN_COMPRESSION_FUNCTIONS";
    #**** Parameters ****
    local p_cmd=$1;     # String    - Default : NULL    - Compression command.
    local p_opts=$2;    # String    - Default : NULL    - Options of the compression command (in case a command call is not mandatory, please leave an empty string as second argument while calling this function).
    local p_name=$3;    # String    - Default : NULL    - Archive's name.
    local p_dest=$4;    # String    - Default : NULL    - Folder destination of the uncompressed data.
    #**** Code ****
    # There is no need to pass the "$p_opts" parameter as argument for the "BU::Main::Args__Files::Uncompress()", as this is an optional current function's parameter.
    # EVEN IF THIS PARAMETER IS OPTIONAL, ANY OTHER FOLLOWING PARAMETERS ARE MANDATORY, SO USE AN EMPTY STRING BETWEEN QUOTES WHEN YOU CALL THE CURRENT FUNCTION !!!!!
    if ! BU::Main::Args__Files::Compress "$cmd" "$p_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # If the 7-Zip compression format is wanted.
    if [ "$p_cmd" == '7z' ]; then
        7z x "" "" "" "";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/FILESYSTEM.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Filesystem.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154,SC2016
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### HARD DRIVE'S FILE SYSTEM PROCESSING
#### DEBUG ID : filesystem::hard-drive-file-system-processing
__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING="filesystem::hard-drive-file-system-processing";
## CHECKING FILE SYSTEM'S INFORMATIONS
## DEBUG ID : checking-filesystem-informations
__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING="$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING::checking-filesystem-informations";
# Checking if the current partition is full.
function BU::Main::Filesystem::IsPartitionFull()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING";
    #**** Parameters ****
    local p_fileFS=$1;  # String    - Default : NULL    - Target file's file system.
    #**** Code ****
    if [ -z "$p_fileFS" ]; then return "$__BU_MAIN_EXIT_INVALID_ARGUMENT";
    elif    [ ! -d "$p_fileFS" ] || \
            [ ! -f "$p_fileFS" ]; then return "$__BU_MAIN_EXIT_DIR_FILE_NOT_FOUND";
    fi
	BU::IsOSAndroidTermux && {
        if [[ "$(df -aH "$p_fileFS")" == 100% ]]; then
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NO_SPACE_LEFT";
		else
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		fi
	}
	BU::IsOSFreeBSD && {
        true;
	}
	BU::IsOSHaiku && {
		if [[ "$(df -th "$p_fileFS | awk 'FNR==10 {print $3}'")" == 0 ]]; then
            return "$__BU_MAIN_EXIT_NO_SPACE_LEFT";
		else
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		fi
	}
	BU::IsOSLinux && {
		if [[ "$(df -Th "$p_fileFS" | awk 'FNR==2 {print $5}')" == 0[A-Za-z] ]]; then
            BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$__BU_MAIN_EXIT_NO_SPACE_LEFT";
		else
			BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
		fi
	}
	BU::IsOSNetBSD && {
        true;
	}
	BU::IsOSOpenBSD && {
        true;
	}
	BU::IsOSx && {
		true;
	}
}
# -----------------------------------------------
## GETTING FILE SYSTEM'S INFORMATIONS
## DEBUG ID : getting-filesystem-informations
__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS="$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING::getting-filesystem-informations";
# Getting the file system path.
function BU::Main::Filesystem::GetFSDevice()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's device";
    BU::IsOSHaiku && local v_cmd="df \"$p_path\"        | awk 'FNR == 5 {print \$2}' || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$1}' || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the total size in bytes allocated to a given file system.
function BU::Main::Filesystem::GetFSTotalSize()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's total size in bytes";
    BU::IsOSHaiku && local v_cmd="df \"$p_path\"        | awk 'FNR == 9 {print \$3\" \"\$4}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$3}'            || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the mounted partition of a given file system.
function BU::Main::Filesystem::GetFSMountPoint()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's mount point";
    BU::IsOSHaiku && local v_cmd="df \"$p_path\"        | awk 'FNR == 2 {print \$3}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$7}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the used size in bytes of a given file system.
function BU::Main::Filesystem::GetFSUsedSizeBytes()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's used size in bytes";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$4}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # Since no used size in bytes is provided by the "df" command on Haiku, it's necessary to check it manually.
    BU::IsOSHaiku && {
        # Getting the file system's total size in bytes.
        local v_totalSize; v_totalSize="$(BU::Main::Filesystem::GetFSTotalSize "$p_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; })";
        # Getting the file system's available size in bytes.
        local v_availableSize; v_availableSize="$(BU::Main::Filesystem::GetFSAvailableSize "$p_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; })";
        # Getting the used size by substracting the available size from the total size.
        local v_usedSize; v_usedSize="$(( v_totalSize - v_availableSize ))";
        BU::EchoMsg "$v_usedSize" '-n' 'nodate';
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
    }
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the percentage of the used space of a given file system.
function BU::Main::Filesystem::GetFSUsedSizePercent()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Default : NULL    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's used size percentage";
    BU::IsOSAndroidTermux   && local v_cmd="df -aH \"$p_path\"  | awk 'FNR == 2 {print \$5}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux           && local v_cmd="df -Th \"$p_path\"  | awk 'FNR == 2 {print \$6}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # Since no used partition size percentage is provided by the "df" command on Haiku, it's necessary to check it manually.
    BU::IsOSHaiku && {
        # Getting the file system's total size in bytes.
        local v_totalSize; v_totalSize="$(BU::Main::Filesystem::GetFSTotalSize "$p_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; })";
        # Getting the file system's available size in bytes.
        local v_availableSize; v_availableSize="$(BU::Main::Filesystem::GetFSAvailableSize "$p_path" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; })";
        # Getting the used percentage.
        local v_usedSize; v_usedSize="$(( v_totalSize * v_availableSize / 100 ))";
        BU::EchoMsg "$v_usedSize%" '-n' 'nodate';
        BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
    }
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the available size in bytes of a given file system.
function BU::Main::Filesystem::GetFSAvailableSize()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's available size in bytes";
    BU::IsOSHaiku && local v_cmd="df \"$p_path\"        | awk 'FNR == 10 {print \$3}'       || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$5}'        || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# Getting the type of the file system of a directory or a file.
function BU::Main::Filesystem::GetFSType()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__HARD_DRIVE_FILE_SYSTEM_PROCESSING__GETTING_FILE_SYSTEM_INFORMATIONS";
    #**** Parameters ****
    local p_path=$1;    # String    - Path of the file or the folder to process.
    #**** Variables ****
    local v_code=0;     # Int       -  Return code to modify in the "$v_cmd" string.
    local v_warn; v_warn="$(BU::__DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU::__DechoHighlightPath "$p_path") file system's type";
    BU::IsOSHaiku && local v_cmd="df \"$p_path\"        | awk 'FNR == 4 {print \$3}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    BU::IsOSLinux && local v_cmd="df -Th \"$p_path\"    | awk 'FNR == 2 {print \$2}'    || { BU::EchoWarning \"\$v_warn\" '-n' 'nodate'; v_code='1'; return \"\$v_code\"; }";
    #**** Code ****
    if ! BU::Main::Args__Filesystem::GetFSInfos "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if ! BU::Main::CMDS::GetCommandReturnOutputValue "$v_cmd"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    eval "$v_cmd";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$v_code";
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
#### PERMISSION AND OWNERSHIP PROCESSING
#### DEBUG ID : filesystem::permission-and-ownership-processing
__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING="filesystem::permission-and-ownership-processing";
## NON-RECURSIVE PERMISSION AND OWNERSHIP PROCESSING
## DEBUG ID : non-recursive
__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING__NON_RECURSIVE="$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING::non-recursive";
# Fonctions d'attribution de propriété de fichier à l'utilisateur.
# Required functions and files into the "Bash-Utils/src/functions" folder :
#   - BU::Main::Checkings::CheckRootEUID -> Checkings.lib
#   - BU::EchoError     -> Echo.lib
#   - BU::EchoNewstep   -> Echo.lib
#   - BU::EchoSuccess   -> Echo.lib
#   - BU::Main::Headers::DrawLine      -> Headers.lib
#   - BU::Main::Errors::HandleErrors  -> Headers.lib
function BU::Main::Filesystem::Chown()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING__NON_RECURSIVE";
    #**** Parameters ****
    p_currentOwner=$1;  # This parameter is used in the translated messages, stored into their own variables.
    p_newOwner=$2;      # New owner of the directory / file.
    p_path=$3;          # Path of the directory / file to process.
    p_option=$4;        # Chown command option(s).
    #**** Code ****
    if ! BU::Main::Args__Filesystem::Chown "$p_currentOwner" "$p_newOwner" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # The "chown" command has to be used with super-user privileges,
    if ! BU::Main::Checkings::CheckRootEUID; then BU::SetLastReturnValue "$__BU_MAIN_EXIT_NOT_PERMITTED"; local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # If the path passed as argument doesn't exists.
    if [ -d "$p_path" ]; then
        BU::EchoNewstep "Changing the ownership rights of the  $(BU::__DechoHighlightPath "$p_path/") folder from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner").";
        BU::Newline;
        # Changing ownership recursively.
        case "$p_option" in
            'R')
                if chown -Rv "$p_newOwner" "$p_path"; then
                    BU::EchoSuccess "The rights of the $(BU::__DechoHighlightPath "$p_path") folder have been successfully changed from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner")";
                    BU::Newline;
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
                else
                    BU::Main::Errors::HandleErrors "1" "Unable to change the rights of the $(BU::__DechoHighlight "$p_path/") folder" "" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-7 ))";
                    BU::Newline;
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                fi
                ;;
            '')
                # Changing ownership non-recursively.
                if chown -v "$p_newOwner" "$p_path"; then
                    BU::EchoSuccess "The rights of the $(BU::__DechoHighlightPath "$p_path") folder have been successfully changed from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner")";
                    BU::Newline;
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
                else
                    BU::Main::Errors::HandleErrors "1" "UNABLE TO CHANGE THE RIGHTS OF THE $(BU::__DechoHighlightPath "$p_path/") FOLDER" \
                        "Please run the script with the command $(BU::__DechoHighlight "bash -x $PROJECT_NAME") to check what happened" \
                        "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-11 ))";
                    BU::Newline;
                    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
                fi
                ;;
            *)
                BU::Main::Errors::HandleErrors "1" "THE $(BU::__DechoHighlightFunction "${FUNCNAME[0]}")'S FUNCTION $(BU::__DechoHighlightPath "$p_option") OPTION PASSED AS 4TH ARGUMENT IS NOT SUPPORTED" \
                    "The supported options for directory processing are :" "$p_option" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-2 ))";
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0
            ;;
        esac
    else
        # Checking first if the path is a filepath. If not, then no correct path is passed as argument.
        if [ -f "$p_path" ]; then
            BU::EchoNewstep "Changing the ownership rights of the  $(BU::__DechoHighlightPath "$p_path/") file from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner").";
            BU::Newline;
            # Changing ownership
            if chown -v "$p_newOwner" "$p_path"; then
                BU::EchoSuccess "The rights of the $(BU::__DechoHighlightPath "$p_path") file have been successfully changed from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner").";
                BU::Newline;
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
            else
                BU::Main::Errors::HandleErrors "$?" "Unable to change the rights of the $(BU::__DechoHighlightPath "$p_path") file !";
                BU::Newline;
                BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
            fi
        else
            BU::Main::Errors::HandleErrors "1" "THE $(BU::__DechoHighlightPath "$p_path") FILE DOESN'T EXISTS" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
        fi
    fi
}
# -----------------------------------------------
## RECURSIVE PERMISSION AND OWNERSHIP PROCESSING
## DEBUG ID : recursive
__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING__RECURSIVE="$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING::recursive";
# Calling the "chown" command to change recursively directory ownership
# Required functions and files into the "Bash-Utils/src/functions" folder :
#	- BU::Main::Checkings::CheckRootEUID		-> Checkings.lib
#	- BU::EchoError			-> Echo.lib
#	- BU::EchoNewstep		-> Echo.lib
#	- BU::EchoSuccess		-> Echo.lib
#	- BU::Newline			-> Echo.lib
#	- BU::Main::Errors::HandleErrors		-> Headers.lib
function BU::Main::Filesystem::ChownRec()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_FILESYSTEM_LIB__CAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING" \
        "$__BU_MAIN_FILESYSTEM_LIB__SUBCAT_DEBUG_ID__PERMISSION_AND_OWNERSHIP_PROCESSING__RECURSIVE";
    #**** Paramètres ****
    local p_currentOwner=$1;   # This parameter is used in the messages.
    local p_newOwner=$2;
    local p_path=$3;
    #**** Code ****
    if ! BU::Main::Args__Filesystem::ChownRec "$p_currentOwner" "$p_newOwner" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # The "chown" command has to be used with super-user privileges,
    if ! BU::Main::Checkings::CheckRootEUID; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    # If the path passed as argument doesn't exists.
    if [ ! -d "$p_path" ]; then
        BU::Main::Errors::HandleErrors "1" "" "" "$p_path" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))";
    fi
    BU::EchoNewstep "Recursive change of the ownership rights of the new folder $(BU::__DechoHighlightPath "$p_path/") from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner")";
	BU::Newline;
    # On change les droits du fichier créé par le script.
	# Comme il est exécuté en mode super-utilisateur, tout dossier ou fichier créé appartient à l'utilisateur root.
	# Pour attribuer les droits de lecture, d'écriture et d'exécution (rwx) à l'utilisateur normal, on appelle
	# la commande chown avec pour arguments :
	#		- Le nom de l'utilisateur à qui donner les droits.
	#		- Le chemin du dossier cible.
	if chown -Rv "$p_newOwner" "$p_path"; then
		BU::EchoSuccess "The rights of the $(BU::__DechoHighlightPath "$p_path/") folder have been successfully changed from $(BU::__DechoHighlight "$p_currentOwner") to $(BU::__DechoHighlight "$p_newOwner")";
		BU::Newline;
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
	else
        BU::EchoError "Unable to change the rights of the $(BU::__DechoHighlightPath "$p_path/") folder";
		BU::Newline;
		BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
    fi
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/HEADERS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Headers.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### FUNCTIONS DEFINITION
#### DEBUG ID : headers::functions-definition
__BU_MAIN_HEADERS_LIB__CAT_DEBUG_ID__FUNCTIONS_DEFINITION="headers::functions-definition";
## HEADERS BASIS CREATION FUNCTIONS
## DEBUG ID : headers-basis-creation-functions
__BU_MAIN_HEADERS_LIB__SUBCAT_DEBUG_ID__FUNCTIONS_DEFINITION__HEADERS_BASIS_CREATION_FUNCTIONS="$__BU_MAIN_HEADERS_LIB__CAT_DEBUG_ID__FUNCTIONS_DEFINITION::headers-basis-creation-functions";
# Fonction de création et d'affichage de lignes selon le nombre de colonnes de la zone de texte du terminal.
function BU::Main::Headers::DrawLine()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_HEADERS_LIB__CAT_DEBUG_ID__FUNCTIONS_DEFINITION" \
        "$__BU_MAIN_HEADERS_LIB__SUBCAT_DEBUG_ID__FUNCTIONS_DEFINITION__HEADERS_BASIS_CREATION_FUNCTIONS";
	#**** Parameters ****
	local p_lineChar=$1;   # Premier paramètre servant à définir le caractère souhaité lors de l'appel de la fonction.
	local p_lineColor=$2;  # Deuxième paramètre servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction.
	local p_strlen=$3;     # Getting the lenght of the string, in order to adapt the line's lenght to the string's lenght.
	local p_bgColor=$4;    # Setting a background color behind the line.
	#**** Code ****
    # If no character is specified for the character line.
    if [ -z "$p_lineChar" ]; then
        p_lineChar="$__BU_MAIN_TXT_CHAR_HEADER_LINE";
    fi
	# Checking if the "$p_lineChar" parameter's value is a string instead of a single character, and getting the first character only.
	if ! BU::IsAlphaNumChar "$p_lineChar"; then
        p_lineChar="${p_lineChar:0:1}";
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
		echo -ne "$p_lineColor";
	fi
	if test "$p_bgColor" != ""; then
        echo -ne "$p_bgColor";
	fi
    # Displaying the desired character on the whole line. To do this, using a "for" loop, we start reading it from
	# the first column (1), then we read the entire line to the end of the terminal's text box. At each call
	# of the "echo" command, a character is displayed and colored according to the encoding defined and written above.
	# The 'i' variable in the "for i in" loop has been replaced by an underscore '_' to stop Shellcheck from sending a warning
	# message due to the non-declaration of the variable 'i', although this does not change anything when the script is executed.
	# Checking if the line must be adapted to the string's lenght.
	if [ -n "$p_strlen" ]; then
        if BU::IsInt "$p_strlen"; then
            for _ in $(eval echo -e "{1..$__p_strlen}"); do
                echo -n "$p_lineChar";
            done
        else
            BU::Main::Errors::HandleSmallErrors 'W' "${__BU_MAIN_COLOR_TXT_HIGHLIGHT}${FUNCNAME[0]}${__BU_MAIN_COLOR_TXT_WARNING} --> Warning : The value passed for the $(BU::DechoHighlightVar "strlen") parameter is not an integer" 'R' 'CPLS';
        fi
	else
        for _ in $(eval echo -e "{1..$__BU_MAIN_TXT_COLS}"); do
            echo -n "$p_lineChar";
        done
    fi
    # Definition (here, reinitialization) of the color of the characters following the last character of the header line
	# using the same code snippet as the first condition, to write the terminal's base color encoding (it is recommended
	# to call the "tput sgr0" command to reset the color according to the profile options of the terminal).
	# As with any color encoding, this plain text will not be displayed on the terminal.
	# En pratique, La couleur des caractères suivants est déjà encodée quand ils sont appelés via une des fonctions d'affichage.
	# Cette réinitialisation de la couleur du texte n'est qu'une mini-sécurité permettant d'éviter d'avoir la couleur de l'invite de
	# commandes encodée avec la couleur des headers si l'exécution du script est interrompue de force avec la combinaison "CTRL + C"
	# ou mise en pause avec la combinaison "CTRL + Z", par exemple.
	if test "$p_lineColor" != "" || test "$p_bgColor" != ""; then
        echo -ne "$__BU_MAIN_COLOR_TXT_RESET";
	fi
	# Étant donné que l'on a utilisé l'option '-n' de la commande "echo", on effectue un saut de ligne pour éviter d'avoir
	# à le répéter après chaque appel de la commande pour laisser un espace vide entre la ligne et le prochain caractère.
	echo;
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Fonction de création de base d'un header (Couleur et caractère de ligne, couleur et chaîne de caractères).
# Since this function can be called in the "BU::Main::Echo::__EchoOutput()" function,
# even if the "$__BU_MAIN_STAT_ECHO" status variable's value is set to "true",
# it's better to create a failsafe, to avoid experiencing an infinite loop.
function BU::HeaderBase()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_HEADERS_LIB__CAT_DEBUG_ID__FUNCTIONS_DEFINITION" \
        "$__BU_MAIN_HEADERS_LIB__SUBCAT_DEBUG_ID__FUNCTIONS_DEFINITION__HEADERS_BASIS_CREATION_FUNCTIONS";
	#**** Parameters ****
	local p_lineColor=$1;      # Defining the wanted character's color to display  servant à définir la couleur souhaitée du caractère lors de l'appel de la fonction "BU::Main::Headers::DrawLine".
	local p_lineChar=$2;       # Defining the wanted character to display when calling the "BU::Main::Headers::DrawLine()" function.
	local p_stringColor=$3;    # Defining the color of the header's string
	local p_stringTxt=$4;      # String displayed between the two lines.
	local p_strlen=$5;         # Getting the lenght of the string, in order to adapt the line's lenght to the string's lenght.
	local p_bgColorCol=$6;     # Defining the background color.
	local p_bgColorPos=$7;     # Defining the background color's position (first line, text or second line, or a mix ?).
	#**** Variables ****
    local v_stat_time_newline="$__BU_MAIN_STAT_TIME_NEWLINE";   # Setting the new lines display time's global status variable to 0 seconds, because the header's pause time is already set.
    local v_stat_time_txt="$__BU_MAIN_STAT_TIME_TXT";           # Setting the normal text display time's global status variable to 0 seconds, because the header's pause time is already set.
    # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    local v_loop_error;
    if [ -n "$p_strlen" ] && [ "$p_strlen" = 'strlen' ]; then local v_strlen; v_strlen="$("${#p_stringTxt}")"; fi
	#**** Code ****
	__BU_MAIN_STAT_TIME_NEWLINE="0";
	__BU_MAIN_STAT_TIME_TXT="0";
    BU::Newline;
    # If no value is passed via the background color's position's parameter.
    if [ -z "$p_bgColorPos" ]; then
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineChar" "$p_lineColor" "$v_strlen" "$p_bgColorCol")" '' "nodate";
        BU::EchoMsg "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_TXT_RESET}";
        BU::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineChar" "$p_lineColor" "$v_strlen" "$p_bgColorCol")" '' "nodate";
    # Else, if a value is passed via the background color's position's parameter.
    else
        # This value MUST be an integer.
        if BU::IsIntPos "$p_bgColorPos" && [ "${#p_bgColorPos}" -ge 1 ] && [ "${#p_bgColorPos}" -le 3 ]; then
            # Transforming the "$p_bgColorPos" variable in an array of integers.
            read -ra int_array <<< "$p_bgColorPos";
            for i in "${int_array[@]}"; do
                if [[ "$i" == '1'* ]]; then
                    BU::DechoBGColor "$(Bu::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineChar" "$p_lineColor" "$v_strlen" "$p_bgColorCol")" "nodate")" "$p_stringColor" "$p_bgColorCol" || { local C="$?"; v_loop_error='error'; break; };
                elif [[ "$i" == *'2'* ]]; then
                    BU::DechoBGColor "$(BU::EchoMsg "$p_stringColor##> $p_stringTxt${__BU_MAIN_COLOR_TXT_RESET}")" "$p_stringColor" "" "$p_bgColorCol" || { local C="$?"; v_loop_error='error'; break; };
                elif [[ "$i" == *'3' ]]; then
                    BU::DechoBGColor "$(Bu::EchoMsg "$(BU::Main::Headers::DrawLine "$p_lineChar" "$p_lineColor" "$v_strlen" "$p_bgColorCol")" "nodate")" "$p_stringColor" "$p_bgColorCol" || { local C="$?"; v_loop_error='error'; break; };
                elif [[ "$i" == *'1'* ]] || [[ "$i" == *'3'* ]]; then
                    BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : the values were not arranged in ascending order, like 123, 12, 13 or 23" 'R';
                else
                    BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : the value passed for the $(BU::DechoHighlightVar "p_bgColorPos") parameter is a bad integer (1, 2 AND / OR 3 are supported), " 'R';
                fi
            done; if [ "${v_loop_error,,}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
        elif BU::IsIntPos "$p_bgColorPos" && [ "${#p_bgColorPos}" -gt 3 ]; then
            BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : the lenght of the value passed as $(BU::DechoHighlightVar "p_bgColorPos") argument is too big" 'R';
        elif [ "${#p_bgColorPos}" -lt 1 ]; then
            BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : the lenght of the value passed as $(BU::DechoHighlightVar "p_bgColorPos") argument is null" 'R';
        else
            BU::Main::Errors::HandleSmallErrors 'W' "$(BU::DechoHighlightFunction "${FUNCNAME[0]}") --> Warning : the value passed for the $(BU::DechoHighlightVar "p_bgColorPos") parameter is not a positive integer" 'R';
        fi
    fi
    BU::Newline;
    sleep "$__BU_MAIN_STAT_TIME_HEADER";
    __BU_MAIN_STAT_TIME_NEWLINE="$v_stat_time_newline";     # Resetting the new lines display time's global status variable to its original value.
    __BU_MAIN_STAT_TIME_TXT="$v_stat_time_txt";             # Resetting the normal text display time's global status variable to its original value.
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
## UNICOLOR HEADERS
# Positional parameters, and their correspondences with the parameters of the "BU::HeaderBase()" function :
# Except for the "$1" positional parameter, the three other are totally optional.
#   $1  --> "$p_stringTxt"
#   $2  --> "$p_strlen"
#   $3  --> "$p_bgColorCol"
#   $4  --> "$p_bgColorPos"
# Header to display without color.
function BU::Header         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RESET"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RESET"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display in case of an error.
function BU::HeaderError    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ERROR"    "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ERROR"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display when switching to a new package category during package installation.
function BU::HeaderInstall  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW"   "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display when changing step.
function BU::HeaderNewstep  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NEWSTEP"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NEWSTEP"    "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display when changing step.
function BU::HeaderStep     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN"     "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display in case of a successfully done step.
function BU::HeaderSuccess  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SUCCESS"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SUCCESS"    "$1" "$2" "$3" "$4" || return 1; return 0; }
# Header to display in case of a minor error.
function BU::HeaderWarning  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WARNING"  "$__BU_MAIN_TXT_CHAR_HEADER_LINE"  "$__BU_MAIN_COLOR_TXT_WARNING"   "$1" "$2" "$3" "$4" || return 1; return 0; }
# Copy-paste this function to avoid losing time while creating unicolor headers :
# function BU::Header<col> { BU::HeaderBase "$__BU_MAIN_COLOR_<COLOR>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR>" "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
# OLD COLORS (BEFORE 2022 01 07)
function BU::HeaderBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGray         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPink         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK"        "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"   	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"	    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED"         "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE"       "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW"      "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
# NEW COLORS (SINCE 2022 01 07)
function BU::HeaderAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavy         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOlive        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTan          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN"     "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_VIOLET"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"			"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
# /////////////////////////////////////////////////////////////////////////////////////////////// #
## BICOLOR HEADERS
# Copy-paste this function to avoid losing time while creating bicolor headers :
# function BU::Header<col1><col2>   { BU::HeaderBase "$__BU_MAIN_COLOR_<COLOR1>" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_<COLOR2>" "$1" "$2" "$3" "$4" || return 1; return 0; }
## AQUA BLUE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderAquaBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaBlue			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaCyan			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaGray			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaNavy         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaOlive        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaPink			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaPurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaRed			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaTan		    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderAquaYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_AQUA"	"$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"		"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## BLACK LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderBlackAqua        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackFuchsia     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackGray        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackGreen       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackLime        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackMaroon      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackNavy        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackOlive       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackPink        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackPurple      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackRed         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackSalmon      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackSilver      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackTan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE" 	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackViolet      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackWhite       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlackYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLACK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## BLUE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderBlueAqua         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueFuchsia      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"   	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueGray         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueLime         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueNavy         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueOlive        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBluePink         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBluePurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"        	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueSilver       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueTan          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"         	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"  	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderBlueYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_BLUE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## CYAN LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderCyanAqua         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanFuchsia      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanGray         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanLime         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanNavy         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanOlive        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanPink         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanSalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanSilver       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanTan          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanTeal         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"  	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderCyanYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_CYAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## FUCHSIA LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderFuchsiaAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaBlue		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaCyan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaGray		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaMaroon	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaNavy  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaOlive 	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaOrange	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaPink		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaPurple	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaRed		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaSalmon	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaSilver	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaTan       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaViolet	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderFuchsiaYellow	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_FUCHSIA" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"		"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## GRAY LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderGrayAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayNavy         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayPink         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"        	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGraySalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGraySilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"  	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGrayYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GRAY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## LIGHT GREEN LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderGreenAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenBlack       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN" 	    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenGray        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY" 	    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenNavy		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenOlive		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenPink        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenPurple      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenRed         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenTan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE" 	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenWhite       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderGreenYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_GREEN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW" 		"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## LIME GREEN LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderLimeAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeBlue			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeCyan			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeGray			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeMarron		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeNavy 		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeOlive		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimePink			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimePurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeRed			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"  	    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderLimeYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_LIME" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## MAROON LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderMaroonAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonBlack		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonBlue		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonCyan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonFuchsia	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonGray		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonGreen		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonLime       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonNavy		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonOlive		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonOrange		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonPink		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonPurple		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonRed		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"  	    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonWhite		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderMaroonYellow		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_MAROON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## NAVY BLUE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderNavyAqua         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyFuchsia      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyGray         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyLime         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyMaroon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyOlive        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyPink         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavySalmon       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavySilver       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyTan          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyTeal         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyViolet       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderNavyYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_NAVY" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"        "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## OLIVE GREEN LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderOliveAqua        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveBlack       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveFuchsia     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveGray        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveGreen       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveLime        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveMaroon      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveNavy        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOlivePink        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOlivePurple      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveRed         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveSalmon      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveSilver      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveTan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveTeal        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveViolet      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveWhite       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOliveYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_OLIVE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"       "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## ORANGE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderOrangeAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeFuchsia	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeGray       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeNavy       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeOlive		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangePink       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangePurple     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeRed        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE" 	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderOrangeYellow     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_ORANGE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## PINK LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderPinkAqua			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkBlack        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkBlue         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkCyan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkGray         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkGreen        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkLime			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkNavy 		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkOlive		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkOrange       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkPurple       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkRed          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"        	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkTeal			{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkTurquoise    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"  	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkWhite        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPinkYellow       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PINK" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## PURPLE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderPurpleAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleFuchsia    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleGray       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleMaroon	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleNavy	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleOlive	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleOrange     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurplePink       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleRed        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleSalmon	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleSilver	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleTan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleTeal	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"	   	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleViolet	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderPurpleYellow     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_PURPLE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## RED LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderRedAqua          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedBlack         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedBlue          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedCyan          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedFuchsia       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedGray          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedGreen         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedLime          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedMaroon        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedNavy          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedOlive         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedOrange        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedPink          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedPurple        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedSalmon        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedSilver        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedTan           { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"            "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedTeal          { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"           "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedTurquoise     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedViolet        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedWhite         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"          "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderRedYellow        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_RED" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"         "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## SALMON LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderSalmonAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonBlack     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonBlue      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonCyan      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonFuchsia	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonGray      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonGreen     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonMaroon    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonNavy       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonOlive      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonOrange  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonPink    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonPurple  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonRed    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"        	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonWhite     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSalmonYellow    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SALMON" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## SILVER LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderSilverAqua	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverBlack     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverBlue      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverCyan      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverFuchsia	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverGray      	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverGreen     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverLime	    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverMaroon    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverNavy       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverOlive      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverOrange  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverPink    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverPurple  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverRed    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"        	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverTan		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverWhite     	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderSilverYellow    	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_SILVER" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"      "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## TAN LINES, DIFFERENTLY COLORED TEXT
function BU::TanAqua                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanBlue                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanBlack               { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanCyan                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanFuchsia             { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanGray                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanGreen               { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanLime                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanMaroon              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanNavy                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"         	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanOlive               { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanOrange              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanPink                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanPurple              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanRed                 { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanSalmon              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanSilver              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanTeal                { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanTurquoise           { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanViolet              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanWhite               { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::TanYellow              { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TAN" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## TEAL LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderTealAqua    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealBlack   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"    		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealBlue    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE" 	    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealCyan    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealFuchsia 		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealGray		    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"	   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealGreen   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealLime    		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealMaroon  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealNavy  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealOlive  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealOrange  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealPink		    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"     		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealPurple  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealRed     		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"			"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealSalmon  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealSilver  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealTan  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealTurquoise	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealViolet  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealWhite   		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE" 		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTealYellow  		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TEAL" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"   		"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## TURQUOISE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderTurquoiseAqua    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseBlack   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseBlue    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseCyan    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseFuchsia { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"  "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseGray    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseGreen   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseLime    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseMaroon  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseNavy    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseOlive   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"    "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseOrange  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoisePink    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoisePurple  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseRed     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseSalmon  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseSilver  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseTan     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseTeal  	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"		"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseViolet  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseWhite   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE" 	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderTurquoiseYellow  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_TURQUOISE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"   "$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## WHITE LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderWhiteAqua		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteBlack       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteBlue        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteCyan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteFuchsia		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteGray        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteGreen       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteLime		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteMaroon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteNavy		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteOlive   	{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteOrange      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhitePink        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"      	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhitePurple      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteRed         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteSalmon		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteSilver		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteTan         { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"       	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteTeal		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteViolet		{ BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"     	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteTurquoise   { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE" 	"$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderWhiteYellow      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_WHITE" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_YELLOW"    	"$1" "$2" "$3" "$4" || return 1; return 0; }
# -----------------------------------------------
## YELLOW LINES, DIFFERENTLY COLORED TEXT
function BU::HeaderYellowAqua       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowBlack      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLACK"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowBlue       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_BLUE"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowCyan       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_CYAN"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowFuchsia    { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_FUCHSIA"     "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowGray       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GRAY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowGreen      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_GREEN"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowLime       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_LIME"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowMaroon     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_MAROON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowNavy       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_NAVY"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowOlive      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_OLIVE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowOrange     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ORANGE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowPink       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PINK"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowPurple     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_PURPLE"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowRed        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_RED"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowSalmon     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SALMON"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowSilver     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_SILVER"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowTan        { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TAN"         "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowTeal       { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TEAL"        "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowTurquoise  { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_TURQUOISE"   "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowViolet     { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_VIOLET"      "$1" "$2" "$3" "$4" || return 1; return 0; }
function BU::HeaderYellowWhite      { BU::HeaderBase "$__BU_MAIN_COLOR_TXT_YELLOW" "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_WHITE"       "$1" "$2" "$3" "$4" || return 1; return 0; }
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/POSIXTERM.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Terminal.lib
# Module        : Main
# Description   : Functions specially made for terminal interaction.
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### TERMINAL INTERACTION FUNCTIONS
#### DEBUG ID : posixterm::terminal-interaction-functions
__BU_MAIN_POSIXTERM_LIB__CAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS="posixterm::terminal-interaction-functions";
## DISPLAYING TEXT AND MORE WHILE A TASK IS ONGOING
## DEBUG ID : displaying-text-and-more-while-a-task-is-ongoing
__BU_MAIN_POSIXTERM_LIB__SUBCAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS__DISPLAYING_TEXT_AND_MORE_WHILE_A_TASK_IS_ONGOIG="$__BU_MAIN_POSIXTERM_LIB__CAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS::displaying-text-and-more-while-a-task-is-ongoing";
# Display a countdown while a task is ongoing.
function BU::Main::PosixTerm::DisplayCountdown()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_POSIXTERM_LIB__CAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS" \
        "$__BU_MAIN_POSIXTERM_LIB__SUBCAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS__DISPLAYING_TEXT_AND_MORE_WHILE_A_TASK_IS_ONGOIG";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Display a progress bar while a task is ongoing.
function BU::Main::PosixTerm::DisplayProgressBar()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_POSIXTERM_LIB__CAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS" \
        "$__BU_MAIN_POSIXTERM_LIB__SUBCAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS__DISPLAYING_TEXT_AND_MORE_WHILE_A_TASK_IS_ONGOIG";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Display a spinner while a task is ongoing.
function BU::Main::PosixTerm::DisplaySpinner()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_POSIXTERM_LIB__CAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS" \
        "$__BU_MAIN_POSIXTERM_LIB__SUBCAT_DEBUG_ID__TERMINAL_INTERACTION_FUNCTIONS__DISPLAYING_TEXT_AND_MORE_WHILE_A_TASK_IS_ONGOIG";
    #**** Parameters ****
    p_string=$1
#    p_countdown=$2
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
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/STATUS.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : CheckSTAT.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### VARIABLES VALUES FUNCTIONS
#### DEBUG ID : status::variables-values-functions
__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS="status::variables-values-functions";
## CHECKING VALUES
## DEBUG ID : checking-values
__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKING_VALUES="$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS::checking-values";
# Easy writing text function.
function BU::Main::Status::ConfEcho()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKING_VALUES";
    #**** Parameters ****
    local p_file=$1;        # String    - Default : NULL    - File where the current function is called (mainly from the "BU::Main::StatusCheckSTAT<...>()" functions).
    local p_lineno=$2;      # Int       - Default : NULL    - Line where the current function is called (mainly from the "BU::Main::StatusCheckSTAT<...>()" functions).
    local p_bad_value=$3;   # String    - Default : NULL    - Bad value passed as "BU::Main::StatusCheckSTAT<...>()" function's argument.
    local p_var_name=$4     # String    - Default : NULL    - Name of the variable that stores the bad value.
    # Shifting the same number of time as the former arguments number
    # to avoid including these arguments values in the allowed values array.
    shift 4;
    local pa_correctValues=("$@");
    #**** Variables ****
    local i=0;      #
    #**** Code ****
    # Sourcing the "Status.conf" file to reset every status global variables values
    BU::Main::Files::SourceFile "$__BU_MAIN_MODULE_CONF_FILE_STATUS_PATH";
    # Setting the "$__BU_MAIN_STAT_DECHO" status global variable to "allow" in order to display correctly the formatted text.
    __BU_MAIN_STAT_DECHO='allow';
    # Since the "$__BU_MAIN_STAT_ECHO" status global variable is reset to "true", it's totally safe to call an "Echo<...>()" function here.
    if [ -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        {
			BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ERROR";
			BU::EchoError "AN ERROR OCCURED DURING THIS STATUS VARIABLE CHECKING --> $p_var_name    |    VALUE : $p_bad_value !!!";
			BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ERROR";
		} 2>&1 | tee -a "$__BU_MAIN_PROJECT_LOG_FILE_PATH";
    else
        BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ERROR";
        BU::EchoError "AN ERROR OCCURED DURING A STATUS VARIABLE CHECKING !!!";
        BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_ERROR";
    fi
    BU::EchoError "In $(BU::__Decho "$p_file" "$__BU_MAIN_COLOR_PATH" "$__BU_MAIN_COLOR_ERROR"), line $(BU::__Decho "$p_lineno" "$__BU_MAIN_COLOR_HIGHLIGHT") --> " '-n' >&2;
    BU::EchoError "Error : the $(BU::__Decho "$p_var_name" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR") variable's value is incorrect." >&2;
    if [ -z "$p_bad_value" ]; then
        echo >&2; BU::EchoError "Bad value : $(BU::__Decho 'An empty string' "$__BU_MAIN_COLOR_YELLOW" "$__BU_MAIN_COLOR_ERROR")." >&2;
    else
        echo >&2; BU::EchoError "Bad value : $(BU::__Decho "$p_bad_value" "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")." >&2;
    fi
    echo >&2; BU::EchoError "The allowed values are :" >&2;
    # Displaying the list of every allowed arguments.
    for val in "${pa_correctValues[@]}"; do
        i=$(( i+1 ));
        # If an empty argument is allowed.
        if [ -z "$val" ]; then
            BU::EchoError "$i/${#pa_correctValues[@]}   --> $(BU::__Decho 'An empty argument' "$__BU_MAIN_COLOR_VAR" "$__BU_MAIN_COLOR_ERROR")" >&2;
        else
            BU::EchoError "$i/${#pa_correctValues[@]}   --> $(BU::__Decho "$val" "$__BU_MAIN_COLOR_HIGHLIGHT" "$__BU_MAIN_COLOR_ERROR")" >&2;
        fi
    done
    echo >&2; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; exit 1;
}
# -----------------------------------------------
## CHECKINGS
## DEBUG ID : checkings
__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS="$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS::checkings";
# Check the "$__BU_MAIN_STAT_DECHO" status variable's value.
function BU::Main::Status::CheckSTAT_DECHO()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("authorize" "forbid" "restrict");
    #**** Code ****
    if [ "${__BU_MAIN_STAT_DECHO,,}" != "authorize" ] && [ "${__BU_MAIN_STAT_DECHO,,}" != "forbid" ] && [ "${__BU_MAIN_STAT_DECHO,,}" != "restrict" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_DECHO" "__BU_MAIN_STAT_DECHO" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Check the "$__BU_MAIN_STAT_ECHO" status variable's value.
function BU::Main::Status::CheckSTAT_ECHO()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("true" "false");
    #**** Code ****
    if [ "${__BU_MAIN_STAT_ECHO,,}" != "true" ] && [ "${__BU_MAIN_STAT_ECHO,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ECHO" "__BU_MAIN_STAT_ECHO" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_ERROR" status variable's value.
function BU::Main::Status::CheckSTAT_ERROR()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("" "fatal" "warning");
    #**** Code ****
    if [ -n "$__BU_MAIN_STAT_ERROR" ] && [ "${__BU_MAIN_STAT_ERROR,,}" != "fatal" ] && [ "${__BU_MAIN_STAT_ERROR,,}" != "warning" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_ERROR" "__BU_MAIN_STAT_ERROR" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
function BU::Main::Status::CheckSTAT_INITIALIZING()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("true" "false");
    #**** Code ****
    if [ "${__BU_MAIN_STAT_INITIALIZING,,}" != "true" ] && [ "${__BU_MAIN_STAT_INITIALIZING,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_INITIALIZING" "__BU_MAIN_STAT_INITIALIZING" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_LOG" status variable's value.
function BU::Main::Status::CheckSTAT_LOG()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("true" "false");
    #**** Code ****
    if [ "${__BU_MAIN_STAT_LOG,,}" != "true" ] && [ "${__BU_MAIN_STAT_LOG,,}" != "false" ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG" "__BU_MAIN_STAT_LOG" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    elif [ "${__BU_MAIN_STAT_LOG,,}" = "true" ] && [ ! -f "$__BU_MAIN_PROJECT_LOG_FILE_PATH" ]; then
        BU::Main::Files::CreateProjectLogFile || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function BU::Main::Status::CheckSTAT_LOG_REDIRECT()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("" "log" "tee");
    #**** Code ****
    if [ -n "$__BU_MAIN_STAT_LOG_REDIRECT" ] && [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" != 'log' ] && [ "${__BU_MAIN_STAT_LOG_REDIRECT,,}" != 'tee' ]; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_LOG_REDIRECT" "__BU_MAIN_STAT_LOG_REDIRECT" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function BU::Main::Status::CheckSTAT_OPERATE_ROOT()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
	#**** Parameters ****
	local p_file=$1;   # String    - Default : NULL    - File where the current function is called.
	local p_lineno=$2; # Int       - Default : NULL    - Line where the current function is called.
	#**** Variables ****
	local va_correctValues=("authorized" "forbidden" "restricted");
	#**** Code ****
	if [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "authorized" ] && [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "forbidden" ] && [ "${__BU_MAIN_STAT_OPERATE_ROOT,,}" != "restricted" ]; then
		BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_OPERATE_ROOT" "__BU_MAIN_STAT_OPERATE_ROOT" "${va_correctValues[@]}";
		local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
	fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_TIME_HEADER" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_HEADER()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("${__BU_MAIN_COLOR_TXT_VAR}An integer or a floating number");
    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_HEADER"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_HEADER" "__BU_MAIN_STAT_TIME_HEADER" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_TIME_NEWLINE" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_NEWLINE()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("${__BU_MAIN_COLOR_TXT_VAR}An integer or a floating number");
    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_HEADER"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_NEWLINE" "__BU_MAIN_STAT_TIME_NEWLINE" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function BU::Main::Status::CheckSTAT_TIME_TXT()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("${__BU_MAIN_COLOR_TXT_ORANGE}An integer or a floating number");
    #**** Code ****
    # If the status variable's value is not a float or an integer.
    if ! BU::IsFloat "$__BU_MAIN_STAT_TIME_TXT"; then
        BU::Main::Status::ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TIME_TXT" "__BU_MAIN_STAT_TIME_TXT" "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function BU::Main::Status::CheckSTAT_TXT_FMT()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local va_correctValues=("true" "false");
    #**** Code ****
    if [ "${__BU_MAIN_STAT_TXT_FMT,,}" != "true" ] && [ "${__BU_MAIN_STAT_TXT_FMT,,}" != "false" ]; then
        ConfEcho "$p_file" "$p_lineno" "$__BU_MAIN_STAT_TXT_FMT" '__BU_MAIN_STAT_TXT_FMT' "${va_correctValues[@]}";
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C";
    fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Checking the "$__BU_MAIN_STAT_USER_OS" status variable's value.
# This function is empty now, as the OS handling is still in work.
function BU::Main::Status::CheckSTAT_USER_OS()
{
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    shift 2;
    # local pa_supported_os=("$@")    # Array storing the list of the operating systems which support a feature to be deployed.
    #**** Variables ****
    #**** Code ****
    return 0;
}
# Checking all the project's status variables values if multiple values had been modified.
function BU::Main::Status::CheckProjectStatusVars()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS";
    #**** Parameters ****
    local p_file=$1;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$2;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Code ****
    # Processing first the "__BU_MAIN_STAT_LOG_REDIRECT" variable, to make sure the following error messages will be correctly displayed if another error happened.
    BU::Main::Status::CheckSTAT_LOG_REDIRECT    "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::ModuleInit::CheckSTAT_DEBUG             "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_DECHO           "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_ECHO            "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_ERROR           "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_INITIALIZING    "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_LOG             "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_OPERATE_ROOT    "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_TIME_HEADER     "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_TIME_NEWLINE    "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_TIME_TXT        "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_TXT_FMT         "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Status::CheckSTAT_USER_OS         "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## CHANGING VALUES MORE EASILY
## DEBUG ID : changing-values-more-easily
__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY="$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS::changing-values-more-easily";
# Positionnal parameters :
#   $1  --> Any     : new value.
#   $2  --> String  : file where the change was made.
#   $3  --> Int     : line where the change was made.
# Changing the "$__BU_MAIN_STAT_DECHO" status variable's value.
function BU::Main::Status::ChangeSTAT_DECHO() { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHECKINGS"; __BU_MAIN_STAT_DECHO="$1"; BU::Main::Status::CheckSTAT_DECHO "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_ECHO" status variable's value, and provide a log redirection support.
## VERY IMPORTANT : DO NOT CALL ANY "BU::Decho<...>()" FUNCTION HERE (THE COMPLETE ONE), OR ELSE THE SCRIPT WILL BE STUCK IN AN INFINITE LOOP !!!!!!!!!!!!!!!
function BU::Main::Status::ChangeSTAT_ECHO()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" \
        "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY";
    #**** Parameters ****
    local p_value=$1;   # String    - Default : NULL    - Value to be changed.
    local p_file=$2;    # String    - Default : NULL    - File where the current function is called.
    local p_lineno=$3;  # Int       - Default : NULL    - Line where the current function is called.
    #**** Variables ****
    local v_log_file_path="$__BU_MAIN_PROJECT_LOG_FILE_PATH";   # Storing the path of the log file in another variable, in order to avoid reading and writing in the same pipeline.
    # This variable stores the 'error' string if a command or a function call failed during the execution of a loop.
    local v_loop_error;
    #*** Code ****
    if [ "true" = "${p_value,,}" ] && BU::IsArrayEmpty "${__BU_MAIN_STATVAR_ECHO_MSG_ARRAY[@]}"; then
        # Declare an array of strings, which will store the messages
        if BU::Main::Status::CheckStatIsLogging; then
            declare __BU_MAIN_STATVAR_ECHO_MSG_ARRAY=();
            # Modifying and checking the global variable's value first, before
            __BU_MAIN_STAT_ECHO="$p_value";
            BU::Main::Status::CheckSTAT_ECHO "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
            BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA";
            BU::EchoGreen "${__BU_MAIN_COLOR_TXT_HIGHLIGHT}'__BU_MAIN_STAT_ECHO : true'${__BU_MAIN_COLOR_TXT_GREEN} --> BEGINNING REDIRECTING TEXT TO THE $__BU_MAIN_COLOR_PATH$v_log_file_path$__BU_MAIN_COLOR_GREEN LOG FILE" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH";
            BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA";
            BU::Newline;
        fi
    elif [ 'false' = "${p_value,,}" ]; then
        if BU::IsArrayNotEmpty "${__BU_MAIN_STATVAR_ECHO_MSG_ARRAY[@]}" && BU::Main::Status::CheckStatIsLogging; then
            for i in "${__BU_MAIN_STATVAR_ECHO_MSG_ARRAY[@]}"; do
                echo "$i" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH" || \
                {
                    local __bu_main_stat_log_redirect_backup="$__BU_MAIN_STAT_LOG_REDIRECT"; __BU_MAIN_STAT_LOG_REDIRECT="";
                    echo >&2;
                    BU::EchoError "In $__BU_MAIN_COLOR_PATH$(basename "${BASH_SOURCE[0]}")$__BU_MAIN_COLOR_ERROR file, function $__BU_MAIN_COLOR_FUNCTION${FUNCNAME[0]}$__BU_MAIN_COLOR_ERROR, line $__BU_MAIN_COLOR_HIGHLIGHT$LINENO$__BU_MAIN_COLOR_ERROR --> Error :" >&2;
                    BU::EchoError "Unable to write in the $__BU_MAIN_COLOR_PATH$__BU_MAIN_PROJECT_LOG_FILE_PATH$__BU_MAIN_COLOR_ERROR log file" >&2;
                    echo >&2;
                    BU::EchoError "Please check the cause of this bug" >&2;
                    BU::EchoError "The cause may be a problem of read and / or write permission" >&2;
                    echo >&2;
                    __BU_MAIN_STAT_LOG_REDIRECT="$__bu_main_stat_log_redirect_backup";
                    local C="$__BU_MAIN_EXIT_NOT_PERMITTED"; v_loop_error='error'; break;
                }
            done; if [ "${v_loop_error,,}" = 'error' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
            BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA";
            BU::EchoGreen "${__BU_MAIN_COLOR_TXT_HIGHLIGHT}'__BU_MAIN_STAT_ECHO : true'${__BU_MAIN_COLOR_TXT_GREEN} --> ENDED REDIRECTING TEXT TO THE $__BU_MAIN_COLOR_PATH$v_log_file_path$__BU_MAIN_COLOR_GREEN LOG FILE" >> "$__BU_MAIN_PROJECT_LOG_FILE_PATH";
            BU::Main::Headers::DrawLine "$__BU_MAIN_TXT_CHAR_HEADER_LINE" "$__BU_MAIN_COLOR_TXT_AQUA";
            BU::Newline;
            # Emptying the array of strings.
            __BU_MAIN_STATVAR_ECHO_MSG_ARRAY=();
        fi
    fi
    __BU_MAIN_STAT_ECHO="$p_value";
    BU::Main::Status::CheckSTAT_ECHO "$p_file" "$p_lineno" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Changing the "$__BU_MAIN_STAT_ERROR" status variable's value.
function BU::Main::Status::ChangeSTAT_ERROR()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY";
    __BU_MAIN_STAT_ERROR="$1";
    BU::Main::Status::CheckSTAT_ERROR "$2" "$3" || {
        local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}";
        return "$C";
    }
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Changing the "$__BU_MAIN_STAT_INITIALIZING" status variable's value.
# WARNING : Do NOT change it's value from 'false' to 'true'. Otherwise, expect bugs.
function BU::Main::Status::ChangeSTAT_INITIALIZING()    {
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY";
	if [ "${__BU_MAIN_STAT_INITIALIZING,,}" = 'false' ] && [ 'true' = "$1" ]; then
		BU::EchoWarning "WARNING : It's strongly discouraged to change the $(BU::DechoHighlight "$__BU_MAIN_STAT_INITIALIZING") value from $(BU::DechoHighlightVar 'false') to $(BU::DechoHighlightVar 'true')"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1;
	else
		__BU_MAIN_STAT_INITIALIZING="$1";     BU::Main::Status::CheckSTAT_INITIALIZING      "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; };
	fi; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Changing the "$__BU_MAIN_STAT_LOG" status variable's value.
function BU::Main::Status::ChangeSTAT_LOG()             { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_LOG="$1";              BU::Main::Status::CheckSTAT_LOG           "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_LOG_REDIRECT" status variable's value.
function BU::Main::Status::ChangeSTAT_LOG_REDIRECT()    { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_LOG_REDIRECT="$1";     BU::Main::Status::CheckSTAT_LOG_REDIRECT  "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_OPERATE_ROOT" status variable's value.
function BU::Main::Status::ChangeSTAT_OPERATE_ROOT()    { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_OPERATE_ROOT="$1";     BU::Main::Status::CheckSTAT_OPERATE_ROOT  "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_TIME_HEADER" status variable's value.
function BU::Main::Status::ChangeSTAT_TIME_HEADER()     { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_TIME_HEADER="$1";      BU::Main::Status::CheckSTAT_TIME_HEADER   "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_TIME_NEWLINE" status variable's value.
function BU::Main::Status::ChangeSTAT_TIME_NEWLINE()    { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_TIME_NEWLINE="$1";     BU::Main::Status::CheckSTAT_TIME_NEWLINE  "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_TIME_TXT" status variable's value.
function BU::Main::Status::ChangeSTAT_TIME_TXT()        { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_TIME_TXT="$1";         BU::Main::Status::CheckSTAT_TIME_TXT      "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Changing the "$__BU_MAIN_STAT_TXT_FMT" status variable's value.
function BU::Main::Status::ChangeSTAT_TXT_FMT()         { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__CHANGING_VALUES_MORE_EASILY"; __BU_MAIN_STAT_TXT_FMT="$1";          BU::Main::Status::CheckSTAT_TXT_FMT       "$2" "$3" || { local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; }; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# -----------------------------------------------
## EASIER BOOLEAN VALUES CHECKINGS
## DEBUG ID : easier-boolean-values-checkings
__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS="$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS::easier-boolean-values-checkings";
# Checking if the "BU::Echo<...>()" functions can call the "BU::CheckProjectLogStatus()" function without provoking an infinite loop.
function BU::Main::Status::CheckStatIsBackupEchoing() { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS"; if [ "${__BU_MAIN_STAT_ECHO,,}"           = 'true' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi; }
# Checking if the library is into its initialization process ($__BU_MAIN_STAT_INITIALIZING).
function BU::Main::Status::CheckStatIsInitializing()  { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS"; if [ "${__BU_MAIN_STAT_INITIALIZING,}"    = 'true' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi; }
# Checking if the log redirection mode is active.
function BU::Main::Status::CheckStatIsLogging()       { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS"; if [ "${__BU_MAIN_STAT_LOG,,}"            = 'true' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi; }
# Checking if the initialization logs can be printed on the terminal.
function BU::Main::Status::CheckStatIsPrintingInit()  { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS"; if [ "${__BU_MAIN_STAT_PRINT_INIT_LOG,,}" = 'true' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi; }
# Checking if the text formatting is allowed.
function BU::Main::Status::CheckStatAllowFormatting() { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_STATUS_LIB__CAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS" "$__BU_MAIN_STATUS_LIB__SUBCAT_DEBUG_ID__VARIABLES_VALUES_FUNCTIONS__EASIER_BOOLEAN_VALUES_CHECKINGS"; if [ "${__BU_MAIN_STAT_TXT_FMT,,}"        = 'true' ]; then BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; else BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 1; fi; }
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/TEXT.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Text.lib
# Module        : Main
# Description   : Functions specially made for text processing (cutting fields / characters, ).
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
#### TEXT PROCESSING FUNCTIONS
#### DEBUG ID : text::text-processing-functions
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS="text::text-processing-functions";
## CUTTING TEXT
## DEBUG ID : cutting-text
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS::cutting-text";
# Cut the date displayed before a string.
function BU::Main::Text::CutLogDateFromString()     { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT"; BU::Main::Text::CutSubStringAfterNthDelim "$1" '] ';  BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Cut the dash written before a command option call (to be improved).
function BU::Main::Text::CutDashFromOption()        { BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT"; BU::Main::Text::CutSubStringAfterNthDelim "$1" '-';   BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0; }
# Cut every part of a string after and with the delimiter, which can be both a single character or a string.
function BU::Main::Text::CutSubStringAfterNthDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT";
    #**** Parameters ****
    local p_string=$1;              # String    - Default : NULL    - String to process.
    local p_delimiter=$2;           # String    - Default : NULL    - Delimiter.
    local p_iterations=${3:-1};     # Int       - Default : 1       - Iterations.
    local p_count=$4;               # String    - Default : NULL    - Allow to set a counter of skipped delimiters.
    #**** Variables ****
    if [ -n "$p_count" ] && [ "${p_count,,}" = 'count' ]; then local v_count=0; fi
	# Leave this variable empty, it is used to store temporarily the first field cut from the original string at each loop iteration.
	local v_fieldtmp="";
	# Let this variable empty, it is used to store the new string with every fields cut from the original string.
	local v_newString="";
	local x;
    #**** Code ****
    if ! BU::Main::Args__Text::CutSubStringAfterNthDelim "$p_string" "$p_delimiter" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if [ -n "$p_iterations" ] && ! BU::IsInt "$p_iterations"; then
        BU::EchoWarning "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1';
    fi
	# Getting the number of occurences of the character / string targeted as delimiter.
	x="$(BU::Main::Text::GetSubStringOccurences "$p_string" "$p_target")";
    for ((i=0; i<x; i++)); do
		if [ "$i" = "$p_iterations" ]; then break; fi
        v_fieldtmp="${p_string%%$p_delimiter*}";
		v_fieldtmp="${v_fieldtmp#*$p_delimiter}";
		if [ -z "$p_newString" ]; then
			p_newString="$v_fieldtmp";
		else
			p_newString="$p_newString$p_delimiter$v_fieldtmp";
		fi
        if [ "${p_count,,}" != 'count' ]; then v_count="$(( v_count + 1 ))"; fi
    done
	if [ "${p_count,,}" != 'count' ]; then echo -ne "$p_newString"; else echo -ne "$v_count"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Cut every part of a string before and with the delimiter, which can be both a single character or a string.
function BU::Main::Text::CutSubStringBeforeNthDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT";
    #**** Parameters ****
    local p_string=$1;              # String    - Default : NULL    - String to process.
    local p_delimiter=$2;           # String    - Default : NULL    - Delimiter.
    local p_iterations=${3:-1};     # Int       - Default : 1       - Iterations.
    local p_count=$4;               # String    - Default : NULL    - Allow to set a counter of skipped delimiters.
    #**** Variables ****
    if [ -n "$p_count" ] && [ "${p_count,,}" = 'count' ]; then local v_count=0; fi
    #**** Code ****
    if ! BU::Main::Args__Text::CutSubStringBeforeNthDelim "$p_string" "$p_delimiter" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    if [ -n "$p_iterations" ] && ! BU::IsInt "$p_iterations"; then
        BU::EchoWarning "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1';
    fi
    for ((i=0; i<p_iterations; i++)); do
        #shellcheck disable=SC2001
        p_string="$(sed "s/^[^$p_delimiter]*$p_delimiter//" <<< "$p_string")";
        p_string="$p_string";
        if [ "${p_count,,}" != 'count' ]; then v_count="$(( v_count + 1 ))"; fi
    done
    if [ "${p_count,,}" != 'count' ]; then echo -ne "$p_string"; else echo -ne "$v_count"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Cut the very first field of a string, before the delimiter, in order to get everything that follows the first field.
function BU::Main::Text::CutFirstFieldBeforeDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT";
    #**** Parameters ****
    local p_string=$1;	# String    - Default : NULL    - String to process.
    local p_delim=$2;	# String	- Default : NULL	- Delimiter
    #**** Code ****
	if ! BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims "$p_string" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$?"; fi
    echo "${p_string%$p_delim*}" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# Cut the very last field of a string, in order to get everything that preceeds the last field.
function BU::Main::Text::CutLastFieldAfterDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT";
    #**** Parameters ****
    local p_string=$1;	# String    - Default : NULL    - String to process.
    local p_delim=$2;	# String	- Default : NULL	- Delimiter
    #**** Code ****
	if ! BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims "$p_string" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$?"; fi
    echo "${p_string#*$p_delim}" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# Deleting letters in a string.
function BU::Main::Text::DeleteLettersInString()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__CUTTING_TEXT";
    #**** Parameters ****
    local p_string=$1;      # String    - Default : NULL    - String to process.
    shift;
    local p_char=("$@");    # String    - Default : NULL    - Letters and strings to remove.
    #**** Code ****
    if ! BU::ArrayIsNotEmpty; then BU::EchoError "No string passed as first argument"; BU::Newline; return 1; fi
    if ! BU::Main::Args__Text::DeleteLettersInString "$p_string" "$(basename "${BASH_SOURCE[0]}")" "${FUCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$?"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# -----------------------------------------------
## FORMATTING TEXT
## DEBUG ID : text::text-processing-functions::formatting-text
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__FORMATTING_TEXT="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS::formatting-text";
# Keep the same text format between lowercased or uppercased text printed by a formatting text function ("BU::Main::Echo::ToLowercase()" OR "BU::Main::Echo::ToUppercase()") or a parameter expansion.
# This function is planned to be used between force-uppered/lowered text, to keep the original text formatting of the wanted string excerpt.
function BU::Main::Echo::KeepFormatting()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__FORMATTING_TEXT";
	#**** Parameters ****
#	p_string=$1;           # String to display.
#	p_old_formatting=$2;   # Former tectxt formatting.
	#**** Code ****
# 	echo -ne &>/dev/null; echo -ne "$p_string";
#
# 	if [ "${p_old_formatting,,}" = 'l' ]; then
#         echo -ne "$(BU::Main::Echo::ToLowercase "$p_string")";
# 	elif [ "${p_old_formatting^^}" = 'U' ]; then
#         echo -ne "$(BU::Main::Echo::ToUppercase "$p_string")";
# 	else
#         echo -ne "<<|| No reformatting precised in the $(BU::Main::Echo::ToLowercase "${FUNCNAME[0]}()") function ||>>";
# 	fi
	BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Print a lowercased text.
# Usage :
#	BU::Main::Echo::ToLowercase "<Text to write>"
function BU::Main::Echo::ToLowercase()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__FORMATTING_TEXT";
	#**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
	#**** Code ****
	echo "$p_string" | tr '[:upper:]' '[:lower:]'; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Print an uppercased text.
# Usage :
#	BU::Main::Echo::ToUppercase "<Text to write>"
function BU::Main::Echo::ToUppercase()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__FORMATTING_TEXT";
	#**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
	#**** Code ****
	echo "$p_string" | tr '[:lower:]' '[:upper:]'; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## GETTING TEXT
## DEBUG ID : getting-text
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS::getting-text"
# Getting the occurences of a character in a main string.
function BU::Main::Text::GetCharacterOccurences()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    local p_target=$2;  # Char      - Default : NULL    - Targeted character.
    #**** Variables ****
    local v_occurences="${p_string//[^$p_target]}";
    #**** Code ****
    if ! BU::Main::Args__Text::GetCharacterOccurences "$p_string" "$p_target" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$?"; fi
    echo -ne "${#v_occurences}";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Get the very first field of a string, and cut everything that follows the first delimiter.
function BU::Main::Text::GetFirstFieldBeforeDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;	# String    - Default : NULL    - String to process.
    local p_delim=$2;	# String	- Default : NULL	- Delimiter
    #**** Code ****
	if ! BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims "$p_string" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    echo "${p_string%%$p_delim*}" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# Get the very last field of a string, and cut everything that preceeds the last delimiter.
function BU::Main::Text::GetLastFieldAfterDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;	# String    - Default : NULL    - String to process.
    local p_delim=$2;	# String	- Default : NULL	- Delimiter
    #**** Code ****
	if ! BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims "$p_string" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
	echo "${p_string##*$p_delim}" && BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# Getting substring after a delimiter, which can be both a single character or a string.
BU::Main::Text::GetSubStringAfterDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;              # String    - Default : NULL    - String to process.
    local p_delim=$2;               # Char      - Default : NULL    - Delimiter
    local p_iterations=${3:-1};     # Int       - Default : 1       - Iterations
    local p_count=$4;               # String    - Default : NULL    - Allow to set a counter of skipped delimiters.
    local p_init=$5;                # String    - Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the call of any function that calls translated text for the main module.
    #**** Variables ****
    if [ -n "$p_count" ] && [ "${p_count,,}" = 'count' ]; then local v_count=0; fi
    #**** Code ****
    if [ -z "$p_init" ] || [ -n "$p_init" ] && [ "${p_init,,}" != '--init' ]; then
        if ! BU::Main::Args__Text::GetSubStringAfterDelim "$p_string" "$p_delim" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    fi
    # WARNING ! DO NOT put double quotes between the "$(seq "$p_iterations")", or else it will not word split, and the loop will only run once !
    for i in $(seq "$p_iterations"); do
        p_string="${p_string#*$p_delim}";
        if [ "${p_count,,}" != 'count' ]; then v_count="$(( v_count + 1 ))"; fi
    done;
    if [ "${p_count,,}" != 'count' ]; then echo -ne "$p_string"; else echo -ne "$v_count"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}" && return 0;
}
# Getting substring before a delimiter, which can be both a single character or a string.
BU::Main::Text::GetSubStringBeforeDelim()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;              # String    - Default : NULL    - String to process.
    local p_delim=$2;               # Char      - Default : NULL    - Delimiter
    local p_iterations=${3:-1};     # Int       - Default : 1       - Iterations
    local p_count=$4;               # String    - Default : NULL    - Allow to set a counter of skipped delimiters.
    local p_init=$5;                # String    - Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the call of any function that calls translated text for the main module.
    #**** Variables ****
    if [ -n "$p_count" ] && [ "${p_count,,}" = 'count' ]; then local v_count=0; fi
	# Leave this variable empty, it is used to store temporarily the first field cut from the original string at each loop iteration.
	local v_fieldtmp="";
	# Let this variable empty, it is used to store the new string with every fields cut from the original string.
	local v_newString="";
	local x;
    #**** Code ****
    if [ -z "$p_init" ] || [ -n "$p_init" ] && [ "${p_init,,}" != '--init' ]; then
        if ! BU::Main::Args__Text::GetSubStringBeforeDelim "$p_string" "$p_delim" "$p_iterations" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
        if [ -n "$p_iterations" ] && ! BU::IsInt "$p_iterations"; then
            BU::EchoWarning "$(BU::__DechoHighlightFunction "${FUNCNAME[0]}()") --> Warning : this function's third argument must be an integer."; p_iterations='1';
        fi
    fi
	# Getting the number of occurences of the character / string targeted as delimiter.
    if [ "${p_init,,}" == '--init' ]; then
        x="$(BU::Main::Text::GetSubStringOccurences "$p_string" "$p_target" "--init")";
	else
        x="$(BU::Main::Text::GetSubStringOccurences "$p_string" "$p_target")";
    fi
    for ((i=0; i<x; i++)); do
		if [ "$i" = "$p_iterations" ]; then break; fi
        v_fieldtmp="${p_string##*$p_delim}";
		v_fieldtmp="${v_fieldtmp%$p_delim*}";
		if [ -z "$v_newString" ]; then
			v_newString="$v_fieldtmp";
		else
			v_newString="$v_newString$p_delim$v_fieldtmp";
		fi
        if [ "${p_count,,}" != 'count' ]; then v_count="$(( v_count + 1 ))"; fi
    done
    if [ -z "$p_init" ] || [ -n "$p_init" ] && [ "${p_init,,}" != '--init' ]; then
	    v_newString="$(BU::Main::Text::ReverseStringWordsOrder "$v_newString" "$p_delim")";
    else
        v_newString="$(BU::Main::Text::ReverseStringWordsOrder "$v_newString" "$p_delim" '--init')";
    fi
	if [ "${p_count,,}" != 'count' ]; then echo -e "$v_newString"; else echo "$p_count"; fi
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the occurences of a sub-string in a main string (it also works with a single character).
function BU::Main::Text::GetSubStringOccurences()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    local p_target=$2;  # String    - Default : NULL    - Targeted sub-string.
    local p_init=$3;    # String    - Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the call of any function that calls translated text for the main module (this function is called by the "BU::Main::Text::GetSubStringBeforeDelim()" function, which is called in the "BU::ModuleInit::ParseCSVLang()" function).
	#**** Variables ****
	local tmp;
	local count;
    #**** Code ****
    if [ -z "$p_init" ] || [ -n "$p_init" ] && [ "${p_init,,}" != '--init' ]; then
        if ! BU::Main::Args__Text::GetSubStringOccurences "$p_string" "$p_target" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    fi
	# https://stackoverflow.com/a/50601141
	# This removes all occurrences of "$p_string" from $CommandResult and places it in tmp.
	# Actually we're using substring replacement here with replacement string missing.
	# Syntax for substring replacement is "${p_string//substring/replacement}" (this replaces all occurrences of substring with replacement).
	tmp="${p_string//$p_target}";
	# This gives us the number of occurrences of "$p_string" in $CommandResult.
	# ${#p_string} gives string length so (${#p_string} - ${#tmp]) is length of all occurrences of "$p_target" (remember, we removed all occurrences of "$p_target" from "$p_string" and placed the result in "$tmp").
	count="$(((${#p_string} - ${#tmp}) / ${#p_target}))";
	echo -e "$count";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the size of a string in byte.
function BU::Main::Text::GetStringByteSize()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    #**** Code ****
    echo -ne "$p_string" | wc --bytes; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the size of a string in characters.
function BU::Main::Text::GetStringCharactersNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    #**** Code ****
    echo -ne "$p_string" | wc --chars; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# Getting the number of words in a string.
function BU::Main::Text::GetStringWordsNumber()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__GETTING_TEXT";
    #**** Parameters ****
    local p_string=$1;  # String    - Default : NULL    - String to process.
    #**** Code ****
    echo -ne "$p_string" | wc -w; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## REVERSING TEXT
## DEBUG ID : reversing-text
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__REVERSING_TEXT="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS::reversing-text";
# Reverse words of a string according to a delimiter.
# Examples with the '|' and '/' delimiter:
# animal | big | car | donut    --> donut | car | big | animal
# /home/user/Documents          --> Documents/user/home
function BU::Main::Text::ReverseStringWordsOrder()
{
    # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
    BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
        "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
        "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__REVERSING_TEXT";
    #**** Parameters ****
    local p_string=$1;	# String    - Default : NULL    - String to process.
    local p_delim=$2;	# String	- Default : NULL	- Delimiter
    local p_init=$3;    # String    - Default : NULL    - RESERVED FOR THE INITIALIZATION PROCESS OF THE MAIN MODULE OF THE BASH UTILS FRAMEWORK : Forbids the call of any function that calls translated text for the main module (this function is called by the "BU::Main::Text::GetSubStringAfterDelim()" function, which is called in the "BU::ModuleInit::ParseCSVLang()" function).
	#**** Variables ****
	# Leave this variable empty, it will store the reversed string.
	local reversed="";
    #**** Code ****
    if [ -z "$p_init" ] || [ -n "$p_init" ] && [ "${p_init,,}" != 'init' ]; then
        if ! BU::Main::Args__Text::CutBeforeAndAfterFirstAndLastDelims "$p_string" "$p_delim" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$LINENO"; then local C="$?"; BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return "$C"; fi
    fi
	IFS="$p_delim" read -ra line <<< "$p_string";
	# shellcheck disable=SC2219
	let x="${#line[@]}-1";
	while [ "$x" -ge 0 ]; do
		if [ "$x" -gt 0 ]; then reversed="$reversed${line[x]}$delim"; else reversed="$reversed${line[x]}"; fi
		(( x-- ));
	done
	echo -e "$reversed";
    BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
}
# -----------------------------------------------
## SPLITTING TEXT
## DEBUG ID : splitting-text
# shellcheck disable=SC2034
__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__SPLITTING_TEXT="$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS::splitting-text";
# Splitting a string from a given delimiter, in order to store it in an array.
# function BU::Main::Text::SplitStringFromDelim()
# {
#     # This function makes it easier for the user to find the current function and its executed content if it is called during the execution of the main script with the command "bash -x".
#     BU::Main::Echo::Debug "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" \
#         "$__BU_MAIN_TEXT_LIB__CAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS" \
#         "$__BU_MAIN_TEXT_LIB__SUBCAT_DEBUG_ID__TEXT_PROCESSING_FUNCTIONS__SPLITTING_TEXT";
#
#     #**** Parameters ****
#     local p_string=$1;          # String    - Default : NULL    - String to process.
#     local p_delim=$2;           # Delimiter.
#     local p_order=$3;           # Splitting order (L|l = left to right, R|r = right to left).
#     local p_iterations=$4;      # Number of delimiters to process.
#     local p_ignore_delim=$5;    # Number of delimiters to ignore before splitting the string.
#
#     #**** Code ****
#     if [ -z "$p_iterations" ] || [ "$p_iterations" -eq 0 ]; then
#         p_iterations='1';
#     fi
#
#     # If the string has to be processed from left to right.
#     if [ "${p_order^^}" = 'L|l' ]; then
#         for ((i=0; i<p_iterations; i++)); do
#             if [ -z "$p_ignore_delim" ] || [ "$p_ignore_delim" -eq 0 ]; then
#                 true
#             else
#                 for ((j=0; j<p_ignore_delim; i++)); do
#                     true
#                 done
#             fi
#         done
#
#     # Else, if the string has to be processed from right to left.
#     elif [ "${p_order^^}" = 'R|r' ]; then
#         for ((i=0; i<p_iterations; i++)); do
#             if [ -z "$p_ignore_delim" ] || [ "$p_ignore_delim" -eq 0 ]; then
#                 true
#             else
#                 for ((j=0; j<p_ignore_delim; i++)); do
#                     true
#                 done
#             fi
#         done
#
#     # Else, if no value is passed to the order processer.
#     elif [ -z "$p_order" ]; then
#         false
#
#     # Else, if an unsupported value is passed to the order processer.
#     else
#         false
#     fi
#
#     BU::Main::Echo::DebugEnd "${FUNCNAME[0]}"; return 0;
# }
# /USR/LOCAL/LIB/BASH-UTILS/LIB/FUNCTIONS/MAIN/TIME.LIB
#!/usr/bin/env bash
# ---------------------
# SCRIPT'S INFORMATIONS
# Name          : Time.lib
# Module        : Main
# Description   :
# Author(s)     : Dimitri Obeid
# Version       :
# ----------------------------
# SHELLCHECK GLOBAL DISABLER :
# Add a coma after each warning code to disable multiple warnings at one go.
# Do not uncomment the "shellcheck disable" line, or else the shellcheck command will be executed during the script's execution, and will not detect any coding mistake during a debugging process.
# DO NOT PUT A COMA AFTER A SHELLCHECK CODE IF THERE'S NO OTHER SHELLCHECK CODE FOLLOWING IT, OR ELSE SHELLCHECK WILL RETURN ERRORS DURING THE DEBUGGING PROCESS !!!
# IF YOU WANT TO ADD ANOTHER SHELLCHECK CODE, WRITE THIS CODE DIRECTLY AFTER THE COMMA, WITHOUT ADDING A BLANK SPACE AFTER IT !!!
# shellcheck disable=SC2154
# --------------------------------------------------------------------------------------------------------------------------------------------
# DO NOT EXECUTE THIS SCRIPT DIRECTLY, instead, just source it by calling the "$__BU_MAIN_FUNCTIONS_FILES_PATH" array in the initializer file.
# /////////////////////////////////////////////////////////////////////////////////////////////// #
# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo -e "WARNING !" >&2; echo >&2;
    echo -e "This shell script (${BASH_SOURCE[0]}) is not meant to be executed directly !" >&2;
    echo -e "Use this script only by sourcing it in your project script." >&2; echo >&2;
    exit 1;
fi
# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #
#################################### DEFINING LIBRARY FUNCTIONS ###################################
