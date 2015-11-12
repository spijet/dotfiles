#!/bin/sh

echo "Installing ZSH stuff..."
  [ -z $HOME/.zshrc ] && ln -s ./.zshrc $HOME/.zshrc
  [ -z $HOME/.zsh ] && ln -s ./zsh $HOME/.zsh
  [ -z $HOME/.zsh/plugins/oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.zsh/plugins/oh-my-zsh
  [ -z $HOME/.zsh/plugins/autosuggestions ] && git clone https://github.com/tarruda/zsh-autosuggestions $HOME/.zsh/plugins/autosuggestions

echo "Installing HLWM symlinks..."
  [ -z $HOME/.config/herbstluftwm ] && ln -s ./herbstluftwm $HOME/.config/herbstluftwm

echo "Installing tmux configs..."
  [ -z $HOME/.tmux.conf ] && ln -s ./tmux/tmux.conf $HOME/.tmux.conf
  [ -z $HOME/.tmuxline.conf ] && ln -s ./tmux/tmuxline.conf $HOME/.tmuxline.conf

echo "Installing vim symlinks and cloning Vundle..."
  [ -z $HOME/.vimrc ] && ln -s ./vim/.vimrc $HOME/.vimrc
  [ -z $HOME/.vim ] && ln -s ./vim/.vimrc $HOME/.vim
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim

