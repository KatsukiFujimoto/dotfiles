#!/bin/zsh

set -u

# mac input speed
defaults read -g InitialKeyRepeat -eq 11 || defaults write -g InitialKeyRepeat -int 11
defaults read -g KeyRepeat -eq 1 || defaults write -g KeyRepeat -int 1
