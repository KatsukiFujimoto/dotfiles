#!/bin/zsh

set -u

relative_dir_path=$(dirname $0)
absolute_path_for() {
  relative_path="$relative_dir_path/$1"
  absolute_path="$(pwd)${relative_path:1}"
  echo $absolute_path
}

# karabiner
mkdir -p ~/.config/karabiner
ln -snf $(absolute_path_for "karabiner/karabiner.json") ~/.config/karabiner/

# rectangle
ln -snf $(absolute_path_for "rectangle/com.knollsoft.Rectangle.plist") ~/Library/Preferences/

# hyperswitch
ln -snf $(absolute_path_for "hyperswitch/com.bahoom.HyperSwitch.plist") ~/Library/Preferences/

# alfred
ln -snf $(absolute_path_for "alfred/com.runningwithcrayons.Alfred-Preferences.plist") ~/Library/Preferences/

# git
mkdir -p ~/.config
ln -snf $(absolute_path_for "git/.gitconfig") ~/.config/
ln -snf $(absolute_path_for "git/.gitignore") ~/.config/
ln -snf $(absolute_path_for "git/git_template") ~/.config/

# github cli
gh config set editor nvim

# iterm2
ln -snf $(absolute_path_for "iterm/com.googlecode.iterm2.plist") ~/Library/Preferences/

# zsh
ln -snf $(absolute_path_for "zsh/.zshrc") ~/

# ctags
ln -snf $(absolute_path_for "ctags/.ctags") ~/

# ripgrep
ln -snf $(absolute_path_for "ripgrep/.rgignore") ~/

# tmux
ln -snf $(absolute_path_for "tmux/.tmux.conf") ~/

# alacritty
ln -snf $(absolute_path_for "alacritty/.alacritty.yml") ~/

# vim
mkdir -p ~/.vim
ln -snf $(absolute_path_for "vim/.vimrc") ~/
ln -snf $(absolute_path_for "vim/.dein") ~/.vim/
ln -snf $(absolute_path_for "vim/coc-settings.json") ~/.vim/

# neovim
mkdir -p ~/.config/nvim
ln -snf $(absolute_path_for "vim/.vimrc") ~/.config/nvim/init.vim
ln -snf $(absolute_path_for "vim/coc-settings.json") ~/.config/nvim/
