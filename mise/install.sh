#!/usr/bin/env bash
#
# mise setup and programming language installation
#

set -e

echo "  Setting up mise and programming languages..."

# Check if mise is installed
if ! command -v mise >/dev/null 2>&1; then
  echo "    Error: mise not found, should be installed via Homebrew"
  exit 1
fi

echo "    mise is available"

# Find and execute all mise.sh scripts for language setup
echo "    Installing programming languages..."
for mise_script in ../*/mise.sh; do
  if [ -f "$mise_script" ]; then
    language=$(basename "$(dirname "$mise_script")")
    echo "      Setting up $language..."
    bash "$mise_script"
  fi
done

echo "  mise and programming languages setup complete"