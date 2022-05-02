#!/bin/zsh

set -u

# homebrew
brew_installed() {
  which brew > /dev/null 2>&1
}

if brew_installed
  echo "already installed Homebrew"
then
else
  echo "installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "checking Homebrew"
brew doctor

echo "updating Homebrew"
brew update

echo "upgrading Homebrew"
brew upgrade

echo "installing applications based on Brewfile"
brew bundle

echo "cleaning up Homebrew"
brew cleanup

# dotfiles in home directory
DOT_FILES=(.zshrc .gitconfig .gitignore .dein .ctags .rgignore .tmux.conf .alacritty.yml)
for file in ${DOT_FILES[@]}
do
  relative_path_for_dot_file="$(dirname $0)/$file"
  absolute_path_for_dot_file="$(pwd)${relative_path_for_dot_file:1}"
  ln -snf $absolute_path_for_dot_file ~/
done

# karabiner
relative_path_for_karabiner="$(dirname $0)/karabiner.json"
absolute_path_for_karabiner="$(pwd)${relative_path_for_karabiner:1}"
ln -snf $absolute_path_for_karabiner ~/.config/karabiner/

# rectangle
relative_path_for_rectangle="$(dirname $0)/com.knollsoft.Rectangle.plist"
absolute_path_for_rectangle="$(pwd)${relative_path_for_rectangle:1}"
ln -snf $absolute_path_for_rectangle ~/Library/Preferences/

# hyperswitch
relative_path_for_hyperswitch="$(dirname $0)/com.bahoom.HyperSwitch.plist"
absolute_path_for_hyperswitch="$(pwd)${relative_path_for_hyperswitch:1}"
ln -snf $absolute_path_for_hyperswitch ~/Library/Preferences/

# alfred
relative_path_for_alfred="$(dirname $0)/com.runningwithcrayons.Alfred-Preferences.plist"
absolute_path_for_alfred="$(pwd)${relative_path_for_alfred:1}"
ln -snf $absolute_path_for_alfred ~/Library/Preferences/

# git_template
relative_path_for_git_template="$(dirname $0)/git_template"
absolute_path_for_git_template="$(pwd)${relative_path_for_git_template:1}"
ln -snf $absolute_path_for_git_template ~/.config/

# iterm2
relative_path_for_iterm="$(dirname $0)/com.googlecode.iterm2.plist"
absolute_path_for_iterm="$(pwd)${relative_path_for_iterm:1}"
ln -snf $absolute_path_for_iterm ~/Library/Preferences/

# vim
relative_path_for_vim="$(dirname $0)/.vimrc"
absolute_path_for_vim="$(pwd)${relative_path_for_vim:1}"
ln -snf $absolute_path_for_vim ~/

# vim coc.nvim
relative_path_for_vim_coc="$(dirname $0)/coc-settings.json"
absolute_path_for_vim_coc="$(pwd)${relative_path_for_vim_coc:1}"
mkdir -p ~/.vim
ln -snf $absolute_path_for_vim_coc ~/.vim/

# neovim
relative_path_for_neovim="$(dirname $0)/.vimrc"
absolute_path_for_neovim="$(pwd)${relative_path_for_neovim:1}"
mkdir -p ~/.config/nvim
ln -snf $absolute_path_for_neovim ~/.config/nvim/init.vim

# neovim coc.nvim
relative_path_for_neovim_coc="$(dirname $0)/coc-settings.json"
absolute_path_for_neovim_coc="$(pwd)${relative_path_for_neovim_coc:1}"
mkdir -p ~/.config/nvim
ln -snf $absolute_path_for_neovim_coc ~/.config/nvim/

# git completion
mkdir -p ~/.zsh
if test -e ~/.zsh/git-completion.bash
then
  echo "already downloaded git-completion.bash"
else
  echo "downloading git-completion.bash"
  wget -O ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
if test -e ~/.zsh/_git
then
  echo "already downloaded git-completion.zsh"
else
  echo "downloading git-completion.zsh"
  wget -O ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi

# mac input speed
defaults read -g InitialKeyRepeat -eq 11 || defaults write -g InitialKeyRepeat -int 11
defaults read -g KeyRepeat -eq 1 || defaults write -g KeyRepeat -int 1

# asdf
asdf plugin add ruby
asdf plugin add rust
asdf plugin add python
asdf plugin add nodejs
asdf plugin add golang
asdf plugin update --all
