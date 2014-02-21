# ajh's zshrc
# Prompt {{{1
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grb

# Completions {{{1
autoload -Uz compinit
compinit

# Environment variables {{{1
export PATH=/usr/local/bin:/usr/local/sbin:/Applications/Postgres93.app/Contents/MacOS/bin:${PATH}
export PATH="$HOME/.bin:$PATH"

# Source externals {{{1
source ~/.zsh/aliases
eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install posix-alias zsh-wcomp zsh-wcomp-install)"

# General settings {{{1
bindkey -e
setopt appendhistory autocd extendedglob
unsetopt beep nomatch
HISTFILE=~/.cache/.zhistory
HISTSIZE=10000
SAVEHIST=10000
