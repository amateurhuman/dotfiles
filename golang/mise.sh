#!/usr/bin/env bash
#
# Go setup via mise
#

set -e

echo "        Installing Go via mise..."
mise use --global go@latest

echo "        Go setup complete"
