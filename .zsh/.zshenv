#!/usr/local/bin/zsh

export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LANG='en_US.UTF-8'

#
# Paths
typeset -gU cdpath fpath mailpath manpath path
typeset -gxU MANPATH
typeset -gxUT INFOPATH infopath

# Set the list of directories that info searches for manuals.
infopath=(
/usr/local/share/info
/usr/share/info
$infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
/usr/local/share/man
/usr/share/man
$manpath
)

for path_file in /etc/manpaths.d/*(.N); do
    manpath+=($(<$path_file))
done
unset path_file

# Set the list of directories that Zsh searches for programs.
path=(
/usr/local/{bin,sbin}
/usr/{bin,sbin}
/{bin,sbin}
/Applications/Postgres93.app/Contents/MacOS/bin
~/.bin
$path
)

for path_file in /etc/paths.d/*(.N); do
    path+=($(<$path_file))
done
unset path_file

fpath=(
/usr/local/Cellar/zsh-completions/0.10.0/share/zsh-completions
~/.zsh/Completion
$fpath
)
