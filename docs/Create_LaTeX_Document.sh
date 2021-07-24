#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

########################################### SOURCING PROJECT'S DEPENDENCIES ###########################################

# shellcheck disable=SC1090
source "$HOME/.bash_profile" || { echo >&2; echo -e "Unable to source the '$HOME/.bash_profile' file" >&2; echo >&2; exit 1; }

# shellcheck disable=SC1090
source "$__BASH_UTILS_LIB_FILE_INITIALIZER" || { echo >&2; echo -e "Unable to source the '$__BASH_UTILS/Initializer.sh' file" >&2; echo >&2; exit 1; }



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

######################################################### CODE ########################################################

## ARGUMENTS DEFINITION

# Please define any needed arguments here.

# -----------------------------------------------

## VARIABLES DEFINITION

# Supported languages array.
__supported_languages=('en' 'fr')

# -----------------------------------------------

## STATUS VARIABLES MODIFICATION

# shellcheck disable=SC2034
__STAT_ERROR="fatal"; CheckSTAT_ERROR "$(basename "${BASH_SOURCE[0]}")" "$LINENO"

# -----------------------------------------------

## FUNCTIONS DEFINITION

# Please define any needed functions here.

# ----------------------------------------------

## CODE

EchoNewstep "In which language do you want to write your LaTeX document ?"
EchoNewstep "Currently supported languages --> English (en), French (fr)"
Newline

read -rp "Please type the wanted language's code in the above parenthesis : " __read_lang
EchoRead "$__read_lang"
Newline

if [[ "$__read_lang" =~ ${__supported_languages[*]} ]]; then
	HandleErrors "1" "THE $(ToLowercase "$(DechoE '$__read_doc_name')'s") VARIABLE'S VALUE IS INCORRECT" "" "$__read_lang" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-1 ))"
else

	#***** Conditions variables definition.
	__path_Bash="$__read_lang/Bash/"
	__path_config="$__read_lang/config"
	__path_basis_functions="$__read_lang/Bash/functions/basis"
	__path_main_functions="$__read_lang/Bash/functions/main"
	__path_variables="$__read_lang/Bash/variable"

	#***** Asking for the new document's path.
	EchoNewstep "What kind of document do you want to write ?"
	EchoMsg "1 - Master documentation			$(DechoGreen "Targeted folder") --> $(Decho "$__path_Bash")"
	EchoMsg "2 - Configuration documentation	$(DechoGreen "Targeted folder") --> $(Decho "$__path_config")"
	EchoMsg "3 - Basic functions documentation	$(DechoGreen "Targeted folder") --> $(Decho "$__path_basis_functions")"
	EchoMsg "4 - Main functions documentation	$(DechoGreen "Targeted folder") --> $(Decho "$__path_main_functions")"
	EchoMsg "5 - Variables documentation		$(DechoGreen "Targeted folder") --> $(Decho "$__path_variables")"
	Newline

	read -rp "Please type the number corresponding to the wanted document category : " __read_folder_code
	EchoRead "$__read_folder_code"
	Newline
	
	#***** Verifying if the entered code is valid.
	lineno_case_read_folder_is_valid="$LINENO"; case "$__read_folder_code" in
		1)
			Makedir "$__BASH_UTILS_DOCS" "$__path_Bash" && __folder_path="$__BASH_UTILS_DOCS/$__path_Bash"
			;;
		2)
			Makedir "$__BASH_UTILS_DOCS" "$__path_config" && __folder_path="$__BASH_UTILS_DOCS/$__path_config"
			;;
		3)
			Makedir "$__BASH_UTILS_DOCS" "$__path_basis_functions" && __folder_path="$__BASH_UTILS_DOCS/$__path_basis_functions"
			;;
		4)
			Makedir "$__BASH_UTILS_DOCS" "$__path_main_functions" && __folder_path="$__BASH_UTILS_DOCS/$__path_main_functions"
			;;
		5)
			Makedir "$__BASH_UTILS_DOCS" "$__path_variables" && __folder_path="$__BASH_UTILS_DOCS/$__path_variables"
			;;
		*)
			HandleErrors "1" "THE $(ToLowercase "$(DechoE '$__read_doc_name')'s")) ENTERED VALUE IS INVALID" "Please type an integer value ranging from 1 to 5" "$__read_folder_code" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$lineno_case_read_folder_is_valid"
			;;
	esac
	
	EchoNewstep "How do you want to name your document ?"
	read -rp "Enter the file's name : " __read_doc_name
	EchoRead "$__read_doc_name"
	
	if [ -z "$__read_doc_name" ]; then
		HandleErrors "1" "THE $(ToLowercase "$(DechoE '$__read_doc_name')'s") VARIABLE IS EMPTY" "Please type a valid name according to your filesystem accepted values" "$__read_doc_name" "$(basename "${BASH_SOURCE[0]}")" "${FUNCNAME[0]}" "$(( LINENO-3 ))"
	fi
	
	__full_path="$__folder_path/$__read_doc_name"

	Makefile "$__folder_path" "$__read_doc_name" && EchoSuccess "Your LaTeX file ($(DechoS "$__full_path")) was successfully created."
	
	exit 0
fi
