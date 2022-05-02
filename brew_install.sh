#!/bin/zsh

set -u

relative_dir_path=$(dirname $0)
absolute_path_for() {
  relative_path="$relative_dir_path/$1"
  absolute_path="$(pwd)${relative_path:1}"
  echo $absolute_path
}

# homebrew
if which brew > /dev/null 2>&1
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
brew bundle --file $(absolute_path_for "brew/Brewfile")

echo "cleaning up Homebrew"
brew cleanup
