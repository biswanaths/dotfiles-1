# ajh17's ~/.zshrc
# Source externals {{{1
source ~/.zsh/styles.zsh
source ~/.zsh/aliases
source ~/.zsh/ajh.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source `brew --prefix`/etc/autojump.sh
eval "$(rbenv init - --no-rehash zsh)"

# Variables {{{1
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'
fpath=(~/.zsh/Completion /usr/local/share/zsh-completions $fpath)

# Settings {{{1
setopt alwaystoend completeinword completealiases pathdirs automenu autolist menucomplete
setopt prompt_subst extendedglob globdots globcomplete correct recexact
setopt sharehistory histignoredups histreduceblanks histignorespace
setopt banghist incappendhistory histexpiredupsfirst histignorealldups
setopt histfindnodups histsavenodups histverify
setopt pushdtohome pushdsilent autopushd pushdminus
setopt longlistjobs autoresume multios
setopt autocd cdablevars multios rmstarwait
setopt rcquotes autoparamslash markdirs
setopt chaselinks combiningchars
unsetopt flowcontrol caseglob clobber extendedhistory

# History {{{1
HISTFILE=$HOME/.cache/.zhistory
HISTSIZE=200000
SAVEHIST=200000

# Key Remappings (Vi-mode) {{{1
KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd "?" history-incremental-pattern-search-backward
bindkey -M vicmd "/" history-incremental-pattern-search-forward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete
bindkey '^L' clear-screen
bindkey '^?' backward-delete-char
