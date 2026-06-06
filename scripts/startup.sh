#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

if [[ -f "/opt/vhui.conf" ]]; then
    /opt/vhclientx86_64 -n -c "/opt/vhui.conf"
fi

cd ~/ && launcher /opt/chiaki --appimage-extract-and-run ${CHIAKI_STARTUP_FLAGS}
