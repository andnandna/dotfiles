# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
    # 色は気分で変えたいかもしれないので変す宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\W${RED}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps
