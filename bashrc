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
## Put your fun stuff here.
######################

# Set PS1
source ~/dotfiles/ps1.sh

# set user locale
export LANG="en_GB.utf8"

# prevents adding of useless commands to bash_history
export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:lh:ll:la:lA:lal:lAl:lgd:lagd:duh:df:dfh:cd:[bf]g:batt:exit:?q"
#export PATH="~/bin:${PATH%:.}"
# PATH completion for cd (need to enter full name - no bash file completion)
#export CDPATH=".:~:~/ddsys/code"

# vi like line editing
set -o vi
# use vim as editor
export EDITOR="vim"

export GIT_PS1_SHOWDIRTYSTATE="true"

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

# http://eriwen.com/productivity/aliases-and-functions/
alias ..='cd ..'
alias ...='cd ../..'
alias a='ant'
alias c='cd'
alias f='find'
alias g='grep'
alias h='history'
alias o='popd'
alias p='pushd'
alias d='dirs'
alias please='sudo'

# Git aliases
alias git='hub'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gp='git pull'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gr='git remote -v'

alias got='git '
alias get='git '

### enable bash completion
[ -f /etc/profile.d/bash_completion.sh ] && {
    . /etc/profile.d/bash_completion.sh
} || echo "completion doesn't exist"


## and for apvlv
#complete -o dirnames -fX '!*.[Pp][Dd][Ff]' apvlv 
## and for VBA, DeSmuME
#complete -o dirnames -fX '!*.[Gg][Bb]*' VisualBoyAdvance 
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume 
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume-glade
#complete -o dirnames -fX '!*.[Nn][Dd][Ss]' desmume-cli 

# t tasks
alias t='python ~/t/t.py --task-dir ~/Dropbox/Tasks --list tasks.txt'
alias tf='python ~/t/t.py --task-dir ~/Dropbox/Tasks --list .tasks.txt.done'

### python vars
[[ "$PYTHONPATH" ]] &&
    export PYTHONPATH="$PYTHONPATH:$HOME/code/python/" ||
    export PYTHONPATH="$HOME/code/python/"

# to use normal git diff
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$HOME/dotfiles/bin:$PATH

# Ros
[ -f /opt/ros/electric/setup.bash ] && { 
    source /opt/ros/electric/setup.bash 
}
export ROS_PACKAGE_PATH=/home/jkimbo/code/rutler/ros_workspace:${ROS_PACKAGE_PATH}

export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=pk-MV4F5N7OEUMPYTMGX744V4UWYAWQNFZ4.pem
export EC2_CERT=cert-MV4F5N7OEUMPYTMGX744V4UWYAWQNFZ4.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# Added by autojump install.sh
source /etc/profile.d/autojump.bash

# calc
function calc {
    echo "scale=4; $1" | bc
}

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# keychain
keychain id_rsa id_dsa
. ~/.keychain/`uname -n`-sh


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
