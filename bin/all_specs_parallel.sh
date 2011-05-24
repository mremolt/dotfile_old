#!/bin/bash

spec_directories=$(find . -type d -name 'spec')

spec_files=''

for dir in $spec_directories; do
  new_files=$(find $dir -type f -name '*_spec.rb')
  spec_files="$spec_files $new_files"
done

echo Running specs in $spec_directories ...
parallel_tests_path=$(bundle show parallel_tests)
parallel_tests_exe="${parallel_tests_path}/bin/parallel_test"

#echo $parallel_tests_exe --type spec $spec_files
$parallel_tests_exe --type spec $spec_files

# Remove acts-as-indexed temp files
[ -d tmp/index/test ] && rm -r tmp/index/test
