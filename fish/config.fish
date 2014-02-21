# ajh's config.fish
set -x PATH /usr/local/bin /usr/local/sbin $PATH
set BROWSER open
set -g -x fish_greeting ''
set -g -x EDITOR vim

function c; clear; end
function ef; vim ~/.config/fish/config.fish; end
alias ls "ls -AG"

# vim: ft=fish
