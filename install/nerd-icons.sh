#!/bin/bash
# Você pode facilmente alterar para outra Nerd Font mudando estas duas linhas.
# Encontre outras fontes em: https://www.nerdfonts.com/font-downloads
FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
# --------------------

set -e

INSTALL_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/$FONT_NAME-nerdfont-install"

echo "› Verificando dependências (wget, unzip, fontconfig)..."
sudo apt-get update >/dev/null
sudo apt-get install -y wget unzip fontconfig >/dev/null

echo "› Preparando diretórios de instalação..."
mkdir -p "$INSTALL_DIR"
mkdir -p "$TMP_DIR"

echo "› Baixando a fonte de $FONT_URL..."
wget -q --show-progress -O "$TMP_DIR/font.zip" "$FONT_URL"

echo "› Descompactando e instalando a fonte em $INSTALL_DIR..."
unzip -q -o "$TMP_DIR/font.zip" -d "$TMP_DIR"

find "$TMP_DIR" -name "*.ttf" -exec cp {} "$INSTALL_DIR" \;

echo "› Atualizando o cache de fontes do sistema..."
fc-cache -f -v >/dev/null

echo "› Limpando arquivos temporários..."
rm -rf "$TMP_DIR"

echo ""
echo " Sucesso! A fonte '$FONT_NAME Nerd Font' foi instalada."
echo ""
echo " AÇÃO NECESSÁRIA:"
echo "   Agora, você precisa ir nas configurações do seu terminal (GNOME Terminal, Konsole, etc.),"
echo "   editar seu perfil e selecionar a nova fonte (procure por '${FONT_NAME}NF' ou '$FONT_NAME Nerd Font')."
echo "   Depois disso, feche e reabra o terminal."
