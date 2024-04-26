FROM quay.io/fedora/fedora-silverblue:40 AS normal

RUN mkdir -p /var/lib/alternatives

RUN rpm-ostree override remove \
    firefox firefox-lang \
    gnome-terminal

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
    papirus-icon-theme

RUN rm -rf /tmp/* /var/* && \
    ostree container commit


FROM normal AS vmware
RUN mkdir -p /var/lib/alternatives
RUN rpm-ostree install imwheel
RUN rm -rf /tmp/* /var/* && \
    ostree container commit
