# Google Cloud SDK integration

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chris/Source/google-cloud-sdk/path.zsh.inc' ]; then 
  . '/Users/chris/Source/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chris/Source/google-cloud-sdk/completion.zsh.inc' ]; then 
  . '/Users/chris/Source/google-cloud-sdk/completion.zsh.inc'
fi