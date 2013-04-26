# .zshrc by Andreas Krennmair <ak@synflood.at>

ZSH=$HOME/.oh-my-zsh

# do OS-dependant stuff
OS=${OSTYPE%%[0-9.]*}

case $OS in
	linux)
		GOROOT=$HOME/hg/go
		GOOS=linux
		GOARCH=amd64
		GOPATH=$HOME/gopath
		GOBIN=$GOPATH/bin
		;;
	darwin)
		alias ls='ls -G'
		alias ldd='otool -L'                        # darwin doesn't have ldd
		alias top='top -o cpu'                      # darwin's top doesn't sort automatically
		GOROOT=/usr/local/go
		GOOS=darwin
		GOARCH=amd64
		GOPATH=$HOME/go
		;;
esac

export GOROOT GOOS GOARCH GOPATH

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e

PROMPT='[%S%T%s][%y]%n@%m:%1c%(!.#.$) '
RPROMPT='%S[%d]%s'

alias -g L=' | less'
alias ls='ls -F --color=auto'
alias wget='noglob wget --content-disposition'
alias rtorrent='rtorrent -o port_range=6910-6919,port_random=yes -s session'
alias !='tmux att -d'


PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH:/sbin:/usr/sbin:$GOBIN:/opt/diet/bin:/usr/local/texlive/2010/bin/x86_64-darwin
PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig
EDITOR=vim
DART_SDK=$HOME/dart-sdk

export PATH PKG_CONFIG_PATH EDITOR DART_SDK

ulimit -c unlimited

export PATH=$HOME/arm-cs-tools/bin:$PATH

# oh-my-zsh configuration:

COMPLETION_WAITING_DOTS="true"
ZSH_THEME=ak

plugins=(brew cp git git-flow github go golang osx perl)

source $ZSH/oh-my-zsh.sh

