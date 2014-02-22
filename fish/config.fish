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
function gst; git status; end
function j; z $argv; end
function upd; brew update; brew upgrade; brew cleanup; end
alias ls "ls -AG"

# Prompt {{{1
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch red

# Status Chars
set __fish_git_prompt_char_dirtystate 'λ'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '*'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end
# vim: ft=fish fdm=marker fen
