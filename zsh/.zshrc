# PATHの設定
# Apple Silicon Mac用のPATHの設定
if test $(uname -m) = 'arm64'
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # https://qiita.com/yutoman027/items/ae11bf22bdbcd645c92a
  alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'
  export PATH="/usr/local/sbin:$PATH"
fi

# エディタ
export EDITOR='nvim'

# ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# 同じコマンドであれば古い方を削除する
setopt hist_ignore_all_dups
# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups
# 同時に起動したzsh間でヒストリーを共有
setopt share_history

# カラー設定
export CLICOLOR=1
export TERM=screen-256color
set termguicolors
autoload -Uz colors && colors

# 自動補完をロード
autoload -Uz compinit && compinit -i
# autoloadの探索パスに自動補完処理を置いている~/.zshを追加
fpath=(~/.zsh $fpath)

# git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# GitHub CLI comepletion
command -v gh 1> /dev/null && eval "$(gh completion -s zsh)"

# Kubernetes completion
command -v kubectl 1> /dev/null && source <(kubectl completion zsh)

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# fzf
if [ -f "$HOME/.fzf.zsh" ]
then
  source ~/.fzf.zsh
else
  $(brew --prefix)/opt/fzf/install
  source ~/.fzf.zsh
fi

# asdf
command -v asdf 1> /dev/null && . $(brew --prefix asdf)/libexec/asdf.sh

# tmux
# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Starship
command -v starship 1> /dev/null && eval "$(starship init zsh)"

# My Commands
ch() {
  cd ~
}
cc() {
  cd ~/codes
}
chf() {
  local dir
  dir=$(find ~ -type d \( -name ".git" -o -name "node_modules" \) -prune -o -type d -name "*" -maxdepth ${1:-5} | fzf --preview 'tree -C -L 1 {} | head -200') &&
  cd "$dir"
}
ccf() {
  local dir
  dir=$(find ~/codes -maxdepth ${1:-3} -type d | fzf --preview 'tree -C -L 1 {} | head -200') &&
  cd "$dir"
}
cf() {
  local dir
  dir=$(find . -maxdepth ${1:-5} -type d | fzf --preview 'tree -C -L 1 {} | head -200') &&
  cd "$dir"
}
apply_asdf() {
  ~/codes/dotfiles/setup_version_managers.sh
}
check_temperature() {
  sudo powermetrics -n ${1:-1} | grep -A10 "SMC sensors"
}

# use emacs mode bindkey
bindkey -e
