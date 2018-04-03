# use mac
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# ==============================================================================
# SOME VARIABLES in capitals
# no whitespace between variable names and = sign!
COLOR_RESET="\e[00m"
COLOR_GREEN="\e[1;32m"
COLOR_RED="\e[00;31m"

NO_CHANGES_STRING="nothing to commit (Sem Alteração)"
CHANGES_ICON='\x26\x13' #nice x UTF-8
NO_CHANGES_ICON='\x27\x13' #checkmark UTF-8

function iconify {
	# will convert a given string to utf-16be which will display a nice icon for us
	iconv -f utf-16be
}

# a nice x icon
function git_changes_icon {
	get_icon $CHANGES_ICON $COLOR_RED
}

# a checkbox icon
function git_no_changes_icon {
	get_icon $NO_CHANGES_ICON $COLOR_GREEN
}

# usage: get_icon $CHANGES_ICON $COLOR_RED
function get_icon {
	# local MY_ICON declares a new local variable, this variable will be removed when this function ends
	# using the $(...) notation we can save the command in the MY_ICON variable
	# `echo -ne` output what follow, n: will supress newlines, e: enable interpretation of backslash escapes
	# note the use of double quoutes around the $CHANGES_ICON variable
	# | the pipe symbol will send the output of echo -ne '...' to the next parameter 'iconify'
	# iconify is a function which we created to convert our UTF8 code to nice icons 
	local MY_ICON=$(echo -ne "$1" | iconify)
	echo -ne "$2$MY_ICON$COLOR_RESET"	
}

# ==============================================================================
# END OF FANCY GIT STATUS ICONS
# ==============================================================================


function parse_git_dirty {
	# [[ ]] is an 'extended test command'
	# 2> will send any SDTERR to /dev/null ( more or less a black hole on your filesystem )
	# 2> will let any SDTOUT through so we can catch it in our tail command ( we will look for $NO_CHANGES_STRING ceclared above )
	# tail -n1 reads as: get me the final line of a given string ( output of git status in our case )
	# $NO_CHANGES_STRING is declared above in this script, it's a simple string variable
	# the && … || … notation at the end of this command reads as: do this ( git_changes_icon ) if true, else do this ( git_no_changes_icon )
	[[ $(git status 2> /dev/null | tail -n1) != "$NO_CHANGES_STRING" ]] && git_changes_icon || git_no_changes_icon
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

PS1='\e[36m\]________________________________________________________________________________\n\[\e[33m\]\h:\W$(__git_ps1 "\[\e[36m\][ %s $(parse_git_dirty) ]\[\e[0m\]\[\e[0;33m\]\[\e[0m\]")\n\[\e[0m\]$ '
# PS1='\e[36m________________________________________________________________________________\n\[\e[33m\]\h:\W$(__git_ps1 "\[\e[36m\][ %s $(parse_git_dirty) ]\[\e[0m\]\[\e[0;33m\]\[\e[0m\]")\n\[\e[0m\]$ '

# set terminal to vi mode - http://blog.sanctum.geek.nz/vi-mode-in-bash/
# set -o vi

export VISUAL=vim
export EDITOR="$VISUAL"

git config --global user.name "Ederson de Lima"
git config --global user.email edersondelima@gmail.com
git config --global core.editor "vim"
