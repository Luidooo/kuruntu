#!/bin/bash

set -e

if ! grep -qE '(vmx|svm)' /proc/cpuinfo; then
  echo "Error: CPU does not support hardware virtualization (vmx/svm)." >&2
  exit 1
fi

sudo apt-get update
sudo apt-get install -y \
  qemu-kvm \
  libvirt-daemon-system \
  libvirt-clients \
  virtinst \
  virt-manager \
  bridge-utils \
  cpu-checker

sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

sudo usermod -aG libvirt,kvm "$USER"

if ! sudo virsh net-info default &>/dev/null; then
  sudo virsh net-define /usr/share/libvirt/networks/default.xml
fi

#if [ "$(sudo virsh net-info default | awk '/Active:/{print $2}')" != "yes" ]; then
#  sudo virsh net-start default
#fi

sudo virsh net-autostart default || true
