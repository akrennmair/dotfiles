# ZSH Theme
# based on the lukerandall theme.

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# previous prompt: ❯
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%Bλ%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[yellow]%}⁇%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}⤸%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}⚑%{$fg_bold[yellow]%}"

