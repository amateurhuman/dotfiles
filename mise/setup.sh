#!/bin/sh
#
# mise setup
#

echo "  Installing mise..."

if test ! $(which mise)
then
  echo "    mise not found, installing via Homebrew (should be handled by Brewfile)"
  exit 1
fi

echo "  mise already installed"