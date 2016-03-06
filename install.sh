#!/bin/sh
BASEFILE="${0}"
BASEDIR="$(pwd $(dirname ${BASEFILE}))"
BCP_DIR="$HOME/.old-dotfiles"
echo "Creating a backup directory..."
  mkdir $BCP_DIR

echo "Base dir is ${BASEDIR}"

echo "Installing ZSH stuff..."
  if [ -f $HOME/.zshrc ]
    then
    mv $HOME/.zshrc $BCP_DIR/.zshrc
    echo "Older .zshrc detected! Will be moved to $BCP_DIR/.zshrc ."
  fi
    ln -s $BASEDIR/.zshrc $HOME/.zshrc

  if [ -d $HOME/.zsh ]
    then
    mv $HOME/.zsh $BCP_DIR/.zsh
    echo "Older .zsh directory detected! Will be moved to ${BCP_DIR}/.zsh ."
  fi
   ln -s $BASEDIR/zsh $HOME/.zsh
  mkdir $HOME/.zsh/plugins
  git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.zsh/plugins/oh-my-zsh
  git clone https://github.com/tarruda/zsh-autosuggestions $HOME/.zsh/plugins/autosuggestions

echo "Installing HLWM symlinks..."
  if [ -d $HOME/.config/herbstluftwm ]
    then
    mv $HOME/.config/herbstluftwm $BCP_DIR/herbstluftwm
    echo "Older HLWM directory detected! Will be moved to $BCP_DIR/herbstluftwm ."
  fi
    ln -s $BASEDIR/herbstluftwm $HOME/.config/herbstluftwm

echo "Installing tmux configs..."
  [ ! -f $HOME/.tmux.conf ] && ln -s $BASEDIR/tmux/tmux.conf $HOME/.tmux.conf
  [ ! -f $HOME/.tmuxline.conf ] && ln -s $BASEDIR/tmux/tmuxline.conf $HOME/.tmuxline.conf

echo "Installing vim symlinks and cloning Vundle..."
  [ -e $HOME/.vimrc ] && ln -s ./vim/.vimrc $HOME/.vimrc
  [ -e $HOME/.vim ] && ln -s ./vim/.vimrc $HOME/.vim
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim

