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
curl https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.7.1/linux-amd64/docker-credential-ecr-login -o /usr/local/bin/docker-credential-ecr-login
chmod +x /usr/local/bin/docker-credential-ecr-login

systemctl enable docker
