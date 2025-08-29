#!/usr/bin/env bash

# -u: Treat unset variables as an error when substituting.
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: the return value of a pipeline is the status of the
#              last command to exit with a non-zero status.
set -eo pipefail

VERSION="26.19.2"

wget --quiet \
    "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v${VERSION}/posh-linux-amd64" \
    -O ~/.local/bin/oh-my-posh.new
cp ~/.local/bin/oh-my-posh.new ~/.local/bin/oh-my-posh
chmod 744 ~/.local/bin/oh-my-posh
rm ~/.local/bin/oh-my-posh.new