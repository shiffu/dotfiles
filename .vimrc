" Leader
let mapleader = ","

" Set bell off for all events
set bo=all

set incsearch
set nocompatible

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set autoindent
set smarttab

set autowrite           " Automatically write files when changing when multiple files are opened

set fileformat=unix

set number relativenumber

syntax on
colorscheme molokai

set ruler                       " Always show the cursor
set colorcolumn=100             " color column at 100 char
set encoding=utf-8
set t_Co=256                    " Support 256 colors

set splitbelow                  " Horizontal splits always on the bottom
set splitright                  " Vertical splits always on the right

set iskeyword+=-                " Treat dash separated words as a word text obj

" Enable autocompletion ctrl+n to activate:
set wildmode=longest,list,full

" Splits open at the bottom and right
set splitbelow splitright

" Replace tab and cr special character (used with set list)
set listchars=tab:→\ ,eol:↲

" netrw as tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" Simpler split navigation Shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quickly edit .vimrc
noremap <c-v> :vs ~/.vimrc<CR>

" Toggle Explorer tree on the left
noremap <leader>e :Lex<CR>

" Fuzzy finder
nmap <leader>l :Files .<CR>

" Auto deletes all trailing whitespaces upon save
autocmd BufWritePre * %s/\s\+$//e

" Auto create & load buffers views
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview

"
" Plugins (only if plugin manager Plug is detected)
"
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    call plug#end()

    " airline config
    " Enable tabline
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#tabline#left_sep = ' '
    "let g:airline#extensions#tabline#left_alt_sep = '|'
    "let g:airline#extensions#tabline#right_sep = ''
    "let g:airline#extensions#tabline#right_alt_sep = ''

    let g:airline#extensions#tabline#formatter = 'default'

    " always show tabs
    set showtabline=2

    " enable powerline fonts
    let g:airline_powerline_fonts = 1
    "let g:airline_left_sep = ''
    "let g:airline_right_sep = ''

    " Stop showing the mode
    set noshowmode
endif

