KURUNTU_PATH="$HOME/.local/share/kuruntu"

cp "$KURUNTU_PATH/utils/wallpaper.png" "/usr/share/backgrounds/wallpaper.png"
WALLPAPER_PATH='/usr/share/backgrounds/wallpaper.png'
gsettings set org.gnome.desktop.background picture-uri "file://${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.background picture-uri-dark "file://${WALLPAPER_PATH}"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color '#8252a1'
