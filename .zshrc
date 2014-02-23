# ajh17's ~/.zshrc
# Source externals {{{1
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
source ~/.zsh/aliases

# Variables {{{1
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export GREP_COLOR='1;33'
PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'
fpath=(~/.zsh/Completions $fpath)

# Settings {{{1
setopt alwaystoend
setopt menu_complete
setopt prompt_subst
setopt globdots
setopt correct
setopt pushdtohome
setopt cdablevars
setopt autolist
setopt recexact
setopt longlistjobs
setopt autoresume
setopt extendedhistory
setopt histignoredups
setopt histreduceblanks
setopt histignorespace
setopt pushdsilent
setopt autopushd
setopt pushdminus
setopt extendedglob
setopt rcquotes
setopt globcomplete
setopt rmstarwait
setopt completeinword
setopt completealiases
setopt sharehistory
setopt noclobber
setopt markdirs
setopt autoparamslash
setopt chaselinks
setopt combiningchars
setopt multios
KEYTIMEOUT=1

# Key remappings {{{1
bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^N' insert-last-word
bindkey '^L' clear-screen

# History {{{1
HISTFILE=$HOME/.zhistory
HISTSIZE=200000
SAVEHIST=200000

# Functions {{{1
function :h-helper () {
    vim + "h" +"h $1" +only +'nnoremap q :q!<CR>';
}
