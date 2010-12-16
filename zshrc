# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found gem rails ruby git)

alias gv="gvim -geom 220x60"
# svn add all ;-)
alias saa='svn add $(svn status | egrep "^\?" | awk "{print $2}")'
alias put='phpunit tests'
alias pdo='cd ~/workspace/prototyp_dokumenten_management/php_pdo_mysql'
alias eed='cd ~/workspace/erich-erdinger && rvm use 1.9.2'
alias weportal='cd ~/workspace/weportal2 && rvm use 1.9.2'

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/completions.zsh

# Fix for CTRL-Arrow
bindkey "5C" forward-word
bindkey "5D" backward-word

# Customize to your needs...
export PATH=/home/mremolt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export CFLAGS="-march=native -O2"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#if [ "$PS1" ] ; then
#  mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#  echo $$ > /dev/cgroup/cpu/user/$$/tasks
#  echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi
