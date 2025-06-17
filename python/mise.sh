#!/usr/bin/env bash
#
# Python setup via mise
#

set -e

echo "        Installing Python via mise..."
mise use --global python@latest

echo "        Python setup complete"
