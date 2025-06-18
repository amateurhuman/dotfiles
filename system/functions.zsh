# Add custom functions directory to fpath
fpath=($DOTFILES/functions $fpath)

# Initialize autocomplete
autoload -U compinit
compinit

# Autoload all functions in the functions directory
if [[ -d $DOTFILES/functions ]]; then
  for function_file in $DOTFILES/functions/*; do
    if [[ -f "$function_file" && ! "$function_file" =~ "/_" ]]; then
      autoload -Uz ${function_file:t}
    fi
  done
  unset function_file
fi