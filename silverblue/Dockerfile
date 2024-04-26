FROM quay.io/fedora/fedora-silverblue:40 AS silverblue

COPY docker-ce.repo /etc/yum.repos.d/docker-ce.repo

RUN mkdir -p /var/lib/alternatives

RUN rpm-ostree override remove \
    firefox firefox-langpacks \
    gnome-terminal gnome-terminal-nautilus && \
    ostree container commit

RUN rpm-ostree install \
    # docker
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    # other packages
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
    papirus-icon-theme && \
    ostree container commit

# enable services    
RUN systemctl enable docker

FROM silverblue AS silverblue-vmware
RUN mkdir -p /var/lib/alternatives
RUN rpm-ostree install imwheel && \
    ostree container commit
