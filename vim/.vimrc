set number
set ic
set showmode
set ts=4
set expandtab
set sw=4
set softtabstop=4
set nomodeline
set nocompatible
set hlsearch

syntax on
filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete
set background=dark
colorscheme solarized

highlight Pmenu ctermfg=green ctermbg=black

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=0

call pathogen#infect('bundle')

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

