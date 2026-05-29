#!/usr/bin/env bash

# -u: Treat unset variables as an error when substituting.
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: the return value of a pipeline is the status of the
#              last command to exit with a non-zero status.
set -eo pipefail

VERSION="${1}"

if [[ -z ${VERSION} ]]; then
  echo "Missing flutter version."
  exit 1
fi

if ! command -v /opt/flutter/bin/flutter > /dev/null; then
  wget \
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${VERSION}-stable.tar.xz" \
    -O "/tmp/flutter.tar.xz"
  sudo rm -rf /opt/flutter/
  sudo tar xf "/tmp/flutter.tar.xz" -C /opt/
  rm "/tmp/flutter.tar.xz"
fi
