FROM quay.io/fedora/fedora-silverblue:41 AS base

COPY docker-ce.repo /etc/yum.repos.d/docker-ce.repo
COPY vscode.repo /etc/yum.repos.d/vscode.repo
COPY hashicorp.repo /etc/yum.repos.d/hashicorp.repo
COPY vivaldi-fedora.repo /etc/yum.repos.d/vivaldi-fedora.repo
COPY repo.sh /tmp/repo.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/repo.sh && \
    ostree container commit

FROM base AS silverblue

COPY docker-credential-ecr-login /bin/docker-credential-ecr-login
COPY session-manager-plugin /bin/session-manager-plugin
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit

FROM silverblue AS silverblue-vmware

COPY build-vm.sh /tmp/build-vm.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build-vm.sh && \
    ostree container commit
