# source .bashrc as needed
# if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
# fi

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# proper path ordering for bin files
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH:/usr/lib"

# support for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# support for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# support for Golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# aws auto-completion
complete -C aws_completer aws

# git auto-completion
source ~/.git-completion.bash

# enables 'git hub'
eval "$(hub alias -s)"

# git prompt settings
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

export EDITOR="vim"

# ignore duplicates and spaced command in history
export HISTCONTROL=ignoreboth

# prompt
export CLICOLOR=1
export PS1="\[\033[36m\][\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\$\[\033[00m\] "

# opens short URLs in browser
function op { open http://$1; }

# environment variables
# export LC_CTYPE=en_US.UTF-8
# export LANG=en_US.UTF-8

# homebrew openssl support
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

# suport for docker-machine
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/David/.docker/machine/machines/dev"
# export DOCKER_MACHINE_NAME="dev"

# command aliases
alias ls='ls -FG'                   # show colors and added symbols
alias la='ls -a'                    # show hidden
alias lg='ls -g -h'                 # show details
alias l="ls -lFGgohq"               # fancy ls
alias grep='grep -n --color=auto'   # adds color, line number
alias tmaftp='ftp 192.183.189.126'
alias be='bundle exec'

# Python aliases
alias pipup="pip list --outdated | cut -d ' ' -f1 | xargs -n1 pip install -U"
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# Git aliases
alias gs="git status"
alias gc="git checkout"

# directory aliases
alias ws='cd ~/workspace'
alias tma='cd ~/workspace/tma'
alias pv='cd ~/workspace/dev/peertopeer/practical_vim'
alias exio='cd ~/workspace/dev/exercism/ruby'
