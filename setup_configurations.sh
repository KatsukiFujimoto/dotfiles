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

# git
mkdir -p ~/.config
ln -snf $(absolute_path_for "git/.gitconfig") ~/
ln -snf $(absolute_path_for "git/.gitignore") ~/
ln -snf $(absolute_path_for "git/git_template") ~/.config/
ln -snf $(absolute_path_for "git/tig/.tigrc") ~/

# github cli
gh config set editor nvim
mkdir -p ~/.config/gh
ln -snf $(absolute_path_for "gh/config.yml") ~/.config/gh/

# zsh
ln -snf $(absolute_path_for "zsh/.zshrc") ~/

# ctags
ln -snf $(absolute_path_for "ctags/.ctags") ~/

# ripgrep
ln -snf $(absolute_path_for "ripgrep/.rgignore") ~/

# tmux
ln -snf $(absolute_path_for "tmux/.tmux.conf") ~/

# alacritty
ln -snf $(absolute_path_for "alacritty/.alacritty.toml") ~/

# asdf
ln -snf $(absolute_path_for "asdf/.tool-versions") ~/

# alt-tab
ln -snf $(absolute_path_for "alttab/com.lwouis.alt-tab-macos.plist") ~/Library/Preferences/

# vim
mkdir -p ~/.vim
ln -snf $(absolute_path_for "vim/.vimrc") ~/
ln -snf $(absolute_path_for "vim/.dein") ~/
ln -snf $(absolute_path_for "vim/coc-settings.json") ~/.vim/
ln -snf $(absolute_path_for "vim/cheatsheet.md") ~/.vim/

# neovim
mkdir -p ~/.config/nvim
ln -snf $(absolute_path_for "vim/.vimrc") ~/.config/nvim/init.vim
ln -snf $(absolute_path_for "vim/coc-settings.json") ~/.config/nvim/

# rubocop
mkdir -p ~/.config/rubocop
ln -snf $(absolute_path_for "rubocop/config.yml") ~/.config/rubocop/
