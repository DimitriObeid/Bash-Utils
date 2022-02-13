#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

# shellcheck disable=SC1090
if ! source "$HOME/Bash-utils-init.sh"; then
    echo >&2; echo -e "In $(basename "$0"), line $(( LINENO-1 )) --> Error : unable to source the modules initializer file." >&2; echo >&2; exit 1
fi

# Calling the "BashUtils_InitModules()" function.
if ! BashUtils_InitModules \
    "module --log-shut" \
    "main --stat-debug=false stat-error=fatal --stat-log=true --stat-log-r=tee --stat-time-txt=1 --stat-txt-fmt=true" \

    then
	    echo >&2; echo "In $(basename "$0"), line $(( LINENO-1 )) --> Error : something went wrong while calling the « BashUtils_InitModules() » function" >&2; echo >&2; exit 1
fi



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### GLOBAL VARIABLES (RE)DEFINITION ###########################################

#### ARGUMENTS DEFINITION

## ARGUMENTS DEFINITION

# Targeted language
__ARG_LANG=$1

# Type of document (master documentation, configurations, module initializer resources or library functions).
__ARG_TYPE=$2

# Name of the file to create.
__ARG_FILENAME=$3

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### VARIABLES DEFINITION

## LANGUAGES

# Supported languages array.
__supported_languages=('en (English)' 'fr (French | Français)')

# -----------------------------------------------

## PATHS

# Script's resources directory.
__RES_DIR="$__BU_MAIN_MODULE_DEVTOOLS_SRC/$__BU_MAIN_PROJECT_NAME"

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### FUNCTIONS DEFINITION

## LANGUAGES PROCESSING

# Listing the supported languages.
function LatexCreateDoc_ListLanguages()
{
    BU::EchoNewstep "Currently supported languages --> English (en), French (fr)"

    for i in "${__supported_languages[@]}"; do
        echo "  - $i"
    done
}

# ----------------------------------------------



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

BU::EchoNewstep "In which language do you want to write your LaTeX document ?"
LatexCreateDoc_ListLanguages
BU::Newline

read -rp "Please type the wanted language's code from one of the above parenthesis : " __read_lang
BU::EchoRead "$__read_lang"
BU::Newline

# ----------------------------------------------

## PROCESSING THE DOCUMENTATION'S LANGUAGE

if [[ "$__read_lang" =~ ${__supported_languages[*]} ]]; then
	# shellcheck disable=SC2016
	BU::Main::Errors::HandleErrors "1" "THE $(BU::DechoHighlightError '$__read_doc_name')'S VARIABLE'S VALUE $(DechoHighlight "") IS INCORRECT" \
        "$(LatexCreateDoc_ListLanguages)" "$__read_lang" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

elif [[ "$__ARG_LANG" =~ ${__supported_languages[*]} ]]; then
# shellcheck disable=SC2016
	BU::Main::Errors::HandleErrors "1" "THE FIRST ARGUMENT'S VALUE (LANGUAGE) IS INCORRECT" \
        "$(LatexCreateDoc_ListLanguages)" "$__read_lang" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"

else

    # ----------------------------------------------

    ## PROCESSING THE TARGET DIRECTORY

	#***** Target paths variables definition.
	__target_path_master="$__read_lang"
	__target_path_module="$__target_path_master/modules"

	__target_path_initscript="$__target_path_module/01) ScriptInit"
	__target_path_config="$__target_path_module/02) Config"
	__target_path_init="$__target_path_module/03) Init"
	__target_path_main_functions="$__target_path_module/04) Functions"

	# If no type of document is passed as second argument
    if [ -z "$__ARG_TYPE" ]; then
        #***** Asking for the new document's path.
        BU::EchoNewstep "What kind of document do you want to write ?"
        BU::EchoMsg "1 - Master documentation                       $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_master")"
        BU::EchoMsg "2 - Module general documentation               $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_module")"
        BU::EchoMsg "3 - Module initializer script's documentation  $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_initscript")"
        BU::EchoMsg "4 - Module configuration documentation         $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_config")"
        BU::EchoMsg "5 - Module initializer documentation           $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_init")"
        BU::EchoMsg "6 - Main functions documentation               $(BU::DechoGreen "Targeted folder") --> $(BU::DechoHighlightPath "$__target_path_main_functions")"
        BU::Newline;

    	read -rp "Please type the number corresponding to the wanted document category : " __read_folder_code
        BU::EchoRead "$__read_folder_code"
        BU::Newline

    elif [ -n "$__ARG_TYPE" ]; then
        __read_folder_code="$__ARG_TYPE"
    fi

    # If the wanted folder doesn't exists yet.
    if [ ! -d "$__read_folder_code" ]; then

        EchoMsg "[ INFO ] The chosen folder doesn't exists yet"
        EchoNewstep "Creation of the $(BU::DechoHighlight "$__read_folder_code") target folder"

        #***** Verifying if the given code is valid.
        lineno_case_read_folder_is_valid="$LINENO"; case "$__read_folder_code" in
            1)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_master" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_master"
                ;;
            2)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_master" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_module"
                ;;
            3)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_initscript" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_initscript"
                ;;
            4)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_config" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_config"
                ;;
            5)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_init" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_init"
                ;;
            6)
                BU::Main::Directories::Make "$__BU_MAIN_MODULE_DOCS_DIR_PATH" "$__target_path_main_functions" && __folder_path="$__BU_MAIN_MODULE_DOCS_DIR_PATH/$__target_path_main_functions"
                ;;
            *)
                if [ -n "$__ARG_TYPE" ]; then
                    BU::Main::Errors::HandleErrors "1" "THE SECOND ARGUMENT'S VALUE ($__ARG_TYPE) IS INVALID" \
                        "Please type an integer value ranging from 1 to 6" "$__read_folder_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno_case_read_folder_is_valid"

                else
                    # shellcheck disable=SC2016
                    BU::Main::Errors::HandleErrors "1" "THE $(BU::DechoE '$__read_doc_name')'s) ENTERED VALUE IS INVALID" \
                        "Please type an integer value ranging from 1 to 6" "$__read_folder_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno_case_read_folder_is_valid"
                fi
                ;;
        esac

        EchoSuccess "The $(DechoHighlightPath "$__read_folder_code") folder was successfully created"
    fi

	if [ -z "$__ARG_FILENAME" ]; then
        BU::EchoNewstep "How do you want to name your document ?"
        read -rp "Enter the file's name (don't add a ''.tek'' extension, this script will complete it) : " __read_doc_name

        BU::EchoRead "$__read_doc_name"

        if [ -z "$__read_doc_name" ]; then
            # shellcheck disable=SC2016
            BU::Main::Errors::HandleErrors "1" "THE $(BU::DechoE '$__read_doc_name')'s VARIABLE IS EMPTY" \
                "Please type a valid name according to your filesystem accepted values" "$__read_doc_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
        fi

        __tex_full_path="$__folder_path/$__read_doc_name"
    else
        __tex_full_path="$__folder_path/$__ARG_FILENAME"
    fi

	BU::Main::Files::Make "$__folder_path" "$__read_doc_name.tex" && BU::EchoSuccess "Your LaTeX file ($(BU::DechoS "$__tex_full_path")) was successfully created."

	## TODO : PUT THE USER'S KEYBOARD INPUTS AS DOCUMENT'S TITLE, AUTHOR'NAME AND SUBJECT. ALSO WRITE THE YEAR.

	exit 0
fi
