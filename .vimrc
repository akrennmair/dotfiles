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

set number

set laststatus=2

set listchars=tab:>.,trail:.,eol:<
set list

set noexpandtab

set wildchar=<TAB>

set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'}]%h%m%r%y\ %{FindFunc()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*%=%c,%l/%L\ %P

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1

function! FindFunc()
	let subpattern = '\(sub\|function\|func\) [^{]\+'
	let subline = search(subpattern, 'bnW')
	if !subline
		return 'not in func'
	else
		return matchstr(getline(subline), subpattern)
	endif
endfunction

autocmd vimenter * if !argc() | NERDTree | endif
