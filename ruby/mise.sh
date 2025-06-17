#!/usr/bin/env bash
#
# Ruby setup via mise
#

set -e

echo "        Installing Ruby via mise..."
mise use --global ruby@latest

echo "        Installing bundler..."
gem install bundler

echo "        Ruby setup complete"
