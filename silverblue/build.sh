#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
  firefox firefox-langpacks \
  gnome-terminal gnome-terminal-nautilus

rpm-ostree install \
  docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
  screen \
  vim \
  make \
  distrobox \
  podman \
  zsh \
  firewall-config \
  gnome-tweaks \
  adw-gtk3-theme \
  openssh-server \
  firewalld \
  papirus-icon-theme \
  jetbrains-mono-fonts \
  syncthing \
  yt-dlp \
  code \
  openssl

# ecr credential helper
chmod +x /var/usrlocal/bin/docker-credential-ecr-login

systemctl enable docker
