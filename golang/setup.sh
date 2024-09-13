# Check if asdf is installed
if ! command -v asdf &> /dev/null; then
  echo "Error: asdf is not installed. Please install asdf first."
  exit 1
fi

# Install Go using asdf
asdf plugin add golang
asdf install golang latest
asdf global golang latest

source $HOME/.asdf/plugins/golang/set-env.zsh
