# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# git補完機能、別途インストールが必要
source ~/.git-completion.bash

# git branch表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh

# Gitブランチの状況を*+%で表示
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプト色、色早見
# 30m : Black
# 31m : Red
# 32m : Green
# 33m : Yellow
# 34m : Blue
# 35m : Purple
# 36m : Cyan
# 37m : Gray
# 4x  : Background
# 1   : Bold

# 出力プロンプト
export PS1='\n\[\e[33;40m\]\u \[\e[0;30;47m\] \[\e[30;47m\]\W\[\e[1;32m \[\e[0;37;43m\]$(__git_ps1 " \[\e[30m\] %s ")\[\e[0;33m\]\[\e[0;39;49m\]\n\[\e[1;35m\]\$ \[\e[0;39m\]'

# Hyper用タブにアイコン表示
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac

# エイリアス
# 会社docker環境
alias deb='docker exec -it bitstar_web_1 /bin/bash'
# 実践vim用、サンプルコードフォルダ直下でのみ
alias rawvim='vim -u essential.vim'
# 会社localPC Elastic起動
alias startes='/usr/local/Cellar/elasticsearch/6.4.3/bin/elasticsearch'
# Git系
alias ga='git add'
alias gcm='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gs='git status'
alias gf='git fetch'
alias gpl='git pull'
alias gps='git push'
alias gb='git blame'
# コマンド系
alias gr='grep -r'
# その他
alias bim='echo "Not bim but vim." | cowsay -f milk'
