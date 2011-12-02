#!/bin/bash
###############################
## Customisation of bash PS1

######################
## Colourise
## pulled from Gentoo's /etc/bashrc to allow

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
    PS1='[$(t | wc -l)] \[\033[01;32m\]\u@\h\[\033[01;34m\] $(__git_ps1 "(%s)") $(_W) \$\[\033[00m\] '
	#PS1='\[\033[01;32m\]\u\[\033[00;32m\]@\[\033[00;92m\]\h\[\033[01;34m\] $(_W)\[\033[00;36m\]$(_R) \[\033[01;34m\]\$\[\033[00m\] '
    # set color terminal
    #[[ "$XAUTHORITY" ]] && export TERM="xterm-256color"
    export TERM="xterm-color"
else
    # show root@ when we don't have colors
    [[ ${EUID} == 0 ]] &&
	PS1='\u@\h \W \$ ' ||
	PS1='\u@\h $(_W)$(_R) \$ '
    # set non-color terminal
    #[[ "$XAUTHORITY" ]] && export TERM="xterm"
    export TERM="xterm"
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

## Short version of \w - attempt to limit PWD to set length.
_W () {
    local wd="${PWD/#${HOME}/~}"	# CWD with ~ for $HOME
    local len=$((${COLUMNS:-80} / 2 - 25))	# max length of \w
    #local rep=".."		# replacement string to indicate shriking
    local rep="…"		# term needs same encoding as file (utf8)
    local chars=1		# number of characters to keep from name
    local fixdot=1		# positive to have ${chars} after . in .dirs
    # Keep trying to shrink, one directory at a time
    while [ ${#wd} -gt ${len} ]
    do
	local h=${wd%%/*}	# head (~) if it's there
	local b=${wd#${h}/}	# main body
	# Iterate over directories for one to shrink
	local nb=""		# new body (before current dir)
	local d=${b%%/*}	# current directory
	# Number of chars depending on ${fixdot}
	[ ${fixdot:-0} -gt 0 -a ${d} != ${d#.} ] &&
	    local nc=$((${chars}+1)) || local nc=${chars}
	b=${b#${d}/}		# body (after current dir)
	while [ "${d}" != "${b}" -a ${#d} -le $((${nc}+${#rep})) ]
	do			# if current directory too short
	    nb="${nb}/${d}"	# add it to new body
	    d=${b%%/*}		# get next directory
	    b=${b#${d}/}	# get rest of body after new dir
	    [ ${fixdot:-0} -gt 0 -a ${d} != ${d#.} ] &&
		nc=$((${chars}+1)) || nc=${chars}
	done
	[ "${d}" = "${b}" ] &&	# if dir = body (ie tried to shrink all dirs)
	    break		# ... done all we can, so end
	# Join with reduced dir for new CWD
	wd="${h}/${nb#/}${nb:+/}${d:0:${nc}}${rep}/${b}"
    done
    echo "${wd}"
}

## Include repositary information, e.g. branch, etc.
_R () {
    local d=$PWD	# current dir
    local b=""		# branch name
    local x=""		# extra information about repo
    # Iterate up to root directory searching for repo.
    while [ -n "${d}" ]
    do
	if [ -d ${d}/.git ]	# git repo
	then
	    b=$(<${d}/.git/HEAD)
	    b=${b##*/}
	elif [ -d ${d}/.hg ]	# mercurial repo
	then
	    b=$(<${d}/.hg/branch)
	else
	    d=${d%/*}		# up a directory
	    continue
	fi
	echo " (${b}${x})"
	break
    done
}

# If run as a program, output a representation of PS1
[ ${0##*/} != "bash" ] &&
    echo -e "PS1:\t$(echo "${PS1}" | sed -e 's:\\\(\[\|\]\)::g' \
					-e "s:\\\\u:$USER:g" \
					-e "s:\\\\h:$(hostname):g" \
					-e "s:\$(_W):$(_W):g" \
					-e "s:\$(_R):$(_R):g" \
					-e 's:\\\$:$:g' \
			    )"