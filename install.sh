#!/usr/bin/zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh --no-check-certificate -O - | sh

git submodule init
git submodule update

mkdir -p $HOME/.config/terminator
ln -sf $(pwd)/config/terminator/config ~/.config/terminator/config
ln -sf $(pwd)/gvimrc ~/.gvimrc
ln -sf $(pwd)/vimrc ~/.vimrc
ln -sf $(pwd)/zshrc ~/.zshrc

ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/zsh ~/.zsh

cd vim/bundle/command-t
#rvm use system
rvm use ree --default
rake make
