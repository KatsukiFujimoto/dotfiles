#!/bin/zsh

set -u

# asdf
asdf plugin add ruby
asdf plugin add rust
asdf plugin add python
asdf plugin add nodejs
asdf plugin add golang

asdf plugin add terraform
asdf plugin add terragrunt

asdf plugin update --all

asdf install

npm install --global \
  corepack@latest \
  prettier@latest \
  eslint@latest
corepack enable
gem install \
  bundler \
  solargraph \
  rubocop \
  rubocop-rails \
  rubocop-rspec \
  rubocop-rspec_rails \
  rubocop-factory_bot \
  rubocop-performance
