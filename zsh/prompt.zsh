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

git_tracking() {
  st=$(/usr/bin/git status -sb 2>/dev/null | tail -n 1 | grep behind)
  if [[ $st == "" ]]
  then
    echo ""
  else
    echo "ˆ"
  fi
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo "on %{$fg[yellow]%}$(git_prompt_info)#%{$reset_color%}"
  else
    if [[ $st == "nothing to commit, working tree clean" ]]
    then
      echo "on %{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg[yellow]%}$(git_prompt_info)*%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
  ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null)
  echo "${ref#refs/heads/}"
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

export PROMPT=$'\n$(directory_name) $(git_dirty)$(need_push)\n[$(time_for_prompt)] $(root_warning)'
