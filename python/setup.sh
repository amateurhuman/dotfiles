# Install Python versions
VERSIONS=( "3.8.0" "3.7.5" "pypy3.6-7.1.1" )
if pyenv --version &>/dev/null; then
  log "-- Using $(pyenv --version)"

  for version in "${VERSIONS[@]}"; do
    pyenv install $version
  done
fi
pyenv global 3.8.0

# Install pipx for global CLI installs
pip3 install pipx

# Install Poetry for better virtual environment experience
pipx install poetry==1.0.0b4