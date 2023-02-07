#!/usr/bin/env bash

# shellcheck disable=SC2154
function WriteCommentCode.Heredoc.fr()
{
cat <<-EOF > "${v_filename_tmp}"
#!/usr/bin/env bash

# -----------------------------
## INFORMATIONS SUR LE SCRIPT :

EOF
}