# PATHの設定
# https://qiita.com/yutoman027/items/ae11bf22bdbcd645c92a
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# 同じコマンドであれば古い方を削除する
setopt hist_ignore_all_dups
# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups
# 同時に起動したzsh間でヒストリーを共有
setopt share_history

# colorsをロード
autoload -Uz colors
colors

# 自動補完をロード
autoload -Uz compinit && compinit -i
# autoloadの探索パスに自動補完処理を置いている~/.zshを追加
fpath=(~/.zsh $fpath)

# colorの設定
export TERM=screen-256color
set termguicolors

# git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# git prompt
source ~/.zsh/git-prompt.sh

# GitHub CLI comepletion
which gh 1> /dev/null && eval "$(gh completion -s zsh)"

# Kubernetes completion
which kubectl 1> /dev/null && source <(kubectl completion zsh)

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
which asdf 1> /dev/null && . /usr/local/opt/asdf/libexec/asdf.sh

# tmux
# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Starship
which starship 1> /dev/null && eval "$(starship init zsh)"

# My Commands
ch() {
  cd ~
}
cc() {
  cd ~/codes
}
ccf() {
  local dir
  dir=$(find ~/codes -maxdepth ${1:-3} -type d | fzf) &&
  cd "$dir"
}
cf() {
  local dir
  dir=$(find . -maxdepth ${1:-3} -type d | fzf) &&
  cd "$dir"
}
