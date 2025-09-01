#!/bin/bash
# Encontre outras fontes em: https://www.nerdfonts.com/font-downloads
FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
# --------------------

set -e

FONTS_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/$FONT_NAME-nerdfont-install"

sudo apt update >/dev/null
sudo apt install -y wget unzip fontconfig

mkdir -p "$INSTALL_DIR"
mkdir -p "$TMP_DIR"

wget -q --show-progress -O "$TMP_DIR/font.zip" "$FONT_URL"

unzip -q -o "$TMP_DIR/font.zip" -d "$TMP_DIR"

find "$TMP_DIR" -name "*.ttf" -exec cp {} "$INSTALL_DIR" \;

fc-cache -f -v >/dev/null

rm -rf "$TMP_DIR"

echo " AÇÃO NECESSÁRIA:"
echo "   Agora, você precisa ir nas configurações do seu terminal (GNOME Terminal, Konsole, etc.),"
echo "   editar seu perfil e selecionar a nova fonte (procure por '${FONT_NAME}NF' ou '$FONT_NAME Nerd Font')."
echo "   Depois disso, feche e reabra o terminal."
