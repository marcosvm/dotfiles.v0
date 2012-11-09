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

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  "Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" settings
set history=1000
set wildmenu
set ignorecase
set smartcase
set scrolloff=3
set backupdir=/.vim-tmp,~/.tmp,~/tmp,/var/tmp,tmp
set directory=/.vim-tmp,~/.tmp,~/tmp,/var/tmp,tmp
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set list listchars=tab:\ \ ,trail:.
set winwidth=100
set ruler
set showcmd
set t_Co=256
set cmdheight=2
set switchbuf=useopen
set number
set numberwidth=5
set encoding=utf-8
set laststatus=2
set vb

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  " this jumps to the last line edited when reopening a file
  " g`" == ge backtick double-quote
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
endif

syntax on
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
augroup END

" remove trailing spaces when saving ruby files
au BufWritePre *.rb :%s/\s\+$//e

" gui settings
if has("gui_running")
  set cursorline
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set gfn=Inconsolata:h14
  colorscheme Tomorrow-Night-Eighties
endif

" mappings
let mapleader = ","
nnoremap <CR> :nohlsearch<cr>
map <D-/> <plug>Commentary
imap <D-/> <Esc><plug>Commentary
imap jj <Esc>
" actions for the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <Leader>s :split %%<CR>
map <Leader>v :vnew %%<CR>
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>
map ,a ggVG
imap <C-l> <space>=><space>
" functions
function! RedBar()
  hi RedBar ctermfg=white ctermbg=red guibg=red
  echohl RedBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

function! GreenBar()
  hi GreenBar ctermfg=white ctermbg=green guibg=green
  echohl GreenBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

function! YellowBar()
  hi YellowBar ctermfg=white ctermbg=green guibg=yellow
  echohl YellowBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

" gist-vim configuration
let g:gist_detect_filetype = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1

hi StatusLine ctermfg=blue ctermbg=yellow
hi Pmenu ctermbg=gray ctermfg=black
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
