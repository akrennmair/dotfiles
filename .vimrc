" .vimrc by Andreas Krennmair <ak@synflood.at>

call pathogen#infect()

set nocompatible

set background=dark

set autoindent
set textwidth=0
set tabstop=4
set shiftwidth=4
set esckeys
set formatoptions=tcqw

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set ruler

set tags+=~/.vim/ctags

set showcmd
set showmatch

set ignorecase

set incsearch
set hlsearch

set laststatus=2

set listchars=tab:>.,trail:.,eol:<
set list

set noexpandtab

set wildchar=<TAB>

set completeopt=menu

autocmd vimenter * if !argc() | NERDTree | endif
