#!/usr/bin/env bash

# shellcheck disable=SC2154
function WriteCommentCode.Heredoc.fr()
{
cat <<-EOF > "${v_filename_tmp}"
#!/usr/bin/env bash

# -----------------------------
## INFORMATIONS SUR LE SCRIPT :

# Nom                           : ${__compiled_file_name}
# Auteur(s) du code             : Dimitri OBEID
# Auteur(s) de la compilation   : $([ -n "$__COMPILATION_AUTHOR" ]  && printf "%s" "${__COMPILATION_AUTHOR}"    || printf 'Vous pouvez donner votre / vos nom(s) si vous avez compilé ce fichier par vous-même')
# Version                       : $([ -n "$__COMPILED_VERSION" ]    && printf "%s" "${__COMPILED_VERSION}"      || printf '1.0')


# ------------------------
# DESCRIPTION DU FICHIER :

#


# ------------------------------------
# DÉSACTIVATEUR GLOBAL DE SHELLCHECK :

#


# ------------------------------
# NOTES À PROPOS DE SHELLCHECK :

#


# -----------------------------------------------------------------------------------------
# N'EXÉCUTEZ PAS DIRECTEMENT CE SCRIPT, à la place, incluez-le dans votre script principal.

# /////////////////////////////////////////////////////////////////////////////////////////////// #

# Prévention de l'exécution directe de ce fichier, sachant que ce dernier n'est pas conçu pour être directement exécuté, mais pour être inclus.

EOF
}