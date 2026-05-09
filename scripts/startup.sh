#!/bin/bash
set -e

source /opt/gow/launch-comp.sh
launcher /opt/chiaki --appimage-extract ${CHIAKI_STARTUP_FLAGS}
