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

# is svn
is_subversion_checkout() {
  [[ $(svn info 2> /dev/null) != '' ]]
}

# svn or git status
st() {
  if is_subversion_checkout
  then
    svn status
  else
    git status
  fi
}

# svn or git add all ;-)
saa() {
  if is_subversion_checkout
  then
    new_files=$(svn status $@ | egrep '^\?' | awk '{print $2}')
    if [[ $new_files != '' ]]
    then
      svn add $(echo $new_files)
    fi
  else
    git add -A $@
  fi
}

_delete_not_committed() {
  egrep '^\?' | ruby -e "STDIN.read.gsub(/\?+\ +/, '').split(\"\n\").each {|f| FileUtils.rm_rf f }"
}

# svn or git delete all uncommited files
sdau() {
  if is_subversion_checkout
  then
    svn status | _delete_not_committed
  else
    git status -s | _delete_not_committed 
  fi
}

# svn or git revert all
sra() {
  if is_subversion_checkout
  then
    svn revert -R .
  else
    git reset .
    git checkout .
  fi
}

# svn revert all and remove all uncommited files
srda() {
  sdau && sra
}

git_reset() {
  git reset --merge ORIG_HEAD
}

# svn or git changes diff
changes() {
  if is_subversion_checkout
  then
    svn diff
  else
    git diff HEAD
  fi
}

# svn or git commit
commit() {
  if is_subversion_checkout
  then
    saa $@
    svn commit $@
  else
    saa $@
    git commit $@
  fi
}

time_since_last_commit() {
  if is_subversion_checkout
  then
    svn log $(svn info | grep '^URL' | awk '{print $NF}') -l 1 | grep '^r' | awk -F\| '{print $3}' | awk -F\( '{print $1}' | ruby -e "require 'active_support/core_ext/string/conversions'; require 'active_support/core_ext/numeric/time'; p ((Time.now - STDIN.read.strip.to_time) / 1.hour).round(2)"
  else
    git log -n 1 | grep Date | ruby -e "require 'active_support/core_ext/string/conversions'; require 'active_support/core_ext/numeric/time'; p ((Time.now - STDIN.read.gsub('Date:', '').strip.to_time) / 1.hour).round(2)"
  fi
}

rtf() {
  rm -f $(find ./ -type f -name "*.swp")
  rm -f $(find ./ -type f -name "*.swo")
  rm -f $(find ./ -type f -name "*.un~")
}

# write swap back to RAM
reset_swap() {
  sudo swapoff -a && sudo swapon -a
}

# piplight
pipelight-plugin-update() {
  sudo pipelight-plugin --update
  for plugin in $(pipelight-plugin --list-enabled)
  do
    pipelight-plugin --disable $plugin
    pipelight-plugin --enable $plugin
  done
}

#virtualbox
rm_vbox_cache() {
  sudo find /var/lib/apt -name '*virtualbox*' -exec rm {} \;
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

wprin() {
  init_project wprin
}

wprina() {
  init_project_with_apache wprin
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

scc() {
  init_project server_chef_config
}

at() {
  AUTOFEATURE=true bundle exec autotest -fc
}

bgu() {
  bundle exec guard start -i
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

export CFLAGS="-march=native -mtune=native -O3"

#REE tuning
#export RUBY_GC_HEAP_INIT_SLOTS=500000
#export RUBY_HEAP_SLOTS_INCREMENT=250000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=90000000
#export RUBY_HEAP_FREE_MIN=100000

# for annotate rails plugin
export SORT=yes POSITION=bottom

#if [ "$PS1" ] ; then
#  mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
#  echo $$ > /dev/cgroup/cpu/user/$$/tasks
#  echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
#fi


export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
