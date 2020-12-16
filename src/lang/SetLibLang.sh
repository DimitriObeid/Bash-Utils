#!/usr/bin/env bash

LIBLANG_TRANSLATION_FILE="$BASH_UTILS_LANG/lang.csv"

# Preventing the direct execution of this file, as this script is not meant to be directly executed, but sourced.
if [ "${0##*/}" == "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING !"; echo
    echo "This script is not meant to be executed directly."
    echo "Use this script only by sourcing it the initializer script."; echo

    exit 1
fi

# Optimizing the "GetLang" function's code with another function.
function ParseCSVLibLang
{
    #***** Parameters *****
    lang=$1
    success_msg=$2
    error_msg=$3

    #***** Variables *****
    col_index=0     # column index
    row_index=0     # line (row)

    #***** Code *****
    # Cut the ICU language code, which is at the left of the underscore, then stroing it into a variable.
    LANG=$("$LANG" | cut -f 1 -d '_')
    WriteInitLog "Language : $LANG"
    
    # Parser le fichier CSV contenant les traductions
    lineno=$LINENO; if [ -f "$LIBLANG_TRANSLATION_FILE" ]; then
        # cat "$LIBLANG_TRANSLATION_FILE" | 
        # Getting the language column first, by checking on the very first CSV file's row
        while IFS=, read -ra col_value; do
            col_index=$(( col_index+1 ))

            if [ "$col_value" = "VARIABLE" ] && [ "$col_index" -eq 1 ]; then
                echo "$col_value"
                echo "$col_index"
            else
                WriteInitLog "In ${BASH_SOURCE[0]}, line $LINENO --> Error : Unable to get the VARIABLE value in the $LIBLANG_TRANSLATION_FILE's FIRST line." "1"
                WriteInitLog "Did you modified the CSV file or the script ?" "1"
                exit 1
            fi
            
        done < "$LIBLANG_TRANSLATION_FILE"

        
        echo "STILL PARSING THE CSV FILE, WAIT UNTIL IT'S DONE" "1"
        exit 1

        # Then, getting the language's row.
        # ÇA NE MARCHE PAS
        # for row_val in "${row_values[$row_index]}"; do
        #       echo "$row_val"
        #       echo "$row_index"
        # done
        
        # Then, reading the VARIABLE column and assign for each variable of the VARIABLE column the value of the $LANG column from the same row.
        
        
        

       #     ANCIEN CODE

       #     for col_index in "${!col_values[@]}"; do
       #         col_index_2=${col_values[$col_index]}
       #         if [ "$col_index" -eq 1 ]; then
       #             for row_index in "${!row_values[@]}"; do
       #                 language_val=${row_values[$row_index]}
       #                 echo "$language_val"
       #                 
       #                 if [ "$language_val" = "$LANG" ]; then
       #                     echo "Row $row_index, LANGUE : $LANG"
       #                 fi
       #             done
       #         fi
       #     done
       #
       #    (( ++row_index ))
       #    awk -F "," {print "VARIABLE"}
    else
        WriteInitLog "" "1"; exit 1
    fi

  
  # Don't double quote what follows the path variable, or else, the loop will only run once.
 #   WriteInitLog "In ${BASH_SOURCE[0]}, line $lineno"; for f in $parent_dir/$file; do
   #     if source "$f"; then
   #         WriteInitLog "$success_msg : $f"
   #     else
   #         echo "$f : $error_msg"; echo
#
 #           exit 1
  #      fi
   # done; WriteInitLog
}

# Detecting user's language with the "$LANG" environment variable.
function SetLibLang
{
    case "$LANG" in
        en_*)
            # English
            ParseCSVLibLang "$LANG" "In ${BASH_SOURCE[0]}, line $lineno --> Error : cannot find the $LIBLANG_TRANSLATION_FILE file, abort" \
                "Translation file found : $LIBLANG_TRANSLATION_FILE"
            ;;
        fr_*)
            # French
            ParseCSVLibLang "$LANG" "Dans le fichier ${BASH_SOURCE[0]}, à la ligne $lineno --> Erreur : impossible de trouver le fichier $LIBLANG_TRANSLATION_FILE" \
                "Fichier de traduction trouvé : $LIBLANG_TRANSLATION_FILE"
            ;;
        *)
            # Else, if the detected language is not (yet) supported, the default language will be set as English.
            # As it's an important information, the "echo" command's output has to be redirected to the terminal too, no matter if
            WriteInitLog "YOUR CURRENT LANGUAGE IS NOT YET SUPPORTED !!" "1"
            WriteInitLog "The $(basename "$0" | cut -f 1 -d '.') library language will be set in English" "1"

            ParseCSVLibLang "In ${BASH_SOURCE[0]}, line $lineno --> Error : cannot find the $LIBLANG_TRANSLATION_FILE file, abort" \
                "Translation file found : $LIBLANG_TRANSLATION_FILE"
            ;;
    esac
}

# In case an user would like to use another language instead of the current used language in the system,
# he can create a file named "lang.conf" in the "Bash-Utils/config" folder and write its language's
if [ -f "$BASH_UTILS_LANG/lang.conf" ]; then
    LANG="$(cat "$BASH_UTILS_LANG/lang.conf")"
    SetLibLang
else
    SetLibLang
fi
