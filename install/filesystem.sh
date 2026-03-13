#!/bin/bash

set -e

echo "Creating filesystem structure..."

DIRS=(
  "$HOME/Randon-shits/rs-trabalho"
  "$HOME/Randon-shits/rs-pessoal"
  "$HOME/Randon-shits/rs-faculdade"
  "$HOME/trabalho"
  "$HOME/pessoal/documentos"
)

for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

echo "Filesystem structure created."
