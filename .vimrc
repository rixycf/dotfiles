"  ___      ___ ___  _____ ______   ________  ________     
" |\  \    /  /|\  \|\   _ \  _   \|\   __  \|\   ____\    
" \ \  \  /  / | \  \ \  \\\__\ \  \ \  \|\  \ \  \___|    
"  \ \  \/  / / \ \  \ \  \\|__| \  \ \   _  _\ \  \       
"   \ \    / /   \ \  \ \  \    \ \  \ \  \\  \\ \  \____  
"    \ \__/ /     \ \__\ \__\    \ \__\ \__\\ _\\ \_______\
"     \|__|/       \|__|\|__|     \|__|\|__|\|__|\|_______|

set vb t_vb=
set novisualbell 
set number
set hlsearch

" indent
set autoindent
set smartindent

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab 

set noswapfile 
set clipboard=unnamed

set showmode
" set showcmd
set laststatus=2

imap { {}<LEFT>
imap ( ()<LEFT>
imap [ []<LEFT>

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk


""-----------------------------------------------------
""-----------------|   vim-plug  |---------------------
""-----------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'junegunn/fzf.vim'
call plug#end()

""-----------------------------------------------------
""----------------| highlight setting |-----------------
""------------------------------------------------------
syntax on
set background=dark

" true color 
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" highlight line number
set cursorline
hi clear CursolLine

" colorscheme iceberg
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }


"
""-----------------------------------------------------
""-----------------|    fzf     |----------------------
""-----------------------------------------------------
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
"  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'))
"
