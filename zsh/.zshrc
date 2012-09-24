#!/usr/local/bin/zsh
#######################################
#     Watabou's .zshrc file           #
#     Modified: May 13, 2012          #
#     Path: $HOME/.zshrc              #
#     Random Comment: zsh > bash!     #
#######################################

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh Environment Variables
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/share/python:$PATH
export ARCHFLAGS='-arch x86_64'
export LESSCHARSET=utf-8
export LESSHISTFILE="~/.zsh/lesshist/"
export LESSHISTSIZE=1000
export EDITOR="subl"
export LANG=en_US.UTF-8

# load fasd
eval "$(fasd --init auto)"

# Cool aliases personalized to my liking.
eval "$(hub alias -s)" # Alias git to hub
alias j="z"        # For fasd
alias firefox="open -a /Applications/FirefoxUX.app"
alias vim="subl"   # mwahahahahaha
alias vi="mvim -v" # just in case
alias fortune="fortune -a"
alias tnotify='terminal-notifier -title "iTerm2" -activate com.googlecode.iterm2'
alias cp="cp -vi"
alias rm="rm -vi"
alias less="less -iJW"
alias df="df -h"
alias mv="mv -vi"
alias ll="ls -lhSG"
alias la="ls -AG"
alias c="clear"
alias ez="mvim -v ~/.zshrc"
alias sz="source ~/.zshrc"
alias evi="mvim -v ~/.vimrc"
alias updateBrew="brew update;brew upgrade;brew cleanup"
alias musicmpd="mpd && mpdscribble && ncmpcpp" # start mpd server, scrobbling and client.
alias top="htop" # Since htop > top. Requires htop to be installed.
# Toggle show all files in the Finder
alias showfilesY="defaults write com.apple.Finder AppleShowAllFiles YES ; killall Finder"
alias showfilesN="defaults write com.apple.Finder AppleShowAllFiles NO ; killall Finder"

# Zsh options
setopt menu_complete                    # On an ambiguous completion, inserts first match immediately.
setopt prompt_subst                     # complete functions in the prompt.
setopt notify                           # report status of background jobs immediately.
setopt globdots                         # don't require a leading period in a filename to be matched.
setopt correct                          # correct the spelling of commands.
setopt pushdtohome                      # just entering pushd will cd to home folder.
setopt cdablevars                       # try expand a "cd" argument if.
setopt autolist                         # automatically list choices when zsh doesn't understand a command.
setopt correctall                       # try to correct the spelling of all arguments in a line.
setopt autocd                           # imply "cd" when I only type a path.
setopt recexact                         # when completing, recognize exact matches.
setopt longlistjobs                     # list jobs in the long format.
setopt autoresume                       # use single word simple commands for resumption of a existing job.
setopt extendedhistory                  # save commands with a time stamp.
setopt histignoredups                   # don't add duplicate commands into the history list.
setopt histreduceblanks                 # and don't add blanks either.
setopt histignorespace                  # done add a command to history that starts with a space
setopt pushdsilent                      # don't print the directory stack after pushd/popd.
setopt autopushd                        # make "cd" command = pushd.
setopt pushdminus                       # exchange + and - when used with a number to specify a dir in the stack.
setopt extendedglob                     # enable more globbing features.
setopt rcquotes                         # allow multiple quotes to signify a single quote within a single quoted string.
setopt globcomplete                     # expand globs
setopt rmstarwait                       # if issuing the "rm *" command, tell zsh to wait 10 seconds.
setopt completeinword                   # complete inside a word.
setopt completealiases                  # don't substitute aliases internally before completion.
setopt sharehistory                     # share history between multiple shells
setopt noclobber                        # don't overwrite files by default
setopt markdirs                         # mark directories with / to make them easier to identify

# History settings
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=2000

# Watch settings
WATCH=notme
WATCHFMT='%n %a %l from %m at %T.'

# set vi-mode
bindkey "^?" backward-delete-char
bindkey -M vicmd "^R" redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "ga" what-cursor-position
bindkey -M viins '^p' history-beginning-search-backward
bindkey -M vicmd '^p' history-beginning-search-backward
bindkey -M viins '^n' history-beginning-search-forward
bindkey -M vicmd '^n' history-beginning-search-forward

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

################################# End of .zshrc ###############################
