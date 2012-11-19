# .zshrc by Andreas Krennmair <ak@synflood.at>

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

GOROOT=$HOME/hg/go
GOOS=linux
GOARCH=amd64
GOPATH=$HOME/gopath
GOBIN=$GOPATH/bin

PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH:/sbin:/usr/sbin:$GOBIN:/opt/diet/bin
PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig
EDITOR=vim

export GOROOT GOOS GOARCH GOBIN PATH PKG_CONFIG_PATH EDITOR

ulimit -c unlimited
