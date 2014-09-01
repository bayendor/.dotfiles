# source .bashrc as needed
# if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
# fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# support for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH:/usr/lib"

export PATH="./bin:$PATH" # support for rails bin stubs

# git auto-completion
source ~/.git-completion.bash

# enables 'git browse'
eval "$(hub alias -s)"

# git prompt settings
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

export EDITOR="/usr/local/bin/mate -w"

# ignore duplicates and spaced command in history
export HISTCONTROL=ignoreboth

# prompt
export CLICOLOR=1

export PS1="\[\033[36m\][\w]\n\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \$\[\033[00m\] "

# environment variables
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# binstub check
rakec()   { type ./bin/rake >/dev/null; if [ $? -eq 0 ]; then ./bin/rake $*; else bundle exec rake $*; fi }
railsc()  { type ./bin/rails >/dev/null; if [ $? -eq 0 ]; then ./bin/rails $*; else rails $*; fi }

# rails shortcuts
rc() { railsc console $*; }
rs() { railsc server $*; }
rg() { railsc generate $*; }

# rake shortcuts
rkr() { rakec routes; }
rkt() { rakec test $*; }
rktprep() { rakec db:test:prepare; }
rkseed() { rakec db:seed; }
rkdbm() { rakec db:migrate; }

# command aliases
alias ls='ls -FG'                 # show colors and added symbols
alias la='ls -a'                  # show hidden
alias lg='ls -g -h'               # show details
alias grep='grep -n --color=auto' # adds color, line # to grep
alias bex='bundle exec'
alias bin='bundle install --binstubs'
alias rvm='rbenv'


# directory aliases
alias ws='cd ~/workspace'
alias tma='cd ~/workspace/tma'
alias pv='cd ~/workspace/tmp/practical_vim'
alias tmaftp='ftp 192.183.189.126'
alias dvc='cd ~/workspace/dvc'
alias prag='cd ~/workspace/dev/prag_prog_ruby'
alias exio='cd ~/workspace/dev/exercism/ruby'
