
function CheckSupport
{
    EchoNewSubStep "Operating system : $OSTYPE"
}

function CreateBashUtilsLibParentFolder
{
    if [ ! -d "$__BASH_UTILS_FOLD" ]; then
        EchoStep "Creating the  \"$__BASH_UTILS_FOLD\"  folder" "I" "J"

        mkdir -pv "$__BASH_UTILS_FOLD" || { EchoError "Unable to create the  \"$__BASH_UTILS_FOLD\"  folder !"; }
        EchoSuccess "The  \"$__BASH_UTILS_FOLD\"  folder was successfully created"
        Newline
    fi
}

function CheckLibOwnership
{
    if [ "$I" -eq 0 ]; then
        EchoStep "Giving  \"$__BASH_UTILS_FOLD\"  ownership to \"$__ARG_USERNAME\"" "I" "J"
    else
        EchoStep "Giving  \"$__BASH_UTILS_FOLD\"  ownership to \"$__ARG_USERNAME\"" "" "J"
    fi

    if chown -Rv "$__ARG_USERNAME" "$__BASH_UTILS_FOLD"; then
        EchoSuccess "Successfully changed the  \"$__BASH_UTILS_FOLD\"  ownership, from root to \"$__ARG_USERNAME\""
    else
        EchoError ""
    fi
}

## CHANGING OWNERSHIP

if [ "$I" -eq 0 ]; then
    EchoStep "Giving  \"$__BASH_UTILS_FOLD\"  ownership to \"$__ARG_USERNAME\"" "I" "J"
else
    EchoStep "Giving  \"$__BASH_UTILS_FOLD\"  ownership to \"$__ARG_USERNAME\"" "" "J"
fi

if chown -Rv "$__ARG_USERNAME" "$__BASH_UTILS_FOLD"; then
    EchoSuccess "Successfully changed the  \"$__BASH_UTILS_FOLD\"  ownership, from root to \"$__ARG_USERNAME\""
else
    EchoError "Unable to change the "
fi  
