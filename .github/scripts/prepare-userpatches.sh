#!/bin/bash
# Usage: ./prepare-userpatches.sh <armbian-build-dir>
# Assemble pxvirt-armbian project files into Armbian userpatches structure
set -e

ARMBIAN_DIR="$1"
REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

USERPATCHES="$ARMBIAN_DIR/userpatches"
OVERLAY="$USERPATCHES/overlay"

mkdir -p "$OVERLAY"

# customize-image.sh wrapper -> userpatches/
cp "$SCRIPT_DIR/customize-image.sh" "$USERPATCHES/"
chmod +x "$USERPATCHES/customize-image.sh"

# Armbian bind-mounts userpatches/overlay/ to /tmp/overlay/ inside chroot
cp "$REPO_ROOT/buildrootfs.sh" "$OVERLAY/"
chmod +x "$OVERLAY/buildrootfs.sh"
cp -r "$REPO_ROOT/scripts" "$OVERLAY/"

echo "[prepare-userpatches] done → $USERPATCHES"
