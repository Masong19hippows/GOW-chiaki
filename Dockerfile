# syntax=docker/dockerfile:1.4
ARG BASE_APP_IMAGE=ghcr.io/games-on-whales/base-app:edge

# hadolint ignore=DL3006
FROM ${BASE_APP_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/bin

RUN <<_INSTALL_CHIAKI-NG
#!/bin/bash
set -e
source /opt/gow/bash-lib/utils.sh

github_download "streetpea/chiaki-ng" ".assets[]|select(.name|endswith(\"AppImage_x86_64\")).browser_download_url" "chiaki"
chmod +x chiaki
_INSTALL_CHIAKI-NG

COPY --chmod=777 scripts/startup.sh /opt/gow/startup-app.sh

ENV XDG_RUNTIME_DIR=/tmp/.X11-unix

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source=$IMAGE_SOURCE