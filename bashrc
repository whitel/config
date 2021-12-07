# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -altF --time-style=long-iso'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

##############################################
# => SSH Commands
##############################################
alias sshcomputer='ssh computer'
alias sshdell='ssh dell@dell -p2222'
alias sshnode9='ssh root@node9 -p2235'
alias sshkali='ssh root@192.168.200.132'
alias sk=sshkali
alias p='ssh -f -N -C -D localhost:8000 conductor@computer -p 10022'

##############################################
# => Git Commands
##############################################

# git status
alias gs='git status'
alias gss='git status -s'

# git add
alias ga='git add '
alias gaa='git add --all'

# git commit
alias gc='git commit -v'
alias gca='git commit -v -a'

# git log
alias gl='git log'
alias gla='git la'
alias gls='git log --stat'

# git branch
alias gb='git branch'
alias gba='git branch -a'

# git diff
alias gd='git diff'
alias gds='git diff --staged'

# git push
alias gps='git push'

# git pull
alias gpl='git pull'

# git others
alias gclean='git clean -xdf'

##############################################
# => Docker commands
##############################################
function de() {
    container=$1
	docker exec -it ${container} bash
}
alias dps='docker ps -a'
alias dp='docker ps'
alias dis='docker images'
alias dr='docker run -dit '
alias gp='git push'

alias mit='de mit'
alias labs='de labs'

##############################################
# => tmux Commands
##############################################
alias tl='tmux ls'
alias te='tmux attach -t '
alias tn='tmux new -s '
alias td='tmux kill-session -t '

##############################################
# => Common Commands
##############################################
export chome='/mnt/c/Users/Whitel'

function GetFunctions() {
    cat $1 | grep "^func "
}

function geo() {
    ip=$1
    curl https://freegeoip.app/json/${ip} -s | jq ".city,.country_name"
    # https://tools.keycdn.com/geo?host=223.72.105.28
}

alias cf="df -h | head -1 && df -h | grep mapper"

alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'

# make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
alias mklist="make -qp | awk -F':' '/^[a-zA-Z0-9][^\$#\/\t=]*:([^=]|\$)/ {split(\$1,A,/ /);for(i in A)print A[i]}'"

export PATH=$PATH:/usr/local/go/bin

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

alias sl='ls'
alias dc='cd'

function gitdiff() {
    file_1=$1
    file_2=$2
    git diff --no-index ${file_1} ${file_2}
}
alias diff=gitdiff
