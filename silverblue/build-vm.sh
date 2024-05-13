#!/bin/bash

set -ouex pipefail

rpm-ostree override remove \
  pipewire-pulseaudio

rpm-ostree install \
  imwheel \
  pulseaudio
