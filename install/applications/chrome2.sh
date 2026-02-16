#!/bin/bash

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt update
sudo apt install -y google-chrome-stable apparmor-utils

sudo tee /etc/apparmor.d/chrome.sandbox >/dev/null <<'EOF'
abi <abi/4.0>,
include <tunables/global>

/opt/google/chrome/chrome-sandbox flags=(unconfined) {
  userns,

  capability setuid,
  capability setgid,
  capability sys_admin,
  capability sys_chroot,

  /opt/google/chrome/chrome-sandbox ix,
  /opt/google/chrome/chrome px,
}
EOF

sudo tee /etc/apparmor.d/google-chrome >/dev/null <<'EOF'
abi <abi/4.0>,
include <tunables/global>

/opt/google/chrome/** flags=(unconfined) {
  userns,
}

/usr/bin/google-chrome** flags=(unconfined) {
  userns,
}
EOF

sudo apparmor_parser -r /etc/apparmor.d/chrome.sandbox
sudo apparmor_parser -r /etc/apparmor.d/google-chrome

sudo chown root:root /opt/google/chrome/chrome-sandbox
sudo chmod 4755 /opt/google/chrome/chrome-sandbox

echo -n | gnome-keyring-daemon --unlock
