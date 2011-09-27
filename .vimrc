runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

" use vim settings
set nocompatible
set history=1000
set wildmenu

" ignore case when searching
set ignorecase
set smartcase

" 3 lines leading for scrolling
set scrolloff=3

" set a backdir dir
set backupdir=/.vim-tmp,~/.tmp,~/tmp,/var/tmp,tmp
set directory=/.vim-tmp,~/.tmp,~/tmp,/var/tmp,tmp

" backspace allowed all over on edit mode
set backspace=indent,eol,start

" nice font
" Syntax on if the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set guifont=Monaco:h14
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=140
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hls

if has("gui_running")
"  :set lines=100
"  :set columns=171
  :set cursorline
  " hide toolbar
  :set go-=T
endif

" set wildmode=longest,list

:set t_Co=256
:set background=light
:colorscheme solarized

let mapleader=","

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

:nnoremap <CR> :nohlsearch<cr>

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

:set cmdheight=2

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
augroup END

set switchbuf=useopen

" Map ,e and ,v to open files int he same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

set number
set numberwidth=5

set encoding=utf-8
set laststatus=2

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>
