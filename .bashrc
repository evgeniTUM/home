#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:./node_modules/.bin:$(dirname $BASH_SOURCE)/bin"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -nw -a '' "
export VISUAL="emacsclient -a ''"

TERM=xterm

alias emacs="$EDITOR"
alias ee="$EDITOR"
alias eg="$VISUAL"
