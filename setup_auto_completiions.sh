#!/bin/zsh

set -u

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
