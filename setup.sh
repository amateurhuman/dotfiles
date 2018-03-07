# For logging and output
RED='\033[0;31m'
GREEN='\033[1;32m'
GREY='\033[0;37m'
NOCOLOR='\033[0m'

log()  { echo -e "${NOCOLOR}$*${NOCOLOR}"; }
loge() { echo -e "${RED}$*${NOCOLOR}";  }
logs() { echo -e "${GREEN}$*${NOCOLOR}";  }
logn() { echo -e "${GREY}$*${NOCOLOR}";  }

# Symlink *files
logs "Creating Symlinks"
for symlink in **/*.symlink; do
  name=$(basename "$symlink" .symlink)
  if [ -f "$HOME/.$name" ] || [ -d "$HOME/.$name" ]; then
    logn "-- Skipping $name, link already exists"
  else
    log "-- Linking $name"
    ln -s "$HOME/.dotfiles/$symlink" "$HOME/.$name"
  fi
done

# Install packages from Brewfile
logs "Installing packages from Homebrew"
if [ -f "$HOME/.Brewfile" ]; then
  brew bundle check --global || brew bundle --global
else
  loge "-- No Brewfile found at $HOME/.Brewfile"
fi

# Run individual setups
logs "Setting up packages"
for setup in **/setup.sh; do
  logs "-- Found ${setup}"
  source $setup;
done

# Configure shell
/bin/zsh -c "source $HOME/.zshrc"
