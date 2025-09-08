#!/bin/bash

# Verifica e instala dependências se necessário
if ! command -v scrot &>/dev/null; then
  echo "scrot não encontrado, instalando..."
  sudo apt-get update && sudo apt-get install -y scrot
fi

if ! command -v xclip &>/dev/null; then
  echo "xclip não encontrado, instalando..."
  sudo apt-get update && sudo apt-get install -y xclip
fi

# Configura o atalho de teclado usando xbindkeys
# O atalho é Super + PrintScreen para tirar um print com seleção e copiar para a área de transferência.
# Você pode personalizar a combinação de teclas conforme necessário.

# Cria o arquivo de configuração do xbindkeys se ele não existir
if [ ! -f ~/.xbindkeysrc ]; then
  touch ~/.xbindkeysrc
fi

# Verifica se a configuração do atalho já existe para evitar duplicatas
if ! grep -q "gnome-screenshot -w -f /tmp/screenshot.png" ~/.xbindkeysrc; then
  # Adiciona a configuração do atalho ao arquivo ~/.xbindkeysrc
  echo -e "
# Screenshot com seleção para clipboard
"gnome-screenshot -w -f /tmp/screenshot.png"
    Control+Shift + Print
" >>~/.xbindkeysrc

  # Reinicia o xbindkeys para aplicar as novas configurações
  killall xbindkeys >/dev/null 2>&1
  xbindkeys

  echo "Atalho de print com seleção para clipboard configurado com sucesso!"
else
  echo "O atalho de print com seleção para clipboard já está configurado."
fi

# Verifica se a configuração do atalho já existe para evitar duplicatas
if ! grep -q "scrot -s -e 'xclip -selection clipboard -t image/png -i $f'" ~/.xbindkeysrc; then
  # Adiciona a configuração do atalho ao arquivo ~/.xbindkeysrc
  echo -e "\n# Screenshot com seleção para clipboard\n\"scrot -s -e 'xclip -selection clipboard -t image/png -i $f'\"
    Control+Shift + Print
" >>~/.xbindkeysrc

  # Reinicia o xbindkeys para aplicar as novas configurações
  killall xbindkeys >/dev/null 2>&1
  xbindkeys

  echo "Atalho de print com seleção para clipboard configurado com sucesso!"
else
  echo "O atalho de print com seleção para clipboard já está configurado."
fi
