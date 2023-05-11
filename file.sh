function BU.ModuleInit.IsInScript()
{
    local v_3="${0: -3}";
    local v_5="${0: -5}";

    if [ "${0:0:2}" == './' ] || [[ "${v_3,,}" == .sh ]] || [[ "${v_5,,}" == .bash ]]; then
        echo "Script";

        return 0;

    elif [[ "${0}" == *bash ]]; then
        echo "Shell";

        return 1;
    else
        echo "Unable to get the current status";

        return 1;
    fi
}


BU.ModuleInit.IsInScript;
