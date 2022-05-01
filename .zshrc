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

# 色を使用出来るようにする
autoload -Uz colors
colors

# NeoVim checkhealth
export TERM=screen-256color
set termguicolors

# ===== git completion =====
[ -f ~/.zsh/git-completion.bash ] && zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# FPATHに`~/.zsh`を追加
fpath=(~/.zsh $fpath)

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i

# ===== git prompt =====
[ -f ~/.zsh/git-prompt.sh ] && source ~/.zsh/git-prompt.sh

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
which gh 1> /dev/null && eval "$(gh completion -s zsh)"

# ===== Kubernetes completion =====
which kubectl 1> /dev/null && source <(kubectl completion zsh)

# ===== Google Cloud SDK =====
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fujimotokatsuki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fujimotokatsuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fujimotokatsuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fujimotokatsuki/google-cloud-sdk/completion.zsh.inc'; fi

# ===== fzf =====
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ==== asdf ====
which asdf 1> /dev/null && . /usr/local/opt/asdf/libexec/asdf.sh

# ==== tmux =====
# SHELL LOGIN WITH TMUX / If not running interactively, do not do anything
if which tmux 1> /dev/null
then
  [[ $- != *i* ]] && return
  [[ -z "$TMUX" ]] && exec tmux
fi

# ===== Starship =====
which starship 1> /dev/null && eval "$(starship init zsh)"