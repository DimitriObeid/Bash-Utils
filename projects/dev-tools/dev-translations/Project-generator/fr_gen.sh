#!/usr/bin/env bash

# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

################################ SOURÇAGE DES DÉPENDANCES DU PROJET ###############################

#### INITIALIZATION DU PROJET [__PROJECT__]

## SOURÇAGE DU FICHIER D'INITIALISATION

# shellcheck disable=SC1091
lineno=$LINENO; if ! source "/usr/local/lib/Bash-Utils/src/Initializer.sh"; then
    echo "Dans le fichier $(basename "$0"), à la ligne $lineno --> Erreur : impossible de sourcer le fichier d'initialisation."; echo; exit 1
fi

# -----------------------------------------------

## DÉFINITION DES DOSSIERS ET DES FICHIERS DE RESSOURCES

# Définissez vos variables d'initialisation du projet ici.
# Si vous avez besoin d'un exemple, veuillez lire le fichier "Bash-utils/src/Linux-reinstall/Linux-reinstall.sh".
# Chemins des sous-dossiers du projet [__PROJECT__].


# Fin du processus d'initialisation.
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2";
WriteInitLog "FIN DU PROCESSUS D'INITIALISATION DU PROJET $(Decho "${PROJECT_NAME^^}")";
WriteInitLog "$(DrawLine "$COL_RESET" "-")" "2"; WriteInitLog;



# ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; #

############################################### CODE ##############################################

# Vous pouvez écrire votre code maintenant.
