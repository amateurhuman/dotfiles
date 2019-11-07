RUBY_VERSIONS=( "2.4.3" "2.5.0" "2.6.5" )

if rbenv -v &>/dev/null; then
  log "-- Using $(rbenv -v)"

  eval "$(rbenv init -)"

  for version in "${RUBY_VERSIONS[@]}"; do
    if rbenv prefix $version &>/dev/null; then
      logn "-- Ruby $version already installed"
    else
      rbenv install $version
    fi
  done

  # gem install bundler
else
  loge "-- rbenv not installed, skipping setup"
fi
