#!/bin/bash 

set -euxo pipefail

# Nvim
[ -d ~/.config/nvim ] || mkdir -p ~/.config/nvim
[ -f ~/.config/nvim/init.vim ] || ln -s "${PWD}/init.vim" ~/.config/nvim/init.vim
