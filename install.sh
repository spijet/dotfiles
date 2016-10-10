#!/bin/sh
set -x
BASEFILE="${0}"
BASEDIR="$(dirname ${BASEFILE})"
BCP_DIR="${HOME}/old-dotfiles"
echo "Base dir is ${BASEDIR}"
read foo
echo "##########################################################################"
echo "# Creating a backup directory...                                         #"
echo "##########################################################################"
  mkdir "${BCP_DIR}"


echo "##########################################################################"
echo "# Installing ZSH stuff...                                                #"
echo "##########################################################################"
  if [ -d "${HOME}/.config/zsh" ]
  then
      echo "Found older ZSH installation in ${HOME}/.config/zsh. Will move it to ${BCP_DIR}."
      mv "${HOME}/.config/zsh" "${BCP_DIR}/zsh"
  fi
  ln -s "${BASEDIR}/zsh" "${HOME}/.config/zsh"
echo "##########################################################################"
echo "# Installed ZSH config to ${HOME}/.config/zsh. Don't forget to set your  #"
echo "# ZDOTDIR accordingly, using ~/.zshenv or /etc/zsh/zshenv.               #"
echo "##########################################################################"

echo "##########################################################################"
echo "# Installing HLWM symlinks...                                            #"
echo "##########################################################################"
  if [ -d "${HOME}/.config/herbstluftwm" ]
    then
        echo "##########################################################################"
        echo "# Older HLWM directory detected!                                         #"
        echo "# Will be moved to \"${BCP_DIR}/herbstluftwm.\"                          #"
        echo "##########################################################################"
        mv "${HOME}/.config/herbstluftwm" "${BCP_DIR}/herbstluftwm"
  fi
  ln -s "${BASEDIR}/herbstluftwm" "${HOME}/.config/herbstluftwm"

echo "##########################################################################"
echo "# Installing tmux configs...                                             #"
echo "##########################################################################"
   [ ! -f $HOME/.tmux.conf ] && ln -s $BASEDIR/tmux/tmux.conf $HOME/.tmux.conf
   [ ! -f $HOME/.tmuxline.conf ] && ln -s $BASEDIR/tmux/tmuxline.conf $HOME/.tmuxline.conf
#
# echo "Installing vim symlinks and cloning Vundle..."
#   [ -e $HOME/.vimrc ] && ln -s ./vim/.vimrc $HOME/.vimrc
#   [ -e $HOME/.vim ] && ln -s ./vim/.vimrc $HOME/.vim
#   git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim
