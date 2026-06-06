#!/bin/bash
set -e

source /opt/gow/launch-comp.sh

cd ~/ && launcher /opt/chiaki --appimage-extract-and-run ${CHIAKI_STARTUP_FLAGS}
