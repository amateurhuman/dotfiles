autoload colors && colors

directory_name() {
  echo "%{$fg[blue]%}%~%\/%{$reset_color%}"
}

time_for_prompt(){
  echo "%{$fg[yellow]%}%D{%I:%M %p}%{$reset_color%}"
}

root_warning(){
  if [[ $(whoami) == "root" ]]
  then
    echo "%{$fg_bold[red]%}# %{$reset_colors%}"
  fi
}

git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg[magenta]%}unpushed%{$reset_color%} "
  fi
}

# export PROMPT=$'\n$(directory_name) $(git_dirty)$(need_push)\n[($(time_for_prompt)) %n@%m] $(root_warning) '

export PROMPT=$'\n$(directory_name) $(need_push)\n[($(time_for_prompt)) %n@%m] $(root_warning)'

set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  set_prompt
}
