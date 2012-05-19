#######################################
#     Watabou's .zshrc file           #
#     Modified: May 13, 2012          #
#     Path: $HOME/.zshrc              #
#     Random Comment: zsh rules!      #
#######################################

# Path to my oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# important paths 
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# Autoload stuff
autoload -U compinit promptinit colors
compinit
promptinit
colors

# Load fasd. 
eval "$(fasd --init auto)"

# Hub 
eval "$(hub alias -s)"

# Theme Options

# Using a theme inspired by Steve Losh. 
ZSH_THEME="macademia"

# Uncomment this if you want automatic updates
# DISABLE_AUTO_UPDATE="true"

# Cool aliases personalized to my liking.
alias vim="mvim -v"                                 # Use MacVim inside iTerm.
alias cp="cp -vi"                                   # Set verbose and interaction on by default
alias mv="mv -i -v"                                 # Set verbose and interaction on by default
alias ll="ls -l"                                    # Show all dirs and files by list and permissions
alias la="ls -a"                                    # Show all dirs and files
alias c="clear"                                     # Clear the screen easily.
alias sz="source ~/.zshrc"                          # Reload .zshrc easily.
alias j="z"                                         # fasd > autojump
alias musicmpd="mpd && mpdscribble && ncmpcpp"      # some fantastic music players

# Toggle show all files in the Finder
alias showfilesY="defaults write com.apple.Finder AppleShowAllFiles YES ; killall Finder"
alias showfilesN="defaults write com.apple.Finder AppleShowAllFiles NO ; killall Finder"

# Load all the plugins
plugins=(autojump brew git compleat zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Shell options
setopt MENUCOMPLETE
setopt ALL_EXPORT
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

# Use cache to speed some stuff 
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# complete process ids
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# change syntax highlighting for the path from underlining to a color
# Use with zsh-syntax-highlighting plugin
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

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
