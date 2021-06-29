#!/usr/bin/bash

__PROJECT_FIFO_DIR_PATH="/usr/local/lib/Bash-utils/projects/lib-tests/FIFO"

function Decho { echo "$(tput setaf 6)$1$(tput sgr0)"; }

# This function is called once in the next function.
function __CreateFIFO
{
    #***** Parameters *****
    local arr=("$@")

    #***** Variables *****
    local i=0

    #***** Code *****
    for val in "${arr[@]}"; do
        i=$(( i+1 ))

        echo "$(tput setaf 166)$i$(tput setaf 196)/$(tput setaf 166)${#arr[@]}$(tput sgr0) : $val$(tput sgr0)"
    done
}

# Creating a named pipe to get a variable's value instead of declaring it in a sub-shell, and thus, losing its modified value.
function CreateFIFO
{
    #***** Parameters *****
    local p_path=$1

    #***** Code *****
    if [ ! -d "$__PROJECT_FIFO_DIR_PATH" ]; then
        echo "Creating the $(Decho "$__PROJECT_FIFO_DIR_PATH")"; echo
        mkdir -pv "$__PROJECT_FIFO_DIR_PATH"
    fi
    
    echo "Creating the $(tput setaf 6)$p_path$(tput sgr0) FIFO."
    echo
    
    if [ ! -p "$p_path" ]; then
        if mkfifo "$p_path"; then
            echo "Successfully created this FIFO --> $(tput setaf 6)$p_path$(tput sgr0)." "$(( LINENO-1 ))"
            echo
        else
            echo "Error : Unable to create this FIFO --> $(Decho "$p_path")"
        fi
    else
        echo "Existing FIFO --> $(tput setaf 6)$p_path$(tput sgr0)" "$(( LINENO-1 ))"
    fi
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

#### NAMED PIPES READING

## FIFO READING

# Reading from a named pipe.
function ReadFromFIFO
{
    #***** Parameters *****
    p_fifoPath=$1               # FIFO's path.
    p_fifoVarName=$2            # Stored variable's name.
    p_fifoCurrentVarValue=$3    # Stored variable's value to get.

    #***** Variables *****
    v_varLine="$p_fifoVarName=\"$p_fifoCurrentVarValue\""

    #***** Code *****
    echo "Read the $p_fifoPath FIFO to find the $p_fifoCurrentVarValue value." 
    echo
        
    while true; do
        if read -r line < "$p_fifoPath"; then
            if [[ "$line" == "$v_varLine" ]]; then
                # Gathering the wanted value
                echo "$p_newVar"
                break
            else
                echo "${FUNCNAME[0]} --> Error : the $(Decho "$v_varLine") string was not found in the $(Decho "$p_fifoPath") FIFO" >&2
                kill "$$"
            fi
        fi
    done
}

# -----------------------------------------------



# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Writing into a named pipe
function WriteIntoFIFO
{
    #***** Parameters *****
    p_fifoPath=$1		# FIFO's path to write into.
    p_fifoVarName=$2    # Stored variable's name
    p_newVar=$3         # Stored variable's new value.
    p_existingPath=$4   # Handling missing FIFO, to define specific instructions.

    #***** Variables *****
    v_varLine="$p_fifoVarName=\"$p_fifoCurrentVarValue\""

    #***** Code *****
    if [ ! -p "$p_fifoPath" ]; then
        if [ "$p_existingPath" = "nopath" ]; then
            return
        else
            echo
            
            # As this function is called by the functions called in the "HandleErrors" function, calling this last function will cause an infinite loop
            # Redefining a part of its behavior was necessary to prevent this situation.
            echo "IN $(basename "${BASH_SOURCE[0]}"), FUNCTION ${FUNCNAME[0]}, LINE $LINENO --> ERROR :" "-ne"
            echo "NO VALUE PASSED IN THE  \"p_existingPath\"  PARAMETER !" "-e"
            echo

            echo ""
        fi
    fi
    # If the file size is equal to 0 (empty file)
    # TODO : Ça bloque par ici
    if [ ! -s "$p_fifoPath" ]; then
        cat <<-EOF > "$p_fifoPath"
        $v_varLine="$p_newVar"
EOF
    fi
}

CreateFIFO "$__PROJECT_FIFO_DIR_PATH/test1"
echo "//////////////////////////////////////////////////////////////////////////////////////////////////"

WriteIntoFIFO "$__PROJECT_FIFO_DIR_PATH/test1" "COLOR" "6" ""
echo "//////////////////////////////////////////////////////////////////////////////////////////////////"

ReadFromFIFO "$__PROJECT_FIFO_DIR_PATH/test1" "COLOR" ""
echo "//////////////////////////////////////////////////////////////////////////////////////////////////"
