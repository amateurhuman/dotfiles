# Check if asdf is installed
if ! command -v asdf &> /dev/null; then
  echo "Error: asdf is not installed. Please install asdf first."
  exit 1
fi

# Install Ruby using asdf
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

# Install bundler
gem install bundler
