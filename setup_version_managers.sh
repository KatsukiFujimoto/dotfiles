#!/bin/zsh

set -u

# asdf
asdf plugin add ruby
asdf plugin add rust
asdf plugin add python
asdf plugin add nodejs
asdf plugin add golang
asdf plugin update --all
