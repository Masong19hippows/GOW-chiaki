#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

sleep 10 && cd ~/ && launcher /opt/chiaki --appimage-extract-and-run ${CHIAKI_STARTUP_FLAGS}
