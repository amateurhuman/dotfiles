# @amateurhuman's amateur dotfiles

Setup and configuration scripts for building a local development environment on macOS.

## How is works
+ `*/.symlink` files are linked into your home directory (Brewfile.symlink -> .Brewfile)
+ `*/.zsh` files are executed when your shell loads
+ `*/.path` files are loaded into your path
+ `*/.alias` files are loaded as aliases
+ `*/setup.sh` files are executed at the end of setup for more configuration/installation

## Customizing

+ Start with `zshrc.symlink` to configure how you like to store projects
+ Modify `homebrew/Brewfile.symlink` with packages you'll want to install with Homebrew

## Installation

+ Install [Strap](https://github.com/MikeMcQuaid/strap)
+ Clone `dotfiles` locally
+ Run `bash setup.sh`

## After Installation

+ Changes to your shell (paths, aliases, etc.) can be loaded with `reloadsh`
