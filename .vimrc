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
Plug 'cocopon/iceberg.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
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

colorscheme iceberg
let g:lightline = { 'colorscheme': 'iceberg' }


"if &compatible
"    set nocompatible
"endif
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"
"call dein#begin(expand('~/.vim/dein'))
"
"call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0 })
"call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
"call dein#add('w0ng/vim-hybrid')
"call dein#add('tomtom/tcomment_vim')
"call dein#add('fatih/vim-go')
"call dein#add('itchyny/lightline.vim')
"
"call dein#end()
"
"filetype plugin indent on
"
"if dein#check_install()
"    call dein#install()
"endif
"
""dein.vim end
"
"
""vimtex------------------------------------------------
""コンパイルするときにオプションをつける？
"let g:vimtex_latexmk_options = '-pdfdvi'
""-clientserverのvimだとエラーがでるのでそれを消す
"let g:vimtex_compiler_latexmk = {'callback':0}
""------------------------------------------------vimtex
"
"
""-----------------------------------------------------
""-----------------|    fzf     |----------------------
""-----------------------------------------------------
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
"  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'))
"
"
""-----------------------------------------------------
""-----------------|   vim-go   |----------------------
""-----------------------------------------------------
"let mapleader = "\<Space>"
"autocmd FileType go nmap <leader>b <Plug>(go-build)
"autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"autocmd FileType go nmap <leader>r <Plug>(go-run)
"autocmd FileType go nmap <leader>t <Plug>(go-test)
"autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
"
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>
"
"function! s:build_go_files()
"    let l:file = expand('%')
"    if l:file =~# '^\f\+_test\.go$'
"        call go#test#Test(0, 1)
"    elseif l:file =~# '^\f\+\.go$'
"        call go#cmd#Build(0)
"    endif
"endfunction
"
"
