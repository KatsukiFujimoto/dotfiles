# https://qiita.com/yutoman027/items/ae11bf22bdbcd645c92a
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# ===== My Commands =====
export PATH=$HOME/my_commands:$PATH
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
alias mdc='mutagen compose'

# 色を使用出来るようにする
autoload -Uz colors
colors

# NeoVim checkhealth
export TERM=screen-256color
set termguicolors

# ===== Pyenv =====
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# ===== git completion =====
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# FPATHに`~/.zsh`を追加
fpath=(~/.zsh $fpath)

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i

# ===== git prompt =====
source ~/.zsh/.git-prompt.sh

# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

# ターミナルのコマンド受付状態の表示変更
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $

setopt PROMPT_SUBST ; PS1='[%B%F{red}%n:%F{green}%~%f]%F{cyan}$(__git_ps1 "(%s)")%f
%F{yellow}$%f '
# setopt PROMPT_SUBST ; PS1='
# [%B%F{red}%n@%m%f%b:%F{green}%~%f]%F{cyan}$(__git_ps1 "(%s)")%f
# %F{yellow}$%f '

# ヒストリーの設定
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# 同じコマンドをヒストリに残さない
# 重複するコマンド行は古い方を削除するらしい
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 同時に起動したzsh間でヒストリーを共有
setopt share_history

# ===== GitHub CLI comepletion =====
eval "$(gh completion -s zsh)"

# ===== Kubernetes completion =====
source <(kubectl completion zsh)

# ===== Google Cloud SDK =====
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fujimotokatsuki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fujimotokatsuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fujimotokatsuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fujimotokatsuki/google-cloud-sdk/completion.zsh.inc'; fi

# ===== fzf =====
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ===== rbenv =====
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# ===== lazydocker ======
alias lzd='lazydocker'

# ==== nodebrew =====
PATH=$HOME/.nodebrew/current/bin:$PATH

# ==== tmux =====
# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# ==== terraform-lsp ====
export PATH=$PATH:~/.bin

# ===== rustup =====
PATH=$HOME/.cargo/bin:$PATH

# ===== Starship =====
eval "$(starship init zsh)"
