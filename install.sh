#!/bin/zsh
git submodule init
git submodule update

ln -sf $(pwd)/config/terminator/config ~/.config/terminator/config
ln -sf $(pwd)/gvimrc ~/.gvimrc
ln -sf $(pwd)/vimrc ~/.vimrc
ln -sf $(pwd)/zshrc ~/.zsh
ln -sf $(pwd)/zshrc ~/.zshrc

ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/vim ~/.zsh
