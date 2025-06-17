# Add custom functions directory to fpath
fpath=($DOTFILES/functions $fpath)

# Initialize autocomplete and load shell functions
autoload -U compinit
compinit