# ajh17's ~/.zshrc
# Source externals {{{1
source ~/.zsh/styles.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/steeef.zsh-theme
source ~/.zsh/aliases
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

# Variables {{{1
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
export GREP_COLOR='1;33'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'

# Settings {{{1
setopt alwaystoend completeinword completealiases pathdirs automenu autolist menucomplete
setopt prompt_subst extendedglob globdots globcomplete correct recexact
setopt sharehistory histignoredups histreduceblanks histignorespace
setopt banghist incappendhistory histexpiredupsfirst histignorealldups
setopt histfindnodups histsavenodups histverify
setopt pushdtohome pushdsilent autopushd pushdminus
setopt longlistjobs autoresume multios
setopt cdablevars multios rmstarwait
setopt rcquotes autoparamslash markdirs
setopt chaselinks combiningchars
unsetopt flowcontrol caseglob clobber extendedhistory

# History {{{1
HISTFILE=$HOME/.cache/.zhistory
HISTSIZE=200000
SAVEHIST=200000

# Key remappings {{{1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
