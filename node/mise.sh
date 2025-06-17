#!/usr/bin/env bash
#
# Node.js setup via mise
#

set -e

echo "        Installing Node.js via mise..."
mise use --global node@lts

echo "        Installing global Node.js packages..."
npm install -g yarn
npm install -g pnpm

echo "        Node.js setup complete"
