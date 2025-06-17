# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).

# Check Apple Silicon Homebrew path first, then Intel path
completion=/opt/homebrew/etc/bash_completion.d/git-completion.bash
if [[ ! -f $completion ]]; then
  completion=/usr/local/etc/bash_completion.d/git-completion.bash
fi

if test -f $completion
then
  source $completion
fi
