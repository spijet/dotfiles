#!/bin/bash

[ -z $HOME/.vimrc ] && ln -s ./vim/.vimrc $HOME/.vimrc
[ -z $HOME/.vim ] && ln -s ./vim/.vimrc $HOME/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
