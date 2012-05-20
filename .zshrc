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

# Load all the plugins
plugins=(autojump brew compleat git osx rvm zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Cool aliases personalized to my liking.
alias vim="mvim -v"                                 # Use MacVim inside iTerm.
alias cp="cp -vi"                                   # Set verbose and interaction on by default
alias mv="mv -i -v"                                 # Set verbose and interaction on by default
alias ll="ls -l"                                    # Show all dirs and files by list and permissions
alias la="ls -a"                                    # Show all dirs and files
alias c="clear"                                     # Clear the screen easily.
alias ez="mvim -v ~/.zshrc"                         # edit .zshrc file easily.
alias sz="source ~/.zshrc"                          # Reload .zshrc easily.
alias j="z"                                         # fasd > autojump
alias musicmpd="mpd && mpdscribble && ncmpcpp"      # some fantastic music players

# Toggle show all files in the Finder
alias showfilesY="defaults write com.apple.Finder AppleShowAllFiles YES ; killall Finder"
alias showfilesN="defaults write com.apple.Finder AppleShowAllFiles NO ; killall Finder"

# Shell options
setopt menucomplete       # On an ambiguous completion, inserts first match immediately.
setopt printexitvalue     # Alert if something failed.
setopt nobeep             # beeps are annoying.
setopt notify             # report status of background jobs immediately.
setopt globdots           # don't require a leading period in a filename to be matched. 
setopt correct            # correct the spelling of commands.
setopt pushdtohome        # just entering pushd will cd to home folder.
setopt cdablevars         # try expand a "cd" argument if. 
setopt autolist           # automatically list choices when zsh doesn't understand a command.
setopt correctall         # try to correct the spelling of all arguments in a line.
setopt autocd             # imply "cd" when I only type a path. 
setopt recexact           # when completing, recognize exact matches. 
setopt longlistjobs       # list jobs in the long format.
setopt autoresume         # use single word simple commands for resumption of a existing job.
setopt histignoredups     # don't add duplicate commands into the history list.
setopt histreduceblanks   # and don't add blanks either.
setopt histignorespace    # done add a command to history that starts with a space
setopt pushdsilent        # don't print the directory stack after pushd/popd.
setopt autopushd          # make "cd" command = pushd.
setopt pushdminus         # exchange + and - when used with a number to specify a dir in the stack. 
setopt extendedglob       # enable more globbing features.
setopt rcquotes           # allow multiple quotes to signify a single quote within a single quoted string.
setopt globcomplete       # expand globs
setopt rmstarwait         # if issuing the "rm *", tell zsh to wait 10 seconds. (enough time to cancel/hit ctrl-c)
setopt completeinword     # complete inside a word.
setopt sharehistory       # share history between multiple shells

export GPGKEY=B2F6D883
export GPG_TTY=$(tty)

# Some default paths
export EDITOR=/usr/bin/vim
export JAVA_HOME=/usr/local/jdk
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# History settings
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000

HOSTNAME="`hostname`"

# Some zsh completion style options

# Use cache to speed some stuff 
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' verbose yes

# color listing
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# make completion prettier with colors!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

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
bindkey "^[s" insert-sudo  # insert a sudo at the beginning of the line
bindkey -v                 # Let's use vi mode instead of emacs.

################################# End of .zshrc ###############################
