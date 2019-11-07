PACKAGES=( "virtualenv" "virtualenvwrapper" )

if pip3 --version &>/dev/null; then
  log "-- Using $(pip3 --version)"

  for package in "${PACKAGES[@]}"; do
    pip3 show $package &>/dev/null
    if [ $? -eq 0 ]; then
      logn "-- $package already installed"
    else
      pip3 install $package
    fi
  done
else
  loge "-- pip3 not installed, skipping setup"
fi