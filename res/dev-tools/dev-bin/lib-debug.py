import re

__BU__BIN__LIB_DEBUG__GLOBVARS__PATHS__BASHUTILS_DIR = os.path.join(os.environ['HOME'], '.Bash-utils', 'Bash-utils-root-val.path');

# Chemin vers votre fichier Bash
fichier_bash = "votre_fichier.sh"

# Expression régulière pour rechercher la fonction et ses arguments
regex = r'(\s*)BU\.Main\.Echo\.Debug\s*\\[\s\S]*?;'

# Fonction pour ajouter un dièse au début de chaque ligne correspondante
def commenter_match(match):
    lignes = match.group(0).split('\n')
    lignes_commentees = ['#' + ligne if ligne.strip() else ligne for ligne in lignes]
    return '\n'.join(lignes_commentees)

# Ouvrir le fichier Bash en mode lecture
with open(fichier_bash, 'r') as f:
    contenu = f.read()

# Rechercher et remplacer les correspondances par les lignes commentées
contenu_commente = re.sub(regex, commenter_match, contenu)

chemin_fichier = os.path.join(os.environ['HOME'], '.Bash-utils', 'Bash-utils-root-val.path')

with open(chemin_fichier, 'r') as f:
    contenu_fichier = f.read()

print("Commentaires ajoutés avec succès !")
