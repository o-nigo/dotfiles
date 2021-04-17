[ -f ~/.zprezto/runcoms/zshrc ] && source ~/.zprezto/runcoms/zshrc

export LANG=ja_JP.UTF-8
export EDITOR=vim

# MacVim
case "${OSTYPE}" in
  darwin*)
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
esac

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

setopt nonomatch

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias re='rbenv exec'
alias be='bundle exec'
alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias bundleinstall='bundle install --path vendor/bundle'

# nodebrew
PATH=$HOME/.nodebrew/current/bin:$PATH

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# go
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# Python
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# Github
eval "$(hub alias -s)"

# ant
export ANT_HOME="/usr/local/bin/ant/"
export PATH="$PATH:$ANT_HOME/bin"

function prf () {
  git fetch -f upstream pull/$1/head:pr$1
  git co pr$1
}

function reset_hard () {
  git fetch upstream
  git reset --hard upstream/$1
}

function psg () {
  ps aux | grep $1
}

function ssh_tunnels () {
  psg '[s]sh.\+-L'
}

function kill_ssh_tunnels () {
  psg "[s]sh.\+-L $1" | awk '{print $2}' | xargs kill
}

[ -f ~/.zshrc.office ] && source ~/.zshrc.office
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
