install_hypralnd() {
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y build-essential git ninja-build cmake gettext libwayland-dev libdrm-dev libxkbcommon-dev libpixman-1-dev libegl1-mesa-dev libgbm-dev libinput-dev libudev-dev libseat-dev libdisplay-info-dev libliftoff-dev libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev
  git clone --recursive https://github.com/hyprwm/Hyprland
  cd Hyprland
  sudo make install
  sudo apt install -y kitty waybar wofi mako-notifier swaybg grim slurp brightnessctl pamixer fonts-font-awesome xdg-desktop-portal-hyprland

}
