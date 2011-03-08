# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
RAILS_PROJECT_APACHE_INIT=$HOME/Desktop/rails_projects.sh

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

# svn add all ;-)
saa() {
  svn add $(svn status | egrep '^\?' | awk '{print $2}')
}

# svn delete all uncommited files
sdau() {
  rm -rf $(svn status | egrep '^\?' | awk '{print $2}')
}

# svn revert all
sra() {
  svn revert -R *
}

# svn revert all and remove all uncommited files
srda() {
  sdau && sra
}

alias gv="gvim -geom 220x60"
alias put='phpunit tests'
alias pdo='cd ~/workspace/prototyp_dokumenten_management/php_pdo_mysql && rvm use ree && clear'
alias eed='cd ~/workspace/erich-erdinger && rvm use ruby-1.9.2-p136 && clear'
alias we='cd ~/workspace/weportal2 && rvm use ruby-1.9.2-p136 && clear'
alias wx='cd ~/workspace/weexams && source bin/activate && cd src/weexams && clear'

alias wea='$RAILS_PROJECT_APACHE_INIT weportal2 && we'
alias we='cd ~/workspace/weportal2 && rvm use ruby-1.9.2 && clear'
alias waa='$RAILS_PROJECT_APACHE_INIT waportal && wa'
alias wa='cd ~/workspace/waportal && rvm use ree && clear'
alias at='AUTOFEATURE=true bundle exec autotest -fc'

alias sync_home_to_monk="rsync -av --delete --progress --exclude \.gvfs  --exclude \.rvm --exclude workspace --exclude NetBeansProjects --exclude NetBeansProjectsGit --exclude Downloads /home/ceichhor monk:~/home/backup/office/"

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/completions.zsh

# Fix for CTRL-Arrow
bindkey "5C" forward-word
bindkey "5D" backward-word

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export CFLAGS="-march=native -O2"
# for annotate rails plugin
export SORT=yes POSITION=bottom

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#if [ "$PS1" ] ; then
#  mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#  echo $$ > /dev/cgroup/cpu/user/$$/tasks
#  echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi
