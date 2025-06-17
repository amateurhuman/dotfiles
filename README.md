# @amateurhuman dotfiles

Professional dotfiles for building a modern macOS development environment with one command.

## Quick Installation

### One-Command Setup (Recommended)

Clone to the standard location and set up symlinks automatically:

```bash
curl https://raw.githubusercontent.com/amateurhuman/dotfiles/main/script/clone | bash
```

Then run the installation:

```bash
~/.dotfiles/script/bootstrap
```

## How it works

Bootstrapping a new system will perform the following steps:

- `*.symlink` files are linked into your home directory (Brewfile.symlink → ~/.Brewfile)
- `config/` directory is linked to `~/.config` for XDG-compliant tool configurations
- `*/install.sh` files are executed during setup for additional configuration

After installation, the dotfiles setup follows these conventions:

- `*.zsh` files are executed when your shell loads
- `*.path` files are loaded into your PATH
- `*.alias` files are loaded as shell aliases

## Features

- **Zero-dependency bootstrap**: Uses only standard UNIX tools
- **Idempotent setup**: Safe to run multiple times
- **Language version management**: Uses [mise](https://mise.jdx.dev/)
- **Package management**: Homebrew integration with Brewfile
- **macOS optimization**: Sensible system defaults
- **Modular organization**: Easy to customize and extend

## Structure

```
dotfiles/
├── script/
│   ├── clone             # Start here to clone repository
│   ├── bootstrap         # Main installation script
│   ├── install           # Run all install.sh scripts without bootstrap
│   └── update            # Update dotfiles and packages
├── bin/                  # Custom executables
├── functions/            # Shell functions
├── config/               # XDG config files
├── macos/                # macOS-specific setup
├── homebrew/             # Package definitions
├── git/                  # Git configuration
├── zsh/                  # Shell configuration
├── mise/                 # Development tool versions
└── [tool]/               # Tool-specific configs
```

## Customization

- **Projects**: Edit `zsh/zshrc.symlink` to configure project directories
- **Packages**: Modify `homebrew/Brewfile.symlink` for your preferred tools
- **Shell**: Customize `zsh/` files for aliases, functions, and prompt
- **Languages**: Update language versions in individual setup scripts

## After Installation

- **Reload shell**: Use `reloadsh` command to refresh configuration
- **Update packages**: Run `brew bundle --global` to install new Brewfile entries
- **Language versions**: Use `mise use <tool>@<version>` to manage versions

## Requirements

- macOS (tested on recent versions)
- Git (for cloning)
- Internet connection (for package downloads)
