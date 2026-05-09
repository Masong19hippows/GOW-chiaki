#!/bin/bash
set -e

source /opt/gow/launch-comp.sh
launcher /usr/bin/chiaki ${CHIAKI-NG_STARTUP_FLAGS} --appimage-extract
