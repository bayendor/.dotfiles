# proper path ordering for bin files
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH:/usr/lib"

# bash-completion (brew install bash-completion@2)
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

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

# homebrew openssl support
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

# command aliases
alias ls='ls -FG'                   # show colors and added symbols
alias la='ls -a'                    # show hidden
alias lg='ls -g -h'                 # show details
alias l="ls -lFGgohq"               # fancy ls
alias grep='grep -n --color=auto'   # adds color, line number
alias be='bundle exec'
alias tf='terraform'

# Python aliases
alias pipup="pip list --format freeze | sed 's/==.*$//g' | xargs pip install -U"
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# Git aliases
alias gs="git status"
alias gc="git checkout"

# directory aliases
alias ws='cd ~/workspace'
alias pv='cd ~/workspace/dev/peertopeer/practical_vim'
alias exio='cd ~/workspace/dev/exercism/ruby'

#AWSume alias to source the AWSume script
alias awsume=". \$(pyenv which awsume)"

#Auto-Complete function for AWSume
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsumepy --rolesusers)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume
