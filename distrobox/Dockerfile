FROM quay.io/fedora/fedora:latest AS base

# repo dependencies
RUN dnf install -y dnf-plugins-core curl jq unzip glibc-locale-source
# distrobox dependencies
RUN dnf install -y bc bzip2 hostname less wget zip rsync man lsof openssh-clients xauth passwd pigz pinentry iputils procps tree diffutils cracklib-dicts zsh ncurses

# set locale
RUN localedef --inputfile=en_GB --charmap=UTF-8 en_GB.UTF-8


FROM base AS docker-cli-distrobox

# remove existing docker
RUN dnf remove -y docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-selinux \
  docker-engine-selinux \
  docker-engine

# add repos
RUN dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# install docker
RUN dnf install -y systemd docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
RUN systemctl enable docker

# install ecr-credential-helper
RUN curl https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.7.1/linux-amd64/docker-credential-ecr-login -o /usr/local/bin/docker-credential-ecr-login
RUN chmod +x /usr/local/bin/docker-credential-ecr-login


FROM base AS main-apps-distrobox

# add repos
RUN dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
COPY vscode.repo /etc/yum.repos.d/vscode.repo

# pyenv dependencies
RUN dnf install -y git gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel

# AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip
RUN rm -rf ./aws

# themes
RUN dnf install -y adw-gtk3-theme

# packages
RUN dnf install -y https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm
RUN dnf install -y packer
RUN dnf install -y syncthing
RUN dnf install -y openssl
RUN dnf install -y code
