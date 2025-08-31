#!/usr/bin/env bash

# -u: Treat unset variables as an error when substituting.
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: the return value of a pipeline is the status of the
#              last command to exit with a non-zero status.
set -eo pipefail