
set incsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set fileformat=unix

set number relativenumber

syntax on

set encoding=utf-8

" Enable autocompletion ctrl+n to activate:
set wildmode=longest,list,full

" Splits open at the bottom and right
set splitbelow splitright

" Simpler split navigation Shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto deletes all trailing whitespaces upon save
autocmd BufWritePre * %s/\s\+$//e
