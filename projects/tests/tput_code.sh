#/usr/bin/env bash

source "/usr/local/lib/Bash-utils/lib/Initializer.sh"

color_code_dir="$PROJECT_TMP_DIR/stat"
color_code_path="$color_code_dir/STAT_COLOR_TXT.txt"

#***** Code *****
if [ ! -d "$color_code_dir" ]; then
    Makedir "$PROJECT_TMP_DIR" "stat"
fi

echo "$STAT_COLOR_TXT" > "$color_code_path"
color_code=$(cat "$color_code_path")
color_code_processing="$(echo "$color_code_path" | tr -dc '0-9')"
