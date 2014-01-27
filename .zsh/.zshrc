#!/usr/local/bin/zsh
# ajh17's ~/.zshrc

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Better git completion script
fpath=(~/.zsh/Completions $fpath)

# Better substring search color
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'

# Source aliases
source ~/.zsh/aliases

# Getting tired of emacs keybindings
bindkey -v

# ? and / in vicmd mode are nice but sometimes I want the arrow keys back
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# DAMNIT ZSH, WHAT ARE YOU WAITING FOR?!
KEYTIMEOUT=1

# Zsh options
setopt alwaystoend      # move to the end of the line after completing
setopt menu_complete    # On an ambiguous completion, inserts first match immediately.
setopt prompt_subst     # complete functions in the prompt.
setopt notify           # report status of background jobs immediately.
setopt globdots         # don't require a leading period in a filename to be matched.
setopt correct          # correct the spelling of commands.
setopt pushdtohome      # just entering pushd will cd to home folder.
setopt cdablevars       # try expand a "cd" argument if.
setopt autolist         # automatically list choices when zsh doesn't understand a command.
setopt autocd           # imply "cd" when I only type a path.
setopt recexact         # when completing, recognize exact matches.
setopt longlistjobs     # list jobs in the long format.
setopt autoresume       # use single word simple commands for resumption of a existing job.
setopt extendedhistory  # save commands with a time stamp.
setopt histignoredups   # don't add duplicate commands into the history list.
setopt histreduceblanks # and don't add blanks either.
setopt histignorespace  # done add a command to history that starts with a space
setopt pushdsilent      # don't print the directory stack after pushd/popd.
setopt autopushd        # make "cd" command = pushd.
setopt pushdminus       # exchange + and - when used with a number to specify a dir in the stack.
setopt extendedglob     # enable more globbing features.
setopt rcquotes         # allow multiple quotes to signify a single quote within a single quoted string.
setopt globcomplete     # expand globs
setopt rmstarwait       # if issuing the "rm *" command, tell zsh to wait 10 seconds.
setopt completeinword   # complete inside a word.
setopt completealiases  # don't substitute aliases internally before completion.
setopt sharehistory     # share history between multiple shells
setopt noclobber        # don't overwrite files by default
setopt markdirs         # mark directories with / to make them easier to identify
setopt autoparamslash   # Directories have / at the end
setopt chaselinks       # give the actual path of the symlink
setopt combiningchars   # displays some characters correctly
setopt multios          # Multiple I/O redirection

# History settings
HISTFILE=$HOME/.zhistory
HISTSIZE=200000
SAVEHIST=200000
################################# End of .zshrc ###############################