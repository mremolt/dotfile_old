# autocomplete caching for rake

function _rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks~ ]; then return 0;
  else
    accurate=$(stat -c%z .rake_tasks~)
    changed=$(stat -c%z Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

function _rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
    fi
    compadd `cat .rake_tasks~`
  fi
}

compctl -K _rake rake

function _killall () {
 user_processes=$(for process in $(ps x | awk '{ print $5 }' | uniq); do basename $process; done)
 compadd $( echo "$user_processes")
}

compctl -K _killall killall
