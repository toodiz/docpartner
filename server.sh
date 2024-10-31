#!/bin/bash

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
php cecil.phar serve

# Note : cecil serve va continuer à s'exécuter, donc le script ne terminera pas automatiquement ici
