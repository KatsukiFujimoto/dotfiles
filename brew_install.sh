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
relative_path_for_brewfile="$(dirname $0)/Brewfile"
absolute_path_for_brewfile="$(pwd)${relative_path_for_brewfile:1}"
brew bundle --file $absolute_path_for_brewfile

echo "cleaning up Homebrew"
brew cleanup
