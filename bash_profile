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

# support for rails bin stubs
export PATH="./bin:$PATH"

# git auto-completion
source ~/.git-completion.bash

# enables 'git hub'
eval "$(hub alias -s)"

# git prompt settings
parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

export EDITOR="/usr/local/bin/atom -w"

# ignore duplicates and spaced command in history
export HISTCONTROL=ignoreboth

# prompt
export CLICOLOR=1

export PS1="\[\033[36m\][\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \n\$\[\033[00m\] "

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

# environment variables
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# binstub check
rakec() { type ./bin/rake >/dev/null; if [ $? -eq 0 ]; then ./bin/rake $*; else bundle exec rake $*; fi }
railsc() { type ./bin/rails >/dev/null; if [ $? -eq 0 ]; then ./bin/rails $*; else rails $*; fi }

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
alias ls='ls -FG'                   # show colors and added symbols
alias la='ls -a'                    # show hidden
alias lg='ls -g -h'                 # show details
alias l="ls -lFGgohq"               # fancy ls
alias grep='ag'                     # because grep sucks
alias tmaftp='ftp 192.183.189.126'
alias be='bundle exec'
alias bin='bundle install --binstubs'
alias rvm='rbenv'
alias sib='seeing_is_believing'

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"

# directory aliases
alias ws='cd ~/workspace'
alias tma='cd ~/workspace/tma'
alias pv='cd ~/workspace/tmp/practical_vim'
alias prag='cd ~/workspace/dev/prag_prog_ruby'
alias exio='cd ~/workspace/dev/exercism/ruby'
alias turing='cd ~/workspace/turing'
