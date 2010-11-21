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
plugins=(command-not-found gem git github rails ruby)

alias gv="gvim"

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/completions.zsh

# Customize to your needs...
export PATH=/home/mremolt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export CFLAGS="-march=native -O2"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ "$PS1" ] ; then  
   mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
   echo $$ > /dev/cgroup/cpu/user/$$/tasks
   echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
fi

