# ajh's config.fish
# Environment Variables {{{1
set -x PATH ~/.bin /usr/local/bin /usr/local/sbin $PATH
set BROWSER open
set -g -x fish_greeting ''
set -g -x EDITOR vim
set -g -x ARCHFLAGS "-arch x86_64"

# Key mappings {{{1
function fish_user_key_bindings
    bind \cn 'accept-autosuggestion'
end

# Aliases {{{1
function sudo!!
    eval sudo $history[1]
end
function c; clear; end
function ef; vim ~/.config/fish/config.fish; end
function sf; exec fish; end
function gst; git status; end
function j; z $argv; end
function upd; brew update; brew upgrade; brew cleanup; end
alias ls "ls -AG"

# Prompt {{{1
function prompt_pwd --description 'Prints the full directory path instead of the half assed one'
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch red

set __fish_git_prompt_char_dirtystate 'λ'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '*'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        set last_status $status
        z --add "$PWD"
        set_color red
        printf '\n%s' (whoami)
        set_color normal
        printf ' at '
        set_color magenta
        printf '%s' (hostname -s)
        set_color normal
        printf ' in '
        set_color blue
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
        printf '\n⇾ '
       set_color normal
end
# vim: ft=fish fdm=marker fen
