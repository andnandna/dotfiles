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
    local  CYAN="\[\e[1;36m\]"
    local  PURPLE="\[\e[1;35m\]"
    local  YELLOW="\[\e[1;33m\]"
    local  GRAY="\[\e[1;37m\]"

    case $TERM in
        xterm*) TITLEBAR='\[\e]0;\W\007\]';;
        *)      TITLEBAR="";;
    esac
    local BASE="\u@\h"
    # PS1="${TITLEBAR}${GLAY}${BASE}${WHITE}:${CYAN}\W${RED}\$(parse_git_branch)${BLUE}\$${WHITE} "
    PS1="${GLAY}\u[\t]${WHITE}:${CYAN}\W${RED}\$(parse_git_branch)${BLUE}\n\$${WHITE} "
}
promps
# git補完機能、別途インストールが必要
source ~/.git-completion.bash

alias debitstar='docker exec -it bitstar_web_1 /bin/bash'
# 実践vim用、サンプルコードフォルダ直下でのみ
alias rawvim='vim -u essential.vim'
# 会社localPC Elastic起動
alias startes='/usr/local/Cellar/elasticsearch/6.4.3/bin/elasticsearch'
