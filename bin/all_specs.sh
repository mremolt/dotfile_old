#!/bin/zsh

spec_directories=$(find . -type d -name 'spec')

echo Running specs in $spec_directories ...
bundle exec rspec -f p $(find . -type d -name 'spec')

