#!/bin/bash

function BU.Main.Filesystem.GetFSDevice()
{
    #**** Parameters ****
    local p_path=$1     # String    - Path of the file or the folder to process.

    #**** Variables ****
    local v_warn; v_warn="$(BU.Main.Decho.Decho.Function "${FUNCNAME[0]}") --> Warning : unable to get the target ($(BU.Main.Decho.Decho.Path "$p_path") file system's device";

    BU.Main.OS.IsHaiku && local v_cmd="df \"$p_path\" | awk 'FNR == 2 {print \$5}' || { BU.Main.Echo.Warning \"\$v_warn\" '-n' 'nodate'; return 1; }";
    BU.Main.OS.IsLinux && local v_cmd="df -Th \"$p_path\" | awk 'FNR == 2 {print \$1}' || { BU.Main.Echo.Warning \"\$v_warn\" '-n' 'nodate'; return 1; }";

    #**** Code ****
    if ! BU.Main.CMDS.GetCommandReturnOutputValue 'df "$path"'; then return 1; fi

    eval "$v_cmd";

    return 0;
}
