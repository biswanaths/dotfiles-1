# ajh's config.fish
set -x PATH ~/.bin /usr/local/bin /usr/local/sbin $PATH
set BROWSER open
set -g -x fish_greeting ''
set -g -x EDITOR vim

function fish_user_key_bindings
    bind \cn 'accept-autosuggestion'
end

function c; clear; end
function ef; vim ~/.config/fish/config.fish; end
function gst; git status; end
function j; z $argv; end
alias ls "ls -AG"

# Prompt (slightly modified from sjl's fish prompt)
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set gray (set_color -o black)

function git_prompt
    if git root >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color magenta
        printf '%s' (git currentbranch ^/dev/null)
        set_color green
#        git_prompt_status
        set_color normal
    end
end

function prompt_pwd --description 'Print the current working directory, shortend to fit the prompt'
    echo $PWD | sed -e "s|^$HOME|~|"
end

function fish_prompt
    set last_status $status
    z --add "$PWD"
    echo
    set_color magenta
    printf '%s' (whoami)
    set_color normal
    printf ' at '
    set_color yellow
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' in '
    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    git_prompt

    echo

    if test $last_status -eq 0
        set_color white -o
        printf '><((°> '
    else
        set_color red -o
        printf '[%d] ><((ˣ> ' $last_status
    end

    set_color normal
end
# vim: ft=fish
