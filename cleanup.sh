#!/bin/bash 

set -euxo pipefail

# Nvim
[ -f ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim

# Alacritty
[ -f ~/.config/alacritty/alacritty.yml ] && rm ~/.config/alacritty/alacritty.yml
