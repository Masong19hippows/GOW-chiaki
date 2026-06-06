#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

if [[ -n "${VIRTUALHERE_CONF_FILE:-}" ]] && [[ -f "$VIRTUALHERE_CONF_FILE" ]]; then
    vhclientx86_64 -n -c "$VIRTUALHERE_CONF_FILE"
fi

cd ~/ && launcher /opt/chiaki --appimage-extract-and-run ${CHIAKI_STARTUP_FLAGS}
