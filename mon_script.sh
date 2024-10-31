#!/bin/bash

# Vérifier si deux paramètres sont fournis
if [ $# -ne 2 ]; then
    echo "Usage: $0 <chemin_du_fichier.md> <langue>"
    exit 1
fi

# Récupérer les paramètres
file_path="$1"
lang="$2"

# Vérifier que le fichier a une extension .md
if [[ ! "$file_path" =~ \.md$ ]]; then
    echo "Erreur: Le fichier doit avoir une extension .md"
    exit 1
fi

# Vérifier que la langue est en minuscule et contient exactement 2 caractères
if [[ ! "$lang" =~ ^[a-z]{2}$ ]]; then
    echo "Erreur: La langue doit être composée de 2 caractères en minuscule"
    exit 1
fi

# Exécuter le script PHP avec les paramètres
echo "Exécution de content.php avec les paramètres $file_path et $lang..."
php content.php "$file_path" "$lang"

# Vérifier si l'exécution de content.php a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors de l'exécution de content.php"
    exit 1
fi

# Supprimer le répertoire .cache
echo "Suppression du répertoire .cache..."
rm -rf .cache

# Vérifier si la suppression a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors de la suppression du répertoire .cache"
    exit 1
fi

# Exécuter cecil serve
echo "Démarrage de cecil serve..."
cecil serve

# Note : cecil serve va continuer à s'exécuter, donc le script ne terminera pas automatiquement ici