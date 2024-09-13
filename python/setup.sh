# Check if asdf is installed
if ! command -v asdf &> /dev/null; then
  echo "Error: asdf is not installed. Please install asdf first."
  exit 1
fi

# Install Python using asdf
asdf plugin add python
asdf install python latest
asdf global python latest
