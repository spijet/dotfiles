#!/bin/sh

echo "Installing ZSH stuff..."
  [ ! -f $HOME/.zshrc ] && ln -s ./.zshrc $HOME/.zshrc
  [ ! -e $HOME/.zsh ] && ln -s ./zsh $HOME/.zsh
  mkdir $HOME/.zsh/plugins
  [ ! -e $HOME/.zsh/plugins/oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.zsh/plugins/oh-my-zsh
  [ ! -e $HOME/.zsh/plugins/autosuggestions ] && git clone https://github.com/tarruda/zsh-autosuggestions $HOME/.zsh/plugins/autosuggestions

echo "Installing HLWM symlinks..."
  [ -d $HOME/.config/herbstluftwm ] && ln -s ./herbstluftwm $HOME/.config/herbstluftwm

echo "Installing tmux configs..."
  [ ! -e $HOME/.tmux.conf ] && ln -s ./tmux/tmux.conf $HOME/.tmux.conf
  [ -z $HOME/.tmuxline.conf ] && ln -s ./tmux/tmuxline.conf $HOME/.tmuxline.conf

echo "Installing vim symlinks and cloning Vundle..."
  [ -e $HOME/.vimrc ] && ln -s ./vim/.vimrc $HOME/.vimrc
  [ -e $HOME/.vim ] && ln -s ./vim/.vimrc $HOME/.vim
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim

