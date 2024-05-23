#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"
RPMFUSION_MIRROR_RPMS="https://mirrors.rpmfusion.org"

mkdir -p /tmp/rpms

curl -Lo "/tmp/rpms/rpmfusion-free-release-${RELEASE}.noarch.rpm" "${RPMFUSION_MIRROR_RPMS}/free/fedora/rpmfusion-free-release-${RELEASE}.noarch.rpm"
curl -Lo "/tmp/rpms/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm" "${RPMFUSION_MIRROR_RPMS}/nonfree/fedora/rpmfusion-nonfree-release-${RELEASE}.noarch.rpm"

rpm-ostree install \
    /tmp/rpms/*.rpm
