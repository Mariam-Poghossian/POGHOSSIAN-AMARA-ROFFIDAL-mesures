#!/bin/bash

# Dossier cible (dossier courant par défaut)
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Erreur : Le dossier '$TARGET_DIR' n'existe pas."
    exit 1
fi

# Convention : fichiers .php, .js, .css, hors vendor/ et fichiers/dossiers cachés
# cat + un seul wc -l => pas de découpage en paquets, résultat identique Mac/Linux
TOTAL=$(find "$TARGET_DIR" \
    -not -path '*/.*' \
    -not -path '*/vendor/*' \
    -type f \( -name "*.php" -o -name "*.js" -o -name "*.css" \) \
    -exec cat {} + | wc -l | tr -d ' ')

echo "Total général : $TOTAL lignes"