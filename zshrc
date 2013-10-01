# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
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
plugins=(command-not-found gem rails ruby git rvm)

# svn status
st() {
  svn status
}

# svn status
sc() {
  svn commit
}

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

rtf() {
  rm $(find ./ -type f -name "*.swp")
  rm $(find ./ -type f -name "*.swo")
  rm $(find ./ -type f -name "*.un~")
}

# write swap back to RAM
reset_swap() {
  sudo swapoff -a && sudo swapon -a
}

alias gv="gvim -geom 220x60"

init_project() {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm reload && cd $(ls -l /var/www/apps/$1/current | awk -F'->' '{print $2}') && rvm use $(cat RUBY_VERSION) && clear
}

init_project_with_apache() {
  init_project $1 && ./script/apache_setup.sh && clear
}

we() {
  init_project weportal2
}

wea() {
  init_project_with_apache weportal2
}

wa() {
  init_project waportal
}

waa() {
  init_project_with_apache waportal
}

opd() {
  init_project online_pump_diary
}

opda() {
  init_project_with_apache online_pump_diary
}

webk() {
  init_project webmasterkurse
}

webka() {
  init_project_with_apache webmasterkurse
}

at() {
  AUTOFEATURE=true bundle exec autotest -fc
}

bgu() {
  bundle exec guard
}

alias sync_home_to_monk="rsync -av --delete --progress --exclude \.gvfs  --exclude \.rvm --exclude workspace --exclude NetBeansProjects --exclude NetBeansProjectsGit --exclude Downloads /home/ceichhor monk:~/home/backup/office/"

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/completions.zsh

# Fix for CTRL-Arrow
bindkey "5C" forward-word
bindkey "5D" backward-word

# Customize to your needs...
#export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
CPUS_COUNT=$(cat /proc/cpuinfo | grep processor | wc -l)

export CFLAGS="-march=native -O3"

#REE tuning
export RUBY_HEAP_MIN_SLOTS=700000
export RUBY_HEAP_SLOTS_INCREMENT=700000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=300000000
export RUBY_HEAP_FREE_MIN=500000

# for annotate rails plugin
export SORT=yes POSITION=bottom

#if [ "$PS1" ] ; then
#  mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#  echo $$ > /dev/cgroup/cpu/user/$$/tasks
#  echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi


export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
