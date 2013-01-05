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
export PATH=/usr/local/share/npm/bin:$PATH
export ARCHFLAGS='-arch x86_64'
export LESSCHARSET=utf-8
export LESSHISTFILE="~/.zsh/lesshist/"
export LESSHISTSIZE=1000

# Change some syntax coloring to look nicer
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta,bold'

## Aliases ## 
eval "$(fasd --init auto)"
eval "$(hub alias -s)"
alias scrot="screenshot"
alias j="z" 
alias firefox="open -a /Applications/FirefoxNightly.app"
alias mutt="cd ~/Desktop/ && mutt"
alias slime="subl"
alias tnotify='terminal-notifier -title "Terminal" -activate com.googlecode.iterm2'
alias cp="cp -vi"
alias rm="rm -vi"
alias unzip="unzip -d ~/Downloads"
alias mv="mv -vi"
alias c="clear"
alias ez="mvim -v ~/.zshrc"
alias sz="source ~/.zshrc"
alias evi="mvim -v ~/.vimrc"
alias updateBrew="brew update;brew upgrade;brew cleanup"
alias musicmpd="mpd && mpdscribble && ncmpcpp"
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
HISTSIZE=200000
SAVEHIST=200000

__rvm_project_rvmrc
fpath=(~/.zsh/Completion $fpath)
################################# End of .zshrc ###############################
