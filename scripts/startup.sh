#!/bin/bash
set -e

source /opt/gow/launch-comp.sh
launcher /home/retro/chiaki --appimage-extract ${CHIAKI_STARTUP_FLAGS}
