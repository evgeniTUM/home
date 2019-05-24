#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:./node_modules/.bin:$(dirname $BASH_SOURCE)/bin"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -nc -a ''"
export VISUAL="emacsclient -c -a -emacs"

TERM=xterm

alias emacs="$EDITOR"
