#!/bin/bash
# Armbian customize-image.sh hook — PXVIRT wrapper
# Args: $RELEASE $LINUXFAMILY $BOARD $BUILD_DESKTOP $ARCH
# Armbian bind-mounts userpatches/overlay/ to /tmp/overlay/ inside chroot
set -e

PXVIRT_DIR=/tmp/overlay

if [[ ! -x "$PXVIRT_DIR/buildrootfs.sh" ]]; then
    echo "ERROR: $PXVIRT_DIR/buildrootfs.sh not found!"
    echo "  Contents of /tmp/overlay/: $(ls /tmp/overlay/ 2>/dev/null)"
    exit 1
fi

exec "$PXVIRT_DIR/buildrootfs.sh" armbian "$@"
