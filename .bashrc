#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -c"
export VISUAL="emacsclient -c -a -emacs"

alias emacs="$EDITOR"
export JAVA_HOME=/usr/lib/jvm/default
