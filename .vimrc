filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-fugitive'
Plugin 'ddollar/nerdcommenter'
Plugin 'neoclide/coc.nvim'
call vundle#end()
filetype plugin indent on


syntax on
set encoding=utf-8
set nocompatible
set belloff=all
set nu
set wrap
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set expandtab
set clipboard+=unnamed " чтобы у вима был тот же буфер для копирования что и у айтерма
set list " показывает скрытые символы
set lcs=tab:░░,trail:·,nbsp:▒ " заменяет скрытые символы точками
set backspace=indent,eol,start
set noswapfile
set scrolloff=8
set wildignore+=*/tmp/*,*/node_modules/*,*/public/assets*,*/vendor/*,*/coverage/*,*/.bundle/*,*/log/*,*/.git/*,*/cassettes/*
set autoread " автообновление файла на случай если его парралельно где то ещё отредактировали
set updatetime=750
set mouse=a
set nobackup
set history=1000
set splitright
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set colorcolumn=80


hi Search cterm=none ctermfg=none ctermbg=24
hi Visual cterm=none ctermfg=none ctermbg=236
hi MatchParen cterm=none ctermfg=none ctermbg=240
hi Pmenu cterm=none ctermfg=green ctermbg=234
hi PmenuSel cterm=none ctermfg=green ctermbg=236
hi Error cterm=none ctermfg=none ctermbg=52
hi StatusLineNC ctermfg=24 ctermbg=255
hi statusline ctermbg=none ctermfg=252
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=Black guibg=NONE
hi ColorColumn ctermbg=233


" Formats the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%m
set statusline+=%=              " Rest: right align
set statusline+=%m
set laststatus=2
set statusline+=\ %=                        " align left
set statusline+=%l/%L[%p%%]            " line X of Y [percent of file]

" изменения цвета статус линии в зависимсоти от режима"
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=none ctermfg=252
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermbg=none ctermfg=175
  else " какой то реплейс мод
    hi statusline ctermbg=green ctermfg=black
  endif
endfunction


let mapleader=" "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" управление окнами
""" переключение между окнами
let g:NERDTreeMapJumpNextSibling = 'F10' " для того что бы работал мой маппинг и хитрывй тоггл
let g:NERDTreeMapJumpPrevSibling = 'F11' "
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-h> <C-w>h
vnoremap <C-j> <C-w>j
vnoremap <C-k> <C-w>k
vnoremap <C-l> <C-w>l

""" сохранение как везде
nnoremap <leader>w :w<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" навигация по файловой системе через Контрол не лидер
""" дерево файлов
let g:NERDTreeWinSize = 40
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! CheckIfCurrentBufferIsFile()
  return strlen(expand('%')) > 0
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && CheckIfCurrentBufferIsFile() && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()
function! ToggleTree()
  if CheckIfCurrentBufferIsFile()
    if IsNERDTreeOpen()
      NERDTreeClose
    else
      NERDTreeFind
    endif
  else
    NERDTree
  endif
endfunction
nmap <C-t> :call ToggleTree()<CR>

""" поиск по проекту
" если файлов в проекте много то он индексирует все файлы
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" для того что бы не индексирвоать лишние файлы
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.git|\.hg|\.svn\|vendor|tmp|node_modules|public|coverage|\.bundle|log|cassettes)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': '',
    \ }
nmap <c-i> :CtrlPBuffer<cr>

" for autoreload file
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Работа с текстом
""" комментирование/раскомментирование - только строки целиком, чтоб поставить коммент в середине строки нужно через инсерт делать
nnoremap <CR> :nohlsearch<CR><CR> " на энтер перестаёт подсвечивать
nmap <leader>/ <leader>c<space>
vmap <leader>/ <leader>c<space>

" алиас для прая
iabbrev bp binding.pry

" <tab> для автозаполения coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"So I can move around in insert
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>


" No keys
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
nnoremap Q <nop> " никогда не попадать в Ex мод
nnoremap <c-]> <nop> " каоке то странное сочетание мне постоянно мешало
nnoremap <space> <nop>

autocmd BufWritePre * :%s/\s\+$//e

" для дебага
nnoremap <leader>ev :vsplit $MYVIMRC<CR> "edit vimrc
nnoremap <leader>rv :so $MYVIMRC<CR> " reload vimrc
nnoremap <leader>rp :CtrlPClearCache<CR> " reload cache ctrlP


"TODO"
" поставить мультикурсор"
" научиться искать лишь в выбранной дирректории и определённое разрешение файлов"
" научиться выделять все слова одинаковые мультикурсором"
" подсвечивать строчки которые изменены но ещё не закоммичены


"" добавлять гит в линию статуса
"" Puts in the current git status
"    if count(g:pathogen_disabled, 'Fugitive') < 1
"        set statusline+=%{fugitive#statusline()}
"    endif
"
"" Puts in syntastic warnings
"    if count(g:pathogen_disabled, 'Syntastic') < 1
"        set statusline+=%#warningmsg#
"        set statusline+=%{SyntasticStatuslineFlag()}
"        set statusline+=%*
"    endif


