FROM registry.opensuse.org/opensuse/distrobox:latest AS base

# repo dependencies
RUN zypper install -y curl jq unzip
# distrobox dependencies
RUN zypper install -y bc bzip2 hostname less wget zip rsync man lsof openssh-clients xauth shadow pigz pinentry iputils procps tree diffutils cracklib-dict-small zsh ncurses
# asdf depdendencies
RUN zypper install -y gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel gdbm-devel make findutils patch gawk sshpass

# set locale
#RUN localedef --inputfile=en_GB --charmap=UTF-8 en_GB.UTF-8

# common host executables
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/git
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/podman
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/conmon


FROM base AS docker-cli-distrobox

# install docker
RUN zypper install -y docker
RUN systemctl enable docker

# install ecr-credential-helper
RUN curl https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.7.1/linux-amd64/docker-credential-ecr-login -o /usr/local/bin/docker-credential-ecr-login
RUN chmod +x /usr/local/bin/docker-credential-ecr-login


FROM base AS main-apps-distrobox

# themes
RUN zypper install -y gtk3-metatheme-adwaita

# host executables
RUN ln -s /usr/bin/distrobox-host-exec /usr/local/bin/docker

# packages
RUN zypper install -y asdf


FROM main-apps-distrobox AS main-apps-deck-distrobox

RUN zypper install -y syncthing

