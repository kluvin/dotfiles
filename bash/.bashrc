#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

RED="$(tput setaf 1)"
GREEN="\[$(tput setaf 2)\]"
BROWN="\[$(tput setaf 3)\]"
BLUE="$(tput setaf 4)"
PURPLE="\[$(tput setaf 5)\]"
LIGHT_BLUE="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
DARK_BROWN="\[$(tput setaf 8)\]"

RESET="$(tput sgr0)"

PS1='${BLUE}\u${RESET}@${BLUE}\h${RESET} '

# Enable colors
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

alias 'howdoi'='howdoi -c'
alias 'ls'='ls --color=always'
alias 'diff'='diff --color=always'
alias 'grep'='grep --color=always'
alias 'logout'='pkill -U $USER'
alias 'config'='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 'less'
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R '

# Navigation
alias '..'='cd ..'
export music='/media/etc/stuff/music'
export dev='/media/etc/dev'

export EDITOR='/usr/bin/vim'

# Drop into
fish

# Start sequence
echo
screenfetch
echo
echo
