#######################################
#     Watabou's .zshrc file           #
#     Modified: May 13, 2012          #
#     Path: $HOME/.zshrc              #
#     Random Comment: zsh rules!      #
#######################################

# Path to my oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# Autoload stuff

autoload -U compinit promptinit colors
compinit
promptinit
colors

# Load fasd. 
eval "$(fasd --init auto)"

# Theme Options

# Using a theme inspired by Steve Losh. 
ZSH_THEME="prose"

# Uncomment this if you don't want automatic updates
# DISABLE_AUTO_UPDATE="true"

# Cool aliases personalized for me.
alias musicmpd="mpd && mpdscribble && ncmpcpp"
alias vim="mvim -v" # Use MacVim inside iTerm.
alias cp="cp -vi"   # Set verbose and interaction on by default
alias mv="mv -vi"   # Set verbose and interaction on by default
alias ll="ls -l"    # Show all dirs and files by list and permissions
alias la="ls -a"    # Show all dirs and files
alias c="clear"     # Clear the screen easily.
alias sv="source ~/.vimrc"
alias sz="source ~/.zshrc"
alias j="z"

# Load all the plugins
plugins=(brew battery git autojump compleat osx)
source $ZSH/oh-my-zsh.sh

setopt CORRECT
setopt MENUCOMPLETE
setopt ALL_EXPORT

#Shell options
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent
setopt autopushd pushdminus extendedglob rcquotes mailwarning

export GPGKEY=B2F6D883
export GPG_TTY=$(tty)

# Some default paths
export EDITOR=/usr/bin/vim
export JAVA_HOME=/usr/local/jdk
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# History settings
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"

# Some zsh completion style options
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Functions

# Inserts sudo at the beginning of the line with Option-s
insert sudo() {
    zle beginning-of-line
    zle -U "sudo "
}

# Key bindings
bindkey '^I' complete-word # complete on tab, leave expansion to _expand 
bindkey "^[s" insert-sudo

################################# End of .zshrc ###############################
