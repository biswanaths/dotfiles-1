# Path to your oh-my-zsh configuration.
# Borrowed some functions from Derek Wyatt's amazing .zshrc file 
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial autojump compleat gem github textmate battery osx)

source $ZSH/oh-my-zsh.sh

setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
setopt CORRECT
setopt MENUCOMPLETE
setopt ALL_EXPORT

#Shell options
setopt notify globdots correct pushdtohome cdablevars autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent
setopt autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
if [[ $mapfile = '' ]] ; then
    zmodload -ap zsh/mapfile mapfile
fi

HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

# Set Prompt
#PS1="$PR_LIGHT_GREEN%n$PR_GREY@$PR_BLUE%m$PR_GREY:$PR_LIGHT_RED%2c$PR_NO_COLOR%(!.#.$) "
#RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
#RPS1="$PR_LIGHT_YELLOW%D{%m/%d/%y %l:%M %p}$PR_NO_COLOR"

unsetopt ALL_EXPORT

autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

zstyle ':completion:*:expand:*' tag-order all-expansions

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''


zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters


zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'


zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'



zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')

zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'



zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
    named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
    avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
    firebird gnats haldaemon hplip irc klog list man cupsys postfix\
    proxy syslog www-data mldonkey sys snort

if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
fi

zstyle ':completion:*:scp:*' tag-order \
    files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
    files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
    users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
    hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH # Load macports funtion
export MANPATH=/opt/local/share/man:$MANPATH # Load the man pages for port

export GPGKEY=B2F6D883
export GPG_TTY=$(tty)

export EDITOR=/usr/local/bin/vim
export JAVA_HOME=/usr/local/jdk

if which dircolors > /dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function eecho
{
    echo $@ 1>&2
}

function findWithSpec
{
    local dirs=
    local egrepopts="-v '\\.sw[po]\\$|/\\.git/|^\\.git/'"
    local nullprint=
    while [[ $# != 0 ]];
    do
        if [[ "$1" == "-Z" ]]; then
            egrepopts="-Zz $egrepopts"
            nullprint="-print0"
            shift
        elif [[ -d "$1" ]]; then
            dirs="$dirs '$1'"
            shift
        else
            break
        fi
    done
    if [[ -z "$dirs" ]]; then
        dirs=.
    fi
    eval "find $dirs $nullprint $@ | egrep $egrepopts"
}

function findsrc
{
    findWithSpec "$@" '-name \*.java -o -name \*.scala -o -name Makefile -o -name \*.h -o -name \*.cpp -o -name \*.c'
}
alias findsrcz="findsrc -Z"

function findj
{
    findWithSpec "$@" '-name \*.java'
}
alias findjz="findj -Z"

function finds
{
    findWithSpec "$@" '-name \*.scala'
}
alias findsz="finds -Z"

function findsj
{
    (finds "$@"; findj "$@")
}
alias findsjz="findsj -Z"

function findh
{
    findWithSpec "$@" '-name \*.h -o -name \*.hpp'
}
alias findhz="findh -Z"

function findc
{
    findWithSpec "$@" '-name \*.cpp -o -name \*.c'
}
alias findcz="findc -Z"

function findch
{
    (findc "$@"; findh "$@")
}
alias findchz="findch -Z"

function findf
{
    findWithSpec "$@" "-type f"
}
alias findfz="findf -Z"

function findm
{
    findWithSpec "$@" "-name Makefile"
}
alias findmz="findm -Z"

alias f=findWithSpec

function findClass
{
    local pattern="${1-}"
    if [ -z "$pattern" ]; then
        eecho "No pattern supplied" 1>&2
        return 1
    fi
    echo $CLASSPATH | tr ':' '\n' | grep -v '^ *$' | \
        while read entry
        do
            echo "====== $entry ======"
            if [ "${entry%.jar}" != "$entry" ]; then
                if [ -f "$entry" ]; then
                    jar tf "$entry" | egrep $pattern
                fi
            elif [ -d "$entry" ]; then
                find "$entry" | egrep -i $pattern
            fi
        done
    }

    function ff
    {
        if [ $# = 0 ]; then
            eecho "usage: ff <file>" 1>&2
            return 1
        fi
        if [ -d "$1" ]; then
            eecho "That's a directory, dumbass." 1>&2
            return 1
        elif [ "${1%/*}" = "$1" ]; then
            firefox -new-tab "file://$(pwd)/$1"
        else
            "cd" "${1%/*}"
            local dir="$(pwd)"
            "cd" - >/dev/null
            firefox -new-tab "file://$dir/${1##*/}"
        fi
        return 0
    }

