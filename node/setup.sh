# Check if asdf is installed
if ! command -v asdf &> /dev/null; then
  echo "Error: asdf is not installed. Please install asdf first."
  exit 1
fi

# Install Node using asdf
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# Install yarn and pnpm
npm install -g yarn
npm install -g pnpm
