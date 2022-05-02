#!/bin/zsh

set -u

# dotfiles in home directory
DOT_FILES=(
  zsh/.zshrc
  git/.gitconfig
  git/.gitignore
  vim/.dein
  ctags/.ctags
  ripgrep/.rgignore
  tmux/.tmux.conf
  alacritty/.alacritty.yml
)
for file in ${DOT_FILES[@]}
do
  relative_path_for_dot_file="$(dirname $0)/$file"
  absolute_path_for_dot_file="$(pwd)${relative_path_for_dot_file:1}"
  ln -snf $absolute_path_for_dot_file ~/
done

# karabiner
relative_path_for_karabiner="$(dirname $0)/karabiner/karabiner.json"
absolute_path_for_karabiner="$(pwd)${relative_path_for_karabiner:1}"
ln -snf $absolute_path_for_karabiner ~/.config/karabiner/

# rectangle
relative_path_for_rectangle="$(dirname $0)/rectangle/com.knollsoft.Rectangle.plist"
absolute_path_for_rectangle="$(pwd)${relative_path_for_rectangle:1}"
ln -snf $absolute_path_for_rectangle ~/Library/Preferences/

# hyperswitch
relative_path_for_hyperswitch="$(dirname $0)/hyperswitch/com.bahoom.HyperSwitch.plist"
absolute_path_for_hyperswitch="$(pwd)${relative_path_for_hyperswitch:1}"
ln -snf $absolute_path_for_hyperswitch ~/Library/Preferences/

# alfred
relative_path_for_alfred="$(dirname $0)/alfred/com.runningwithcrayons.Alfred-Preferences.plist"
absolute_path_for_alfred="$(pwd)${relative_path_for_alfred:1}"
ln -snf $absolute_path_for_alfred ~/Library/Preferences/

# git_template
relative_path_for_git_template="$(dirname $0)/git/git_template"
absolute_path_for_git_template="$(pwd)${relative_path_for_git_template:1}"
ln -snf $absolute_path_for_git_template ~/.config/

# iterm2
relative_path_for_iterm="$(dirname $0)/iterm/com.googlecode.iterm2.plist"
absolute_path_for_iterm="$(pwd)${relative_path_for_iterm:1}"
ln -snf $absolute_path_for_iterm ~/Library/Preferences/

# vim
relative_path_for_vim="$(dirname $0)/vim/.vimrc"
absolute_path_for_vim="$(pwd)${relative_path_for_vim:1}"
ln -snf $absolute_path_for_vim ~/

# vim coc.nvim
relative_path_for_vim_coc="$(dirname $0)/vim/coc-settings.json"
absolute_path_for_vim_coc="$(pwd)${relative_path_for_vim_coc:1}"
mkdir -p ~/.vim
ln -snf $absolute_path_for_vim_coc ~/.vim/

# neovim
relative_path_for_neovim="$(dirname $0)/vim/.vimrc"
absolute_path_for_neovim="$(pwd)${relative_path_for_neovim:1}"
mkdir -p ~/.config/nvim
ln -snf $absolute_path_for_neovim ~/.config/nvim/init.vim

# neovim coc.nvim
relative_path_for_neovim_coc="$(dirname $0)/vim/coc-settings.json"
absolute_path_for_neovim_coc="$(pwd)${relative_path_for_neovim_coc:1}"
mkdir -p ~/.config/nvim
ln -snf $absolute_path_for_neovim_coc ~/.config/nvim/
