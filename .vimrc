 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-rails.git'
 Bundle 'tpope/vim-commentary'
 Bundle 'tpope/vim-surround'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'nono/vim-handlebar'
 Bundle 'mileszs/ack.vim'
 Bundle 'chriskempson/vim-tomorrow-theme'
 Bundle 'mattn/webapi-vim'
 Bundle 'mattn/gist-vim'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
