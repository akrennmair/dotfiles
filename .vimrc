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

set listchars=tab:\|.,trail:.,eol:<,nbsp:_
set list

set noexpandtab

set wildchar=<TAB>

set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'}]%h%m%r%y\ %{FindFunc()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*%=%c,%l/%L\ %P

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [ ], 'passive_filetypes': ['go', 'c', 'cpp'] }

function! FindFunc()
	let subpattern = '\(sub\|function\|func\) [^{]\+'
	let subline = search(subpattern, 'bnW')
	if !subline
		return 'not in func'
	else
		return matchstr(getline(subline), subpattern)
	endif
endfunction

function! Ack(args)
	let grepprg_back=&grepprg
	set grepprg=ack\ -H\ --nocolor\ --nogroup
	execute "silent! grep " . a:args
	botright copen
	let &grepprg=grepprg_back
endfunction

command! -nargs=* -complete=file Ack call Ack(<q-args>)

nmap <F6> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

function! s:GoLint()
	cexpr system("golint " . shellescape(expand('%')))
	copen
endfunction
command! GoLint :call s:GoLint()
