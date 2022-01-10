#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

# shellcheck disable=SC1090
source "$HOME/Bash-utils-init.sh" "main" || { echo >&2; echo -e "Unable to source the '$__BU_MOD_MAIN/Initializer.sh' file" >&2; echo >&2; exit 1; }



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

## ARGUMENTS DEFINITION

# Please define any needed arguments here.

# -----------------------------------------------

## VARIABLES DEFINITION

# Script's resources directory.
__RES_DIR="$__BU_MAIN_MODULE_DOCS_DIR_PATH/.$__BU_MAIN_PROJECT_NAME"

# Supported languages array.
__supported_languages=('en' 'fr')

# -----------------------------------------------

## STATUS VARIABLES MODIFICATION

# shellcheck disable=SC2034
__BU_MAIN_STAT_ERROR="fatal"; CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## FUNCTIONS DEFINITION

# Please define any needed functions here.

# ----------------------------------------------

## CODE

BU::EchoNewstep "In which language do you want to write your LaTeX document ?"
BU::EchoNewstep "Currently supported languages --> English (en), French (fr)"
BU::Newline

read -rp "Please type the wanted language's code in the above parenthesis : " __read_lang
BU::EchoRead "$__read_lang"
BU::Newline

if [[ "$__read_lang" =~ ${__supported_languages[*]} ]]; then
	# shellcheck disable=SC2016
	BU::Main::Errors::HandleErrors "1" "THE $(BU::Main::Echo::ToLowercase "$(BU::DechoE '$__read_doc_name')'s") VARIABLE'S VALUE IS INCORRECT" "The currently supported languages are : $(for _ in "${__supported_languages[@]}"; do echo -e "- $_\n"; done)" "$__read_lang" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
else

	#***** Conditions variables definition.
	__path_Bash="$__read_lang/Bash/"
	__path_config="$__read_lang/config"
	__path_basis_functions="$__read_lang/Bash/functions/basis"
	__path_main_functions="$__read_lang/Bash/functions/main"
	__path_variables="$__read_lang/Bash/variable"

	#***** Asking for the new document's path.
	BU::EchoNewstep "What kind of document do you want to write ?"
	BU::EchoMsg "1 - Master documentation			$(BU::DechoGreen "Targeted folder") --> $(BU::Decho "$__path_Bash")"
	BU::EchoMsg "2 - Configuration documentation	$(BU::DechoGreen "Targeted folder") --> $(BU::Decho "$__path_config")"
	BU::EchoMsg "3 - Basic functions documentation	$(BU::DechoGreen "Targeted folder") --> $(BU::Decho "$__path_basis_functions")"
	BU::EchoMsg "4 - Main functions documentation	$(BU::DechoGreen "Targeted folder") --> $(BU::Decho "$__path_main_functions")"
	BU::EchoMsg "5 - Variables documentation		$(BU::DechoGreen "Targeted folder") --> $(BU::Decho "$__path_variables")"
	BU::Newline

	read -rp "Please type the number corresponding to the wanted document category : " __read_folder_code
	BU::EchoRead "$__read_folder_code"
	BU::Newline

	#***** Verifying if the entered code is valid.
	lineno_case_read_folder_is_valid="$LINENO"; case "$__read_folder_code" in
		1)
			BU::Main::Directories::Make "$__BU_MAIN_DOCS" "$__path_Bash" && __folder_path="$__BU_MAIN_DOCS/$__path_Bash"
			;;
		2)
			BU::Main::Directories::Make "$__BU_MAIN_DOCS" "$__path_config" && __folder_path="$__BU_MAIN_DOCS/$__path_config"
			;;
		3)
			BU::Main::Directories::Make "$__BU_MAIN_DOCS" "$__path_basis_functions" && __folder_path="$__BU_MAIN_DOCS/$__path_basis_functions"
			;;
		4)
			BU::Main::Directories::Make "$__BU_MAIN_DOCS" "$__path_main_functions" && __folder_path="$__BU_MAIN_DOCS/$__path_main_functions"
			;;
		5)
			BU::Main::Directories::Make "$__BU_MAIN_DOCS" "$__path_variables" && __folder_path="$__BU_MAIN_DOCS/$__path_variables"
			;;
		*)
			# shellcheck disable=SC2016
			BU::Main::Errors::HandleErrors "1" "THE $(BU::Main::Echo::ToLowercase "$(BU::DechoE '$__read_doc_name')'s")) ENTERED VALUE IS INVALID" "Please type an integer value ranging from 1 to 5" "$__read_folder_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno_case_read_folder_is_valid"
			;;
	esac

	BU::EchoNewstep "How do you want to name your document ?"
	read -rp "Enter the file's name (no ''.tek'' extension, this script will complete it) : " __read_doc_name
	BU::EchoRead "$__read_doc_name"

	if [ -z "$__read_doc_name" ]; then
		# shellcheck disable=SC2016
		BU::Main::Errors::HandleErrors "1" "THE $(BU::Main::Echo::ToLowercase "$(BU::DechoE '$__read_doc_name')'s") VARIABLE IS EMPTY" "Please type a valid name according to your filesystem accepted values" "$__read_doc_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
	fi
	__full_path="$__folder_path/$__read_doc_name"

	BU::Main::Files::Make "$__folder_path" "$__read_doc_name.tex" && BU::EchoSuccess "Your LaTeX file ($(BU::DechoS "$__full_path")) was successfully created."

	## TODO : PUT THE USER'S KEYBOARD INPUTS AS DOCUMENT'S TITLE, AUTHOR'NAME AND SUBJECT. ALSO WRITE THE YEAR.

	exit 0
fi
