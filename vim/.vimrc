filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'ddollar/nerdcommenter'

call vundle#end()
filetype plugin indent on


syntax on
set encoding=utf-8
set nocompatible
set belloff=all
set number
set wrap
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set clipboard+=unnamed
set list listchars=trail:·
set backspace=indent,eol,start
set noswapfile
set scrolloff=3
set wildignore+=*/tmp/*,*/node_modules/*,*/public/assets*,*/vendor/*,*/coverage/*,*/.bundle/*,*/log/*,*/.git/*,*/cassettes/*


let mapleader=","


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


nmap <C-\> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle \| BuffergatorClose<CR>
let g:NERDTreeWinSize = 40


" автоматически добавлять закрывающуюся скобку или кавычку
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


" если файлов в проекте много то он индексирует все файлы
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" для того что бы не индексирвоать лишние файлы
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.git|\.hg|\.svn\|vendor|tmp|node_modules|public|coverage|\.bundle|log|cassettes)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': '',
    \ }
nmap <C-i> :CtrlPBuffer<cr>


" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e



" чтобы двигать вверх и вниз строки
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv


let g:NERDSpaceDelims = 1
