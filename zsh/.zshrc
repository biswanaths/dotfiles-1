#######################################
#     Watabou's .zshrc file           #
#     Modified: May 13, 2012          #
#     Path: $HOME/.zshrc              #
#     Random Comment: zsh rules!      #
#######################################

# Path to my oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# Theme name
ZSH_THEME="steeef"

# OMZ Options
DISABLE_AUTO_UPDATE="true"

# Plugins to use
plugins=(brew cpanm fasd git hub history-substring-search rbenv osx sublime zsh-syntax-highlighting)

# Load OMZ
source $ZSH/oh-my-zsh.sh

# Zsh Environment Variables
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
eval "$(rbenv init -)"
export PATH=/usr/local/share/python:$PATH
export ARCHFLAGS='-arch x86_64'
export LESSCHARSET=utf-8
export LESSHISTFILE="~/.zsh/lesshist/" 
export LESSHISTSIZE=1000

# Cool aliases personalized to my liking.
alias vim="mvim -v"
alias vi="mvim -v"
alias cp="cp -vi"
alias rm="rm -vi"
alias mv="mv -vi" 
alias ll="ls -l" 
alias la="ls -A"
alias c="clear"
alias ez="mvim -v ~/.zshrc"
alias sz="source ~/.zshrc"
alias evi="mvim -v ~/.vimrc"
alias updateBrew="brew update;brew outdated;brew upgrade;brew cleanup"
alias j="z" # For fasd
alias musicmpd="mpd && mpdscribble && ncmpcpp" # start mpd server, scrobbling and client.
alias top="htop" # Since htop > top. Requires htop to be installed.
# Toggle show all files in the Finder
alias showfilesY="defaults write com.apple.Finder AppleShowAllFiles YES ; killall Finder"
alias showfilesN="defaults write com.apple.Finder AppleShowAllFiles NO ; killall Finder"

# Zsh options
# Many other great zsh options ommitted since omz sets them. 
setopt menucomplete       # On an ambiguous completion, inserts first match immediately.
setopt prompt_subst       # complete functions in the prompt.
setopt notify             # report status of background jobs immediately.
setopt globdots           # don't require a leading period in a filename to be matched. 
setopt correct            # correct the spelling of commands.
setopt autolist           # automatically list choices when zsh doesn't understand a command.
setopt correctall         # try to correct the spelling of all arguments in a line.
setopt recexact           # when completing, recognize exact matches. 
setopt longlistjobs       # list jobs in the long format.
setopt autoresume         # use single word simple commands for resumption of a existing job.
setopt pushdminus         # exchange + and - when used with a number to specify a dir in the stack. 
setopt rcquotes           # allow multiple quotes to signify a single quote within a single quoted string.
setopt globcomplete       # expand globs
setopt rmstarwait         # if issuing the "rm *" command, tell zsh to wait 10 seconds.
unsetopt beep             # for the love of science, don't beep at me.

# History settings
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=2000

################################# End of .zshrc ###############################
