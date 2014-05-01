#
#
### Adapted from steeef zsh prompt theme.
### Modified anough behaviors to rename it
#
#
setopt prompt_subst
autoload colors
autoload -Uz vcs_info
colors

turquoise="%F{81}"
orange="%F{166}"
purple="%F{135}"
hotpink="%F{161}"
limegreen="%F{118}"

# Version control
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' %F{blue}[%F{green}%b%c%u%F{blue}]'
    } else {
        zstyle ':vcs_info:*' formats ' %F{blue}[%F{green}%b%c%u%F{red}●%F{blue}]'
    }
    vcs_info
}

vim_insert_mode="%B%F{red}>%F{yellow}>%F{green}>%f%b%{$reset_color%}"
vim_cmd_mode="%B%F{green}<%F{yellow}<%F{red}<%f%b%{$reset_color%}"
vim_mode=$vim_insert_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_insert_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

preexec () {
   (( $#_elapsed > 1000 )) && set -A _elapsed $_elapsed[-1000,-1]
   typeset -ig _start=SECONDS
}
precmd() {
   (( _start >= 0 )) && set -A _elapsed $_elapsed $(( SECONDS-_start ))
   _start=-1
}

function zle-line-finish {
  vim_mode=$vim_insert_mode
}
zle -N zle-line-finish
PROMPT=$'
%{$purple%}%n%{$reset_color%} at %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%}${vcs_info_msg_0_}%F{blue}
%(?/%F{blue}/%F{red})${vim_mode} %{$reset_color%}'
RPROMPT='%F{blue}⚙ %j%{$reset_color%} :: %{$orange%}(${_elapsed[-1]}s) %{$reset_color%}'
# vim: ft=zsh
