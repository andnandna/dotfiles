# ---------------------------------------------------------
# Enable Powerlevel10k
# ---------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------------------------------------------------------
# Zinit's installer
# ---------------------------------------------------------
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ---------------------------------------------------------
# plugin list
# ---------------------------------------------------------

zinit ice wait lucid
zinit light zsh-users/zsh-completions # 補完
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions # 補完
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait lucid
zinit  light chrissicool/zsh-256color
zinit ice depth=1
zinit light romkatv/powerlevel10k

# ---------------------------------------------------------
# basic
# ---------------------------------------------------------

# 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# 他のzshと履歴を共有
setopt inc_append_history
setopt share_history

# ---------------------------------------------------------
# alias
# ---------------------------------------------------------

alias ls='ls -G'
alias python="python3"
alias pip="pip3"

# ---------------------------------------------------------
# prompt
# ---------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------------------------------------
# completion
# ---------------------------------------------------------

# コマンド補完
autoload -Uz compinit && compinit

# 小文字でも大文字にマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補をTabや矢印で選択可能
zstyle ':completion:*:default' menu select=1

# ---------------------------------------------------------
# hight-light
# ---------------------------------------------------------

# サジェストの色変更
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# lsコマンドで色分けする
zstyle ':completion:*' list-colors $LSCOLORS

# ---------------------------------------------------------
# peco
# ---------------------------------------------------------

# コマンド履歴検索 ctrl+r
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# コマンド履歴からディレクトリ検索・移動 ctrl+e
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]* *//' | peco)"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

# カレントディレクトリ以下のディレクトリ検索・移動 ctrl+x
function find_cd() {
  local selected_dir=$(find . -type d | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N find_cd
bindkey '^X' find_cd

eval "$(nodenv init -)"
export CLICOLOR=1
export TERM=xterm-256color

# エイリアス
alias gs='git status'
alias gd='git diff'
alias gpl='git pull origin'
alias gck='git checkout'
alias gck-b='git checkout -b'
alias gst='git stash -u'
alias ga='git add'
alias gcm-m='git commit -m'
alias gps='git push origin'

eval "$(nodenv init -)"

