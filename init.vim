packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-fugitive')
call minpac#add('fatih/vim-go', {'do': ':GoInstallBinaries'})
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('rust-lang/rust.vim')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('ciaranm/securemodelines')
call minpac#add('itchyny/lightline.vim')
call minpac#add('iamcco/markdown-preview.nvim', {'do': 'packloadall! | call mkdp#util#install()'})
set nu

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syn on
set ruler
set incsearch
set number
set numberwidth=5
set showcmd
set hlsearch
set cmdheight=2
set laststatus=2
set autowrite
set expandtab
set visualbell
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
map ; :

ca W w

au Filetype go setlocal syntax=OFF

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" let g:go_fmt_command = "gofmt" // for orchestrator open source
let g:go_fmt_command = "goimports"

" go to the last edited position in file
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" remove trailing spaces when saving
au BufWritePre *.rb :%s@\s\+$@@e
au BufWritePre *.yml :%s@\s\+$@@e
au BufWritePre *.js :%s@\s\+$@@e
au BufWritePre *.erb :%s@\s\+$@@e
au BufWritePre *.java :%s@\s\+$@@e

" settings for ruby files
au Filetype ruby setlocal ts=2 sts=2 sw=2 et
let mapleader=","
nnoremap <CR> :nohlsearch<cr>
imap jj <Esc>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>s :split %%
map <leader>v :vnew %%
map ,a ggVG
map <C-e> :b#<CR>
map <leader>j :%!jq '.'<CR>
" puts the caller
nnoremap <leader>wat oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

imap <C-L> <space>=><space>

let g:rustfmt_autosave = 1

autocmd BufReadPost *.rs setlocal filetype=rust

"set hidden
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"    \ }

" Automatically start language servers.
"let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
"nnoremap <silent> K :call LanguageClient_textDocument_hover()
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
"
hi PMenu ctermbg=Yellow

" coc configurations
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
    \ 'colorscheme': 'default',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
