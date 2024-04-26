FROM quay.io/fedora/fedora-silverblue:40 AS silverblue

RUN mkdir -p /var/lib/alternatives

RUN rpm-ostree override remove \
    firefox firefox-langpacks \
    gnome-terminal gnome-terminal-nautilus && \
    ostree container commit

RUN rpm-ostree install \
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
    papirus-icon-theme && \
    ostree container commit

FROM silverblue AS silverblue-vmware
RUN mkdir -p /var/lib/alternatives
RUN rpm-ostree install imwheel && \
    ostree container commit
