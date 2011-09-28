# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

###############################
## pulled from /etc/bashrc to allow changed PS1 and color control

use_color=false
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
	    eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
	    eval $(dircolors -b /etc/DIR_COLORS)
	fi
    fi
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --colour=auto'
    [[ ${EUID} == 0 ]] &&
	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] ' ||
    PS1='[$(t | wc -l)] \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    # set color terminal
    export TERM="xterm-color"
else
    # show root@ when we don't have colors
    [[ ${EUID} == 0 ]] &&
	PS1='\u@\h \W \$ ' ||
	PS1='\u@\h \w \$ '
    # set non-color terminal
    export TERM="xterm"
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

## end color control
######################


###############################
## Put your fun stuff here.
######################

# set user locale
export LANG="en_GB.utf8"

# prevents adding of useless commands to bash_history
export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:lh:ll:la:lA:lal:lAl:lgd:lagd:duh:df:dfh:cd:[bf]g:batt:exit:?q"
export PATH="~/bin:${PATH%:.}"
# PATH completion for cd (need to enter full name - no bash file completion)
export CDPATH=".:~:~/ddsys/code"

# vi like line editing
set -o vi
# use vim as editor
export EDITOR="vim"

# alias list
alias ll='ls -loh --group-directories-first'
alias la='ls -A --group-directories-first'
alias lal='ls -Al'
alias lgd='ls --group-directories-first'
alias lagd='ls -A --group-directories-first'
alias lh='ls -sh'
alias llh='ls -lh'
alias lah='ls -Ash'
alias lalh='ls -Alh'
alias duh='du -sh'
alias dfh='df -h'
alias grep.l='grep -A2 -B2'
alias luvcview.i='luvcview -f yuv -i 30'
alias :q='exit'
alias octave='octave --silent'
alias vim='vim -p'
alias jkpc='rdesktop -u JK -f -a16 -rsound:remote 192.168.1.238'

# Git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

### enable bash completion
[[ -f ~/share/bash-completion/bash-completion.sh ]] &&
    source ~/share/bash-completion/bash-completion.sh
## and for git
source ~/.git-completion.sh
## and for sudo
#complete -cf sudo
## and for apvlv
#complete -o dirnames -fX '!*.[Pp][Dd][Ff]' apvlv 
## and for VBA, DeSmuME
#complete -o dirnames -fX '!*.[Gg][Bb]*' VisualBoyAdvance 
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume 
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume-glade
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume-cli 

# t tasks
alias t='python ~/t/t.py --task-dir ~/Dropbox/tasks --list tasks.txt'

### python vars
[[ "$PYTHONPATH" ]] &&
    export PYTHONPATH="$PYTHONPATH:$HOME/Documents/code/python/web/" ||
    export PYTHONPATH="$HOME/Documents/code/python/web/"

# to use normal git diff
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$HOME/bin:$PATH
